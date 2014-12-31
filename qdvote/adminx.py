#coding:utf-8
import xadmin
from xadmin import views
from models import *

from DjangoUeditor.models import UEditorField
from DjangoUeditor.widgets import UEditorWidget
from xadmin.views import BaseAdminPlugin, ModelFormAdminView, DetailAdminView
from django.conf import settings
from django.db.models import TextField

class GlobalSetting(object):
	#设置base_site.html的Title
	site_title = '场外市场评选活动后台管理系统'

	def get_site_menu(self):

		return (
            {'title': '清大益讯','menus':(
                {'title': '评委管理', 'icon': 'fa fa-user', 'url': self.get_model_url(JUDGE, 'changelist')},
                {'title': '行业分类', 'icon': 'fa fa-file', 'url': self.get_model_url(INDUSTRY, 'changelist')},
                {'title': '参评企业', 'icon': 'fa fa-bank', 'url': self.get_model_url(COMPANY, 'changelist')},
                {'title': '投票记录', 'icon': 'fa fa-inbox', 'url': self.get_model_url(VOTEPHONE, 'changelist')},
            )},
        )



class JUDGEAdmin(object):
	list_display = ['name','company','position','sort']
	search_fields = ['name']
	list_editable = ['name', 'company', 'position','sort']

class INDUSTRYAdmin(object):
	list_display = ['name','sort']
	search_fields = ['name']
	list_editable = ['name','sort']

class COMPANYAdmin(object):
	list_display = ['name','code','industry','vote_type','vote_status','video','vote','sort']
	search_fields = ['name']
	list_editable = ['name','industry','vote_type','vote_status','video','sort']
	list_filter=['industry','vote_type','vote_status']
	style_fields  = {'detail':'ueditor'}
	list_per_page = 20

class RANDOMCODEAdmin(object):
	list_display = ['tel','code','time','count']

class VOTEPHONEAdmin(object):
	list_display = ['tel','time','vote_type','company']


class XadminUEditorWidget(UEditorWidget):
	def __init__(self,**kwargs):
		self.ueditor_options=kwargs
		self.Media.js = None
		super(XadminUEditorWidget,self).__init__(kwargs)

class UeditorPlugin(BaseAdminPlugin):
	def get_field_style(self, attrs, db_field, style, **kwargs):
		if style == 'ueditor':
			if isinstance(db_field, UEditorField):
				widget = db_field.formfield().widget
				param = {}
				param.update(widget.ueditor_settings)
				param.update(widget.attrs)
				return {'widget': XadminUEditorWidget(**param)}
			if isinstance(db_field, TextField):
				return {'widget': XadminUEditorWidget}
		return attrs
	def block_extrahead(self, context, nodes):
		js = '<script type="text/javascript" src="%s"></script>' % (settings.STATIC_URL + "ueditor/ueditor.config.js")
		js += '<script type="text/javascript" src="%s"></script>' % (settings.STATIC_URL + "ueditor/ueditor.all.min.js")
		nodes.append(js)


xadmin.site.register(JUDGE,JUDGEAdmin)
xadmin.site.register(INDUSTRY,INDUSTRYAdmin)
xadmin.site.register(COMPANY,COMPANYAdmin)
#xadmin.site.register(RANDOMCODE,RANDOMCODEAdmin)
xadmin.site.register(VOTEPHONE,VOTEPHONEAdmin)
xadmin.site.register(views.CommAdminView, GlobalSetting)
xadmin.site.register_plugin(UeditorPlugin,DetailAdminView)
xadmin.site.register_plugin(UeditorPlugin,ModelFormAdminView)