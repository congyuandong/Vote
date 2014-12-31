#coding:utf-8
from django.db import models
from imagekit.models import ProcessedImageField
from imagekit.processors import ResizeToFill
from DjangoUeditor.models import UEditorField
from django.conf import settings


class JUDGE(models.Model):
	name = models.CharField(max_length=50,verbose_name='姓名')
	#image = models.ImageField(upload_to ='avatar/',verbose_name='头像',help_text='像素112px*135px')
	image = ProcessedImageField(upload_to ='avatar/',verbose_name='头像',help_text='112px*135px像素为宜，程序将自动剪裁',
					processors=[ResizeToFill(112, 135)],format='JPEG')
	company = models.CharField(max_length=50,verbose_name='公司')
	position = models.CharField(max_length=200,verbose_name='职位描述',help_text='100个汉字以内')
	sort = models.IntegerField(default=0,verbose_name='排序',help_text='小数在前')

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name = '评委'
		verbose_name_plural = '评委管理'

class INDUSTRY(models.Model):
	name = models.CharField(max_length=100,verbose_name='行业',help_text='不能超过8个汉字！')
	sort = models.IntegerField(default=0,verbose_name='排序',help_text='小数在前')

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name = '行业'
		verbose_name_plural = '行业分类'

VOTE_TYPE = (
	(0, u"最具投资价值企业"),
    (1, u"最佳创新成长企业"),
	)

VOTE_STATUS = (
	(0, u"投票中"),
    (1, u"预投票"),
	)

class COMPANY(models.Model):
	name = models.CharField(max_length=200,verbose_name='公司名称')
	code = models.CharField(max_length=200,verbose_name='股权代码')
	industry = models.ForeignKey(INDUSTRY,verbose_name='行业分类')
	sort = models.IntegerField(default=0,verbose_name='排序',help_text='小数在前')
	vote = models.IntegerField(default=0,verbose_name='投票数')
	image = ProcessedImageField(upload_to ='logo/',verbose_name='公司logo',help_text='225px*105px像素为宜，程序将自动剪裁',
					processors=[ResizeToFill(225, 105)],format='JPEG')
	detail = UEditorField(verbose_name='公司详细介绍',imagePath="ueditor/images/",
        filePath="ueditor/files/",settings=settings.UEDITOR_SETTINGS['config'],
		upload_settings={'imageMaxSize':2048000},null=True,blank=True)
	vote_type = models.IntegerField(verbose_name="奖项类型",default=0,choices=VOTE_TYPE)
	vote_status = models.IntegerField(verbose_name="投票状态",default=0,choices=VOTE_STATUS)
	video = models.CharField(verbose_name="视频编号",max_length=200,null=True,blank=True)

	def __unicode__(self):
		return self.name

	class Meta:
		verbose_name = '企业'
		verbose_name_plural = '参赛企业'

'''
随机验证码
'''
class RANDOMCODE(models.Model):
	tel = models.CharField(max_length=20,verbose_name='手机号码',unique=True)
	code = models.CharField(max_length=10,verbose_name='验证码')
	time = models.DateTimeField(verbose_name='更新时间')
	count = models.IntegerField(default=0,verbose_name='请求验证码的次数')

	def __unicode__(self):
		return self.tel

	class Meta:
		verbose_name = '验证码'
		verbose_name_plural = '验证码管理'

'''
已经投过票的手机号
'''
class VOTEPHONE(models.Model):
	tel = models.CharField(max_length=20,verbose_name='手机号码')
	time = models.DateTimeField(verbose_name='投票时间')
	vote_type = models.IntegerField(verbose_name="奖项类型",default=0,choices=VOTE_TYPE)
	company = models.ForeignKey(COMPANY,verbose_name='投票公司')

	def __unicode__(self):
		return self.tel

	class Meta:
		verbose_name = '投票记录'
		verbose_name_plural = '投票记录'
