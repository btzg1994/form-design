<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html> 
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title>${activity.name }</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/front/css/cee.css"/>
		<link href="${pageContext.request.contextPath}/resources/Public/css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/front/js/jquery-1.11.0.min.js" ></script>
        <script src="${pageContext.request.contextPath}/resources/front/js/jquery.mobilePhoneNumber.js"></script>
        <script src="${pageContext.request.contextPath}/resources/front/js/jquery.caret.js"></script>
        <script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
        <link href="${pageContext.request.contextPath}/resources/Public/css/site.css?2024" rel="stylesheet" type="text/css" />
        <script type="text/javascript">
			var productName = '${activity.name}';
			function selectCg(){
				var text = $('#salarytype').find("option:selected").text();
				$('#county').text(text);
			}
		</script>
		<style>
		    .content{max-width: 720px;background-color: #${activity.bgColor}; position: relative;}
			.guanzhu {width: 86%;margin-left: 7%;margin-top: 4px;   overflow: hidden;
	              border-radius: 10px;text-align: center; position:relative;}
			.word1{margin-top: 10px; font-size: 40px;font-weight: 1200; padding-bottom:10px; line-height:1.1em;}
			.word2{font-size: 14px; font-weight: 600;
			       margin-top: -30px;display: block; position:absolute; right:10px; bottom:10px;}	
			.time {width: 86%;margin: auto;margin-top: 14px; overflow: hidden;background-color: black;}	
			.word5{font-size: 81px;
					font-weight: normal;
					font-stretch: normal;
					letter-spacing: 8px;
					color: #ffffff;
					box-shadow: 4px 14px 18px 0px 
						rgba(255, 146, 102, 0.77);}	
			.img7{width: 15%;margin-left: 7%;}	 
			.word6{margin-left: 25%;
				font-size: 15px;color: #ffffff;}			
			table{width: 86%;margin-left: 7%;margin-top:15px;border: none;}	
			tr{border: 1px solid white;color: white;font-size: 14px;}
			td{text-align: center;border: 1px solid white;color: white;font-size: 14px; padding:8px 5px; line-height:1.6em;}	
			.signup{width :53%; margin-left:23%;margin-top: 40px;}
			.footer{margin-top: 25px;}	
			
			.tankuang input{margin-left: 12%;width: 76%;border-radius: 20px;height: 50px;
			border: none; box-sizing: border-box; padding: 0px 40px;font-size: 16px;}	
			img{width: 100%;}       
			.control-group{margin-left:-15%;}
			fieldset{border:none}	
		</style>
		
		
		<script type="text/javascript">
			const ENDTIME = ${endTime};
			const PHONE_REGEX = /^1\d{10}$/;
			
			
			
			
			$(function(){
				
				$('#legend').hide();
				
				/* 立即报名按钮*/
			 	$('#signupImg').click(function(){
			 		var date = new Date();
					var nowTime = date.getTime();
					var time = ENDTIME - nowTime;
			 		if(time <= 0){//活动已结束
			 			alert('活动已结束！');
			 			return;
			 		}
			 		
			 		var index = layer.open({
					  type: 1,
					  skin: 'layui-layer-rim', //加上边框
					  area: ['400px', '300px'], //宽高
					  content:  '${form.content }'+'<dd><div class="butdiv"><a id="signupBtn" href="javascript:;"><img src="${pageContext.request.contextPath}/resources/front/img/img-button2.png"></a></div></dd>',
					});
					
					/* 确认报名 */
				$('#signupBtn').click(function(){
					var activitydId = $('#aid').val();
					//校验
					if(!activitydId){
						alert('服务器繁忙！');
						return;
					}
					
					var formData = new FormData($('form').get(0));
					formData.append("activityId",activitydId);
					$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/formRecord/addFormRecord",
							async : false,
							data : formData,
							processData : false, //必不可缺
							contentType : false, //必不可缺
							dataType : "json",
							success : function(data) {
									layer.close(index);
						   			alert(data.info);
							}
						});
				});
				
						
					$('legend').hide();					
			 	});
			 	
			 	$('#closeBtn').click(function(){
			 		$('#tanceng').hide();
			 	})
				
				
				
			})
			
						//--创建页面监听，等待微信端页面加载完毕 触发音频播放
