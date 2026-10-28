<%@ Control Language="VB" AutoEventWireup="false" CodeFile="thankyou_application.ascx.vb" Inherits="webcontrols_thankyou_applications" %>

<style>
    * {
        font-family: Montserrat, Helvetica, sans-serif;
    }

    .thankyou-container {
        max-width: 1264px;
        margin: 0 auto;
        padding: 64px 40px;
        background: #ffffff;
        border-radius: 24px;
    }

    .thankyou-wrapper {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 64px;
        align-items: center;
    }

    /* Left column — text content */
    .thankyou-content {
        display: flex;
        flex-direction: column;
        gap: 24px;
    }

    .thankyou-badge {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 8px 20px;
        background: #fe0018;
        color: #ffffff;
        border-radius: 50px;
        font-size: 14px;
        font-weight: 600;
        width: fit-content;
        letter-spacing: 0.3px;
    }

    .thankyou-badge-icon {
        font-size: 18px;
        line-height: 1;
    }

    .thankyou-heading {
        font-size: 36px;
        font-weight: 700;
        color: #02213e;
        margin: 0;
        line-height: 44px;
    }

    .thankyou-subheading {
        font-size: 18px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 28px;
    }

    .thankyou-steps {
        display: flex;
        flex-direction: column;
        gap: 16px;
        margin-top: 8px;
    }

    .thankyou-step {
        display: flex;
        align-items: flex-start;
        gap: 16px;
        padding: 16px 20px;
        background: #f7f9fc;
        border: 1px solid #d6dce5;
        border-left: 4px solid #02213e;
        border-radius: 8px;
    }

    .thankyou-step-number {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 32px;
        height: 32px;
        background: #02213e;
        color: #ffffff;
        border-radius: 50%;
        font-size: 14px;
        font-weight: 700;
        flex-shrink: 0;
    }

    .thankyou-step-text {
        flex: 1;
    }

    .thankyou-step-text h3 {
        font-size: 15px;
        font-weight: 600;
        color: #02213e;
        margin: 0 0 4px 0;
        line-height: 20px;
    }

    .thankyou-step-text p {
        font-size: 13px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 20px;
    }

    .thankyou-contact {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 16px 20px;
        background: #f7f9fc;
        border: 1px solid #d6dce5;
        border-left: 4px solid #fe0018;
        border-radius: 8px;
        margin-top: 8px;
    }

    .thankyou-contact p {
        font-size: 14px;
        font-weight: 400;
        color: #4b5563;
        margin: 0;
        line-height: 22px;
    }

    .thankyou-contact a {
        color: #fe0018;
        font-weight: 600;
        text-decoration: underline;
    }

    .thankyou-contact a:hover {
        color: #d50014;
    }

    /* Right column — image */
    .thankyou-image-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .thankyou-image-wrapper img {
        max-width: 100%;
        height: auto;
        max-height: 550px;
        object-fit: cover;
        border-radius: 16px;
    }

    /* Responsive */
    @media (max-width: 1200px) {
        .thankyou-container {
            padding: 40px 30px;
        }

        .thankyou-wrapper {
            grid-template-columns: 1fr;
            gap: 40px;
        }

        .thankyou-image-wrapper {
            order: -1;
        }

        .thankyou-image-wrapper img {
            max-height: 350px;
            width: 100%;
        }
    }

    @media (max-width: 768px) {
        .thankyou-container {
            padding: 24px 16px;
        }

        .thankyou-wrapper {
            gap: 24px;
        }

        .thankyou-heading {
            font-size: 26px;
            line-height: 34px;
        }

        .thankyou-subheading {
            font-size: 15px;
            line-height: 22px;
        }

        .thankyou-image-wrapper img {
            max-height: 260px;
        }

        .thankyou-step {
            padding: 12px 16px;
        }
    }
</style>

<div class="thankyou-container">
    <div class="thankyou-wrapper">
        <!-- Left Column — Content -->
        <div class="thankyou-content">
            <span class="thankyou-badge">
                <span class="thankyou-badge-icon">✓</span>
                Application Submitted
            </span>

            <h1 class="thankyou-heading">Thank you for your application</h1>

            <p class="thankyou-subheading">Thank you for applying to study with us. We’re really pleased that you’ve chosen Orbital South Colleges for the next step of your education</p>

            <div class="thankyou-steps">
                <div class="thankyou-step">
                    <span class="thankyou-step-number">1</span>
                    <div class="thankyou-step-text">
                        <h3>Confirmation Email</h3>
                        <p>You will receive a confirmation email shortly. Please check your junk/spam folder and add @osc.ac.uk to your safe senders list.</p>
                    </div>
                </div>

                <div class="thankyou-step">
                    <span class="thankyou-step-number">2</span>
                    <div class="thankyou-step-text">
                        <h3>Application Review</h3>
                        <p>Your application is now with our admissions team who will be in touch again soon to explain the next steps</p>
                    </div>
                </div>

                <div class="thankyou-step">
                    <span class="thankyou-step-number">3</span>
                    <div class="thankyou-step-text">
                        <h3>Next Steps</h3>
                        <p>You may be invited for an interview or asked to attend an enrolment session. We will confirm everything by email.</p>
                    </div>
                </div>
            </div>

            <div class="thankyou-contact">
                <p>In the meantime, if you have any questions please don’t hesitate to get in touch via <a href="mailto:clientservices@esc.ac.uk">clientservices@esc.ac.uk</a> or <a href="tel:01737 772611">01737 772611</a>.</p>
            </div>
        </div>

        <!-- Right Column — Image -->
        <div class="thankyou-image-wrapper">
            <img src="_images/image-2.png" alt="Orbital South Colleges" />
        </div>
    </div>
</div>