<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线表单生成系统</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/back/js/easyui/themes/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/back/js/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/back/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/back/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/back/css/my.css"
	rel="stylesheet" type="text/css">
<style type="text/css">
.resetPwdBtn {
	
}

.frozenBtn {
	
}
</style>
<!--[if lt IE 9]><script src="${pageContext.request.contextPath}/resources/back/jrjs/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/resources/back/jrjs/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/html5shiv.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/back/jrjs/respond.min.js"></script>
<![endif]-->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/easyui/outOfBounds.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/zTree/jquery.ztree.all.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/jquery.ocupload-1.1.2.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/back/js/datetimeformat.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/jquery.easyui.plus.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/back/js/myjs.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/layer/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/back/js/myjs.js"></script>


</head>


<body>
	<div class="content">
		 <!--顶部信息-->
   	<jsp:include page="../public/head.jsp"></jsp:include>
	<!--顶部信息结束-->
    
    
    <div class="content-box">
    
      <!--左边导航-->
    		<jsp:include page="../public/content_left.jsp">
    			<jsp:param value="formData" name="type"/>
    		</jsp:include>  	
			<!--左边导航结束-->

			<!--右边内容-->
			<div class="content-rg">
				<div class="tityj">
					<p id="contentTitle" class="fl">数据管理</p>
					<div class="fr"></div>
					<div class="clear"></div>
				</div>
			<div class="rgtit">
                <ul>
                    <li class="sele"><span>表单数据下载</span></li>
                </ul>
                <div class="clear"></div>
            </div>
				<div class="rgcon bodybai">
					<!-- <div class="butdivs">
						<a type="button"
							href=""
							class="btn btn-info">xx</a> 
					</div> -->
					
					<div class="border-bom">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="table mytab">
							<thead>
								<tr>
									<th>活动编号</th>
									<th>活动图片</th>
									<th>活动名称</th>
									<th>活动开始时间</th>
									<th>活动结束时间</th>
									<th>创建时间</th>
									<th>备注</th>
									<th>状态</th>
									<th>总访问量</th>
									<th>操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${pageInfo.list}" var="activity"
									varStatus="vs">
									<tr>
										<td>${activity.id}</td>
										<td ><img width="150px;" src="${pageContext.request.contextPath}/${activity.imgUrl}"> </td>
										<td>${activity.name}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
												value="${activity.startTime}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
												value="${activity.endTime}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
												value="${activity.createTime}" /></td>
										<td>${activity.remark}</td>
										<td>${activity.status == 1 ? "已启用" : "已冻结"}</td>
										<td>${activity.pageViewCount}</td>
										<td>
												<a  href="${pageContext.request.contextPath}/index/${activity.id}">活动主页</a>&nbsp;&nbsp;
												<a   href="${pageContext.request.contextPath}/sendDetail/getFormSendDetail?activityId=${activity.id}">下载表单明细</a>&nbsp;&nbsp;
												
										</td>
									</tr>
								</c:forEach>
							<tbody>
						</table>
					</div>

					<c:if test="${pageInfo.size != 0 }">
						<!--分页-->
						<div class="fenye">
							<div class="black2 black1 fl">
								<span>每页显示条数：</span>
								<c:choose>
									<c:when test="${pageInfo.pageSize == 5 }">
										<span class="current">5条</span>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/back/activity/findActivities/${pageInfo.pageNum}/5">5条</a>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${pageInfo.pageSize == 10 }">
										<span class="current">10条</span>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/back/activity/findActivities/${pageInfo.pageNum}/10">10条</a>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${pageInfo.pageSize == 20 }">
										<span class="current">20条</span>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/back/activity/findActivities/${pageInfo.pageNum}/20">20条</a>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${pageInfo.pageSize == 30 }">
										<span class="current">30条</span>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/back/activity/findActivities/${pageInfo.pageNum}/30">30条</a>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="black2 fr">
								<c:choose>
									<c:when test="${pageInfo.pageNum == 1 }">
										<span class="disabled"> &lt; </span>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/back/activity/findActivities/${pageInfo.pageNum - 1}/${pageInfo.pageSize}">
											&lt; </a>
									</c:otherwise>
								</c:choose>

								<c:set var="maxNavigatepageNum" value="0"></c:set>

								<c:forEach items="${pageInfo.navigatepageNums }" var="num">
									<c:choose>
										<c:when test="${pageInfo.pageNum == num }">
											<span class="${pageInfo.pageNum == num ? 'current':'' }">${num}</span>
										</c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath }/back/activity/findActivities/${num}/${pageInfo.pageSize}">${num }</a>
										</c:otherwise>
									</c:choose>

									<c:set var="maxNavigatepageNum" value="${ num}"></c:set>
								</c:forEach>

								<c:if test="${maxNavigatepageNum != pageInfo.pages }">
                       	...
                       	<a
										href="${pageContext.request.contextPath }/back/activity/findActivities/${pageInfo.pages}/${pageInfo.pageSize}">${pageInfo.pages }</a>
								</c:if>
								<c:choose>
									<c:when test="${pageInfo.pageNum == pageInfo.pages }">
										<span class="disabled"> &gt; </span>
									</c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/back/activity/findActivities/${pageInfo.pageNum + 1}/${pageInfo.pageSize}">
											&gt; </a>
									</c:otherwise>
								</c:choose>

							</div>

							<div class="clear"></div>
						</div>
						<!--分页结束-->
					</c:if>
				</div>

			</div>
			<!--右边内容结束-->
		</div>
	</div>

</body>

</html>