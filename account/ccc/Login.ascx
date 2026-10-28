<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Login.ascx.vb" Inherits="account_ccc_Login" %>

<style>
    /* Main container */
    .login-container {
        margin: 0 auto;
        padding: 64px 40px;
        background: #ffffff;
        border-radius: 24px;
    }

    /* Page header */
    .login-header {
        margin-bottom: 40px;
    }

    .login-header h1 {
        font-size: 40px;
        font-weight: 400;
        color: #212529;
        margin-bottom: 16px;
        line-height: 48px;
    }

    .login-header p {
        font-size: 16px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 24px;
    }

    /* Form fields */
    .login-form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 24px;
    }

    .login-form-group label {
        font-size: 14px;
        font-weight: 600;
        color: #212529;
        margin: 0;
    }

    .login-form-group label.required::after {
        content: ' *';
        color: #d32f2f;
    }

    .login-form-group input[type="email"],
    .login-form-group input[type="password"] {
        padding: 10px 12px;
        border: 1px solid #d0d5dd;
        border-radius: 6px;
        font-size: 14px;
        color: #4b5563;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        width: 100%;
        max-width: 480px;
        box-sizing: border-box;
    }

    .login-form-group input[type="email"]:focus,
    .login-form-group input[type="password"]:focus {
        outline: none;
        border-color: #0052cc;
        box-shadow: 0 0 0 3px rgba(0, 82, 204, 0.1);
    }

    /* Error text */
    .login-error-text {
        color: #d32f2f;
        font-size: 14px;
        font-weight: 400;
        margin-bottom: 16px;
    }

    /* Login button */
    .login-btn {
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
        margin-top: 8px;
    }

    .login-btn:hover {
        background: #0047b2;
    }

    /* Links section */
    .login-links {
        margin-top: 32px;
        padding-top: 24px;
        border-top: 1px solid #e0e5eb;
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .login-links a {
        font-size: 14px;
        font-weight: 500;
        color: #0052cc;
        text-decoration: none;
        transition: color 0.2s ease;
        padding: 0;
    }

    .login-links a:hover {
        color: #0047b2;
        text-decoration: underline;
    }

    /* Resend link */
    .resend-notice {
        background: #fff3cd;
        border-left: 4px solid #ff9800;
        padding: 12px 16px;
        border-radius: 4px;
        margin-bottom: 16px;
    }

    .resend-notice a {
        font-size: 14px;
        font-weight: 600;
        color: #0052cc;
        text-decoration: none;
    }

    .resend-notice a:hover {
        text-decoration: underline;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .login-container {
            padding: 24px 16px;
        }

        .login-header h1 {
            font-size: 28px;
            line-height: 36px;
        }

        .login-form-group input[type="email"],
        .login-form-group input[type="password"] {
            max-width: 100%;
        }

        .login-btn {
            width: 100%;
        }
    }
</style>

<style>
    .login-container {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        border-radius: 0;
        font-family: Montserrat, Helvetica, sans-serif;
    }

    .login-container::before {
        content: "Account access";
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

    .login-header {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .login-header h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .login-header p {
        max-width: 760px;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .login-form-group {
        max-width: 720px;
        padding: 0;
    }

    .login-form-group label {
        color: #000000;
        font-weight: 800;
    }

    .login-form-group input[type="email"],
    .login-form-group input[type="password"] {
        max-width: none;
        min-height: 50px;
        border: 1px solid #cfcfcf;
        border-radius: 0;
        color: #000000;
    }

    .login-form-group input[type="email"]:focus,
    .login-form-group input[type="password"]:focus {
        border-color: #43973D;
        box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.18);
    }

    .login-container .btn-secondary,
    .login-btn {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-weight: 800;
    }

    .login-container .btn-secondary:hover,
    .login-container .btn-secondary:focus,
    .login-btn:hover,
    .login-btn:focus {
        background: #000000 !important;
        border-color: #000000 !important;
        color: #ffffff !important;
    }

    .login-links {
        max-width: 720px;
        margin-top: 36px;
        padding: 24px;
        background: #F3F1EE;
        border-top: 8px solid #43973D;
    }

    .login-links a,
    .resend-notice a {
        color: #000000;
        font-weight: 800;
        text-decoration: underline;
    }

    .login-links a:hover,
    .resend-notice a:hover {
        text-decoration: none;
    }

    .resend-notice {
        max-width: 720px;
        background: #fff8e8;
        border-left: 8px solid #FAA926;
        border-radius: 0;
    }

    .login-error-text {
        color: #b00020;
        font-weight: 700;
    }

    @media (max-width: 768px) {
        .login-container {
            padding: 32px 20px;
        }

        .login-header {
            padding: 28px 22px;
        }

        .login-header h1 {
            font-size: 32px;
        }
    }
</style>

<div class="login-container">
    <!-- Header -->
    <div class="login-header">
        <h1>Login</h1>
        <p>Enter your email address and password to access your account.</p>
    </div>

    <!-- Email Field -->
    <div class="login-form-group">
        <label for="email" class="required">Email</label>
        <input type="email" id="email" class="form-control" name="pre[email]" placeholder="Enter your email address" autocomplete="off" required autofocus />
    </div>

    <!-- Password Field -->
    <div class="login-form-group">
        <label for="password" class="required">Password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" autocomplete="off" required />
    </div>

    <!-- Error Messages -->
    <div>
        <p runat="server" id="errtext" class="login-error-text"></p>
        <asp:Panel runat="server" ID="pnlResend" Visible="false" CssClass="resend-notice">
            <asp:HyperLink ID="lnkReSend" Visible="false" runat="server" ClientIDMode="Static" NavigateUrl="~/webenrolment.aspx?page=~/account/ccc/AccessPending.ascx">Click here to request a new verification email</asp:HyperLink>
        </asp:Panel>
    </div>

    <!-- Login Button -->
    <div>
        <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="btn-secondary" />
    </div>

    <!-- Links -->
    <div class="login-links">
        <asp:HyperLink ID="lnkReset" runat="server" ClientIDMode="Static" NavigateUrl="~/webenrolment.aspx?page=~/account/ccc/PasswordReset.ascx">Forgotten your password?</asp:HyperLink>
        <asp:HyperLink ID="HyperLink1" runat="server" ClientIDMode="Static" NavigateUrl="~/webenrolment.aspx?page=~/account/ccc/Register.ascx">Don't have an account? Register here</asp:HyperLink>
    </div>
</div>