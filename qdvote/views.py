#coding:utf-8
from django.shortcuts import render
from django.template import RequestContext
from django.shortcuts import render_to_response
from django.http import HttpResponse,HttpResponseRedirect

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