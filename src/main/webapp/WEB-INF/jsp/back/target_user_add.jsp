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
		var gender = $('#gender').val();
		var phone = $('#phone').val();
		var email = $('#email').val();
		var addr = $('#addr').val();
		
		if(!name || !gender || !phone || !email || !addr){
			alert('存在空字段');
			return;
		}
		
		var index = layer.msg('正在保存');
		var formData = new FormData($('#form')[0]);
		$.ajax({
			type : 'post',
			url : "${pageContext.request.contextPath}/targetUser/addTargetUser",
			data : formData,
			cache : false,
			processData : false,
			contentType : false,
			dataType:'json'
		}).success(function(data) {
			if(data){
				if(data.code == 0){
					layer.msg(data.info);
					// alert(data.info);
				}else{
					layer.msg(data.info)
					// alert(data.info);
				}
			}
		}).error(function() {
		});
	});
	
	
	$('#clearBtn').click(function(){
		document.getElementById('form').reset();
	})
	
	
});
</script>
</head>


<body>   
   <div class="content">
   <!--顶部信息-->
   	<jsp:include page="../public/head.jsp"></jsp:include>
	<!--顶部信息结束-->
    
    
    <div class="content-box">
    
      <!--左边导航-->
    		<jsp:include page="../public/content_left.jsp">
    			<jsp:param value="targetUserAdd" name="type"/>
    		</jsp:include>  	
			<!--左边导航结束-->
        
        <!--右边内容-->
        <div class="content-rg">
            <div class="tityj">
                <p id="contentTitle" class="fl">目标用户管理</p>
                <div class="fr"></div>
                <div class="clear"></div>
            </div>
            
             <div class="rgtit">
                <ul>
                    <li class="sele"><span>添加用户</span></li>
                </ul>
                <div class="clear"></div>
            </div>
            
            <div class="rgcon bodybai">
                <div class="formdiv">
                	<form id="form" >
	                     <table  border="0" cellspacing="0" cellpadding="0" class="contab contab-wid">
	                          <tr>
	                            <th>姓名：</th>
	                            <td><input id="name"  name="name" type="text" class="form-control myinput" ></td>
	                          </tr>
	                          <tr>
	                            <th>性别：</th>
	                            <td><select id="gender"  name="gender"  class="form-control myinput" >
	                            		<option value="1" checked>男</option>
	                            		<option value="0">女</option>
	                            	</select>
	                            </td>
	                          </tr>
	                          <tr>
	                            <th>邮箱：</th>
	                            <td><input id="email"  name="email" type="text" class="form-control myinput" ></td>
	                          </tr>
	                          <tr>
	                            <th>电话：</th>
	                            <td><input id="phone"  name="phone" type="text" class="form-control myinput" ></td>
	                          </tr>
	                          <tr>
	                            <th>地址：</th>
	                            <td><textarea id="addr"  name="addr" type="text" class="form-control myinput" ></textarea></td>
	                          </tr>
	                         
	                      </table>
	                        
	                      <div class="but-div">
	                      	<button id="saveBtn" type="button" class="btn btn-info but120">保存</button>
		                      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                      	<button id="clearBtn" type="button" class="btn btn-info but120">重置</button>
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