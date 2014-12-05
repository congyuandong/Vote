#coding:utf-8
from django.shortcuts import render
from django.template import RequestContext
from django.shortcuts import render_to_response
from django.http import HttpResponse,HttpResponseRedirect
from django.http import Http404
from django.db.models import Count
from django.conf import settings
from datetime import datetime


from models import *
import simplejson as json
import tools as T

def Index(request):
	context = RequestContext(request)
	context_dict = {}

	return render_to_response('qdvote/index.html',context_dict,context)

#组织机构
def Institution(request):
	context = RequestContext(request)
	context_dict = {}

	return render_to_response('qdvote/institution.html',context_dict,context)

#评委介绍
def Judge(request):
	context = RequestContext(request)
	context_dict = {}
	JUDGE_objs = JUDGE.objects.order_by('sort')
	context_dict['jueges'] = JUDGE_objs
	return render_to_response('qdvote/judgeIntro.html',context_dict,context)

#参选报名
def Apply(request):
	context = RequestContext(request)
	context_dict = {}

	return render_to_response('qdvote/apply.html',context_dict,context)

#联系我们
def Contact(request):
	context = RequestContext(request)
	context_dict = {}

	return render_to_response('qdvote/contact.html',context_dict,context)


#投票入口
def VoteEntry(request):
	context = RequestContext(request)
	context_dict = {}

	return render_to_response('qdvote/voteEntry.html',context_dict,context)

def OnlineVote(request):
	context = RequestContext(request)
	context_dict = {}
	INDUSTRY_objs = INDUSTRY.objects.order_by('sort')
	context_dict['industrys'] = INDUSTRY_objs
	#COMPANY_objs = COMPANY.objects.all().annotate(dcount=Count('industry'))
	#context_dict['companys'] = COMPANY_objs
	companys = []
	for INDUSTRY_obj in INDUSTRY_objs:
		company_list = COMPANY.objects.filter(industry__exact = INDUSTRY_obj)
		if company_list:
			companys.append({'industry':INDUSTRY_obj,'company_list':company_list})
	context_dict['companys'] = companys 
	if settings.DEBUG:
		print context_dict
	return render_to_response('qdvote/onlineVote.html',context_dict,context)

def Detail(request,id):
	context = RequestContext(request)
	context_dict = {}
	try:
		COMPANY_obj = COMPANY.objects.get(id = id)
		context_dict['company'] = COMPANY_obj
	except COMPANY.DoesNotExist:
		raise Http404
	return render_to_response('qdvote/details.html',context_dict,context)

def Rank(request):
	context = RequestContext(request)
	context_dict = {}

	COMPANY_objs = COMPANY.objects.order_by('-vote')
	context_dict['companys'] = COMPANY_objs

	return render_to_response('qdvote/rank.html',context_dict,context)

#获取随机验证码
def GetRandomCode(request):
	response_dict = {}
	if request.method == 'GET':
		tel = request.GET.get('tel','')
		if len(tel) != 11:
			response_dict['status'] = 0
		elif T.CheckExist(VOTEPHONE,{'tel':tel}):
			response_dict['status'] = 2
		else:
			RANDOMCODE_objs = RANDOMCODE.objects.filter(tel=tel)
			if RANDOMCODE_objs:
				if RANDOMCODE_objs[0].count >= 3:
					response_dict['status'] = 3
				elif (datetime.now() - RANDOMCODE_objs[0].time).seconds < 60:
					response_dict['status'] = 4
				else:
					#在第一次发送
					if T.SendRandomCode(tel):
						response_dict['status'] = 1
					else:
						response_dict['status'] = 5
			else:
				#第一次发送
				if T.SendRandomCode(tel):
					response_dict['status'] = 1
				else:
					response_dict['status'] = 5
	if settings.DEBUG:
		print response_dict
	return HttpResponse(json.dumps(response_dict),content_type="application/json")

#投票
def VoteCompany(request):
	response_dict = {}
	if request.method == 'GET':
		tel = request.GET.get('tel','')
		code = request.GET.get('code','')
		c_id = request.GET.get('id','')
		print c_id
		if T.CheckExist(VOTEPHONE,{'tel':tel}):
			response_dict['status'] = 2
		elif CheckRandomCode(tel,code):
			response_dict['status'] = 1
			try:
				COMPANY_obj = COMPANY.objects.get(id = c_id)
				COMPANY_obj.vote += 1
				COMPANY_obj.save()
				VOTEPHONE_new = VOTEPHONE(tel = tel,time = datetime.now(),company = COMPANY_obj)
				VOTEPHONE_new.save()
			except COMPANY.DoesNotExist:
				raise Http404
		else:
			response_dict['status'] = 0
	if settings.DEBUG:
		print response_dict
	return HttpResponse(json.dumps(response_dict),content_type="application/json")

#判断用户的验证码是否错误或者超时 5min
def CheckRandomCode(tel,code):
	randomCode_obj = RANDOMCODE.objects.filter(tel = tel)
	if randomCode_obj:
		if randomCode_obj[0].code == code and (datetime.now() - randomCode_obj[0].time).seconds < 300:
			return True
		else:
			return False
	else:
		return False