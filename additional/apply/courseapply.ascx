<%@ Control Language="VB"  AutoEventWireup="false" CodeFile="courseapply.ascx.vb" Inherits="courseapply"  %>

<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

        <!--The CourseEnrolAction adds the offering to the basket as an Enrolment-->
    <cc1:CourseEnrolAction ID="CourseEnrolAction" runat="server" />
    
<div class="container">
    <div class="row">
        <div class="col">

            <%If tblOffering.Count > 0 And NewOfferingRow IsNot Nothing Then %>
                <div class="alert theme-primary" role="alert">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="breadcrumb-link" href="https://apply.osc.ac.uk"><i class="fa-solid fa-house"></i>&nbsp;Orbital South Colleges</a>
                            </li>
                            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
                            <li class="breadcrumb-item">
                                <a class="breadcrumb-link" href="webenrolment.aspx?page=~/apply/courseapply.ascx"><i class="fa-solid fa-book"></i>&nbsp;<%=OfferingRow.CollegeLevelCode%> - <%=OfferingRow.CollegeLevelName %></a>
                            </li>
                            <li class="breadcrumb-divider"><i class="fa-solid fa-angles-right"></i></li>
                            <li class="breadcrumb-item" aria-current="page">
                                <a class="breadcrumb-link active" href="#"><i class="fa-solid fa-graduation-cap"></i>&nbsp;<%=OfferingRow.Code%> - <%=OfferingRow.Name %></a>
                            </li>
                        </ol>
                    </nav>
                </div>

                <div class="progress mt-5 mb-5" role="progressbar" aria-label="Progress..." aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar bg-primary" style="width: 10%">10%</div>
                </div>

                <div class="bd-callout mt-5 mb-5">
                    <h4><i class="fa-solid fa-graduation-cap"></i> Course Information</h4>

                    <%--<div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered text-left"
                            DataKeyNames="OfferingID">

                            <Columns>
                                <asp:BoundField DataField="CourseInformation" HeaderText="Course Name" >
                                    <ControlStyle CssClass="searchgridfield" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Code" HeaderText="Course Code">
                                    <ControlStyle CssClass="searchgridfield" />
                                </asp:BoundField>
                                <asp:BoundField DataField="StartDate" DataFormatString="{0:dd MMM yyyy}" HeaderText="Start Date"
                                    HtmlEncode="False">
                                    <ControlStyle CssClass="searchgridfield" />
                                </asp:BoundField>
                                <asp:BoundField DataField="EndDate" DataFormatString="{0:dd MMM yyyy}" HeaderText="End Date"
                                    HtmlEncode="False">
                                    <ControlStyle CssClass="searchgridfield" />
                                </asp:BoundField>
                                <asp:BoundField DataField="SiteDescription" HeaderText="Campus" />
                                <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee Per Year" DataFormatString="{0:c}" Visible="false">
                                    <ControlStyle CssClass="searchgridfield" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle CssClass="searchgridcell" />
                            <EmptyDataTemplate>
                                <p>
                                    No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                                        another course.
                                </p>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>--%>

                    <div class="container">
                        <%For Each crs In tblOffering %>
                            <%
