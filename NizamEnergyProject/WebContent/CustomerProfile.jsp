<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bal.CustomerRetrieveDataBAL"%>
<%@page import="java.util.HashMap"%>
<%@page import="bean.UserBean"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="assets/icons/favicon.png" />
<title>Nizam Energy</title>

<!-- ================== BEGIN BASE CSS STYLE ================== -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link
	href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css"
	rel="stylesheet" />
<link href="assets/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="assets/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link href="assets/css/animate.min.css" rel="stylesheet" />
<link href="assets/css/style.min.css" rel="stylesheet" />
<link href="assets/css/style-responsive.min.css" rel="stylesheet" />
<link href="assets/css/myGallery.css" rel="stylesheet" />
<link href="assets/plugins/bootstrap-select/bootstrap-select.min.css"
	rel="stylesheet" />
<link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
<link href="assets/plugins/isotope/isotope.css" rel="stylesheet" />
<link href="assets/plugins/lightbox/css/lightbox.css" rel="stylesheet" />
<!-- ================== END BASE CSS STYLE ================== -->
<link rel="stylesheet" href="assets/css/viewer.css" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="assets/plugins/ionicons/css/ionicons.min.css"
	rel="stylesheet" />
<link href="assets/plugins/simple-line-icons/simple-line-icons.css"
	rel="stylesheet" />

