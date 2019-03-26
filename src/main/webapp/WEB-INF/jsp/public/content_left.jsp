<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
</style>
</head>
<!--左边导航-->
<div class="content-lf">
	<c:if test="${not empty ADMIN_ID}">
	
	<dl class="mymenu">
		<dt class="menu_title">
			<p class="gl_ico">
				<span>活动管理</span>
			</p>
		</dt>
		<dd class="menu_item ">
			<a href="${pageContext.request.contextPath}/view/activity_add" <c:if test="${param.type eq 'activityAdd' }">style="background-color: #44b549;color:#fff;"</c:if>>添加活动</a>
		</dd>
		<dd class="menu_item ">
			<a href="${pageContext.request.contextPath}/sign/activity/findActivities/1/10" <c:if test="${param.type eq 'activityList' }">style="background-color: #44b549;color:#fff;"</c:if>>活动管理</a>
		</dd>
	</dl>
	<dl class="mymenu">
		<dt class="menu_title">
			<p class="gl_ico">
				<span>表单管理</span>
			</p>
		</dt>
		<dd class="menu_item">
			<a href="${pageContext.request.contextPath}/view/addForm" <c:if test="${param.type eq 'addForm' }">style="background-color: #44b549;color:#fff;"</c:if>>创建表单模板</a>
		</dd>
		<dd class="menu_item ">
			<a href="${pageContext.request.contextPath}/view/formList" <c:if test="${param.type eq 'formList' }">style="background-color: #44b549;color:#fff;"</c:if>>已有表单模板</a>
		</dd>
	</dl>
	<dl class="mymenu">
		<dt class="menu_title">
			<p class="tj_ico">
				<span>目标用户管理</span>
			</p>
		</dt>
		<dd class="menu_item">
			<a href="${pageContext.request.contextPath}/view/target_user_add" <c:if test="${param.type eq 'targetUserAdd' }">style="background-color: #44b549;color:#fff;"</c:if>>添加用户</a>
		</dd>
		<dd class="menu_item">
			<a href="${pageContext.request.contextPath}/view/target_user_list" <c:if test="${param.type eq 'targetUserList' }">style="background-color: #44b549;color:#fff;"</c:if>>查询用户</a>
		</dd>
		<dd class="menu_item ">
			<a href="${pageContext.request.contextPath}/view/target_user_upload" <c:if test="${param.type eq 'targetUserUpload' }">style="background-color: #44b549;color:#fff;"</c:if>>批量导入联系人</a>
		</dd>
	</dl>
	<dl class="mymenu">
		<dt class="menu_title">
			<p class="tj_ico">
				<span>活动推送管理</span>
			</p>
		</dt>
		<dd class="menu_item">
			<a href="${pageContext.request.contextPath}/view/addSend" <c:if test="${param.type eq 'addSend' }">style="background-color: #44b549;color:#fff;"</c:if>>添加活动推送</a>
		</dd>
		<dd class="menu_item ">
			<a href="${pageContext.request.contextPath}/view/sendRecord" <c:if test="${param.type eq 'sendRecord' }">style="background-color: #44b549;color:#fff;"</c:if>>活动推送记录</a>
		</dd>
	</dl>
	<dl class="mymenu">
		<dt class="menu_title">
			<p class="tj_ico">
				<span>数据管理</span>
			</p>
		</dt>
		<dd class="menu_item">
			<a href="${pageContext.request.contextPath}/sign/activity/formdata/1/10" <c:if test="${param.type eq 'formData' }">style="background-color: #44b549;color:#fff;"</c:if>>表单数据下载</a>
		</dd>
		<dd class="menu_item ">
			<a href="${pageContext.request.contextPath}/view/access_detail_list" <c:if test="${param.type eq 'accessDetailList' }">style="background-color: #44b549;color:#fff;"</c:if>>活动页访问明细</a>
		</dd>
	</dl>
	</c:if>
	<c:if test="${not empty SUPER_ADMIN_NAME_SESSION}">
	<dl class="mymenu">
		<dt class="menu_title">
			<p class="tj_ico">
				<span>系统管理</span>
			</p>
		</dt>
		<dd class="menu_item">
			<a href="${pageContext.request.contextPath}/view/admin_add" <c:if test="${param.type eq 'adminAdd' }">style="background-color: #44b549;color:#fff;"</c:if>>添加管理人员</a>
		</dd>
		<dd class="menu_item ">
			<a href="${pageContext.request.contextPath}/view/admin_list" <c:if test="${param.type eq 'adminList' }">style="background-color: #44b549;color:#fff;"</c:if>>管理人员查询</a>
		</dd>
	</dl>
	</c:if>
</div>


</html>