'Dim OfferingRow = OfferingDataTable.FetchByOfferingID(crs.OfferingID)
                            %>
                            <div class="row">
                                <div class="md:col">
                                    <div class="card mt-3">
                                        <div class="card-body">
                                            <h4><i class="fa-solid fa-award"></i> <%=crs.Name%></h4>
                                            <div class="row">
                                                <div class="sm:col-6 md:col-3">
                                                    <strong>Start Date:</strong>
                                                </div>
                                                <div class="sm:col-6 md:col-3">
                                                    <%=If(Not (IsNothing(crs.StartDate)), crs.StartDate.Value.ToString("dd/MM/yyyy"), "")%>
                                                </div>
                                                <div class="sm:col-6 md:col-3">
                                                    <strong>End Date:</strong>
                                                </div>
                                                <div class="sm:col-6 md:col-3">
                                                    <%=If(Not (IsNothing(crs.EndDate)), crs.EndDate.Value.ToString("dd/MM/yyyy"), "")%>
                                                </div>
                                                <div class="sm:col-6 md:col-3">
                                                    <strong>Course Code:</strong>
                                                </div>
                                                <div class="sm:col-6 md:col-3">
                                                    <%=crs.Code%>
                                                </div>
                                                <div class="sm:col-6 md:col-3">
                                                    <strong>Campus:</strong>
                                                </div>
                                                <div class="sm:col-6 md:col-3">
                                                    <%=crs.SiteDescription%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <%Next%>
                    </div>
                </div>

                <div class="bd-callout bd-callout-warning mt-5 mb-5">
                    <h5 class="mb-4">
                        <span class="badge theme-primary"><%= OfferingTypeRow.Description %></span> Before you begin please have with you:
                    </h5>

                    <ul class="list-group">
                        <li class="list-group-item icon listcheck"> Your address details, mobile number and a personal email address</li>
                        <li class="list-group-item icon listcheck"> Your parent, guardian or carer emergency contact details</li>
                        <li class="list-group-item icon listcheck"> One form of ID</li>
                        <li class="list-group-item icon listcheck"> A headshot photograph</li>
                        <li class="list-group-item icon listcheck"> Your National Insurance Number if you are over 19</li>
                        <li class="list-group-item icon listcheck"> Evidence of qualifications including English and/or Maths and your grades</li>
                    </ul>
                </div>

                <div class="alert theme-primary hstack gap-3" role="alert">
                    <div>
                        <h1><i class="fa-solid fa-circle-info"></i></h1>
                    </div>
                    <div>
                        <p>
                            Remember to click the <strong>Submit button at the end of the form</strong>, otherwise we will not receive your application
                        </p>
                        <p>
                            Submitting this form does not guarantee you a place, it is subject to validation by the college
                        </p>
                    </div>
                </div>

                <div class="alert theme-warning hstack gap-3" role="alert">
                    <div>
                        <i class="fa-solid fa-triangle-exclamation"></i>
                    </div>
                    <div>
                        <p>
                            This session will remain active for 40 minutes before it expires - you will have to start again if the session expires
                        </p>
                    </div>
                </div>

                <div class="alert theme-inverse" role="alert">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                
                            </div>
                            <div class="col text-end">
                                <span class="d-grid gap-2 md:d-block">
                                    <button type="button" class="btn-solid btn-styled theme-primary btn-lg NextButton">Next <i class="fa-solid fa-angles-right"></i></button>
                                    <cc1:CCCButton ID="btnContinue" CssClass="d-none" class="d-none" ClientIDMode="Static" runat="server" Text="Continue to Checkout" ImageResource="btnContinue" LinkResource="apply_personal_details" CausesValidation="true" />
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--<cc1:CCCButton ID="btnContinue6" runat="server" Text="Start " CssClass="button" LinkResource="checkout_enrolments_FE_aspx" />--%>

            <% Else %>
                <div class="alert theme-danger" role="alert">
                    <div class="row">
                        <div class="sm:col-1">
                            <h3><i class="fa-solid fa-triangle-exclamation"></i></h3>
                        </div>
                        <div class="sm:col-11">
                            <h4 class="alert-heading">Course Not Found</h4>
                            <p>Sorry this course was not found or is not set up for applications</p>
                            <p class="text-center"><a class="btn-solid btn-styled theme-danger" href="https://www.osc.ac.uk/" role="button"><i class="fa-solid fa-rotate-left"></i> Return to the Orbital South Colleges Website</a></p>
                            <hr>
                            <p class="mb-0">Contact the Admissions Team on <i class="fa-solid fa-phone"></i> <a href="tel:000">000</a> or by email at <i class="fa-solid fa-envelope"></i> <a href="mailto:xxx@osc.ac.uk?subject=Course Not Found on Website">xxx@osc.ac.uk</a></p>
                        </div>
                    </div>
                </div>
        <% End If %>
    </div>
</div>
