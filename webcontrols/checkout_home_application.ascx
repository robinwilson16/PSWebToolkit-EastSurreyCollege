<%@ Control Language="VB" AutoEventWireup="false" CodeFile="checkout_home_application.ascx.vb" Inherits="checkout_home_application" %>
<%@ Register Assembly="PSWebEnrolmentKit" Namespace="CompassCC.ProSolution.PSWebEnrolmentKit"
    TagPrefix="cc1" %>

<style>
    /* Consistent font for all elements */
    * {
        font-family: Montserrat, Helvetica, sans-serif;
    }

    /* Main container */
    .checkout-container {
        max-width: 1264px;
        margin: 0 auto;
        padding: 64px 40px;
        background: #ffffff;
        border-radius: 24px;
    }

    /* Page header */
    .page-header {
        margin-bottom: 48px;
        text-align: center;
    }

    .page-header h1 {
        font-size: 36px;
        font-weight: 700;
        color: #02213e;
        margin-bottom: 16px;
        line-height: 44px;
    }

    .page-header p {
        font-size: 18px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 28px;
    }

    /* Time estimate banner */
    .time-estimate {
        background: #fff8e1;
        border: 1px solid #ffc107;
        border-radius: 8px;
        padding: 16px 20px;
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 32px;
        text-align: center;
        justify-content: center;
    }

    .time-estimate p {
        font-size: 14px;
        font-weight: 500;
        color: #856404;
        margin: 0;
        line-height: 20px;
    }

    /* Two column layout */
    .content-wrapper {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 64px;
        margin-bottom: 40px;
    }

    /* Left column - Checklist section */
    .checklist-section {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    .checklist-title {
        font-size: 22px;
        font-weight: 700;
        color: #02213e;
        margin-bottom: 16px;
        padding-bottom: 16px;
        border-bottom: 3px solid #fe0018;
    }

    .checklist-item {
        display: flex;
        gap: 16px;
        padding: 16px;
        background: #f7f9fc;
        border-radius: 8px;
        border-left: 4px solid #02213e;
    }

    .checklist-item-icon {
        flex-shrink: 0;
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .checklist-item-icon img {
        width: 24px;
        height: 24px;
    }

    .checklist-item-content h3 {
        font-size: 16px;
        font-weight: 600;
        color: #02213e;
        margin: 0 0 8px 0;
    }

    .checklist-item-content p {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 18px;
    }

    .checklist-item-content ul {
        font-size: 14px;
        margin: 8px 0 0 0;
        padding-left: 20px;
        color: #4b5563;
    }

    .checklist-item-content ul li {
        margin-bottom: 4px;
        line-height: 18px;
    }

    .checklist-item-content strong {
        font-weight: 600;
        color: #02213e;
    }

    /* Right column - Accordions */
    .accordion-section {
        display: flex;
        flex-direction: column;
        gap: 0;
    }

    .accordion-section h2 {
        font-size: 22px;
        font-weight: 700;
        color: #02213e;
        margin-bottom: 24px;
        padding-bottom: 16px;
        border-bottom: 3px solid #fe0018;
    }

    .accordion-item {
        border-bottom: 1px solid #e0e5eb;
        padding: 24px 0;
    }

    .accordion-item:first-of-type {
        padding-top: 0;
    }

    .accordion-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        cursor: pointer;
        user-select: none;
    }

    .accordion-header-title {
        font-size: 16px;
        font-weight: 600;
        color: #02213e;
        margin: 0;
    }

    .accordion-icon {
        width: 24px;
        height: 24px;
        flex-shrink: 0;
        transition: transform 0.3s ease;
    }

    .accordion-item.active .accordion-icon {
        transform: rotate(180deg);
    }

    .accordion-content {
        display: none;
        margin-top: 16px;
        padding-top: 16px;
    }

    .accordion-item.active .accordion-content {
        display: block;
    }

    .accordion-content p {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        line-height: 22px;
        margin-bottom: 12px;
    }

    .accordion-content p:last-child {
        margin-bottom: 0;
    }

    .accordion-content strong {
        font-weight: 600;
        color: #02213e;
    }

    .accordion-content ul {
        font-size: 14px;
        color: #4b5563;
        margin: 12px 0;
        padding-left: 20px;
    }

    .accordion-content ul li {
        line-height: 22px;
        margin-bottom: 6px;
    }

    /* Bottom section - Checkbox and Button */
    .bottom-section {
        border-top: 1px solid #e0e5eb;
        padding-top: 40px;
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    .checkbox-group {
        display: flex;
        align-items: flex-start;
        gap: 12px;
    }

    .checkbox-group input[type="checkbox"] {
        width: 20px;
        height: 20px;
        margin-top: 2px;
        flex-shrink: 0;
        cursor: pointer;
        accent-color: #02213e;
    }

    .checkbox-group label {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        line-height: 20px;
        cursor: pointer;
        margin: 0;
    }

    .button-group {
        display: flex;
        gap: 16px;
    }

    /* btn-secondary to match BAC site theme */
    .btn-secondary {
        display: inline-block !important;
        padding: 14px 32px !important;
        background: #fe0018 !important;
        color: #ffffff !important;
        border: none !important;
        border-radius: 50px !important;
        font-size: 16px !important;
        font-weight: 600 !important;
        cursor: pointer !important;
        transition: all 0.2s ease !important;
        font-family: Montserrat, Helvetica, sans-serif !important;
        text-decoration: none !important;
        text-align: center !important;
    }

    .btn-secondary:hover {
        background: #d50014 !important;
        color: #ffffff !important;
    }

    .btn-secondary i {
        margin-left: 8px;
    }

    /* Validation */
    .alert-danger {
        background: #ffebee;
        border: 1px solid #ef9a9a;
        border-left: 4px solid #fe0018;
        color: #c62828;
        padding: 12px 16px;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 500;
        margin-top: 24px;
    }

    /* Responsive Design */
    @media (max-width: 1200px) {
        .checkout-container {
            padding: 40px 30px;
        }

        .content-wrapper {
            grid-template-columns: 1fr;
            gap: 40px;
        }
    }

    @media (max-width: 768px) {
        .checkout-container {
            padding: 24px 16px;
        }

        .page-header h1 {
            font-size: 26px;
            line-height: 34px;
        }

        .page-header p {
            font-size: 15px;
            line-height: 22px;
        }

        .checklist-title,
        .accordion-section h2 {
            font-size: 20px;
        }

        .content-wrapper {
            gap: 24px;
        }

        .btn-secondary {
            width: 100% !important;
            text-align: center !important;
        }
    }
</style>

<div class="checkout-container">
    <!-- Page Header -->
    <div class="page-header">
        <h1>Before You Begin</h1>
        <p>To make your application smooth and speedy, please have the following information to hand</p>
    </div>

    <!-- Time Estimate -->
    <div class="time-estimate">
        <p>⏱ This application takes approximately 15–20 minutes. You cannot save your progress partway through, so please make sure you have everything ready before you start.</p>
    </div>

    <!-- Content Wrapper -->
    <div class="content-wrapper">
        <!-- Left Column - Checklist -->
        <div class="checklist-section">
            <h2 class="checklist-title">Application Checklist</h2>

            <!-- Personal Details -->
            <div class="checklist-item">
                <div class="checklist-item-icon">
                    <img src="_images/icon_check.png" alt="Check" />
                </div>
                <div class="checklist-item-content">
                    <h3>Personal Details</h3>
                    <p>You will need to provide:</p>
                    <ul>
                        <li>Title, first name, middle name and surname</li>
                        <li>Sex and date of birth</li>
                        <li>National Insurance number (if known)</li>
                    </ul>
                    <p><strong>Previously studied with us?</strong> Have your previous student number ready if you know it.</p>
                </div>
            </div>

            <!-- Contact Details -->
            <div class="checklist-item">
                <div class="checklist-item-icon">
                    <img src="_images/icon_check.png" alt="Check" />
                </div>
                <div class="checklist-item-content">
                    <h3>Contact Details</h3>
                    <p>Please have the following ready:</p>
                    <ul>
                        <li>Email address (a personal email is preferred, not school or work)</li>
                        <li>Mobile phone number</li>
                        <li>Home telephone number (optional)</li>
                    </ul>
                </div>
            </div>

            <!-- Home Address -->
            <div class="checklist-item">
                <div class="checklist-item-icon">
                    <img src="_images/icon_check.png" alt="Check" />
                </div>
                <div class="checklist-item-content">
                    <h3>Home Address</h3>
                    <p>Please know your full home address including:</p>
                    <ul>
                        <li>Street address, city, county and postcode</li>
                        <li>Country of permanent residence</li>
                        <li>Approximate date you moved to your current address</li>
                    </ul>
                </div>
            </div>

            <!-- Emergency Contacts -->
            <div class="checklist-item">
                <div class="checklist-item-icon">
                    <img src="_images/icon_check.png" alt="Check" />
                </div>
                <div class="checklist-item-content">
                    <h3>Two Emergency Contacts</h3>
                    <p>You will need details for <strong>two</strong> emergency contacts. For each, please have:</p>
                    <ul>
                        <li>First name and surname</li>
                        <li>Phone number and email address</li>
                        <li>Relationship to you</li>
                    </ul>
                </div>
            </div>

            <!-- Qualifications -->
            <div class="checklist-item">
                <div class="checklist-item-icon">
                    <img src="_images/icon_check.png" alt="Check" />
                </div>
                <div class="checklist-item-content">
                    <h3>Qualifications</h3>
                    <p>Please have your exam results or predicted grades ready:</p>
                    <ul>
                        <li>Subject, level, grade and approximate date taken</li>
                        <li>Where you studied (school/college name)</li>
                        <li>Whether you have achieved GCSE Maths and/or English</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Right Column - Accordions -->
        <div class="accordion-section">
            <h2>Good to Know</h2>

            <!-- Background Info -->
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3 class="accordion-header-title">What background information will I be asked?</h3>
                    <img class="accordion-icon" src="_images/plus-icon.svg" alt="Toggle" />
                </div>
                <div class="accordion-content">
                    <p>You will be asked about:</p>
                    <ul>
                        <li><strong>Ethnic group</strong> — select from a dropdown list</li>
                        <li><strong>Nationality</strong> — as shown on your passport</li>
                        <li><strong>UK / EU residency</strong> — whether you have been a resident for the past 3 or more years</li>
                        <li><strong>Date of entry into the UK</strong> — if you have not been resident for 3+ years</li>
                        <li><strong>Criminal convictions</strong> — whether you have any unspent criminal convictions</li>
                    </ul>
                </div>
            </div>

            <!-- Education & School -->
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3 class="accordion-header-title">What education details are needed?</h3>
                    <img class="accordion-icon" src="_images/plus-icon.svg" alt="Toggle" />
                </div>
                <div class="accordion-content">
                    <p>If you are <strong>19 or under</strong>, you will be asked to select the last school you attended from a list.</p>
                    <p>You will also be asked:</p>
                    <ul>
                        <li>Whether you have achieved <strong>GCSE Maths</strong></li>
                        <li>Whether you have achieved <strong>GCSE English</strong></li>
                        <li>Whether you have had <strong>extra time or other exam concessions</strong> — if so, please provide a brief description</li>
                    </ul>
                </div>
            </div>

            <!-- Medical / Disability -->
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3 class="accordion-header-title">Disabilities or health conditions?</h3>
                    <img class="accordion-icon" src="_images/plus-icon.svg" alt="Toggle" />
                </div>
                <div class="accordion-content">
                    <p>We want to make sure we can support you. You will be asked to select any disabilities or health conditions from a dropdown list.</p>
                    <p>You can select up to <strong>two categories</strong> and add a free-text description of any additional needs or special requirements.</p>
                </div>
            </div>

            <!-- How did you hear / Why this course -->
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3 class="accordion-header-title">Will I need to write a statement?</h3>
                    <img class="accordion-icon" src="_images/plus-icon.svg" alt="Toggle" />
                </div>
                <div class="accordion-content">
                    <p>There is no formal personal statement, but you will be asked two short questions:</p>
                    <ul>
                        <li><strong>How did you hear about us?</strong> — select from a dropdown</li>
                        <li><strong>What interests you about this course?</strong> — a short free-text answer (max 256 characters)</li>
                    </ul>
                    <p>This is your chance to briefly tell us why you're applying.</p>
                </div>
            </div>

            <!-- Previous Students -->
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3 class="accordion-header-title">I've studied here before — what do I need?</h3>
                    <img class="accordion-icon" src="_images/plus-icon.svg" alt="Toggle" />
                </div>
                <div class="accordion-content">
                    <p>If you have previously studied at Orbital South Colleges, you will be able to tick a box and provide:</p>
                    <ul>
                        <li>Your <strong>previous student number</strong> (if you know it)</li>
                        <li>Your <strong>name when last at college</strong> (if it has changed)</li>
                    </ul>
                    <p>This helps us link your records and speed up your application.</p>
                </div>
            </div>

            <!-- NI Number -->
            <div class="accordion-item">
                <div class="accordion-header" onclick="toggleAccordion(this)">
                    <h3 class="accordion-header-title">Will I need my National Insurance number?</h3>
                    <img class="accordion-icon" src="_images/plus-icon.svg" alt="Toggle" />
                </div>
                <div class="accordion-content">
                    <p>Your National Insurance number is <strong>optional</strong> but helpful to provide if you know it. The format is AB123456C.</p>
                    <p>If you don't have it to hand, you can still complete your application without it.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bottom Section -->
    <div class="bottom-section">
        <div class="checkbox-group">
            <asp:checkbox type="checkbox" id="chkConfirm" runat="server" />
            <label for="<%= chkConfirm.ClientID %>">I confirm that I have read the College's policies and procedures, and the privacy notice. I understand that by completing this form my details will be held on the College database in accordance with the Data Protection Act 2018.</label>
        </div>

        <asp:Button ID="getstarted" runat="server" CssClass="btn btn-secondary" Text="Start Application" />
    </div>
</div>

<asp:ValidationSummary ID="ValidationSummary4" runat="server" CssClass="alert alert-danger" />

<script>
    function toggleAccordion(element) {
        const item = element.closest('.accordion-item');
        item.classList.toggle('active');
    }
</script>