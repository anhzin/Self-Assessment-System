<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<div id="assignmentE" class="portlet box light panel panel-success">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject leftShift"> <i
				class="fa fa-book fa-fw"></i>Assignment List
			</span>
		</div>
		<div class="actions">
			<jsp:useBean id="now" class="java.util.Date" />
			Date Time :
			<fmt:formatDate value="${now}" pattern="MM/dd/yyyy hh:mm:ss a z" />
			&nbsp; &nbsp;
		
			<a
				class="btn  btn-circle btn-icon-only btn-primary fullscreen fa fa-th-large text-right alignright"
				href="#" data-original-title="" title=""></a>
		</div>
	</div>
	<div class="portlet-body">
		<button id="exportAssignment" class="btn btn-primary btn-circle alignright">
			<i class="fa fa-arrow-circle-down"></i>Export
		</button>
		<!-- 		<div class="table-toolbar">
			<div class="row">
				<div class="col-md-6"></div>
			</div>
		</div>
		<br> <br>

		<div class="row">
			<div class="col-md-8"></div>
		</div>
		<br> <br> -->

		<div id="table_wrapper">

			<table class="table table-striped table-hover table-bordered"
				id="sample_editable_1">
				<thead>
					<tr>
						<th><input type="checkbox" class="chkAssignmentCls"
							id="assignments_SelectAll" data-chks=".assignmentChkGroup" /></th>
						<th>No</th>
						<th>Coach</th>
						<th>StudentID</th>
						<th>Full Name</th>
						<th>Entry</th>
						<th>Email</th>
						<th>Date Assigned</th>
						<th>Date Finished</th>
						<th>Try</th>
						<th class="tblStatusCol2">Status</th>
						<th class="noExl">Report</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${assignments}" var="assignment"
						varStatus="status">
						<tr>
							<td class="assignmentChkGroup" data-id="${assignment.id}"><input
								type="checkbox" /></td>
							<td>${status.count}</td>
							<td>${assignment.coachId.firstName}
								${assignment.coachId.lastName}</td>
							<td>${assignment.studentId.studentId}</td>
							<td>${assignment.studentId.firstName}
								${assignment.studentId.lastName}</td>
							<td>${assignment.studentId.entry}</td>
							<td>${assignment.studentId.email}</td>
							<fmt:parseDate value="${assignment.start_date}"
								pattern="yyyy-MM-dd'T'HH:mm" var="startDate" type="date" />
							<fmt:formatDate value="${startDate}" var="myStartDate"
								type="date" pattern="MM/dd/yyyy hh:mm:ss a z" />
							<td>${myStartDate}</td>
							<fmt:parseDate value="${assignment.end_date}"
								pattern="yyyy-MM-dd'T'HH:mm" var="endDate" type="date" />
							<fmt:formatDate value="${endDate}" var="myEndDate" type="date"
								pattern="MM/dd/yyyy hh:mm:ss a z" />
							<td>${myEndDate}</td>
							<%-- 							<td>${assignment.count}</td> --%>
							<td><c:choose>
									<c:when test="${assignment.count == 99}">
										0
									</c:when>
									<c:otherwise>
										${assignment.count}
									</c:otherwise>
								</c:choose></td>

							<td><c:choose>

									<c:when
										test="${assignment.started == true and assignment.finished==true}">
										<span class="label label-primary">F</span>
									</c:when>
									<c:when
										test="${assignment.started == true and assignment.finished==false}">
										<span class="label label-warning">S</span>
									</c:when>
									<c:when
										test="${assignment.started == false and assignment.finished==false}">
										<span class="label label-info">A</span>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose></td>
							<td class="noExl"><c:choose>

									<c:when
										test="${assignment.started == true and assignment.finished==true}">


										<a
											href="<spring:url value="/${sessionScope.role}/result/${assignment.id}" />">result</a> | <a
											href="<spring:url value="/${sessionScope.role}/resultDetail/${assignment.id}" />">detail</a>
                                      | <a
											href="<spring:url value="/${sessionScope.role}/resultDetail/${assignment.id}" />">Feedback</a>

									</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</div>
<script
	src="<c:url value="/metronic/assets/global/plugins/jquery.min.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/metronic/assets/global/plugins/jquery-migrate.min.js" />"
	type="text/javascript"></script>
<%-- <script src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"/>"></script> --%>
<%-- <script  src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"/>"></script> --%>
<script type="text/javascript"
	src="<c:url value="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.1.135/jspdf.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="http://cdn.uriit.ru/jsPDF/libs/adler32cs.js/adler32cs.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2014-11-29/FileSaver.min.js"/>"></script>
<%-- <script type="text/javascript" src="<c:url value="libs/Blob.js/BlobBuilder.js"/>"></script> --%>
<script type="text/javascript"
	src="<c:url value="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.addimage.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.standard_fonts_metrics.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.split_text_to_size.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="http://cdn.immex1.com/js/jspdf/plugins/jspdf.plugin.from_html.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/metronic/assets/admin/pages/scripts/jquery.table2excel.js"/>"></script>