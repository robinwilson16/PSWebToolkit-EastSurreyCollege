<%@ Control Language="VB" AutoEventWireup="false" CodeFile="UserAccount.ascx.vb" Inherits="account_ccc_UserAccount" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit" TagPrefix="cc1" %>

<style>
    /* Main container */
    .account-container {
        margin: 0 auto;
        padding: 64px 40px;
        background: #ffffff;
        border-radius: 24px;
    }

    /* Page header */
    .account-header {
        margin-bottom: 40px;
    }

    .account-header h1 {
        font-size: 40px;
        font-weight: 400;
        color: #212529;
        margin-bottom: 16px;
        line-height: 48px;
    }

    .account-header p {
        font-size: 16px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 24px;
    }

    /* Quick links */
    .account-quick-link {
        display: inline-block;
        font-size: 14px;
        font-weight: 600;
        color: #0052cc;
        text-decoration: none;
        margin-bottom: 32px;
        transition: color 0.2s ease;
    }

    .account-quick-link:hover {
        color: #0047b2;
        text-decoration: underline;
    }

    /* Application card */
    .application-card {
        background: #f8f9fa;
        border: 1px solid #e0e5eb;
        border-radius: 12px;
        padding: 32px;
        margin-bottom: 24px;
    }

    .application-card-header {
        font-size: 20px;
        font-weight: 600;
        color: #212529;
        margin-bottom: 24px;
        padding-bottom: 16px;
        border-bottom: 2px solid #0052cc;
    }

    /* ===== Progress Tracker ===== */
    .progress-tracker {
        display: flex;
        justify-content: space-between;
        margin: 0 0 32px 0;
        padding: 0;
        list-style: none;
        position: relative;
        counter-reset: step;
    }

    /* Connecting line behind dots */
    .progress-tracker::before {
        content: '';
        position: absolute;
        top: 18px;
        left: 10%;
        right: 10%;
        height: 3px;
        background: #e0e5eb;
        z-index: 0;
    }

    /* Filled portion of the line (overlay) */
    .progress-tracker::after {
        content: '';
        position: absolute;
        top: 18px;
        left: 10%;
        height: 3px;
        background: #0052cc;
        z-index: 0;
        width: 0%;
        transition: width 0.4s ease;
    }

    /* Progress line fill states — controlled via data attribute on the <ol> */
    .progress-tracker[data-progress="1"]::after { width: 20%; }
    .progress-tracker[data-progress="2"]::after { width: 40%; }
    .progress-tracker[data-progress="3"]::after { width: 60%; }
    .progress-tracker[data-progress="4"]::after { width: 80%; }

    .progress-step {
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
        z-index: 1;
        flex: 1;
        text-align: center;
    }

    /* Step dot */
    .progress-step-dot {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background: #ffffff;
        border: 3px solid #e0e5eb;
        margin-bottom: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 13px;
        font-weight: 700;
        color: #b7bdc4;
        transition: all 0.3s ease;
        counter-increment: step;
    }

    /* Step number via counter */
    .progress-step-dot::after {
        content: counter(step);
    }

    /* Step label */
    .progress-step-label {
        font-size: 12px;
        font-weight: 500;
        color: #9ca3af;
        max-width: 110px;
        line-height: 1.3;
    }

    /* Done state */
    .progress-step.progtrckr-done .progress-step-dot {
        background: #0052cc;
        border-color: #0052cc;
        color: #ffffff;
    }

    .progress-step.progtrckr-done .progress-step-dot::after {
        content: '✓';
        font-size: 16px;
    }

    .progress-step.progtrckr-done .progress-step-label {
        color: #212529;
        font-weight: 600;
    }

    /* Current / active state */
    .progress-step.progtrckr-current .progress-step-dot {
        background: #ffffff;
        border-color: #0052cc;
        color: #0052cc;
        box-shadow: 0 0 0 4px rgba(0, 82, 204, 0.15);
    }

    .progress-step.progtrckr-current .progress-step-label {
        color: #0052cc;
        font-weight: 700;
    }

    /* Todo state (default — no extra styling needed) */
    .progress-step.progtrckr-todo .progress-step-dot {
        background: #f8f9fa;
        border-color: #e0e5eb;
        color: #d1d5db;
    }

    .progress-step.progtrckr-todo .progress-step-label {
        color: #9ca3af;
    }

    /* ===== Stage Detail Cards ===== */
    .stage-details-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 16px;
    }

    .stage-detail-card {
        background: #ffffff;
        border: 1px solid #e0e5eb;
        border-radius: 8px;
        padding: 16px;
        transition: opacity 0.2s ease, border-color 0.2s ease;
    }

    /* Done detail card — blue left accent */
    .stage-detail-card.prog-details.done {
        border-left: 3px solid #0052cc;
        opacity: 1;
    }

    /* Current detail card — highlighted */
    .stage-detail-card.prog-details.current {
        border-left: 3px solid #0052cc;
        background: #f3f8ff;
        opacity: 1;
    }

    /* Todo detail card — faded */
    .stage-detail-card.prog-details.todo {
        opacity: 0.45;
        border-left: 3px solid #e0e5eb;
    }

    .stage-detail-title {
        font-size: 13px;
        font-weight: 600;
        color: #0052cc;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        margin-bottom: 12px;
        padding-bottom: 8px;
        border-bottom: 1px solid #e0e5eb;
    }

    .prog-details.todo .stage-detail-title {
        color: #9ca3af;
    }

    .stage-detail-row {
        display: flex;
        flex-direction: column;
        gap: 2px;
        margin-bottom: 8px;
    }

    .stage-detail-row:last-child {
        margin-bottom: 0;
    }

    .stage-detail-label {
        font-size: 12px;
        font-weight: 600;
        color: #212529;
    }

    .stage-detail-value {
        font-size: 13px;
        font-weight: 400;
        color: #4b5563;
    }

    /* Continue notice */
    .continue-notice {
        background: #f3f8ff;
        border-left: 4px solid #0052cc;
        padding: 16px;
        border-radius: 4px;
        margin: 32px 0;
    }

    .continue-notice p {
        font-size: 14px;
        font-weight: 500;
        color: #212529;
        margin: 0;
        line-height: 22px;
    }

    .success-notice {
        background: #d4edda;
        border-left: 4px solid #28a745;
        color: #155724;
        padding: 16px;
        border-radius: 4px;
        margin: 24px 0;
        font-size: 14px;
        line-height: 22px;
    }

    .continue-btn {
        display: inline-block;
        padding: 12px 48px;
        background: #0052cc;
        color: #ffffff;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s ease;
        font-family: Montserrat, Helvetica, sans-serif;
    }

    .continue-btn:hover {
        background: #0047b2;
    }

    /* Divider */
    .account-divider {
        height: 1px;
        background: #e0e5eb;
        margin: 48px 0;
    }

    /* Update Details section */
    .update-section {
        margin-top: 48px;
    }

    .update-section-header {
        margin-bottom: 40px;
    }

    .update-section-header h2 {
        font-size: 28px;
        font-weight: 600;
        color: #212529;
        margin-bottom: 12px;
    }

    /* Form sections */
    .update-form-section {
        background: #f8f9fa;
        border: 1px solid #e0e5eb;
        border-radius: 12px;
        padding: 32px;
        margin-bottom: 32px;
    }

    .update-form-section-title {
        font-size: 18px;
        font-weight: 600;
        color: #212529;
        margin-bottom: 24px;
        padding-bottom: 12px;
        border-bottom: 2px solid #0052cc;
    }

    /* Form rows */
    .update-form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 24px;
    }

    .update-form-row.single-col {
        grid-template-columns: 1fr;
    }

    /* Form field */
    .update-field {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 20px;
    }

    .update-field label {
        font-size: 14px;
        font-weight: 600;
        color: #212529;
        margin: 0;
    }

    .update-field label.required::after {
        content: ' *';
        color: #d32f2f;
    }

    .update-field input[type="text"],
    .update-field input[type="email"],
    .update-field input[type="password"],
    .update-field input[type="date"],
    .update-field select {
        padding: 10px 12px;
        border: 1px solid #d0d5dd;
        border-radius: 6px;
        font-size: 14px;
        color: #4b5563;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        width: 100%;
        box-sizing: border-box;
        height: auto;
    }

    .update-field input:focus,
    .update-field select:focus {
        outline: none;
        border-color: #0052cc;
        box-shadow: 0 0 0 3px rgba(0, 82, 204, 0.1);
    }

    /* Password change notice */
    .password-notice {
        background: #fff3cd;
        border-left: 4px solid #ff9800;
        padding: 16px;
        border-radius: 4px;
        margin-bottom: 24px;
    }

    .password-notice p {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 22px;
    }

    .password-info {
        font-size: 12px;
        color: #6b7280;
        margin-top: 4px;
    }

    /* Student number read-only field */
    .readonly-field {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 20px;
    }

    .readonly-field label {
        font-size: 14px;
        font-weight: 600;
        color: #212529;
    }

    .readonly-field input[type="text"] {
        padding: 10px 12px;
        border: 1px solid #e0e5eb;
        border-radius: 6px;
        font-size: 14px;
        color: #6b7280;
        background: #f0f0f0;
        font-family: Montserrat, Helvetica, sans-serif;
        width: 100%;
        box-sizing: border-box;
        cursor: not-allowed;
    }

    /* Update button */
    .update-btn {
        display: inline-block;
        padding: 12px 48px;
        background: #0052cc;
        color: #ffffff !important;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.2s ease;
        font-family: Montserrat, Helvetica, sans-serif;
        margin-top: 16px;
    }

    .update-btn:hover {
        background: #0047b2;
    }

    /* Error / success */
    .update-error {
        color: #d32f2f;
        font-size: 14px;
        font-weight: 400;
        text-align: center;
        margin-top: 16px;
        display: block;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .account-container {
            padding: 24px 16px;
        }

        .account-header h1 {
            font-size: 28px;
            line-height: 36px;
        }

        .application-card {
            padding: 20px 16px;
        }

        /* Vertical tracker on mobile */
        .progress-tracker {
            flex-direction: column;
            gap: 0;
            padding-left: 18px;
        }

        .progress-tracker::before {
            top: 0;
            bottom: 0;
            left: 18px;
            right: auto;
            width: 3px;
            height: auto;
        }

        .progress-tracker::after {
            top: 0;
            left: 18px;
            right: auto;
            width: 3px !important;
            height: 0%;
        }

        .progress-tracker[data-progress="1"]::after { height: 25%; width: 3px !important; }
        .progress-tracker[data-progress="2"]::after { height: 50%; width: 3px !important; }
        .progress-tracker[data-progress="3"]::after { height: 75%; width: 3px !important; }
        .progress-tracker[data-progress="4"]::after { height: 100%; width: 3px !important; }

        .progress-step {
            flex-direction: row;
            gap: 14px;
            text-align: left;
            padding: 8px 0;
        }

        .progress-step-dot {
            flex-shrink: 0;
            margin-bottom: 0;
        }

        .progress-step-label {
            max-width: none;
        }

        .stage-details-grid {
            grid-template-columns: 1fr;
        }

        .update-form-section {
            padding: 20px 16px;
        }

        .update-form-row {
            grid-template-columns: 1fr;
        }

        .update-btn,
        .continue-btn {
            width: 100%;
        }

        .update-section-header h2 {
            font-size: 22px;
        }
    }
