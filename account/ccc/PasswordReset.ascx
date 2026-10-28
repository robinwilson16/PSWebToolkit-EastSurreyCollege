<%@ Control Language="VB" AutoEventWireup="false" CodeFile="PasswordReset.ascx.vb" Inherits="account_ccc_PasswordReset" %>

<style>
    .password-reset {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        color: #000000;
    }

    .password-reset * {
        box-sizing: border-box;
    }

    .password-reset::before {
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

    .password-reset__hero {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .password-reset__hero h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .password-reset__hero p {
        max-width: 820px;
        margin: 0;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .password-reset__panel {
        max-width: 920px;
        padding: 32px;
        background: #ffffff;
        border: 1px solid #e3e3e3;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .password-reset__panel h2 {
        margin: -32px -32px 28px -32px;
        padding: 22px 28px;
        background: #43973D;
        color: #ffffff;
        font-size: 22px;
        font-weight: 800;
    }

    .password-reset__field {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 24px;
    }

    .password-reset__field label {
        color: #000000;
        font-size: 14px;
        font-weight: 800;
    }

    .password-reset__field label::after {
        content: " *";
        color: #b00020;
    }

    .password-reset__field input[type="email"] {
        min-height: 50px;
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #cfcfcf;
        border-radius: 0;
        color: #000000;
        font-family: Montserrat, Helvetica, sans-serif;
        font-size: 14px;
    }

    .password-reset__field input[type="email"]:focus {
        outline: none;
        border-color: #43973D;
        box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.18);
    }

    .password-reset .btn,
    .password-reset .btn-primary {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-weight: 800;
    }

    .password-reset .btn:hover,
    .password-reset .btn:focus,
    .password-reset .btn-primary:hover,
    .password-reset .btn-primary:focus {
        background: #000000 !important;
        border-color: #000000 !important;
    }

    .password-reset .alert-danger {
        max-width: 920px;
        margin-top: 24px;
        padding: 16px 20px;
        background: #fff4f4;
        border: 1px solid #d80000;
        border-left: 8px solid #d80000;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    .password-reset .alert-success {
        margin-top: 24px;
        padding: 16px 20px;
        background: #eef8ec;
        border: 1px solid #43973D;
        border-left: 8px solid #43973D;
        border-radius: 0;
        color: #000000;
        font-weight: 700;
    }

    .password-reset .close {
        color: #000000;
        opacity: 1;
    }

    @media (max-width: 768px) {
        .password-reset {
            padding: 32px 20px;
        }

        .password-reset__hero {
            padding: 28px 22px;
        }

        .password-reset__hero h1 {
            font-size: 32px;
        }

        .password-reset__panel {
            padding: 24px 20px;
        }

        .password-reset__panel h2 {
            margin: -24px -20px 24px -20px;
        }
    }
</style>

<div class="password-reset">
    <div class="password-reset__hero">
        <h1>Reset password</h1>
        <p>Enter the email address you used to register and we will send you a link to reset your password.</p>
    </div>

    <div class="password-reset__panel">
        <h2>Request reset link</h2>

        <div class="password-reset__field">
            <label for="email">Email</label>
            <input type="email" id="email" class="form-control" name="pre[email]" placeholder="Enter your email address" autocomplete="off" required />
        </div>

        <asp:Button runat="server" ID="btnResetPassword" Text="Reset password" CssClass="btn btn-primary btn-block" />

        <div class="alert alert-success alert-dismissable" runat="server" visible="false" id="altSuccess">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <strong>Success!</strong> We've sent an email to your inbox. Please check it for the link to reset your password.
        </div>
    </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
</div>