document.addEventListener('DOMContentLoaded', function () {
    function audioAutoPlay() {
        var audio = document.getElementById('musicfx');
            audio.play();
        document.addEventListener("WeixinJSBridgeReady", function () {
            audio.play();
        }, false);
    }
    audioAutoPlay();
});

			
		</script>
	</head>
	
	
<style type="text/css">
	#musicControl { position:fixed;right:10px;top:10px;display:inline-block;}
	#musicControl a { display:inline-block;width:30px;height:30px;overflow:hidden;background-image:url('http://wxdata.52116.cn/static/img/mcbg4.png');background-repeat: no-repeat;background-size:30px auto;}
	#musicControl a audio{width:100%;height:30px;}
	#musicControl a.stop { background-position:0px bottom;}
	#musicControl a.on { background-position:0px 0px;-webkit-animation:reverseRotataZ 1.2s linear infinite;}
	#music_play_filter{width:100%;height:100%;overflow:hidden;position:fixed;top:0;left:0;z-index:99999998;}
	@-webkit-keyframes reverseRotataZ{
		0%{-webkit-transform: rotateZ(0deg);}
		100%{-webkit-transform: rotateZ(-360deg);}
	}
</style>

	
	<body >
		<input type="hidden" value="${activity.id}" id="aid">
			<!-- 播放器 -->
			<div id="music_play_filter" onclick="just_play(1)"></div>
		    <span id="musicControl">
		    <a id="mc_play" class="on" onclick="play_music();">
				<audio id="musicfx" loop="loop" autoplay="autoplay">
					<source src="${pageContext.request.contextPath}/${activity.musicUrl}" type="audio/mpeg" />
				</audio>
			</a>
			</span>
			<!-- 播放器 -->
			<div class="di">
				<img  src="${pageContext.request.contextPath}/${activity.imgUrl}"/>
			</div>
		
		<div class="content">
                
				
				
				<div id="signupImg" class="fuceng" style="width: 100%;height: 80PX;position: fixed;bottom: 0px;left: 50%;transform: translate(-50%,0);
					 -webkit-transform: translate(-50%,0);background-color: rgba(255,255,255,0.5);max-width: 750px;margin: auto;" >
				    <div style="width: 56%;max-width: 600px; background-color:#ffe92f ;margin: auto;
					border-radius: 10px;margin-top: 10px;margin-left:23%; font-size: 20px;color: white;text-align: center;line-height: 40px;">
						<div class="word1"  style="padding: 10px; font-size: 40px;">立即报名</div>
					</div>
			    </div> 
				
				
				
				<%-- <img id="signupImg" class="signup" style="cursor: pointer;" src="${pageContext.request.contextPath}/resources/front/img/img-button.png"/> --%>
			</div>
			
			
			
		</div>
		
		<script>
			$(function  () {
				$(".signup").click( function (){
					$(".tankuang").show();
					$(".di").hide();
				});
				$(".close").click( function (){
					$(".tankuang").hide();
					$(".di").show();
				});
				});
        </script>
	</body>
</html>
<script type="text/javascript">
	function just_play(id){
		$('#mc_play audio').get(0).play();
		$('#mc_play').attr('class','on');
		if (typeof(id)!='undefined'){
			$('#music_play_filter').hide();
		}
	}
	function play_music(){
		if ($('#mc_play').hasClass('on')){
			$('#mc_play audio').get(0).pause();
			$('#mc_play').attr('class','stop');
		}else{
			$('#mc_play').attr('class','on');
		}
		$('#music_play_filter').hide();
	}
var play_filter=document.getElementById('music_play_filter');
play_filter.addEventListener('click', function(){
	just_play(1);
});
play_filter.addEventListener('touchstart', function(){
	just_play(1);
});
play_filter.addEventListener('touchend', function(){
	just_play(1);
});
play_filter.addEventListener('touchmove', function(){
	just_play(1);
});
play_filter.addEventListener('mousedown', function(){
	just_play(1);
});
play_filter.addEventListener('mouseup', function(){
	just_play(1);
});
play_filter.addEventListener('mousemove',function(){
	just_play(1);
});
</script>
