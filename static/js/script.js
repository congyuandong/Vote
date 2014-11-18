var voteYear = 2015;
var voteMonth = 1;
var voteDay = 15;
//左侧导航条偏移数量
var offset_count = 0;
//验证码发送间隔时间
var getcode_time = 10;

var vote_id = -1;

$(document).ready(function() {
  var len = $(".left").height();
  len = (len > 500) ? len : 500;
  $(".main").css("height", len);
  var lenr = $(".vright").height();
	var lenl = $(".sidenav").height() + 60;
	if (lenl < lenr) {
		$(".vright").css("height", lenr);
		$(".vleft").css("height", lenr);
	} else
		$(".vmain").css("height", lenl);
  //设置倒计时
  setLastTime();

  //设置投票界面左侧导航的跟随效果
  $(document).scroll(function(){
  	if($('.sidenav.cfix').length > 0){
  		//$('.sidenav.cfix').css('top',($(document).scrollTop() - 200) +"px");
  		if($(document).scrollTop() > 760){
  			$('.sidenav.cfix').css('top',($(document).scrollTop() - 760 + 20 - window.offset_count*44) +"px");
  		}else{
  			$('.sidenav.cfix').css('top',20 +"px");
  		}
  		$(".vtitle").each(function(index){
      		if($(this).offset().top > $(window).scrollTop()){
        		if(index > 0){
          			$(".sidenav.cfix li:eq("+(index-1)+")").addClass("active").siblings().removeClass("active");
          			if(index > 10){
          				window.offset_count = index - 10
          			}
        		}
        	return false;
      	}
    });
  	}
  });

  //模态框的各类方法
  if($('#voteModal').length	> 0){
  	$('.btn_vote').click(function(){
  		$('#voteModal').modal("show");
  		$('#phone').val('');
  		$('#code').val('');
  		window.vote_id = $('.btn_vote').attr('data');
  		var load_timeout = $.cookie('load_timeout');
		if(load_timeout != 0 && load_timeout != null){
			$('#getcode').addClass('disabled');
			disable_getcode();
		}
  	});

  	//提交投票
  	$('#btn_sure').click(function(){
  		if(!checkMobile($('#phone').val())){
  			set_alert('您输入的手机号码不正确','');
  			return;
  		}
  		if($('#code').val() == ''){
  			set_alert('验证码不能为空','');
  			return;
  		}

  		$('#voteModal').modal("hide");

  		$.ajax({
	        url:'/v/vc/?tel='+$('#phone').val()+'&code='+$('#code').val()+'&id='+window.vote_id,
	        method:'get',
	        dateType:'json',
	        success:function(data){
	            status = data.status;
	            if(status == 1){
	            	alert('投票成功!感谢您的支持!');
	            }else if(status == 0){
	            	alert('验证码错误或已失效');
	            }else if(status == 2){
	            	alert('您已经投过票了，请勿重复投票');
	            }
	        },
	        error:function(date){
	        }
    	});
  	});

  	//获取验证码
  	$('#getcode').click(function(){
  		if(!checkMobile($('#phone').val())){
  			set_alert('您输入的手机号码不正确','');
  			return;
  		}
  		$.ajax({
	        url:'/v/code/?tel='+$('#phone').val(),
	        method:'get',
	        dateType:'json',
	        success:function(data){
	            status = data.status;
	            if(status == 1){
	            	set_alert('验证码获取成功，请稍等','alert-info');
	            }else if(status == 2){
	            	set_alert('该手机号码已投票，请勿重复投票','alert-error');
	            }else if(status == 3){
	            	set_alert('该手机号码已获取验证码超过三次，请跟换其他手机号码进行投票','alert-error');
	            }else if(status == 4){
	            	set_alert('您的验证码仍然有效，请在60秒后再尝试','alert-info');
	            }
	        },
	        error:function(date){
	        }
    	});

  		$.cookie('load_timeout',getcode_time);
  		$('#getcode').addClass('disabled');
  		disable_getcode();

  	});

  } 
});

//设置警告框内容和样式
function set_alert(msg,type){
	content = "<div class='alert "+type+" '><button type='button' class='close' data-dismiss='alert'>&times;</button> <strong>"+msg+"</strong></div>"
	$('#alert_field').html(content);
}

//禁止获取验证码
function disable_getcode(){
	var load_timeout = $.cookie('load_timeout');
	if (load_timeout >= 0) {
		$('#getcode_span').text(load_timeout+'s');
		$.cookie('load_timeout' , load_timeout - 1);
		setTimeout("disable_getcode()", 1000);
	}else{
		$('#getcode').removeClass('disabled');
		//$('#span_refresh').css("color","#017aff");
		$('#getcode_span').text('获取');
	}
}

function checkMobile(str){
	var re = /^1\d{10}$/;
    return re.test(str);
}


function setLastTime(){
	var now = new Date();
	var endDate = new Date(voteYear,voteMonth,voteDay);
	var leftTime = endDate.getTime() - now.getTime();
	if(leftTime>=0){
		var leftsecond = parseInt(leftTime/1000);
		var day = Math.floor(leftsecond/(24*60*60));
		var hour =  Math.floor((leftsecond-day*24*60*60)/(60*60));
		var minute = Math.floor((leftsecond-day*24*60*60-hour*3600)/60);
		var second = Math.floor(leftsecond-day*24*60*60-hour*3600-minute*60);
		if(day >= 10){
			$('#t_days').text(day);
		}else{
			var str_days = '0'+day.toString();
			$('#t_days').text(str_days);
		}
		if(hour >= 10){
			$('#t_hours').text(hour);
		}else{
			var str_hours = '0'+hour.toString();
			$('#t_hours').text(str_hours);
		}
		if(minute >= 10){
			$('#t_mins').text(minute);
		}else{
			var str_mins = '0'+minute.toString();
			$('#t_mins').text(str_mins);
		}
		if(second >= 10){
			$('#t_secs').text(second);
		}else{
			var str_second = '0'+second.toString();
			$('#t_secs').text(str_second);
		}
	}else{
		$('#t_days').text('00');
		$('#t_hours').text('00');
		$('#t_mins').text('00');
		$('#t_secs').text('00');
	}
	setTimeout('setLastTime()',1000);
}
