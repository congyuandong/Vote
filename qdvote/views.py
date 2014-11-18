#coding:utf-8
from django.shortcuts import render
from django.template import RequestContext
from django.shortcuts import render_to_response
from django.http import HttpResponse,HttpResponseRedirect
from django.http import Http404
from django.db.models import Count
from django.conf import settings

from models import *

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

def OnlineVote(request):
	context = RequestContext(request)
	context_dict = {}
	INDUSTRY_objs = INDUSTRY.objects.order_by('sort')
	context_dict['industrys'] = INDUSTRY_objs
	#COMPANY_objs = COMPANY.objects.all().annotate(dcount=Count('industry'))
	#context_dict['companys'] = COMPANY_objs
	companys = []
	for INDUSTRY_obj in INDUSTRY_objs:
		companys.append({'industry':INDUSTRY_obj,'company_list':COMPANY.objects.filter(industry__exact = INDUSTRY_obj)})
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

	return render_to_response('qdvote/rank.html',context_dict,context)