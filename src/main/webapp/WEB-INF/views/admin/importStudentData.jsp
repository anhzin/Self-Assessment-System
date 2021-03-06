<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp"%>

<c:if test="${not empty success}">
	<%@ include file="/WEB-INF/views/LogPopUp.jsp"%>
</c:if>
<div class="panel panel-success">

	<div class="panel-heading">
		<h3 class="panel-title">
			<i class="glyphicon glyphicon-upload"></i>Import Data
		</h3>
	</div>
	<div class="panel-body">
		<div class="portlet-body form">
			<c:if test="${not empty error}">
				<div class="alert alert-warning">
					<strong>Warning!</strong> <br />invalid extension!
				</div>
				
			</c:if>
			<div class="alert alert-warning" id="invalid" style="display: none">
					<strong>Warning!</strong> ${error1} <br /> Invalid Format!
				</div>
			<c:if test="${not empty success}">
				<div class="alert alert-success">
					<strong>Success!</strong> Successfully imported Data!
				</div>
			</c:if>
			<c:if test="${error}">
				<div class="alert alert-success">
					<strong>Oops!</strong> Something went wrong, please check the file!
				</div>
			</c:if>
			<form:form method="POST" class="register-form"
				action="importStudentData" enctype="multipart/form-data">
				<div class="form-body">
					<div class="form-group last">
						<label class="col-md-3 control-label">Excel file</label>
						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon input-circle-left"> <i
									class="fa fa-file-excel-o"></i>
								</span> <input 
									type="file"
									name="ExcelFile" id="ExcelFile"
									class="form-control input-circle-right"
									placeholder="Excel File" 
									required
									accept=".csv, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.ms-excel"
									>
							</div>
						</div>
					</div>
				</div>
				<br />
				<div class="form-actions">
					<div class="row">
						<div class="col-md-offset-3 col-md-9">
							<button type="submit" class="btn btn-circle btn-primary" onclick="return loadingStudents()">
								<span class="glyphicon glyphicon-upload" ></span> Import
							</button>
							<c:if test="${sessionScope.role == 'admin' }">
							<a href="<c:url value='/admin/students'/>"> <input
								type="button" id="register-cancel-btn"
								class="btn btn-default btn btn-circle" value="Cancel" /></a>
								</c:if>
								<c:if test="${sessionScope.role == 'coach' }">
							<a href="<c:url value='/coach/students'/>"> <input
								type="button" id="register-cancel-btn"
								class="btn btn-default btn btn-circle" value="Cancel" /></a>
								</c:if>
						</div>
					</div>
				</div>
			</form:form>
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-waitingfor/1.2.4/bootstrap-waitingfor.js"></script>
<script>

$(document).ready(
	    function(){
	        $('input:file').change(
	            function(){
	            	var x = document.getElementById("invalid");
	            	var ext= $('#ExcelFile').val().split('.').pop().toLowerCase();
	            	if($.inArray(ext, ['xls','xlsx']) == -1) {
	            	   x.style.display= "block";
	            	    
	            	}else{
	            		x.style.display= "none";
	            	}
	            }
	            );
	    });
	    
//loading pop up while waiting to complete the import	
window.loadingStudents=function(){
	 var inputFile = document.getElementById("ExcelFile").value; // added .value
	 if (inputFile !== "") {
		 waitingDialog.show('Processing......');
		 return true;
	 }
}	
</script>