<script type="text/javascript">	
	var customer;
	var appliance;

	function getValue(text) {
		var txt = document.getElementById('text').value;
		document.getElementById('updateURLreject').href = "AcceptAndRejectController?click=reject&customerId="
				+ customer + "&applianceId=" + appliance + "&text=" + txt + "";

	}

	function setMoodValueDelete(applianceID, customerID) {

		customer = customerID;
		appliance = applianceID;
		var text = document.getElementById('text').value;
		document.getElementById('updateURLreject').href = "AcceptAndRejectController?click=reject&customerId="
				+ customerID
				+ "&applianceId="
				+ applianceID
				+ "&text="
				+ text
				+ "";
	}
	function setMoodValue(eligibilityId) {
		document.getElementById("applianceId").innerHTML = eligibilityId;
		document.getElementById('updateURL').onclick = function() {
			helloWorld(eligibilityId);
		};
	}

	function helloWorld(applianceValue) {
		var link = "AcceptAndRejectController?click=accept&eligibilityId=" + applianceValue;
		document.getElementById('updateURL').href = link;

	}
	function changefunction() {
		
		if ($('#fgQ1 option:selected').val() == '2') {
			$("#fgQ1").css("display", "none");
			$("#fgQ1_diff_info").css("display", "block");
																				
		} 
		if ($('#fgQ2 option:selected').val() == '2') {
			$("#fgQ2").css("display", "none");
			$("#fgQ2_diff_info").css("display", "block");																		
		}
		if ($('#fgQ3 option:selected').val() == '2') {
		
			$("#fgQ3").css("display", "none");
			$("#fgQ3_diff_info").css("display", "block");
		}
		if ($('#ogQ1 option:selected').val() == '2') {
		
			$("#ogQ1").css("display", "none");
			$("#ogQ1_diff_info").css("display", "block");
		} 
		if ($('#ogQ2 option:selected').val() == '2') {
		
			$("#ogQ2").css("display", "none");
			$("#ogQ2_diff_info").css("display", "block");
		} 
		if ($('#ogQ3 option:selected').val() == '2') {
		
			$("#ogQ3").css("display", "none");
			$("#ogQ3_diff_info").css("display", "block");
		}
		if ($('#cvQ1 option:selected').val() == '1') {
		
			$("#cvQ1").css("display", "none");
			$("#cvQ1_diff_info").css("display", "block");
		}
		if ($('#cvQ2 option:selected').val() == '1') {
		
			$("#cvQ2").css("display", "none");
			$("#cvQ2_diff_info").css("display", "block");
		}
		if ($('#cvQ4 option:selected').val() == '1') {
		
			$("#cvQ4").css("display", "none");
			$("#cvQ4_diff_info").css("display", "block");
		}		
	}
																	
	function refreshCancel() {
																			
		$("#fgQ1").css("display", "block");
		$('#fgQ1 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#fgQ1_diff_info").css("display", "none");
	}
	function refreshfgQ2() {
																			
		$("#fgQ2").css("display", "block");
		$('#fgQ2 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#fgQ2_diff_info").css("display", "none");
	}
	function refreshfgQ3() {
																			
		$("#fgQ3").css("display", "block");
		$('#fgQ3 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#fgQ3_diff_info").css("display", "none");
	}
	function refreshogQ1() {
																			
		$("#ogQ1").css("display", "block");
		$('#ogQ1 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#ogQ1_diff_info").css("display", "none");
	}
	function refreshogQ2() {
																			
		$("#ogQ2").css("display", "block");
		$('#ogQ2 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#ogQ2_diff_info").css("display", "none");
	}
	function refreshogQ3() {
																			
		$("#ogQ3").css("display", "block");
		$('#ogQ3 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#ogQ3_diff_info").css("display", "none");
	}
	function refreshcvQ1() {
																			
		$("#cvQ1").css("display", "block");
		$('#cvQ1 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#cvQ1_diff_info").css("display", "none");
	}
	function refreshcvQ2() {
																			
		$("#cvQ2").css("display", "block");
		$('#cvQ2 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#cvQ2_diff_info").css("display", "none");
	}
	function refreshcvQ4() {
																			
		$("#cvQ4").css("display", "block");
		$('#cvQ4 option').filter(function(i){
		 return this.hasAttribute('selected')
		}).prop('selected', 'selected');
		
		$("#cvQ4_diff_info").css("display", "none");
	}

</script>

</head>
<body>

	<%
		UserBean userbean = (UserBean) session.getAttribute("email");
		int customerId = (Integer.parseInt((String) request
				.getAttribute("customerId")));

		String customerCnic = (String) request.getAttribute("cnic");

		int key = (Integer) request.getAttribute("key");
		int statuss = (Integer) request.getAttribute("status");

		String eligibilityId = (String) request.getAttribute("appId");

		int eligibID = (Integer.parseInt((String) request
				.getAttribute("appId")));

		ArrayList<HashMap<String, String>> maps = CustomerRetrieveDataBAL
				.getRequestStatus(Integer.parseInt(eligibilityId));
	%>
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

					<li class="has_sub"><a href="SuperAdminDashboard"> <i
							class="fa fa-laptop"></i> <span>Dashboard</span>
					</a></li>
					<li <%if (key == 1) {
				out.print("class='active'");
			}%>><a
						href="Request"> <i class="fa fa-inbox"></i> <span>Loan
								Request</span> <span class="badge pull-right"
							id="unseen_loan_request_count" style="font-size: 13px;"></span>
					</a></li>
					<li <%if (key == 3) {
				out.print("class='active'");
			}%>><a
						href="AdvanceBooking"> <i class="icon-support"></i> <span>Advance
								Booking</span><span class="badge pull-right" id="unseen_booking_count"></span>
					</a></li>


					<li <%if (key == 2) {
				out.print("class='active'");
			}%>><a
						href="Customer"> <i class="fa fa-suitcase"></i> <span>Customers
						</span>
					</a></li>
					<li class="has-sub"><a href="Appliances"> <i
							class="ion-cube"></i> <span>Pipeline</span>
					</a></li>
					<li class="has-sub "><a href="javascript:;"> <b
							class="caret pull-right"></b> <i class="fa fa-th"></i> <span>Sales
								Force</span>
					</a>
						<ul class="sub-menu active">
							<li><a href="DistrictOfficerr">District Officer</a></li>
							<li><a href="FieldOfficer">Field Officer</a></li>
							<li><a href="NizamDost">Nizam Dost</a></li>
						</ul></li>

					<li class="has-sub"><a href="javascript:;"> <b
							class="caret pull-right"></b> <i class="fa fa-money "></i> <span>Finance</span>
					</a>
						<ul class="sub-menu active">

							<li><a href="Finance">Payments</a></li>
							<li><a href="Loan">Loan books</a></li>
							<li><a href="CommissionPayout">Commissions</a></li>
						</ul></li>

					<li class="has-sub"><a href="DeviceAlarms"> <i
							class="icon-support"></i> <span>Alarms</span>
					</a></li>

					<li class="has-sub"><a href="EnergyAnalytics"> <i
							class="ion-podium"></i> <span>Energy Analytics</span>
					</a></li>

					<li class="has-sub"><a href="javascript:;"> <b
							class="caret pull-right"></b> <i class="fa fa-money "></i> <span>Reports</span>
					</a>
						<ul class="sub-menu active">
							<li><a href="LateAndDefaulterReport">Late/Defaulter
									Report</a></li>
							<li><a href="FutureLoanBooks">Future loan book</a></li>
							<li><a href="DataAndReports">Reports</a></li>
						</ul></li>
				</ul>
				<!-- end sidebar nav -->
			</div>
			<!-- end sidebar scrollbar -->
		</div>
		<div class="sidebar-bg"></div>
		<!-- end #sidebar -->

		<!-- begin #content -->
		<div id="content" class="content">

			<span style="float: left; color: black; margin-top: 2%;"
				class="page-header" id="customerName"></span> <span
				style="float: right; margin-bottom: 9px;"> <a
				href="javascript:;" class="btn btn-lg btn-block btn-success"> <i
					class="fa fa-calendar pull-left"></i>&nbsp;Created Date /<small
					id="created_date"> &nbsp;</small>
			</a> <a href="javascript:;" class="btn btn-lg btn-block btn-success">
					<i class="fa fa-calendar pull-left"></i>&nbsp;Requested Date /<small
					id="requested_date"> &nbsp;<%="0000-00-00"%></small>
			</a></span><br> <span
				style="float: right; margin-right: 10px; margin-top: -22px;">
				<%
					if (key == 1 || key == 3) {
						for (int i = 0; i < maps.size(); i++) {
							if (maps.get(i).get("Status").equals("0")
									|| maps.get(i).get("Status").equals("10")) {
				%> <a href="javascript:;" class="btn btn-lg btn-block btn-inverse">
					<i class="ion-cube pull-left" style="margin-top: 15px;"></i> &nbsp;
					Loan Request for<small> <%=maps.get(i).get("ApplianceName")%></small><br>
					Scheme <small><%=maps.get(i).get("scheme")%></small>
			</a><br> <span
				style="display: flex; margin-top: -15px; margin-bottom: 10px; margin-left: -2px">
					<a href="#modal-alert"
					onclick="setMoodValue('<%=maps.get(i).get("EligibilityId")%>')"
					class="btn"
					style="background-color: #2980b9; color: white; font-weight: bold; width: 120px"
					data-toggle="modal" style="width:70%;">Accept<span
						class="fa fa-check"> </span></a> <input
					style="background-color: black;" type="hidden" name="appliance"
					id="applianceValue" value="<%=maps.get(i).get("ApplianceId")%>">

					<a href="#modal-alert-delete"
					onclick="setMoodValueDelete('<%=maps.get(i).get("ApplianceId")%>','<%=maps.get(i).get("customerId")%>')"
					class="btn btn-danger"
					style="color: white; font-weight: bold; margin-left: 3%; width: 120px"
					data-toggle="modal"> Reject &nbsp;<span class="fa fa-times"></span>

				</a>
			</span> <%
 	}
 		}
 	}
 %>
			</span>


			<!-- begin profile-info -->

			<!-- begin table -->

			<div class="row">
				<div class="col-sm-12">
					<div class="panel  panel-with-tabs">
						<div class="panel-heading" style="margin-left: -15px">
							<ul id="" class="nav nav-tabs">
								<li class="active"><a href="#personalInformation"
									data-toggle="tab"> <span class="hidden-xs">Personal
											Information</span>
								</a></li>

								<li><a href="#incomeDetails" data-toggle="tab"><span
										class="hidden-xs">Income Details</span></a></li>
								<li><a href="#assetsExpenses" data-toggle="tab"><span
										class="hidden-xs">Assets, Expenses & Liabilities</span></a></li>
								<li><a href="#gaurantorsInformation" data-toggle="tab"><span
										class="hidden-xs">Guarantors Information</span></a></li>
								<%
									if (statuss == 4 || statuss == 9 || statuss == 0) {
								%>
								<li><a href="#ccVerification" data-toggle="tab"><span
										class="hidden-xs">CC Verification</span></a></li>
								<%
									}
								%>
							</ul>
							<h4 class="panel-title"></h4>
						</div>

						<div id="myTabContent" class="tab-content">

							<!-- personal information tab starts -->

							<div class="tab-pane fade in active" id="personalInformation">
								<div class="panel-body " style="">
									<div class="table table-striped" style="font-size: 13px">
										<div class="row-well">
											<div class="col-md-6 well">
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>Full
															Name</b></label>
													<div class="col-md-5" id="customer_name"></div>
												</div>
												<br>
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>Primary
															number</b></label>
													<div class="col-md-5" id="customer_phone"></div>
												</div>
												<br>
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>Secondary
															number</b></label>
													<div class="col-md-5" id="customer_phone2"></div>
												</div>
												<br>
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>CNIC</b></label>
													<div class="col-md-5" id="customer_cnic"></div>
												</div>
												<br>
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>Date
															of Birth</b></label>
													<div class="col-md-5" id="date_of_birth"></div>
												</div>
												<br>
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>Gender</b></label>
													<div class="col-md-5" id="gender"></div>
												</div>
												<br>
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>Marital
															Status</b></label>
													<div class="col-md-5" id="relation_status"></div>
												</div>
												<br>
												<div class="form-group row">
													<label class="col-md-7 control-label"><b>Disability</b></label>
													<div class="col-md-5" id="customer_disibility"></div>
												</div>
												<br> <br>

												<fieldset>
													<legend>
														<b>Location</b>
													</legend>

													<div class="form-group row">
														<label class="col-md-7 control-label"><b>System
																installed place, Address</b></label>
														<div class="col-md-5" id="customer_sys_installed_place"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Address</b></label>
														<div class="col-md-5" id="customer_address"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Union
																Council</b></label>
														<div class="col-md-5" id="customer_union_council"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Tehsil,
																District</b></label>
														<div class="col-md-5" id="tehsil_district"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Province</b></label>
														<div class="col-md-5" id="province"></div>
													</div>
													<br> <br>
												</fieldset>
												<fieldset>
													<legend>
														<b>Additional Contact Information</b>
													</legend>
													<table class="table equal table-responsive table-bordered"
														style="font-size: 13px">

														<thead style="background-color: ghostwhite;">
															<tr>
																<th>Name</th>
																<th>Relation</th>
																<th>Phone Number</th>
															</tr>
														</thead>
														<tbody id="additionContact">
														</tbody>
													</table>
												</fieldset>
											</div>

											<div class="col-md-6 well">
												<fieldset>
													<legend>
														<b>Household & Family</b>
													</legend>

													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Father
																Name</b></label>
														<div class="col-md-5" id="father_name"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Head
																of family</b></label>
														<div class="col-md-5" id="customer_head_faimly"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Caste</b></label>
														<div class="col-md-5" id="customerCaste"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Household
																members</b></label>
														<div class="col-md-5"
															id="customer_total_household_members"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Household
																Members Depends (Under 18)</b></label>
														<div class="col-md-5" id="customer_dependants_members"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Total
																Household Members (Adult & Above 60)</b></label>
														<div class="col-md-5" id="customer_total_adult_members"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Number
																of Childrens going to School</b></label>
														<div class="col-md-5" id="customer_children"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Family
																Type</b></label>
														<div class="col-md-5" id="customer_families_type"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Room
																Occupied By Household (Only bedroom & living room)</b></label>
														<div class="col-md-5" id="customer_roomoccupied_household"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Residence</b></label>
														<div class="col-md-5" id="customer_residence"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Residence
																Since (number of years)</b></label>
														<div class="col-md-5" id="customer_residence_period"></div>
													</div>
													<br>
												</fieldset>
												<fieldset>
													<legend>
														<b>Qualification & Other Information</b>
													</legend>

													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Education</b></label>
														<div class="col-md-5" id="education"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"><b>Technical/Vocational
																Training, Course name</b></label>
														<div class="col-md-5" id="customer_training_skill"></div>
													</div>
													<br>
												</fieldset>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- personal information tab ends -->

							<!-- income details tab starts -->

							<div class="tab-pane fade" id="incomeDetails">
								<div class="panel-body " style="">
									<div class="table table-striped" style="font-size: 13px">
										<div class="row-well">
											<div class="col-md-6 well">
												<fieldset>
													<div class="form-group row">
														<label class="col-md-7 control-label"><legend>
																<b>Monthly Income</b>
															</legend></label>
														<div class="col-md-5" id="net_monthly_income"
															style="font-size: 21px; font-weight: bold;"></div>
													</div>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Total
																Monthly Income</b>
														</label>
														<div class="col-md-5" id="customer_total_income"
															style="font-size: 12px; font-weight: bold;"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Total
																Irregularly Income</b>
														</label>
														<div class="col-md-5"
															id="customer_total_irregularly_income"
															style="font-size: 12px; font-weight: bold;"></div>
													</div>
													<br> <br>
												</fieldset>

												<fieldset>
													<legend>
														<b>Monthly Income Details</b>
													</legend>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Remittances
																Frequency (Amount)</b>
														</label>
														<div class="col-md-5" id="customerRemittancee"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Remittances
																Relation</b>
														</label>
														<div class="col-md-5" id="customerRemittancesRelation"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Remittances
																Profession</b>
														</label>
														<div class="col-md-5" id="customer_remittances_profession"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Rental
																Frequency, Rental Income (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_rental_profit_income"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Rental
																Profit Income Source</b>
														</label>
														<div class="col-md-5" id="customer_rental_from"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Labour
																Type</b>
														</label>
														<div class="col-md-5" id="customer_labour_type"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Labour
																Amount (Daily)</b>
														</label>
														<div class="col-md-5" id="customer_labour_amount"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Other
																Labour Type</b>
														</label>
														<div class="col-md-5" id="customer_other_labour_type"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>No.
																of Labour Days in Month</b>
														</label>
														<div class="col-md-5" id="customer_labour_in_month"></div>
													</div>
													<br> <br>
												</fieldset>
												<fieldset>
													<legend>
														<b>Irregularly Income Details</b>
													</legend>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Agri
																income frequency (Amount)</b>
														</label>
														<div class="col-md-5" id="farming"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Live
																stock Type </b>
														</label>
														<div class="col-md-5" id="customerLivestockType"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Live
																stock (Profit)</b>
														</label>
														<div class="col-md-5" id="customerLivestockIncome"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Other
																Income Contributors (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_income_comtributers"></div>
													</div>
													<br>
												</fieldset>

											</div>
											<div class="col-md-6 well">
												<fieldset>
													<div class="form-group row">
														<label class="col-md-7 control-label"><legend>
																<b>Additional Income Details</b>
															</legend></label>
														<div class="col-md-5" id="additional_income_details"></div>
														<table class="table equal table-responsive table-bordered"
															style="font-size: 13px">

															<thead style="background-color: ghostwhite;">
																<tr>
																	<th>Detail</th>
																	<th>Amount</th>
																</tr>
															</thead>
															<tbody id="additionalIncome">

															</tbody>
														</table>
													</div>
												</fieldset>
												<br> <br>
												<fieldset>
													<legend>
														<b>Business Details</b>
													</legend>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Business
																Income (monthly)</b>
														</label>
														<div class="col-md-5" id="business_income"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Business
																Title</b>
														</label>
														<div class="col-md-5" id="business_name"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Business
																Type</b>
														</label>
														<div class="col-md-5" id="businees_type"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Years
																in Business</b>
														</label>
														<div class="col-md-5" id="period"></div>
													</div>
													<br> <br>
												</fieldset>
												<fieldset>
													<legend>
														<b>Employment Details</b>
													</legend>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Salary/Pension</b>
														</label>
														<div class="col-md-5" id="salary_or_pension"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Company/Org.
																Name</b>
														</label>
														<div class="col-md-5" id="organisation_name"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Designation</b>
														</label>
														<div class="col-md-5" id="job_position"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Length
																of Job</b>
														</label>
														<div class="col-md-5" id="job_period"></div>
													</div>
													<br>
												</fieldset>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- income details tab ends -->

							<!-- assets, Expenses and liabilities tab starts -->
							<div class="tab-pane fade" id="assetsExpenses">
								<div class="panel-body " style="">
									<div class="table table-striped" style="font-size: 13px">
										<div class="row-well">
											<div class="col-md-6 well">
												<fieldset>
													<div class="form-group row">
														<label class="col-md-7 control-label"><legend>
																<b>Assets</b>
															</legend></label>
														<div class="col-md-5" id="assets_amount"
															style="font-size: 21px; font-weight: bold;"></div>
													</div>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Land
																in acres (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_land"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Buffalo
																(Amount)</b>
														</label>
														<div class="col-md-5" id="customer_bbuffalo"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Cow
																(Amount)</b>
														</label>
														<div class="col-md-5" id="customer_cow"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Calf
																(Amount)</b>
														</label>
														<div class="col-md-5" id="customer_calf"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Goat/Sheep
																(Amount)</b>
														</label>
														<div class="col-md-5" id="customer_goat_sheep"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>No.
																of Motar Bikes (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_bike"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>No.
																of Cars (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_car"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>No.
																of Tractors (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_tractors"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>TV
																(Amount)</b>
														</label>
														<div class="col-md-5" id="customer_tv"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Fridge
																(Amount)</b>
														</label>
														<div class="col-md-5" id="customer_fridge"></div>
													</div>
													<br> <br>
												</fieldset>
												<fieldset>
													<legend>
														<b>Additional Assets</b>
													</legend>
													<table class="table equal table-responsive table-bordered"
														style="font-size: 13px">

														<thead style="background-color: ghostwhite;">
															<tr>
																<th>Asset Type</th>
																<th>Asset Amount</th>
															</tr>
														</thead>
														<tbody id="additionalAssets">

														</tbody>
													</table>
												</fieldset>
											</div>
											<div class="col-md-6 well">
												<fieldset>
													<div class="form-group row">
														<label class="col-md-7 control-label"><legend>
																<b>Monthly Expenses</b>
															</legend></label>
														<div class="col-md-5" id="monthly_expenses"
															style="font-size: 21px; font-weight: bold;"></div>
													</div>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Connectivity</b>
														</label>
														<div class="col-md-5" id="customer_electricity_type"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Primary
																Source of Electricity</b>
														</label>
														<div class="col-md-5" id="customer_sourceof_electricity"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Electricity
																Expense (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_electricity_amount"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Mobile
																Type</b>
														</label>
														<div class="col-md-5" id="customer_mobile_type"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Mobile
																Bills Amount</b>
														</label>
														<div class="col-md-5" id="customer_mobilebills_amount"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Network
																types in Area</b>
														</label>
														<div class="col-md-5" id="networks_in_area"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Transport
																Mode (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_transport_mode"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Karyana
																(Amount)</b>
														</label>
														<div class="col-md-5" id="customer_karyana"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Education
																Expense Amount</b>
														</label>
														<div class="col-md-5" id="customer_education_amount"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Medical
																Recurring (Amount)</b>
														</label>
														<div class="col-md-5" id="customer_medical_recuring"></div>
													</div>
													<br> <br>
												</fieldset>
												<fieldset>
													<legend>
														<b>Additional Expenses</b>
													</legend>
													<table class="table equal table-responsive table-bordered"
														style="font-size: 13px">

														<thead style="background-color: ghostwhite;">
															<tr>
																<th>Expense Type</th>
																<th>Expense Amount</th>
															</tr>
														</thead>
														<tbody id="additionalMonthlyExpenses">

														</tbody>
													</table>
												</fieldset>
											</div>
										</div>

										<!-- Loan and Liabilities starts -->
										<div class="row-well">
											<div class="col-md-12 well">
												<fieldset>
													<legend>
														<b>Loan and Liabilities</b>
													</legend>
													<table class="table equal table-responsive table-bordered"
														style="font-size: 13px">
														<thead style="background-color: ghostwhite;">
															<tr>
																<th>Name</th>
																<th>Borrowed Amount</th>
																<th>Remaining Amount</th>
																<th>Monthly Installments</th>
																<th>Duration of Loan</th>
																<th>Frequency of Payments</th>
															</tr>
														</thead>
														<tbody id="loanAndLiabilities">
														</tbody>
													</table>
												</fieldset>
											</div>
										</div>
										<!-- Loan and Liabilities ends -->
									</div>
								</div>
							</div>
							<!-- assets, Expenses and liabilities tab ends -->

							<!-- guarantors tab stars -->
							<div class="tab-pane fade" id="gaurantorsInformation">
								<div class="panel-body " style="">
									<div class="table table-striped" style="font-size: 13px">
										<div class="row-well">
											<div class="col-md-6 well">
												<fieldset>
													<legend>
														<b>Family Gaurantor</b>
													</legend>

													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Name</b>
														</label>
														<div class="col-md-5" id="f_guarantor_name"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>CNIC</b>
														</label>
														<div class="col-md-5" id="f_guarantor_cnic"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Primary
																Phone</b>
														</label>
														<div class="col-md-5" id="f_guarantor_primary_phone"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Secondary
																Phone</b>
														</label>
														<div class="col-md-5" id="f_guarantor_secondary_phone"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Relationship</b>
														</label>
														<div class="col-md-5" id="f_guarantor_relationship"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Monthly
																Income</b>
														</label>
														<div class="col-md-5" id="f_guarantor_monthly_income"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Profession</b>
														</label>
														<div class="col-md-5" id="f_guarantor_profession"></div>
													</div>
													<br>

												</fieldset>
											</div>
											<div class="col-md-6 well">
												<fieldset>
													<legend>
														<b>Outside Gaurantor</b>
													</legend>

													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Name</b>
														</label>
														<div class="col-md-5" id="o_guarantor_name"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>CNIC</b>
														</label>
														<div class="col-md-5" id="o_guarantor_cnic"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Primary
																Phone</b>
														</label>
														<div class="col-md-5" id="o_guarantor_primary_phone"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Secondary
																Phone</b>
														</label>
														<div class="col-md-5" id="o_guarantor_secondary_phone"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Relationship</b>
														</label>
														<div class="col-md-5" id="o_guarantor_relationship"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Monthly
																Income</b>
														</label>
														<div class="col-md-5" id="o_guarantor_monthly_income"></div>
													</div>
													<br>
													<div class="form-group row">
														<label class="col-md-7 control-label"> <b>Profession</b>
														</label>
														<div class="col-md-5" id="o_guarantor_profession"></div>
													</div>
													<br>

												</fieldset>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- guarantors tab ends -->

							<!-- CC verification starts -->

							<div class="tab-pane fade" id="ccVerification">
								<div class="panel-body " style="">
									<div class="table table-striped" style="font-size: 13px">

										<!-- Nizam dost verification starts -->

										<div class="col-md-12 well">
											<form action="" id="nd_verification" data-ndverification
												data-eligibilityId="<%=eligibilityId%>">
												<div class="col-md-4">
													<fieldset>
														<legend>
															<b>Nizam Dost Verification</b>
														</legend>
													</fieldset>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3"></div>
												<div class="col-md-3"></div>

												<div class="col-md-12">
													<div class="col-md-6">
														<label><font color="red"><b>Name</b></font></label>
													</div>
													<div class="col-md-3" id="salesman_name"></div>
													<div class="col-md-2"></div>
												</div>

												<div class="col-md-12" style="margin-top: 10px">
													<div class="col-md-6">
														<label><font color="red"><b>Phone
																	Number</b></font></label>
													</div>
													<div class="col-md-3" id="salesman_primary_phone"></div>
													<div class="col-md-2"></div>
												</div>

												<div class="col-md-12" style="margin-top: 10px">
													<div class="col-md-6">
														<label><b>Do you personally know <span
																id="customer_name_for_nd_q1"></span> ? (How do you know
																/ when did you meet)
														</b></label>
													</div>
													<div class="col-md-3">
														<div class="col-xs-10">
															<select class="form-control selectpicker" id="ndQ1"
																name="ndQ1">
																<option value="" selected>Select</option>
																<option value="0">Yes</option>
																<option value="1">No</option>
															</select>
														</div>
													</div>
													<div class="col-md-2"></div>
												</div>

												<div class="col-md-12" style="margin-top: 10px">
													<div class="col-md-6">
														<label><b>Reputation for timely payment, Can
																you assure it?</b></label>
													</div>
													<div class="col-md-3">
														<div class="col-xs-10">
															<select class="form-control selectpicker" name="ndQ2"
																id="ndQ2">
																<option value="" selected>Select</option>
																<option value="0">Yes</option>
																<option value="1">No</option>
															</select>
														</div>
													</div>
													<div class="col-md-2"></div>
												</div>

												<div class="col-md-12" style="margin-top: 10px">
													<div class="col-md-6">
														<label><b>Willingness to take responsibility
																(monthly payments, recovery of system)</b></label>
													</div>
													<div class="col-md-3">
														<div class="col-xs-10">
															<select class="form-control selectpicker" name="ndQ3"
																id="ndQ3">
																<option value="" selected>Select</option>
																<option value="0">Yes</option>
																<option value="1">No</option>
															</select>
														</div>
													</div>
													<div class="col-md-2"></div>
												</div>

												<div class="col-md-12" style="margin-top: 10px">
													<div class="col-md-6">
														<label><b>Do you know the guarantors?</b></label>
													</div>
													<div class="col-md-3">
														<div class="col-xs-10">
															<select class="form-control selectpicker" name="ndQ4"
																id="ndQ4">
																<option value="" selected>Select</option>
																<option value="0">Yes</option>
																<option value="1">No</option>
																<option value="2">Only one</option>
															</select>
														</div>
													</div>
													<div class="col-md-2"></div>
												</div>

												<div class="col-md-12" style="margin-top: 10px">
													<div class="col-md-6">
														<label><b>How often do you meet <span
																id="customer_name_for_nd_q5"></span> ?
														</b></label>
													</div>
													<div class="col-md-3">
														<div class="col-xs-10">
															<select class="form-control selectpicker" name="ndQ5"
																id="ndQ5">
																<option value="" selected>Select</option>
																<option value="0">Regularly</option>
																<option value="1">Irregularly</option>
																<option value="2">Just met him</option>
															</select>
														</div>
													</div>
													<div class="col-md-2"></div>
												</div>

												<div class="col-md-12" style="margin-top: 10px">
													<div class="col-md-6"></div>
													<div class="col-md-3">
														<div class="col-xs-10">

															<button type="button" class="btn pull-right btn-success"
																id="btn_cc_verified_nd" onclick="verifyND();"
																name="btn_cc_verified_nd" value="1">Verified</button>
														</div>
													</div>
													<div class="col-md-2"></div>
												</div>
												<div class="col-md-12">
													<div class="col-md-6"></div>
													<div class="col-md-6" id="ndMessage"
														style="color: red; font-size: 12px; font-weight: bold; display: none;">
														Please select all.</div>
												</div>

												<div class="col-md-12">
													<div class="col-md-2">
														<a href="#modalForNDComment" class="btn btn-success"
															data-toggle="modal">Add a comment for ND...</a>
													</div>
													<div class="col-md-1"></div>
													<div class="col-md-2" id="view_nd_history">
														<button type="button" class="btn btn-success"
															id="btn_view_nd_calling_history"
															name="btn_view_nd_calling_history"
															onclick="getCallingInformationForAll('<%=eligibID%>', 'btn_view_nd_calling_history', 'get_nd_calling_history_details'); viewAndHideCallingData('btn_view_nd_calling_history')"
															value="1">View calling history</button>
													</div>
													<div class="col-md-2" id="hide_nd_history"
														style="display: none;">
														<button type="button" class="btn btn-success"
															id="btn_hide_nd_calling_history"
															name="btn_hide_nd_calling_history"
															onclick="viewAndHideCallingData('btn_hide_nd_calling_history')">Hide
															calling history</button>
													</div>
												</div>

												<div class="col-md-12"
													style="margin-top: 10px; display: none;"
													id="view_nd_calling_history_details">

													<div class="col-md-6 inline bordered round-corner">
														<div class="table-responsive" style="font-size: 13px">
															<table class="table table-striped">
																<thead>
																	<tr>
																		<th>Extension number</th>
																		<th>CC commented</th>
																		<th>Call time</th>
																	</tr>
																</thead>
																<tbody id="get_nd_calling_history_details">

																</tbody>
															</table>
														</div>
													</div>
												</div>

											</form>
										</div>
										<!-- Nizam dost verification ends -->

										<!-- guarantors verification starts -->

										<div class="col-md-12 well">
											<div class="col-md-3">
												<fieldset>
													<legend>
														<b>Guarantors Verification</b>
													</legend>
												</fieldset>
											</div>
											<div class="col-md-3"></div>
											<div class="col-md-3">
												<fieldset>
													<legend>
														<b>Family Guarantor</b>
													</legend>
												</fieldset>
											</div>
											<div class="col-md-3">
												<fieldset>
													<legend>
														<b>Outside Guarantor</b>
													</legend>
												</fieldset>
											</div>

											<div class="col-md-12">
												<div class="col-md-3">
													<b><span><font color="red">Name</font></span></b>
												</div>
												<div class="col-md-3"></div>

												<div class="col-md-3" id="f_guarantor_name_for_cc"></div>
												<div class="col-md-3" id="o_guarantor_name_for_cc"></div>
											</div>

											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<b><font color="red">Phone number</font></b>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3" id="f_guarantor_primary_phone_for_cc"></div>
												<div class="col-md-3" id="o_guarantor_primary_phone_for_cc"></div>
											</div>

											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Location of <span
															id="customer_name_for_guarantor_q1">'s </span> house
															(Owned or Rented? - Since how many years)
													</b></label>
												</div>
												<div class="col-md-3">
													<span id="guarantor_customer_house"></span> <span
														id="guarantor_customer_live_since"
														style="margin-left: 60px"></span>
												</div>

												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="fgQ1"
															onchange="changefunction()" name="fgQ1">
															<option value="" selected>Select</option>
															<option value="0">Aware</option>
															<option value="1">Not aware</option>
															<option value="2">Different information</option>
														</select>
													</div>

													<div class="col-xs-10" style="display: none;"
														id="fgQ1_diff_info">
														<input class="form-control mask income-source"
															name="fgQ1_" id="fgQ1_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 48%; margin-left: 163px; margin-top: -30px;"
															id="cncl" onclick="refreshCancel()"> Refresh</span>
													</div>
												</div>

												<div class="col-md-3">
													<div class="col-xs-10" style="display: none;"
														id="ogQ1_diff_info">
														<input class="form-control mask income-source"
															name="ogQ1_" id="ogQ1_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="ogQ1_cncl" onclick="refreshogQ1()"> Refresh</span>

													</div>

													<div class="col-xs-10">
														<select class="form-control selectpicker" id="ogQ1"
															onchange="changefunction()" name="ogQ1">
															<option value="" selected>Select</option>
															<option value="0">Aware</option>
															<option value="1">Not aware</option>
															<option value="2">Different information</option>
														</select><br>
													</div>
												</div>
											</div>

											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Sources of Income & Amounts (check
															primary source)</b></label>
												</div>
												<div class="col-md-3">
													<span id="guarantor_customer_source_of_income"></span> <span
														id="guarantor_customer_largest_income_amount"
														style="margin-left: 48px"></span>
												</div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" name="fgQ2"
															id="fgQ2" onchange="changefunction()">
															<option value="" selected>Select</option>
															<option value="0">Aware</option>
															<option value="1">Not sure</option>
															<option value="2">Different information</option>
														</select>
													</div>
													<div class="col-xs-10" style="display: none;"
														id="fgQ2_diff_info">
														<input class="form-control mask income-source"
															name="fgQ2_" id="fgQ2_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="fgQ2_cncl" onclick="refreshfgQ2()"> Refresh</span>
													</div>
												</div>

												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="ogQ2"
															onchange="changefunction()" name="ogQ2">
															<option value="" selected>Select</option>
															<option value="0">Aware</option>
															<option value="1">Not aware</option>
															<option value="2">Different information</option>
														</select>
													</div>
													<div class="col-xs-10" style="display: none;"
														id="ogQ2_diff_info">
														<input class="form-control mask income-source"
															name="ogQ2_" id="ogQ2_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="ogQ2_cncl" onclick="refreshogQ2()"> Refresh</span>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Any Loans or liabilities? </b></label>
												</div>
												<div class="col-md-3">
													<span id="guarantor_customer_loan_source"></span> <span
														id="guarantor_customer_loan_amount"
														style="margin-left: 48px"></span>
												</div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" name="fgQ3"
															id="fgQ3" onchange="changefunction()">
															<option value="" selected>Select</option>
															<option value="0">Yes</option>
															<option value="1">No</option>
															<option value="2">Different information</option>
														</select>
													</div>
													<div class="col-xs-10" style="display: none;"
														id="fgQ3_diff_info">
														<input class="form-control mask income-source"
															name="fgQ3_" id="fgQ3_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="fgQ3_cncl" onclick="refreshfgQ3()"> Refresh</span>
													</div>

												</div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="ogQ3"
															onchange="changefunction()" name="ogQ3">
															<option value="" selected>Select</option>
															<option value="0">Yes</option>
															<option value="1">No</option>
															<option value="2">Different information</option>
														</select>
													</div>
													<div class="col-xs-10" style="display: none;"
														id="ogQ3_diff_info">
														<input class="form-control mask income-source"
															name="ogQ3_" id="ogQ3_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="ogQ3_cncl" onclick="refreshogQ3()"> Refresh</span>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Reputation for timely payment, Can
															you assure it?</b></label>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" name="fgQ4"
															id="fgQ4">
															<option value="" selected>Select</option>
															<option value="0">Yes</option>
															<option value="1">No</option>
														</select>
													</div>
												</div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="ogQ4"
															name="ogQ4">
															<option value="" selected>Select</option>
															<option value="0">Yes</option>
															<option value="1">No</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Willingness to take responsibility
															(monthly payments, recovery of system)</b></label>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" name="fgQ5"
															id="fgQ5">
															<option value="" selected>Select</option>
															<option value="0">Yes</option>
															<option value="1">No</option>
														</select>
													</div>
												</div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="ogQ5"
															name="ogQ5">
															<option value="" selected>Select</option>
															<option value="0">Yes</option>
															<option value="1">No</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12">
												<div class="col-md-3"></div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<form action="" id="fg_verification" data-fgverification
														data-eligibilityId="<%=eligibilityId%>">
														<div class="col-xs-10">
															<button type="button" class="btn pull-right btn-success"
																id="btn_cc_verified_fg" onclick="verifyFG();"
																name="btn_cc_verified_fg" value="1">Verified</button>
														</div>

													</form>
												</div>
												<form action="" id="og_verification" data-ogverification
													data-eligibilityId="<%=eligibilityId%>">
													<div class="col-md-3">
														<div class="col-xs-10">
															<button type="button" class="btn pull-right btn-success"
																id="btn_cc_verified_og" onclick="verifyOG();"
																name="btn_cc_verified_og" value="1">Verified</button>

														</div>
												</form>
											</div>
											<div class="col-md-12" style="margin-top: 10px">
												<div class="col-md-6"></div>
												<div class="col-md-6" id="fgMessage"
													style="color: red; font-size: 12px; font-weight: bold; display: none;">
													Please select all.</div>
												<div class="col-md-3" id="ogMessage"
													style="color: red; font-size: 12px; font-weight: bold; display: none; margin-left: 730px; margin-top: -18px;">
													Please select all.</div>
											</div>

											<div class="col-md-12">
												<div class="col-md-2">
													<a href="#modalForFGComment" class="btn btn-success"
														data-toggle="modal">Add a comment for FG...</a>
												</div>

												<div class="col-md-1"></div>

												<div class="col-md-2" id="view_fg_history">
													<button type="button" class="btn btn-success"
														id="btn_view_fg_calling_history"
														name="btn_view_fg_calling_history"
														onclick="getCallingInformationForAll('<%=eligibID%>', 'btn_view_fg_calling_history', 'get_fg_calling_history_details'); viewAndHideCallingData('btn_view_fg_calling_history')"
														value="2">View calling history</button>
												</div>
												<div class="col-md-2" id="hide_fg_history"
													style="display: none;">
													<button type="button" class="btn btn-success"
														id="btn_hide_fg_calling_history"
														name="btn_hide_fg_calling_history"
														onclick="viewAndHideCallingData('btn_hide_fg_calling_history')">Hide
														calling history</button>
												</div>

												<div class="col-md-2"></div>
												<div class="col-md-2">
													<a href="#modalForOGComment" class="btn btn-success"
														data-toggle="modal">Add a comment for OG...</a>
												</div>
												<div class="col-md-1"></div>
												<div class="col-md-2" id="view_og_history">
													<button type="button" class="btn btn-success"
														id="btn_view_og_calling_history"
														name="btn_view_og_calling_history"
														onclick="getCallingInformationForAll('<%=eligibID%>', 'btn_view_og_calling_history', 'get_og_calling_history_details'); viewAndHideCallingData('btn_view_og_calling_history')"
														value="3">View calling history</button>
												</div>
												<div class="col-md-2" id="hide_og_history"
													style="display: none;">
													<button type="button" class="btn btn-success"
														id="btn_hide_og_calling_history"
														name="btn_hide_og_calling_history"
														onclick="viewAndHideCallingData('btn_hide_og_calling_history')">Hide
														calling history</button>
												</div>
											</div>

											<div class="col-md-12">

												<div class="col-md-6"
													style="margin-top: 10px; display: none; float: left"
													id="view_fg_calling_history_details">
													<div class="inline bordered round-corner">
														<div class="table-responsive" style="font-size: 13px">
															<table class="table table-striped">
																<thead>
																	<tr>
																		<th>Extension number</th>
																		<th>CC commented</th>
																		<th>Call time</th>
																	</tr>
																</thead>
																<tbody id="get_fg_calling_history_details">

																</tbody>
															</table>
														</div>
													</div>
												</div>

												<div class="col-md-6"
													style="margin-top: 10px; display: none; float: right"
													id="view_og_calling_history_details">

													<div class="inline bordered round-corner">
														<div class="table-responsive" style="font-size: 13px">
															<table class="table table-striped">
																<thead>
																	<tr>
																		<th>Extension number</th>
																		<th>CC commented</th>
																		<th>Call time</th>
																	</tr>
																</thead>
																<tbody id="get_og_calling_history_details">

																</tbody>
															</table>
														</div>
													</div>
												</div>

											</div>


										</div>
									</div>
									<!-- guarantors verification ends -->

									<!-- customers verification starts -->

									<div class="col-md-12 well">
										<form action="" id="customer_verify" data-csverification
											data-eligibilityId="<%=eligibilityId%>">
											<div class="col-md-4">
												<fieldset>
													<legend>
														<b>Customer Verification</b>
													</legend>
												</fieldset>
											</div>

											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<b><font color="red">Name</font></b>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<span id="customer_name_for_cc"></span>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<b><font color="red">Phone Number</font></b>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<span id="customer_phone_for_cc"></span>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Location of <span
															id="customer_name_for_customer_verification_q1">'s</span>
															house (Owned or Rented? - Since how many years)
													</b></label>
												</div>
												<div class="col-md-3">
													<span id="customer_house"></span> <span
														id="customer_live_since" style="margin-left: 60px"></span>
												</div>

												<div class="col-md-3" style="display: none;"
													id="cvQ1_diff_info">
													<div class="col-xs-10">
														<input class="form-control mask income-source"
															name="cvQ1_" id="cvQ1_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="cvQ1_cncl" onclick="refreshcvQ1()"> Refresh</span>
													</div>
												</div>

												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="cvQ1"
															name="cvQ1" onchange="changefunction()">
															<option value="" selected>Select</option>
															<option value="0">Matching</option>
															<option value="1">Different</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Any Loans or liabilities? </b></label>
												</div>
												<div class="col-md-3">
													<span id="customer_loan_source"></span> <span
														id="customer_loan_amount" style="margin-left: 48px"></span>
												</div>
												<div class="col-md-3" style="display: none;"
													id="cvQ2_diff_info">
													<div class="col-xs-10">
														<input class="form-control mask income-source"
															name="cvQ2_" id="cvQ2_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="cvQ2_cncl" onclick="refreshcvQ2()"> Refresh</span>
													</div>
												</div>

												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="cvQ2"
															name="cvQ2" onchange="changefunction()">
															<option value="" selected>Select</option>
															<option value="0">Matching</option>
															<option value="1">Different</option>
														</select><br>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Sources of Income & Amounts (check
															primiary source)</b></label>
												</div>
												<div class="col-md-3">
													<span id="customer_source_of_income"></span> <span
														id="customer_largest_income_amount"
														style="margin-left: 48px"></span>
												</div>

												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="cvQ3"
															name="cvQ3">
															<option value="" selected>Select</option>
															<option value="0">Yes</option>
															<option value="1">No</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Will you be able to pay monthly? On
															time? If not we will recover system</b></label>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3" style="display: none;"
													id="cvQ4_diff_info">
													<div class="col-xs-10">
														<input class="form-control mask income-source"
															name="cvQ4_" id="cvQ4_" placeholder="Other"> <span
															class="btn fa fa-spinner"
															style="background-color: #00ACAC; color: white; font-weight: bold; width: 50%; margin-left: 163px; margin-top: -30px;"
															id="cvQ4_cncl" onclick="refreshcvQ4()"> Refresh</span>
													</div>
												</div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="cvQ4"
															name="cvQ4" onchange="changefunction()">
															<option value="" selected>Select</option>
															<option value="0">Matching</option>
															<option value="1">Different</option>
														</select>
													</div>
												</div>

												<div class="col-md-3"></div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>Product run time, Call CC for
															complaints</b></label>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="cvQ5"
															name="cvQ5">
															<option value="" selected>Select</option>
															<option value="0">Communicated</option>
															<option value="1">Not communicated</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3">
													<label><b>You can pay yourself by going to a
															mobile money retailer</b></label>
												</div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<select class="form-control selectpicker" id="cvQ6"
															name="cvQ6">
															<option value="" selected>Select</option>
															<option value="0">Communicated</option>
															<option value="1">Not communicated</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-12" style="margin-top: 15px">
												<div class="col-md-3"></div>
												<div class="col-md-3"></div>
												<div class="col-md-3">
													<div class="col-xs-10">
														<button type="button" class="btn pull-right btn-success"
															id="btn_cc_verified_customer" onclick="verifyCustomer();"
															name="btn_cc_verified_customer" value="1">Verified</button>
													</div>
												</div>
											</div>
										</form>
										<div class="col-md-12">
											<div class="col-md-6"></div>
											<div class="col-md-6" id="customerMessage"
												style="color: red; font-size: 12px; font-weight: bold; display: none;">
												Please select all.</div>
										</div>

										<div class="col-md-12">

											<div class="col-md-2">
												<a href="#modalForCustomerComment" class="btn btn-success"
													data-toggle="modal">Add a comment for Customer...</a>
											</div>
											<div class="col-md-1"></div>

											<div class="col-md-2" id="view_customer_history">
												<button type="button" class="btn btn-success"
													id="btn_view_customer_calling_history"
													name="btn_view_customer_calling_history"
													onclick="getCallingInformationForAll('<%=eligibID%>', 'btn_view_customer_calling_history', 'get_customer_calling_history_details'); viewAndHideCallingData('btn_view_customer_calling_history')"
													value="4">View calling history</button>
											</div>
											<div class="col-md-2" id="hide_customer_history"
												style="display: none;">
												<button type="button" class="btn btn-success"
													id="btn_hide_customer_calling_history"
													name="btn_hide_customer_calling_history"
													onclick="viewAndHideCallingData('btn_hide_customer_calling_history')">Hide
													calling history</button>
											</div>

										</div>

										<div class="col-md-12"
											style="margin-top: 10px; display: none;"
											id="view_customer_calling_history_details">

											<div class="col-md-6 inline bordered round-corner">
												<div class="table-responsive" style="font-size: 13px">
													<table class="table table-striped">
														<thead>
															<tr>
																<th>Extension number</th>
																<th>CC commented</th>
																<th>Call time</th>
															</tr>
														</thead>
														<tbody id="get_customer_calling_history_details">

														</tbody>
													</table>
												</div>
											</div>
										</div>

									</div>
									<div class="col-md-12">
										<div class="col-md-2">
											<button type="button" class="btn btn-success"
												id="btn_cc_verified_all" name="btn_cc_verified_all"
												onclick="verifyAll('<%=eligibID%>')" value="1">Verified
												All</button>
										</div>
										<div class="col-md-1"></div>
										<div class="col-md-3 alert alert-success" role="alert"
											style="color: green; font-weight: bold; display: none;"
											id="success_message">
											<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
											<span id="show_message_success"></span>
										</div>
										<div class="col-md-4 alert alert-danger" role="alert"
											style="color: red; font-weight: bold; display: none;"
											id="fail_message">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
											<span id="show_message_failed"></span>
										</div>
									</div>
								</div>

							</div>
							<!-- customers verification ends -->
						</div>
					</div>
				</div>

				<!-- CC verification ends -->

				<!-- Appliances in account starts -->
				<div class="row">
					<div class="col-md-12">
						<div class="panel  panel-with-tabs">
							<ul id="ioniconsTab" class="nav nav-tabs">
								<li class="active"><a href="#acceptedAppliances"
									data-toggle="tab"> <span class="hidden-xs m-l-3">Accepted
											Appliances<span class="badge badge-inverse m-l-3"></span>
									</span>
								</a></li>
								<li><a href="#rejectedAppliances" data-toggle="tab"> <span
										class="hidden-xs m-l-3">Rejected Appliances<span
											class="badge badge-inverse m-l-3"></span>
									</span></a></li>
							</ul>
							<div id="ioniconsTabContenta" class="tab-content">
								<div class="tab-pane fade in active" id="acceptedAppliances">
									<div data-scrollbar="false" style="font-size: 13px;"
										class="table-responsive">
										<table id="sold" class="table table-striped">
											<thead>
												<tr>
													<th>Appliance</th>
													<th>District Officer</th>
													<th>Field Officer</th>
													<th>Nizam Dost</th>
													<th>Eligibility Status</th>
													<th>Appliance Transfer Status</th>
													<th>Appliance Charging Status</th>
													<th>Loan Status</th>
													<th>Loan Book</th>
												</tr>
											</thead>
											<tbody id="getAcceptedAppliances">

											</tbody>
										</table>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Appliances in account ends -->
			</div>
		</div>
	</div>


	<!-- begin profile-section -->
	<div class="profile-section">
		<!-- accept request model -->
		<div class="modal fade" id="modal-alert">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header success">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h4 class="modal-title">Accept Request</h4>
					</div>
					<div class="modal-body">
						<div class="alert m-b-0">
							<input type="hidden" id="applianceId" />
							<p>
								Are you sure you want to accept loan request of <i
									id="customer_name_for_accept_request"> </i> ?
							</p>
						</div>



					</div>
					<div class="modal-footer">
						<a href="javascript:;" class="btn btn-sm btn-white"
							data-dismiss="modal">Close</a> <a id="updateURL"
							class="btn btn-sm btn-success">Accept</a>
					</div>
				</div>
			</div>
		</div>
		<!-- accept request model end -->

		<!-- delete request model -->
		<div class="modal fade" id="modal-alert-delete">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header danger">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h4 class="modal-title">Delete Request</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<h4 class="m-b-0 p-b-15 m-t-0 underline">Appliance</h4>
							<div class="p-15">
								<label class="checkbox-inline"> Purpose</label><input
									type="text" name="text" id="text" onchange="(getValue('text'))">

							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a href="javascript:;" class="btn btn-sm btn-white"
							data-dismiss="modal">Close</a> <a id="updateURLreject"
							class="btn btn-sm btn-danger">Reject</a>
					</div>
				</div>
			</div>
		</div>
		<!-- delete request model end -->

		<!-- comment modal starts -->
		<div class="modal fade" id="modalForNDComment">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header success">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h4 class="modal-title">Calling information of Nizam Dost</h4>
					</div>
					<div class="modal-body">
						<div class="form-group has-feedback">
							<label><b>Extension number: </b></label>
							<div class="input-group" data-parsley-trigger="change">
								<span class="input-group-addon">92</span> <input type="text"
									class="form-control mask" data-mask="9999999999"
									name="verified_nd_extension_number"
									id="verified_nd_extension_number" maxlength="10"
									placeholder="Extension number" />
							</div>
							<span style="color: red; font-size: 12px;"
								id="ndExtensionNumberResult"></span>
						</div>
						<div class="form-group has-feedback" style="margin-top: 10px">
							<label><b>CC Comment: </b></label>

							<textarea class="form-control"
								placeholder="Type a comment here..." id="verified_nd_cc_comment"
								name="verified_nd_cc_comment" rows="3"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="btn_nd_verified_call_data" name="btn_nd_verified_call_data"
								onclick="insertCallingInformationForAll('<%=eligibID%>', 'verified_nd_extension_number', 'verified_nd_cc_comment', 'btn_nd_verified_call_data', 'modalForNDComment')"
								value="1">Comment</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="modal fade" id="modalForFGComment">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header success">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h4 class="modal-title">Calling information of Family
							Guarantor</h4>
					</div>
					<div class="modal-body">
						<div class="form-group has-feedback">
							<label><b>Extension number: </b></label>
							<div class="input-group" data-parsley-trigger="change">
								<span class="input-group-addon">92</span> <input type="text"
									class="form-control mask" data-mask="9999999999"
									name="verified_fg_extension_number" required
									id="verified_fg_extension_number" maxlength="10"
									placeholder="Extension number" />
							</div>
						</div>
						<div class="form-group has-feedback" style="margin-top: 10px">
							<label><b>CC Comment: </b></label>

							<textarea class="form-control"
								placeholder="Type a comment here..." id="verified_fg_cc_comment"
								required name="verified_fg_cc_comment" rows="3"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="btn_fg_verified_call_data" name="btn_fg_verified_call_data"
								onclick="insertCallingInformationForAll('<%=eligibID%>', 'verified_fg_extension_number', 'verified_fg_cc_comment', 'btn_fg_verified_call_data', 'modalForFGComment')"
								value="2">Comment</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="modal fade" id="modalForOGComment">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header success">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h4 class="modal-title">Calling information of Outside
							Guarantor</h4>
					</div>
					<div class="modal-body">
						<div class="form-group has-feedback">
							<label><b>Extension number: </b></label>
							<div class="input-group" data-parsley-trigger="change">
								<span class="input-group-addon">92</span> <input type="text"
									class="form-control mask" data-mask="9999999999"
									name="verified_og_extension_number"
									id="verified_og_extension_number" maxlength="10"
									placeholder="Extension number" />
							</div>
						</div>
						<div class="form-group has-feedback" style="margin-top: 10px">
							<label><b>CC Comment: </b></label>

							<textarea class="form-control"
								placeholder="Type a comment here..." id="verified_og_cc_comment"
								name="verified_og_cc_comment" rows="3"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="btn_og_verified_call_data" name="btn_og_verified_call_data"
								onclick="insertCallingInformationForAll('<%=eligibID%>', 'verified_og_extension_number', 'verified_og_cc_comment', 'btn_og_verified_call_data', 'modalForOGComment')"
								value="3">Comment</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>

			</div>
		</div>

		<div class="modal fade" id="modalForCustomerComment">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header success">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true"></button>
						<h4 class="modal-title">Calling information of Customer</h4>
					</div>
					<div class="modal-body">
						<div class="form-group has-feedback">
							<label><b>Extension number: </b></label>
							<div class="input-group" data-parsley-trigger="change">
								<span class="input-group-addon">92</span> <input type="text"
									class="form-control mask" data-mask="9999999999"
									name="verified_customer_extension_number"
									id="verified_customer_extension_number" maxlength="10"
									placeholder="Extension number" />
							</div>
						</div>
						<div class="form-group has-feedback" style="margin-top: 10px">
							<label><b>CC Comment: </b></label>

							<textarea class="form-control"
								placeholder="Type a comment here..."
								id="verified_customer_cc_comment"
								name="verified_customer_cc_comment" rows="3"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="btn_customer_verified_call_data"
								name="btn_customer_verified_call_data"
								onclick="insertCallingInformationForAll('<%=eligibID%>', 'verified_customer_extension_number', 'verified_customer_cc_comment', 'btn_customer_verified_call_data', 'modalForCustomerComment')"
								value="4">Comment</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!-- comment modal ends -->

	</div>
	<!-- end row -->


	<!-- end scrollbar -->




	<!-- begin profile-section -->

	<!-- end row -->

	<!-- begin scroll to top btn -->
	<a href="javascript:;"
		class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade"
		data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
	<!-- end scroll to top btn -->

	<!-- ================== BEGIN BASE JS ================== -->

	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
	<script
		src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
	<script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/viewer.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
	<script src="assets/plugins/isotope/jquery.isotope.min.js"></script>
	<script src="assets/plugins/lightbox/js/lightbox-2.6.min.js"></script>
	<script src="assets/js/gallery.demo.min.js"></script>
	<!-- ================== END BASE JS ================== -->

	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="assets/plugins/bootstrap-wizard/js/ccVerification.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
	<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script
		src="assets/plugins/bootstrap-multiple-select/js/bootstrap-multiple-select.js"></script>
	<script src="js/customerProfile.js"></script>
	<script src="assets/js/apps.min.js"></script>

	<script>
			$(document).ready(function() {
				App.init();
				getCustomerProfile('<%=customerId%>', '<%=customerCnic%>');
				getCustomerOtherPhoneNumbers('<%=customerId%>');
				getOtherIncome('<%=customerId%>');
				getOtherAssets('<%=customerId%>');
				getOtherMonthlyExpenses('<%=customerId%>');
				getCustomerLoanAndLiabilities('<%=customerId%>');
				getCustomerFamilyGuarantor('<%=customerId%>', 1);
				getCustomerOutsideGuarantor('<%=customerId%>', 2);
				getCustomerAcceptedAppliances('<%=customerId%>');
				getCustomerVerificationData('<%=eligibID%>');
		});
	</script>
</body>

</html>