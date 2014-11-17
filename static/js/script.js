var voteYear = 2015;
var voteMonth = 1;
var voteDay = 15;

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


});


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
