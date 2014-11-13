#coding:utf-8
from django.db import models
from imagekit.models import ProcessedImageField
from imagekit.processors import ResizeToFill


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