</style>

<style>
    .account-container {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        border-radius: 0;
        font-family: Montserrat, Helvetica, sans-serif;
    }

    .account-container::before {
        content: "Applicant account";
        display: inline-block;
        margin-bottom: 16px;
        padding: 8px 14px;
        background: #43973D;
        color: #ffffff;
        font-size: 14px;
        font-weight: 700;
        letter-spacing: 0.02em;
        text-transform: uppercase;
    }

    .account-header {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .account-header h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .account-header p {
        max-width: 920px;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .account-quick-link {
        display: inline-flex;
        margin-bottom: 32px;
        padding: 14px 20px;
        background: #000000;
        color: #ffffff;
        font-weight: 800;
        text-decoration: none;
    }

    .account-quick-link:hover,
    .account-quick-link:focus {
        background: #43973D;
        color: #ffffff;
        text-decoration: none;
    }

    .application-card,
    .update-form-section {
        background: #ffffff;
        border: 1px solid #e3e3e3;
        border-radius: 0;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .application-card-header,
    .update-form-section-title {
        margin: -32px -32px 28px -32px;
        padding: 22px 28px;
        background: #43973D;
        border-bottom: 0;
        color: #ffffff;
        font-size: 22px;
        font-weight: 800;
    }

    .progress-tracker::after {
        background: #43973D;
    }

    .progress-step.progtrckr-done .progress-step-dot {
        background: #43973D;
        border-color: #43973D;
    }

    .progress-step.progtrckr-current .progress-step-dot {
        border-color: #43973D;
        color: #43973D;
        box-shadow: 0 0 0 4px rgba(67, 151, 61, 0.18);
    }

    .progress-step.progtrckr-current .progress-step-label {
        color: #000000;
    }

    .stage-detail-card {
        border-radius: 0;
    }

    .stage-detail-card.prog-details.done,
    .stage-detail-card.prog-details.current {
        border-left-color: #43973D;
    }

    .stage-detail-card.prog-details.current {
        background: #F3F1EE;
    }

    .stage-detail-title {
        color: #000000;
        font-weight: 800;
    }

    .continue-notice,
    .password-notice {
        background: #F3F1EE;
        border-left: 8px solid #FAA926;
        border-radius: 0;
    }

    .continue-notice p,
    .password-notice p {
        color: #000000;
    }

    .success-notice {
        background: #eef8ec;
        border-left: 8px solid #43973D;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    .continue-btn,
    .account-container .btn-secondary,
    .update-btn {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-weight: 800;
    }

    .continue-btn:hover,
    .continue-btn:focus,
    .account-container .btn-secondary:hover,
    .account-container .btn-secondary:focus,
    .update-btn:hover,
    .update-btn:focus {
        background: #000000 !important;
        border-color: #000000 !important;
        color: #ffffff !important;
    }

    .account-divider {
        margin: 56px 0;
        background: #d8d8d8;
    }

    .update-section-header {
        margin-bottom: 28px;
    }

    .update-section-header h2 {
        margin: 0;
        color: #000000;
        font-size: 32px;
        font-weight: 800;
    }

    .update-field label,
    .readonly-field label {
        color: #000000;
        font-weight: 800;
    }

    .update-field input[type="text"],
    .update-field input[type="email"],
    .update-field input[type="password"],
    .update-field input[type="date"],
    .update-field select,
    .readonly-field input[type="text"] {
        min-height: 50px;
        border: 1px solid #cfcfcf;
        border-radius: 0;
        color: #000000;
    }

    .update-field input:focus,
    .update-field select:focus {
        border-color: #43973D;
        box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.18);
    }

    .readonly-field input[type="text"] {
        background: #F3F1EE;
        color: #555555;
    }

    .update-error,
    #errtext {
        color: #b00020 !important;
        font-weight: 700;
    }

    @media (max-width: 768px) {
        .account-container {
            padding: 32px 20px;
        }

        .account-header {
            padding: 28px 22px;
        }

        .account-header h1 {
            font-size: 32px;
        }

        .application-card,
        .update-form-section {
            padding: 24px 20px;
        }

        .application-card-header,
        .update-form-section-title {
            margin: -24px -20px 24px -20px;
        }
    }
</style>

<div class="account-container">
    <!-- Header -->
    <div class="account-header">
        <h1>Your Account</h1>
        <p>Here you can see the status of any previous applications you have made, along with the details on interviews that have been arranged.</p>
    </div>

    <a href="#Details" class="account-quick-link">↓ Update your details</a>

    <!-- Applications List -->
    <asp:ListView runat="server" ID="lstDetails">
        <ItemTemplate>
            <div class="application-card">
                <div class="application-card-header">
                    <asp:Label runat="server" ID="lblCourse" text='<%#: Eval("OfferingName")%>'></asp:Label>
                </div>

                <!-- Progress Tracker -->
                <ol class="progress-tracker" runat="server" id="progtrckr" data-progress="0">
                    <li class="progress-step progtrckr-done" runat="server" id="stage0">
                        <span class="progress-step-dot"></span>
                        <span class="progress-step-label">Submitted</span>
                    </li>
                    <li class="progress-step progtrckr-todo" runat="server" id="stage1">
                        <span class="progress-step-dot"></span>
                        <span class="progress-step-label">Application Created</span>
                    </li>
                    <li class="progress-step progtrckr-todo" runat="server" id="stage2">
                        <span class="progress-step-dot"></span>
                        <span class="progress-step-label">Interview Created</span>
                    </li>
                    <li class="progress-step progtrckr-todo" runat="server" id="stage3">
                        <span class="progress-step-dot"></span>
                        <span class="progress-step-label">College Offer Made</span>
                    </li>
                    <li class="progress-step progtrckr-todo" runat="server" id="stage4">
                        <span class="progress-step-dot"></span>
                        <span class="progress-step-label">Student Enrolled</span>
                    </li>
                </ol>

                <!-- Stage Details -->
                <div class="stage-details-grid">
                    <ol style="list-style:none; padding:0; margin:0; display:contents;" runat="server" id="Ol1">
                        <li runat="server" id="stage0Details" class="stage-detail-card prog-details done">
                            <div class="stage-detail-title">Application Submitted</div>
                            <div class="stage-detail-row">
                                <span class="stage-detail-label">Request Date</span>
                                <span class="stage-detail-value"><asp:Label runat="server" ID="lblRequestDate" text='<%#: Eval("RequestDate", "{0:d}")%>'></asp:Label></span>
                            </div>
                        </li>

                        <li runat="server" id="stage1Details" class="stage-detail-card prog-details todo">
                            <div class="stage-detail-title">Application Processed</div>
                            <div class="stage-detail-row">
                                <span class="stage-detail-label">Date</span>
                                <span class="stage-detail-value"><asp:Label runat="server" ID="iApplicationCreatedDate" text='<%#: Eval("ApplicationCreatedDate", "{0:d}")%>'></asp:Label></span>
                            </div>
                        </li>

                        <li runat="server" id="stage2Details" class="stage-detail-card prog-details todo">
                            <div class="stage-detail-title">Interview Details</div>
                            <div runat="server" id="interviewDetails">
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Date/Time</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iDateTime" text='<%#: Eval("DateTime", "{0:d}")%>'></asp:Label></span>
                                </div>
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Site</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iSite" text='<%#: Eval("Site")%>'></asp:Label></span>
                                </div>
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Type</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iType" text='<%#: Eval("InterviewType")%>'></asp:Label></span>
                                </div>
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Duration</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iDuration" text='<%#: Eval("Duration")%>'></asp:Label></span>
                                </div>
                            </div>
                        </li>

                        <li runat="server" id="stage3Details" class="stage-detail-card prog-details todo">
                            <div class="stage-detail-title">Offer Details</div>
                            <div class="stage-detail-row">
                                <span class="stage-detail-label">Offer</span>
                                <span class="stage-detail-value"><asp:Label runat="server" ID="iOffer" text='<%#: Eval("ApplicationOffer")%>'></asp:Label></span>
                            </div>
                        </li>

                        <li runat="server" id="stage4Details" class="stage-detail-card prog-details todo">
                            <div class="stage-detail-title">Enrolment Details</div>
                            <div runat="server" id="enrolmentDetails">
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Start Date</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iEnrolmentStartDate" text='<%#: Eval("EnrolmentStartDate", "{0:d}") %>'></asp:Label></span>
                                </div>
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Expected End Date</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iEnrolmentExpectedEndDate" text='<%#: Eval("EnrolmentExpectedEndDate", "{0:d}")%>'></asp:Label></span>
                                </div>
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Course Code</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iEnrolmentCourseCode" text='<%#: Eval("EnrolmentCourseCode")%>'></asp:Label></span>
                                </div>
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Course Name</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iEnrolmentCourseName" text='<%#: Eval("EnrolmentCourseName")%>'></asp:Label></span>
                                </div>
                                <div class="stage-detail-row">
                                    <span class="stage-detail-label">Group Code</span>
                                    <span class="stage-detail-value"><asp:Label runat="server" ID="iEnrolmentGroupCode" text='<%#: Eval("EnrolmentGroupCode")%>'></asp:Label></span>
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>

    <!-- Continue Notice -->
    <div class="continue-notice">
        <p>If we need to collect any more information from you, please click continue below and you'll be redirected to the relevant form.</p>
    </div>

    <cc1:CCCButton ID="btnContinue" runat="server" Text="Continue" CausesValidation="true" CssClass="continue-btn" SaveForLater="true" SaveForLaterIn="All" />

    <p class="success-notice" id="dontcollect" runat="server" visible="false">It looks like we don't need to collect any more information from you. If you think that's not right, please get in touch using the contact details in the footer of this page.</p>

    <!-- Divider -->
    <div class="account-divider"></div>

    <!-- Update Details Section -->
    <a name="Details"></a>
    <div class="update-section">
        <div class="update-section-header">
            <h2>Update Your Details</h2>
        </div>

        <!-- Student Number (Read-only) -->
        <div class="update-form-section">
            <h3 class="update-form-section-title">Student Reference</h3>
            <div class="readonly-field">
                <cc1:StudentEnrolmentField StudentEnrolmentFieldType="RefNo" ID="fldRef" runat="server" IsRequired="false" IsReadOnly="true" LabelWidth="400" CustomCaption="Student Number" EnableViewState="true" />
            </div>
        </div>

        <!-- Personal Details -->
        <div class="update-form-section">
            <h3 class="update-form-section-title">Personal Details</h3>

            <div class="update-form-row">
                <div class="update-field">
                    <label for="<%= txtFirstName.ClientID %>" class="required">First Name</label>
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter your first name" autocomplete="off" required="required" />
                </div>
                <div class="update-field">
                    <label for="<%= txtSurname.ClientID %>" class="required">Surname</label>
                    <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter your surname" autocomplete="off" required="required" autofocus="true" />
                </div>
            </div>

            <div class="update-form-row">
                <div class="update-field">
                    <label for="<%= ddlTitle.ClientID %>" class="required">Title</label>
                    <asp:DropDownList ID="ddlTitle" runat="server" CssClass="form-control" title="Title">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Mr" Value="Mr"></asp:ListItem>
                        <asp:ListItem Text="Mrs" Value="Mrs"></asp:ListItem>
                        <asp:ListItem Text="Miss" Value="Miss"></asp:ListItem>
                        <asp:ListItem Text="Ms" Value="Ms"></asp:ListItem>
                        <asp:ListItem Text="Dr" Value="Dr"></asp:ListItem>
                        <asp:ListItem Text="Br" Value="Br"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="update-field">
                    <label for="<%= ddlSex.ClientID %>" class="required">Sex</label>
                    <asp:DropDownList ID="ddlSex" runat="server" CssClass="form-control" title="Sex">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                        <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="update-form-row single-col">
                <div class="update-field">
                    <label for="<%= txtDOB.ClientID %>" class="required">Date of Birth</label>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" autocomplete="off" />
                </div>
            </div>
        </div>

        <!-- Address -->
        <div class="update-form-section">
            <h3 class="update-form-section-title">Address</h3>

            <div class="update-form-row">
                <div class="update-field">
                    <label for="<%= txtAddress1.ClientID %>">Address Line 1</label>
                    <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control" placeholder="House number and street" autocomplete="off" />
                </div>
                <div class="update-field">
                    <label for="<%= txtAddress2.ClientID %>">Address Line 2</label>
                    <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control" placeholder="Apartment, suite, etc." autocomplete="off" />
                </div>
            </div>

            <div class="update-form-row">
                <div class="update-field">
                    <label for="<%= txtAddress3.ClientID %>">Address Line 3</label>
                    <asp:TextBox ID="txtAddress3" runat="server" CssClass="form-control" autocomplete="off" />
                </div>
                <div class="update-field">
                    <label for="<%= txtAddress4.ClientID %>">Address Line 4</label>
                    <asp:TextBox ID="txtAddress4" runat="server" CssClass="form-control" autocomplete="off" />
                </div>
            </div>

            <div class="update-form-row single-col">
                <div class="update-field">
                    <label for="<%= txtPostcode.ClientID %>">Postcode</label>
                    <asp:TextBox ID="txtPostcode" runat="server" CssClass="form-control" placeholder="Enter your postcode" autocomplete="off" />
                </div>
            </div>
        </div>

        <!-- Email -->
        <div class="update-form-section">
            <h3 class="update-form-section-title">Email</h3>

            <div class="update-form-row single-col">
                <div class="update-field">
                    <label for="<%= txtEmail.ClientID %>" class="required">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email address" autocomplete="off" required="required" />
                </div>
            </div>
        </div>

        <!-- Change Password -->
        <div class="update-form-section">
            <h3 class="update-form-section-title">Change Password</h3>

            <div class="password-notice">
                <p>To change your password, enter your existing password and then your new password below. Leave these fields blank if you don't want to change your password.</p>
            </div>

            <div class="update-form-row single-col">
                <div class="update-field">
                    <label for="<%= txtPassword.ClientID %>">Current Password</label>
                    <asp:TextBox ID="txtPassword" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your current password" autocomplete="off" />
                </div>
            </div>

            <div class="update-form-row">
                <div class="update-field">
                    <label for="<%= txtNewPassword.ClientID %>" class="required">New Password</label>
                    <asp:TextBox ID="txtNewPassword" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your new password" autocomplete="off" />
                    <asp:Label ID="lblPasswordInfo" runat="server" CssClass="password-info"></asp:Label>
                </div>
                <div class="update-field">
                    <label for="<%= txtPassword_Mirror.ClientID %>" class="required">Retype New Password</label>
                    <asp:TextBox ID="txtPassword_Mirror" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your new password" autocomplete="off" oninput="check(this)" />
                </div>
            </div>
        </div>

        <!-- Error Messages -->
        <div class="form-group" runat="server" id="errtext" style="color: #d32f2f; font-size: 14px;"></div>

        <!-- Update Button -->
        <div style="text-align: center;">
            <asp:Button runat="server" ID="btnUpdate" Text="Update Details" CssClass="btn-secondary" OnClick="btnSubmit_OnClick" />
            <label id="lblError" runat="server" visible="false" class="update-error"></label>
        </div>
    </div>
</div>

<script>
    function check(input) {
        if (input.value !== $("#txtNewPassword").val()) {
            input.setCustomValidity('Password does not match.');
        } else {
            input.setCustomValidity('');
        }
    }
</script>