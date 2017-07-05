<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="bean.UserBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="bal.DoFoNdFormsBAL"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nizam Energy</title>

<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet" />
<link
	href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
	rel="stylesheet" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"> -->
<link href="assets/css/animate.min.css" rel="stylesheet" />
<link href="assets/css/style.min.css" rel="stylesheet" />
<link href="assets/css/style-responsive.min.css" rel="stylesheet" />
<link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
<!-- ================== END BASE CSS STYLE ================== -->

<!-- ================== BEGIN PAGE CSS STYLE ================== -->
<link href="assets/plugins/morris/morris.css" rel="stylesheet" />
<!-- ================== END PAGE CSS STYLE ================== -->

<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->
<link href="assets/plugins/ionicons/css/ionicons.min.css"
	rel="stylesheet" />
<link href="assets/plugins/simple-line-icons/simple-line-icons.css"
	rel="stylesheet" />

<link rel="stylesheet" href="style.css" type="text/css">
<script src="amcharts/amcharts.js" type="text/javascript"></script>
<script src="amcharts/serial.js" type="text/javascript"></script>

</head>
<body>
	<%
		UserBean userbean = (UserBean) session.getAttribute("email");
		if (userbean == null) {
			response.sendRedirect("SolarHomeSystemLogin");
		} else {
			ArrayList<HashMap<String, String>> list = DoFoNdFormsBAL
					.getFieldOfficersbyDistrict(userbean.getUser_district());
			System.out.println("list : "+list);
	%>

	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in">
		<span class="spinner"></span>
	</div>
	<!-- end #page-loader -->

	<!-- begin #page-container -->
	<div id="page-container"
		class="fade page-sidebar-fixed page-header-fixed page-with-light-sidebar page-with-wide-sidebar">

		<!-- begin #header -->
		<%@include file="/superAdminHeader.jsp"%>
		<!-- end #header -->

		<!-- begin #sidebar -->
		<div id="sidebar" class="sidebar">
			<!-- begin sidebar scrollbar -->
			<div data-scrollbar="true" data-height="100%">
				<!-- begin sidebar user -->
				<ul class="nav">
					<li class="nav-profile">
						<div class="image">
							<a href="javascript:;"><img src="assets/img/user-13.jpg"
								alt="" /></a>
						</div>
						<div class="info">
							<%=userbean.getUserName()%>
							<small> Superadmin </small>
						</div>
					</li>
				</ul>
				<!-- end sidebar user -->
				<!-- begin sidebar nav -->
				<ul class="nav">
					<!-- 					<li class="nav-header">Navigation</li> -->
					<li class="has-sub active"><a href="DistrictOfficerDashboard">
							<i class="fa fa-laptop"></i> <span>Dashboard</span>
					</a></li>

					<li class="has-sub"><a href="LoanRequest"> <%-- <span class="badge pull-right"><%=countRequests%></span> --%>
							<i class="icon-note"></i> <span>Loan Request</span> <!-- 						Begin	SuperAdminHeader.js UnseenRequest() -- Jeevan -->
							<span class="badge pull-right" id="do_unseen_loan_request_count"></span>
					</a></li>
					<li class="has-sub"><a href="DoWiseAdvanceBooking"><i
							class="fa fa-star"></i><span>Advance Booking</span> <span
							class="badge pull-right" id="do_unseen_bookings_count"></span></a></li>

					<li class="has-sub "><a href="DoAppliances"><i
							class="fa fa-suitcase"></i><span>Pipeline</span></a></li>

					<li class="has-sub"><a href="DoLoanBooks"><i
							class="fa fa-star"></i><span>Loan Books</span></a></li>

					<li class="has-sub"><a href="javascript:;"> <b
							class="caret pull-right"></b> <i class="fa fa-th"></i> <span>Sales
								Force</span>
					</a>
						<ul class="sub-menu active">
							<li><a href="DoWiseFieldOfficers">Field Officer</a></li>
							<li><a href="DoWiseNizamDost">Nizam Dost</a></li>
						</ul></li>


					<li class="has-sub"><a href="DoAlarmsPage"> <i
							class="fa fa-star"></i> <span>Live Alerts</span>
					</a></li>

					<li class="has-sub"><a href="DoFutureLoanBooks"> <i
							class="fa fa-star"></i> <span>Future Loan Books</span>
					</a></li>
					<!-- begin sidebar minify button -->
					<li><a href="javascript:;" class="sidebar-minify-btn"
						data-click="sidebar-minify"><i class="fa fa-angle-double-left"></i></a></li>
					<!-- end sidebar minify button -->
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- end #sidebar -->


		<!-- begin #content -->
		<div id="content" class="content">

			<div class="row" style="padding-top: 2%;">

				<div class="row">
					<p>
						<b style="font-size: x-large; color: brown;">Data </b>
					</p>
				</div>

				<div class="row well">

					<div class="row">
						<form method="GET" action="SalesReport">

							<label class="control-label col-md-2"><b>Late/Defaulter
									Customers</b> </label>
							<div class="col-md-2">
								<select class="form-control" name="foId">
									<option value="">Select Field Officer</option>
									<%
										for (int i = 0; i < list.size(); i++) {
									%>
									<option value=<%=list.get(i).get("foid")%>><%=list.get(i).get("foName")%></option>
									<%
										}
									%>
								</select>
							</div>

							<div class="col-md-2">
								<button type="submit" class="btn btn-success btn-sm pull-left"
									name="click" id="click"
									value="Download CustomerList">
									<b>Download Customer List</b>
								</button>
							</div>

						</form>
					</div>
				</div>
				<!-- end panel -->

			</div>

			<!-- end row -->
		</div>
		<!-- end #content -->

		<%
			} // session else closed
		%>

		<!-- begin scroll to top btn -->
		<a href="javascript:;"
			class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade"
			data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
		<!-- end scroll to top btn -->

	</div>



	<!-- end page container -->

	<!-- ================== BEGIN BASE JS ================== -->
	<script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
	<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/myscript.js"></script>

	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
	<script src="assets/plugins/chart-js/chart.js"></script>
	<script type="text/javascript" src="assets/js/notification-chat.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="assets/plugins/DataTables/js/jquery.dataTables.js"></script>
	<script src="assets/js/table-manage-default.demo.min.js"></script>

	<script src="assets/plugins/icheck/icheck.js"></script>

	<script src="assets/js/apps.min.js"></script>

	<script src="js/validation.js"></script>
	<script src="assets/js/numeral.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->

	<script type="text/javascript">
		$(document).ready(function() {
			App.init();
		});
	</script>
</body>

</html>
