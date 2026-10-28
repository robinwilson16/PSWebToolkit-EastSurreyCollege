<%@ Control Language="VB" AutoEventWireup="false" CodeFile="DoPasswordReset.ascx.vb" Inherits="account_ccc_DoPasswordReset" %>

<style>
    .do-password-reset {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        color: #000000;
    }

    .do-password-reset * {
        box-sizing: border-box;
    }

    .do-password-reset::before {
        content: "Password reset";
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

    .do-password-reset__hero {
        margin-bottom: 36px;
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .do-password-reset__hero h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .do-password-reset__hero p {
        max-width: 820px;
        margin: 0;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    .do-password-reset__panel {
        max-width: 920px;
        padding: 32px;
        background: #ffffff;
        border: 1px solid #e3e3e3;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    }

    .do-password-reset__panel h2 {
        margin: -32px -32px 28px -32px;
        padding: 22px 28px;
        background: #43973D;
        color: #ffffff;
        font-size: 22px;
        font-weight: 800;
    }

    .do-password-reset__field {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 24px;
    }

    .do-password-reset__field label {
        color: #000000;
        font-size: 14px;
        font-weight: 800;
    }

    .do-password-reset__field input[type="password"] {
        min-height: 50px;
        width: 100%;
        padding: 10px 12px;
        border: 1px solid #cfcfcf;
        border-radius: 0;
        color: #000000;
        font-family: Montserrat, Helvetica, sans-serif;
        font-size: 14px;
    }

    .do-password-reset__field input[type="password"]:focus {
        outline: none;
        border-color: #43973D;
        box-shadow: 0 0 0 3px rgba(67, 151, 61, 0.18);
    }

    .do-password-reset__password-info {
        display: block;
        margin-top: 8px;
        color: #555555;
        font-size: 12px;
        line-height: 1.5;
    }

    .do-password-reset__error {
        color: #b00020;
        font-size: 14px;
        font-weight: 700;
    }

    .do-password-reset .btn,
    .do-password-reset .btn-primary {
        min-height: 54px;
        padding: 0 34px;
        background: #43973D !important;
        border: 2px solid #43973D !important;
        border-radius: 0;
        color: #ffffff !important;
        font-weight: 800;
    }

    .do-password-reset .btn:hover,
    .do-password-reset .btn:focus,
    .do-password-reset .btn-primary:hover,
    .do-password-reset .btn-primary:focus {
        background: #000000 !important;
        border-color: #000000 !important;
    }

    .do-password-reset .alert-danger {
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

    @media (max-width: 768px) {
        .do-password-reset {
            padding: 32px 20px;
        }

        .do-password-reset__hero {
            padding: 28px 22px;
        }

        .do-password-reset__hero h1 {
            font-size: 32px;
        }

        .do-password-reset__panel {
            padding: 24px 20px;
        }

        .do-password-reset__panel h2 {
            margin: -24px -20px 24px -20px;
        }
    }
</style>

<div class="do-password-reset">
    <div class="do-password-reset__hero">
        <h1>Choose a new password</h1>
        <p>Enter and confirm your new password below to regain access to your account.</p>
    </div>

    <div class="do-password-reset__panel">
        <h2>Update password</h2>

        <div class="do-password-reset__field">
            <label for="passwordnew">New password</label>
            <input type="password" id="passwordnew" name="passwordnew" class="form-control" placeholder="Enter your new password" autocomplete="off" />
            <asp:Label ID="lblPasswordInfo" runat="server" CssClass="do-password-reset__password-info"></asp:Label>
        </div>

        <div class="do-password-reset__field">
            <label for="password_mirror">Retype new password</label>
            <input type="password" id="password_mirror" name="password_mirror" class="form-control" placeholder="Retype your new password" autocomplete="off" oninput="check(this)" />
        </div>

        <p runat="server" id="errtext" class="do-password-reset__error"></p>

        <asp:Button runat="server" ID="btnUpdate" Text="Update password" CssClass="btn btn-primary btn-block" />
    </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="alert alert-danger" ForeColor="" />
</div>

<script>
    function check(input) {
        if (input.value !== $("#passwordnew").val()) {
            input.setCustomValidity('Password does not match.');
        } else {
            input.setCustomValidity('');
        }
    }
</script>