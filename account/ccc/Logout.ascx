<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Logout.ascx.vb" Inherits="account_ccc_Logout" %>

<style>
    .account-logout {
        width: 100%;
        margin: 0;
        padding: 56px;
        background: #ffffff;
        font-family: Montserrat, Helvetica, sans-serif;
        color: #000000;
    }

    .account-logout::before {
        content: "Signing out";
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

    .account-logout__hero {
        padding: 48px;
        background: #F3F1EE;
        border-left: 8px solid #43973D;
    }

    .account-logout__hero h1 {
        margin: 0 0 14px 0;
        color: #000000;
        font-size: 44px;
        font-weight: 800;
        line-height: 1.12;
    }

    .account-logout__hero p {
        max-width: 820px;
        margin: 0;
        color: #333333;
        font-size: 18px;
        line-height: 1.55;
    }

    @media (max-width: 768px) {
        .account-logout {
            padding: 32px 20px;
        }

        .account-logout__hero {
            padding: 28px 22px;
        }

        .account-logout__hero h1 {
            font-size: 32px;
        }
    }
</style>

<div class="account-logout">
    <div class="account-logout__hero">
        <h1>Signing you out</h1>
        <p>Please wait while your account session is closed.</p>
    </div>
</div>