<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Register.ascx.vb" Inherits="account_ccc_Register" %>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/cupertino/jquery-ui.css" />
<script src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.19.1/jquery.validate.js"></script>

<style>
    /* Main container */
    .register-container {
        margin: 0 auto;
        padding: 64px 40px;
        background: #ffffff;
        border-radius: 24px;
    }

    /* Page header */
    .register-header {
        margin-bottom: 40px;
    }

    .register-header h1 {
        font-size: 40px;
        font-weight: 400;
        color: #212529;
        margin-bottom: 16px;
        line-height: 48px;
    }

    .register-header p {
        font-size: 16px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 24px;
    }

    /* Form sections */
    .register-section {
        background: #f8f9fa;
        border: 1px solid #e0e5eb;
        border-radius: 12px;
        padding: 32px;
        margin-bottom: 32px;
    }

    .register-section-title {
        font-size: 18px;
        font-weight: 600;
        color: #212529;
        margin-bottom: 24px;
        padding-bottom: 12px;
        border-bottom: 2px solid #0052cc;
    }

    /* Form rows — 2-column grid */
    .register-form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 24px;
        margin-bottom: 0;
    }

    .register-form-row.single-col {
        grid-template-columns: 1fr;
    }

    /* Form field group */
    .register-field {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 20px;
    }

    .register-field label {
        font-size: 14px;
        font-weight: 600;
        color: #212529;
        margin: 0;
    }

    .register-field label.required::after {
        content: ' *';
        color: #d32f2f;
    }

    .register-field input[type="text"],
    .register-field input[type="email"],
    .register-field input[type="password"],
    .register-field input[type="date"],
    .register-field select {
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

    .register-field input:focus,
    .register-field select:focus {
        outline: none;
        border-color: #0052cc;
        box-shadow: 0 0 0 3px rgba(0, 82, 204, 0.1);
    }

    .register-field .field-helper {
        font-size: 12px;
        color: #6b7280;
        margin: 0;
    }

    /* Password info label */
    .password-info {
        font-size: 12px;
        color: #6b7280;
        margin-top: 4px;
    }

    /* Register button */
    .register-btn {
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

    .register-btn:hover {
        background: #0047b2!important;
    }

    /* Error label */
    .register-error {
        color: #d32f2f;
        font-size: 14px;
        font-weight: 400;
        text-align: center;
        margin-top: 16px;
        display: block;
    }

    /* Validation summary */
    .register-validation-summary {
        background: #f8d7da;
        border-left: 4px solid #d32f2f;
        color: #721c24;
        padding: 16px;
        border-radius: 4px;
        margin-top: 24px;
        font-size: 14px;
    }

    /* Info notice */
    .register-notice {
        background: #f3f8ff;
        border-left: 4px solid #0052cc;
        padding: 16px;
        border-radius: 4px;
        margin-bottom: 32px;
    }

    .register-notice p {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 22px;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .register-container {
            padding: 24px 16px;
        }

        .register-header h1 {
            font-size: 28px;
            line-height: 36px;
        }

        .register-section {
            padding: 20px 16px;
        }

        .register-form-row {
            grid-template-columns: 1fr;
        }

        .register-btn {
            width: 100%;
        }
    }
</style>

<style>
    .register-container {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        border-radius: 0;
        font-family: Montserrat, Helvetica, sans-serif;
    }

    .register-container::before {
        content: "Create an account";
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

    .register-header {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .register-header h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .register-header p {
        max-width: 820px;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .register-section {
        margin-bottom: 28px;
        padding: 32px;
        background: #ffffff;
        border: 1px solid #e3e3e3;
        border-radius: 0;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .register-section-title {
        margin: -32px -32px 28px -32px;
        padding: 22px 28px;
        background: #43973D;
        border-bottom: 0;
        color: #ffffff;
        font-size: 22px;
        font-weight: 800;
    }

    .register-notice {
        background: #F3F1EE;
        border-left: 8px solid #FAA926;
        border-radius: 0;
    }

    .register-notice p {
        color: #000000;
    }

    .register-field label {
        color: #000000;
        font-weight: 800;
    }

    .register-field input[type="text"],
    .register-field input[type="email"],
    .register-field input[type="password"],
    .register-field input[type="date"],
    .register-field select {
        min-height: 50px;
        border: 1px solid #cfcfcf;
        border-radius: 0;
        color: #000000;
    }

    .register-field input:focus,
    .register-field select:focus {
        border-color: #43973D;
        box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.18);
    }

    .register-container .btn-secondary,
    .register-btn {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-weight: 800;
    }

    .register-container .btn-secondary:hover,
    .register-container .btn-secondary:focus,
    .register-btn:hover,
    .register-btn:focus {
        background: #000000 !important;
        border-color: #000000 !important;
        color: #ffffff !important;
    }

    .register-error {
        color: #b00020;
        font-weight: 700;
    }

    .register-validation-summary {
        margin-top: 28px;
        background: #fff4f4;
        border: 1px solid #d80000;
        border-left: 8px solid #d80000;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    @media (max-width: 768px) {
        .register-container {
            padding: 32px 20px;
        }

        .register-header {
            padding: 28px 22px;
        }

        .register-header h1 {
            font-size: 32px;
        }

        .register-section {
            padding: 24px 20px;
        }

        .register-section-title {
            margin: -24px -20px 24px -20px;
        }
    }
</style>

<div class="register-container">
    <!-- Header -->
    <div class="register-header">
        <h1>Register an Account</h1>
        <p>Create your account to get started. Fields marked with an asterisk (*) are required.</p>
    </div>

    <!-- Personal Details Section -->
    <div class="register-section">
        <h2 class="register-section-title">Personal Details</h2>

        <div class="register-form-row">
            <div class="register-field">
                <label for="<%= txtFirstName.ClientID %>" class="required">First Name</label>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" placeholder="Enter your first name" autocomplete="off" />
            </div>
            <div class="register-field">
                <label for="<%= txtSurname.ClientID %>" class="required">Surname</label>
                <asp:TextBox ID="txtSurname" runat="server" CssClass="form-control" placeholder="Enter your surname" autocomplete="off" />
            </div>
        </div>

        <div class="register-form-row">
            <div class="register-field">
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
            <div class="register-field">
                <label for="<%= ddlSex.ClientID %>" class="required">Sex</label>
                <asp:DropDownList ID="ddlSex" runat="server" CssClass="form-control" title="Sex">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                    <asp:ListItem Text="Male" Value="M"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="register-form-row single-col">
            <div class="register-field">
                <label for="<%= txtDOB.ClientID %>" class="required">Date of Birth</label>
                <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date" autocomplete="off" />
            </div>
        </div>
    </div>

    <!-- Address Section -->
    <div class="register-section">
        <h2 class="register-section-title">Address</h2>

        <div class="register-form-row">
            <div class="register-field">
                <label for="<%= txtAddress1.ClientID %>">Address Line 1</label>
                <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control" placeholder="House number and street" autocomplete="off" />
            </div>
            <div class="register-field">
                <label for="<%= txtAddress2.ClientID %>">Address Line 2</label>
                <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control" placeholder="Apartment, suite, etc." autocomplete="off" />
            </div>
        </div>

        <div class="register-form-row">
            <div class="register-field">
                <label for="<%= txtAddress3.ClientID %>">Address Line 3</label>
                <asp:TextBox ID="txtAddress3" runat="server" CssClass="form-control" autocomplete="off" />
            </div>
            <div class="register-field">
                <label for="<%= txtAddress4.ClientID %>">Address Line 4</label>
                <asp:TextBox ID="txtAddress4" runat="server" CssClass="form-control" autocomplete="off" />
            </div>
        </div>

        <div class="register-form-row single-col">
            <div class="register-field">
                <label for="<%= txtPostcode.ClientID %>">Postcode</label>
                <asp:TextBox ID="txtPostcode" runat="server" CssClass="form-control" placeholder="Enter your postcode" autocomplete="off" />
            </div>
        </div>
    </div>

    <!-- Account Details Section -->
    <div class="register-section">
        <h2 class="register-section-title">Account Details</h2>

        <div class="register-notice">
            <p>Your email address will be used for login and all correspondence. Please ensure it is correct and accessible.</p>
        </div>

        <div class="register-form-row single-col">
            <div class="register-field">
                <label for="<%= txtEmail.ClientID %>" class="required">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email address" autocomplete="off" />
            </div>
        </div>

        <div class="register-form-row">
            <div class="register-field">
                <label for="<%= txtPassword.ClientID %>" class="required">Password</label>
                <asp:TextBox ID="txtPassword" ClientIDMode="Static" runat="server" CssClass="form-control" TextMode="Password" placeholder="Create a password" autocomplete="off" />
                <asp:Label ID="lblPasswordInfo" runat="server" CssClass="password-info"></asp:Label>
            </div>
            <div class="register-field">
                <label for="<%= txtPassword_Mirror.ClientID %>" class="required">Retype Password</label>
                <asp:TextBox ID="txtPassword_Mirror" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm your password" autocomplete="off" oninput="check(this)" />
            </div>
        </div>
    </div>

    <!-- Register Button -->
    <div style="text-align: center;">
        <asp:Button runat="server" ID="btnRegister" Text="Register" CssClass="btn-secondary" />
        <label id="lblError" runat="server" visible="false" class="register-error"></label>
    </div>

    <!-- Validation Summary -->
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="register-validation-summary" ForeColor="" />
</div>

<script>
    function check(input) {
        if (input.value !== $("#txtPassword").val()) {
            input.setCustomValidity('Password does not match.');
        } else {
            input.setCustomValidity('');
        }
    }
</script>