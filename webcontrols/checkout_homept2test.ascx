<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_homept2test.ascx.vb" Inherits="checkout_homept2test"  %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

 





  
<div class ="form-field-section grey" id="griddiv" runat="server" visible="false">
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="courselistgrid table table-striped table-bordered text-center"
    DataKeyNames="OfferingID" CellSpacing="-1" BorderStyle="None" GridLines="none"
CaptionAlign="Top" Visible="true">

        
    <Columns>
        <asp:BoundField DataField="Name" HeaderText="Course Name">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
                <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Start Date"
                    HtmlEncode="False">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
                <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="End Date"
                    HtmlEncode="False">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>
                <asp:BoundField DataField="SiteDescription" HeaderText="Site" />
             <%--   <asp:BoundField DataField="TotalFeeAmount" HeaderText="Fee" DataFormatString="{0:c}">
                    <ControlStyle CssClass="searchgridfield" />
                </asp:BoundField>--%>
            </Columns>
            <RowStyle CssClass="searchgridcell" />
            <HeaderStyle CssClass="searchgridheader" />
            <EmptyDataTemplate>
                <p>No Actual Courses Found for you to Enrol on / Apply for, please try searching for 
                    another course.</p>
            </EmptyDataTemplate>
        </asp:GridView>
   
    

</div>



<br />

 <div class="form-field-section grey" id ="hascourse" runat="server">
     <h4 class="app-title"> Welcome to Online Applications</h4>


     <p>Please ensure you have the following information to hand before starting your application, as you will not be able to save the form and return to it later.
	
     <ul><li>

           - Personal details, including your address and a personal email 

         </li>

         <li> - Next of kin information, such as their name and contact details</li>

         <li> - Your qualifications - subjects, year they were taken and predicted/actual grades </li>
     </ul>

         </p>

 <br />
     <p>
When you are ready to start, please check that this course is the one you are looking to apply for:</p>



 

     <p>    Course Name: <span id="coursename" runat="server" style="font-weight:bold;"></span>
         <br /><b>Start Date: <span id="startdate1" runat="server"></span></b><b>
             <br />End Date: <span id="enddate" runat="server"></span></b> </p>
     
	 
	 

        
         <p> <span id="HEText" runat="server" visible="false">You are 18+ and have applied for a university level programme and you have also applied for a student loan.  You should have your Student Support Number (SSN) to hand. E.g. SFDU12345678A. <b>NOTE: This form should only be completed for part time Higher Education courses, full time Higher Education courses should be applied for through UCAS. </b> </span></p>

  


     <p><span id="campus" runat="server"></span></p>


	 
	 
	 


      
     <br />
     <p class="alert alert-info">If this is not the course you are looking to study, please go back to our website and find the right course before clicking apply.</p>

     
	 
	 




     <br />
     <br />
       <asp:Button ID="getstarted" runat="server" CssClass="btn btn-primary" Text="Let's Get Started" />


     <br />
         <asp:ValidationSummary ID="ValidationSummary3" runat="server" CssClass="alert alert-danger" />

 </div>



<div id="nocourse" runat="server">


    <p class="alert alert-info">Please add a course to proceed</p>

</div>
   <br />


<div class="form-field-section grey" hidden="hidden">



    <h4 class="app-title">Testing Links (Remove / reformat when live) </h4>

    
       <h3> Enquiry forms</h3>

     <a href="webenrolment.aspx?page=~/additional/enquiry/checkout_enquiriesASKUS.ascx">Ask Us</a>
    <br />
    <br />

    <a href="webenrolment.aspx?page=~/additional/enquiry/checkout_enquiriesGENERAL.ascx">General</a>
    <br />
    <br />
    <a href="webenrolment.aspx?page=~/additional/enquiry/checkout_enquiriesGUIDES.ascx">Guides</a>
    <br />
    <br />
    <a href="webenrolment.aspx?page=~/additional/enquiry/checkout_enquiriesEVENTS.ascx">Events</a>
    <br />
    <br />
    <a href="webenrolment.aspx?page=~/additional/enquiry/checkout_enquiriesMAIN.ascx">Courses</a>





   

   <h3>Templates - Supplementary Forms</h3>


    <a href="webenrolment.aspx?page=~/additional/templates/checkout_bursary.ascx">Bursary </a>
    <br />
    <br />

    <a href="webenrolment.aspx?page=~/additional/templates/checkout_evidence_new.ascx">Grades upload</a>
    <br />
    <br />
  
    
    
    <a href="webenrolment.aspx?page=~/additional/templates/checkout_feeremission_new.ascx">Fee Remission upload</a>
    <br />
    <br />
  
       <a href="webenrolment.aspx?page=~/additional/templates/checkout_payment.ascx">Single Payment</a>
    <br />
    <br />

       <a href="webenrolment.aspx?page=~/additional/templates/parking.ascx">Parking permit</a>
    <br />
    <br />
           <a href="webenrolment.aspx?page=~/additional/templates/photo.ascx">Photo Upload</a>
    <br />
    <br />


</div>

 

    
