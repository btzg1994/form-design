<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>在线表单生成系统</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/icon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/back/js/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">

<link href="${pageContext.request.contextPath}/resources/back/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/back/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/resources/back/css/my.css" rel="stylesheet" type="text/css">   
<link href="${pageContext.request.contextPath}/resources/back/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">   
<link href="${pageContext.request.contextPath}/resources/jpicker-1.1.6/css/jPicker-1.1.6.min.css" rel="stylesheet" type="text/css">   
<link href="${pageContext.request.contextPath}/resources/jpicker-1.1.6/jPicker.css" rel="stylesheet" type="text/css">   
<style type="text/css">
	.pms_unit{}
	.pms_second{}
	.pms_first{}
</style>
<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/resources/back/jrjs/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/resources/back/jrjs/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/html5shiv.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/respond.min.js"></script>
<![endif]-->

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.min.js"></script>   
<script src="${pageContext.request.contextPath}/resources/back/js/bootstrap.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/easyui/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/easyui/outOfBounds.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/zTree/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/jquery.ocupload-1.1.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/datetimeformat.js"></script>
<script src="${pageContext.request.contextPath}/resources/back/js/jquery.easyui.plus.js"></script>
<script src="${pageContext.request.contextPath}/resources/back/js/myjs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jpicker-1.1.6/jpicker-1.1.6.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
<script type="text/javascript">
	
$(function(){
	
	/* 提交表单 */
	$('#saveBtn').click(function() {
		var name = $('#name').val();
		var startTime = $('#startTime').val();
		var endTime = $('#endTime').val();
		var bgColor = $('#bgColor').val();
		
		if(!name){
			alert('活动名称不能为空！');
			return;
		}
		if(!bgColor){
			alert('背景颜色不能为空！');
			return;
		}
		if(!startTime){
			alert('活动开始时间不能为空！');
			return;
		}
		if(!endTime){
			alert('活动结束时间不能为空！');
			return;
		}
		
		var x1 = Date.parse(startTime);
		var x2 = Date.parse(endTime);
		var x3 = x2 - x1;
		if(x3 < 0 ){//时间差小于0，提示重新输入
			alert('活动开始时间不能大于活动结束时间！');
			return;
		}
	
	
		var formData = new FormData($('#addActivityForm')[0]);
		layer.msg('正在保存');
		$.ajax({
			type : 'post',
			url : "${pageContext.request.contextPath}/sign/activity/addActivity",
			data : formData,
			cache : false,
			processData : false,
			contentType : false,
		}).success(function(data) {
			if(data){
				layer.msg(data.rspMsg);
			}
		}).error(function() {
		});
	});
	
	/* 初始化时间插件 */
	 $('#startTime').datetimepicker({
	    format: 'yyyy-mm-dd hh:ii:ss',
	    language:'zh-CN',
	    autoclose:true,
	    todayBtn:"linked",
	    minuteStep:1
	});
	
	$('#endTime').datetimepicker({
	    format: 'yyyy-mm-dd hh:ii:ss',
	    language:'zh-CN',
	    autoclose:true,
	    todayBtn:"linked",
	    minuteStep:1
	});
	
	const jpickerSettings= {
          window:
          {
        	  position:
              {
                x: 'screenCenter', /* acceptable values "left", "center", "right", "screenCenter", or relative px value */
                y: 'bottom' /* acceptable values "top", "bottom", "center", or relative px value */
              },
            expandable: true
          },
          images:
          {
            //clientPath: '/'+document.location.pathname.split("/")[1]+'/commons/jpicker-1.1.6/images/', /* Path to image files */
            clientPath: '${pageContext.request.contextPath}/resources/jpicker-1.1.6/images/', /* Path to image files */
          },
          localization: /* alter these to change the text presented by the picker (e.g. different language) */
          {
            text:
            {
              title: '拖动鼠标选中一个颜色',
              newColor: '选中颜色',
              currentColor: '当前颜色',
              ok: '确定',
              cancel: '取消'
            },
            tooltips:
            {
              colors:
              {
                newColor: '点击‘确定’提交新选颜色',
                currentColor: '点击这里还原当前颜色'
              },
              buttons:
              {
                ok: '提交选中的颜色',
                cancel: '取消并恢复当前颜色'
              }
            }
          }
          
        };
	
	 /* 背景颜色 */
	 $("#bgColor").jPicker(jpickerSettings);
	 /* 按钮颜色 */
	 $("#btnColor").jPicker(jpickerSettings);
	 /* 按钮文字颜色 */
	 $("#btnTextColor").jPicker(jpickerSettings);
	/************************jpicker********************************/
	
	
});
</script>
</head>


<body>   
   <div class="content">
    <!--顶部信息-->
   	<jsp:include page="../public/head.jsp" ></jsp:include>
	<!--顶部信息结束-->
    
    
    <div class="content-box">
    
	     <!--左边导航-->
    		<jsp:include page="../public/content_left.jsp">
	   			<jsp:param value="activityAdd" name="type"/>
    		</jsp:include>  	
			<!--左边导航结束-->
        
        <!--右边内容-->
        <div class="content-rg">
            <div class="tityj">
                <p id="contentTitle" class="fl">活动管理</p>
                <div class="fr"></div>
                <div class="clear"></div>
            </div>
            
             <div class="rgtit">
                <ul>
                    <li class="sele"><span>添加活动</span></li>
                </ul>
                <div class="clear"></div>
            </div>
            
            <div class="rgcon bodybai">
                <div class="formdiv">
                	<form id="addActivityForm" >
	                     <table  border="0" cellspacing="0" cellpadding="0" class="contab contab-wid">
	                          <tr>
	                            <th>活动名称：</th>
	                            <td><input id="name"  name="name" type="text" class="form-control myinput" ></td>
	                          </tr>
	                          <tr >
	                            <th>活动图片：</th>
								<td ><input style="border: none;" id="banner"  name="banner" type="file" class="form-control myinput" ><font style="color:red;">（建议图片大小不超过100KB）</font></td>
	                          </tr>
	                          <tr >
	                            <th>背景音乐：</th>
								<td ><input style="border: none;" id="music"  name="music" type="file" class="form-control myinput" ><font style="color:red;">（建议音乐文件大小不超过 1MB）</font></td>
	                          </tr>
	                          <tr >
	                            <th>背景颜色：</th>
								<td ><input  id="bgColor"  name="bgColor" type="text" class="form-control myinput" ></td>
	                          </tr>
	                          <tr>
	                            <th>活动开始时间：</th>
	                            <td><input id="startTime"  name="startTime" type="text" class="form-control myinput" ></td>
	                          </tr>
	                          <tr>
	                            <th>活动结束时间：</th>
	                            <td><input id="endTime" name="endTime" type="text" class="form-control myinput" ></td>
	                          </tr>
	                          <tr>
	                            <th>备注：</th>
	                            <td><input id="remark" name="remark" type="text" class="form-control myinput" ><font style="color:red;">（此项非必填）</font></td>
	                          </tr>
	                      </table>
	                        
	                      <div class="but-div">
	                      	<button id="saveBtn" type="button" class="btn btn-info but120">保存</button>
	                      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      	<button onclick="document.getElementById('addActivityForm').reset();" type="button" class="btn btn-info but120">重置</button>
	                      </div>
                      </form>
                 </div>
             </div>
        </div>
        <!--右边内容结束-->
    </div>
</div>  

</body>  

</html>