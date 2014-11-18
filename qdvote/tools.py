#coding:utf-8
#功能类
from models import *
import string,random
from datetime import datetime
from xml.etree import ElementTree
import requests
import re

#查找某个模型的数据是否存在
def CheckExist(model,kwargs):
	objects = model.objects.filter(**kwargs)
	if objects:
		return True
	return False

#随机产生六个数字
def RandCode():
	return string.join(random.sample(['1','2','3','4','5','6','7','8','9','0'], 6)).replace(' ','')

#调用短信接口，发送随机验证码
def SendRandomCode(tel):
	url = 'http://www.mxtong.net.cn/GateWay/Services.asmx/DirectSend'
	code = RandCode()
	content = '您的验证码为'+code+'。工作人员不会向您索要，请勿向任何人泄漏。【清大益讯】'
	payload = {'UserID':'965125','Account':'admin','Password':'DUWBT2','Phones':tel,
				'Content':content,'SendTime':'','SendType':'1','PostFixNumber':''}
	r = requests.get(url,params=payload)
	#xml = ElementTree.fromstring(r.content)
	#RetCode = xml.find("ROOT").find("RetCode").text
	#print RetCode
	search = re.search('<RetCode>(?P<status>\w+)</RetCode>',r.content)
	RetCode = search.groupdict()['status']
	if RetCode == 'Sucess':
		if CheckExist(RANDOMCODE,{'tel':tel}):
			randomCode_obj = RANDOMCODE.objects.get(tel = tel)
			randomCode_obj.code = code
			randomCode_obj.count += 1
			randomCode_obj.time = datetime.now()
			randomCode_obj.save()
		else:
			randomCode_obj = RANDOMCODE(tel = tel,code = code,time = datetime.now(),count=1)
			randomCode_obj.save()
		return True
	else:
		return False