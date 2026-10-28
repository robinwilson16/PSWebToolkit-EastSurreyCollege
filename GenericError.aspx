<%@ Page Language="vb" AutoEventWireup="false" Inherits="GenericError" CodeFile="GenericError.aspx.vb" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Orbital South Colleges - Application Error</title>
    <link href="content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            font-family: 'Montserrat', Helvetica, sans-serif;
        }

        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        body {
            background: #ffffff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Full-width error container */
        .error-container {
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .error-header {
            background: linear-gradient(135deg, #0052cc 0%, #003a99 100%);
            padding: 40px;
            text-align: center;
            color: white;
        }

        .error-header img {
            max-height: 70px;
            margin-bottom: 24px;
            display: block;
            background: white;
            padding: 12px 20px;
            border-radius: 6px;
            margin-left: auto;
            margin-right: auto;
        }

        .error-header h1 {
            margin: 0;
            font-size: 36px;
            font-weight: 600;
            line-height: 1.2;
            letter-spacing: -0.5px;
        }

        .error-content {
            flex: 1;
            padding: 48px 40px;
            max-width: 100%;
        }

        .error-section {
            margin-bottom: 32px;
        }

        .error-section:last-child {
            margin-bottom: 0;
        }

        .section-label {
            font-size: 13px;
            font-weight: 700;
            color: #0052cc;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 12px;
            display: block;
        }

        .error-message-box {
            background: #f9f9f9;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            font-size: 14px;
            line-height: 1.8;
            color: #212121;
            word-break: break-word;
            white-space: pre-wrap;
            position: relative;
            min-height: 100px;
            max-height: 350px;
            overflow-y: auto;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Montserrat', Helvetica, sans-serif;
        }

        .copy-button {
            position: absolute;
            top: 12px;
            right: 12px;
            background: #0052cc;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            z-index: 10;
        }

        .copy-button:hover {
            background: #003a99;
            transform: translateY(-1px);
        }

        .copy-button.copied {
            background: #2ea44f;
        }

        .error-details {
            background: #f9f9f9;
            border-left: 4px solid #0052cc;
            padding: 20px;
            border-radius: 4px;
        }

        .error-detail-row {
            margin-bottom: 16px;
            display: grid;
            grid-template-columns: 150px 1fr;
            gap: 16px;
        }

        .error-detail-row:last-child {
            margin-bottom: 0;
        }

        .error-detail-label {
            font-size: 12px;
            font-weight: 700;
            color: #0052cc;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .error-detail-value {
            font-size: 14px;
            color: #424242;
            word-break: break-word;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Montserrat', Helvetica, sans-serif;
        }

        .instructions-box {
            background: #e8f0ff;
            border-left: 4px solid #0052cc;
            padding: 24px;
            border-radius: 4px;
        }

        .instructions-box h3 {
            font-size: 16px;
            font-weight: 600;
            color: #0052cc;
            margin: 0 0 16px 0;
        }

        .instructions-box ol {
            margin: 0;
            padding-left: 24px;
        }

        .instructions-box li {
            font-size: 14px;
            color: #424242;
            line-height: 1.8;
            margin-bottom: 10px;
        }

        .instructions-box li:last-child {
            margin-bottom: 0;
        }

        .instructions-box strong {
            color: #0052cc;
            font-weight: 600;
        }

        .instructions-box a {
            color: #0052cc;
            text-decoration: underline;
            transition: all 0.2s ease;
        }

        .instructions-box a:hover {
            color: #003a99;
        }

        .button-group {
            display: flex;
            gap: 12px;
            margin-top: 40px;
        }

        .btn-custom {
            flex: 1;
            padding: 14px 24px;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            min-height: 44px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary {
            background: #0052cc;
            color: white;
        }

        .btn-primary:hover {
            background: #003a99;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 52, 153, 0.3);
        }

        .btn-secondary {
            background: #f5f5f5;
            color: #212121;
            border: 2px solid #e0e0e0;
        }

        .btn-secondary:hover {
            background: #eeeeee;
            border-color: #d0d0d0;
            transform: translateY(-2px);
        }

        .error-footer {
            background: #f5f5f5;
            padding: 24px 40px;
            text-align: center;
            font-size: 13px;
            color: #666666;
            border-top: 1px solid #e0e0e0;
        }

        .error-footer p {
            margin: 0;
            line-height: 1.6;
        }

        /* Scrollbar styling */
        .error-message-box::-webkit-scrollbar {
            width: 8px;
        }

        .error-message-box::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        .error-message-box::-webkit-scrollbar-thumb {
            background: #0052cc;
            border-radius: 4px;
        }

        .error-message-box::-webkit-scrollbar-thumb:hover {
            background: #003a99;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .error-content {
                padding: 40px 32px;
            }

            .error-header h1 {
                font-size: 32px;
            }
        }

        @media (max-width: 768px) {
            .error-header {
                padding: 32px 24px;
            }

            .error-header h1 {
                font-size: 26px;
            }

            .error-content {
                padding: 32px 24px;
            }

            .error-detail-row {
                grid-template-columns: 1fr;
                gap: 4px;
            }

            .error-detail-label {
                margin-bottom: 4px;
            }

            .button-group {
                flex-direction: column;
                gap: 10px;
            }

            .btn-custom {
                padding: 12px 16px;
            }

            .copy-button {
                position: static;
                width: 100%;
                margin-top: 12px;
                margin-bottom: 12px;
            }

            .error-message-box {
                padding: 12px;
                padding-top: 50px;
            }

            .instructions-box {
                padding: 16px;
            }

            .instructions-box h3 {
                font-size: 15px;
                margin-bottom: 12px;
            }

            .instructions-box ol {
                padding-left: 20px;
            }

            .instructions-box li {
                font-size: 13px;
                margin-bottom: 8px;
            }
        }

        @media (max-width: 480px) {
            body {
                padding: 0;
            }

            .error-header {
                padding: 24px 16px;
            }

            .error-header img {
                max-height: 60px;
            }

            .error-header h1 {
                font-size: 20px;
            }

            .error-content {
                padding: 20px 16px;
            }

            .error-message-box {
                font-size: 13px;
                max-height: 250px;
            }

            .error-footer {
                padding: 16px;
                font-size: 12px;
            }

            .section-label {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <form id="Form1" method="post" runat="server">
        <div class="error-container">
            <!-- Error Header -->
            <div class="error-header">
             <%--   <img src="_images/logo.png" alt="Orbital South Colleges Logo" />--%>
                <h1>An Unexpected Error Occurred</h1>
            </div>

            <!-- Error Content -->
            <div class="error-content">
                <!-- Error Message Box -->
                <div class="error-section">
                    <label class="section-label">Error Message</label>
                    <div style="position: relative;">
                        <button type="button" class="copy-button" onclick="copyErrorToClipboard()" title="Copy error details to clipboard">Copy</button>
                        <div class="error-message-box">
                            <asp:Label ID="lblErrorMessage" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <!-- Additional Error Information -->
                <div class="error-section">
                    <label class="section-label">Additional Details</label>
                    <div class="error-details">
                        <div class="error-detail-row">
                            <div class="error-detail-label">Error Type</div>
                            <div class="error-detail-value">
                                <asp:Label ID="lblErrorType" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="error-detail-row">
                            <div class="error-detail-label">Referring Page</div>
                            <div class="error-detail-value">
                                <asp:Label ID="lblErrorPage" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Help Instructions -->
              

                <!-- Action Buttons -->
                <div class="button-group">
                    <a href="javascript:history.back()" class="btn-custom btn-secondary">Go Back</a>
                    <a href="webenrolment.aspx" class="btn-custom btn-primary">Return Home</a>
                </div>
            </div>

            <!-- Footer -->
            <div class="error-footer">
                <p>© Orbital South Colleges. All rights reserved.</p>
            </div>
        </div>
    </form>

    <script>
        function copyErrorToClipboard() {
            const messageBox = document.querySelector('.error-message-box');
            const errorText = messageBox.innerText.trim();

            navigator.clipboard.writeText(errorText).then(function () {
                const button = document.querySelector('.copy-button');
                const originalText = button.innerText;
                button.innerText = 'Copied!';
                button.classList.add('copied');

                setTimeout(function () {
                    button.innerText = originalText;
                    button.classList.remove('copied');
                }, 2000);
            }).catch(function (err) {
                // Fallback for older browsers
                try {
                    const textArea = document.createElement('textarea');
                    textArea.value = errorText;
                    document.body.appendChild(textArea);
                    textArea.select();
                    document.execCommand('copy');
                    document.body.removeChild(textArea);

                    const button = document.querySelector('.copy-button');
                    button.innerText = 'Copied!';
                    button.classList.add('copied');

                    setTimeout(function () {
                        button.innerText = 'Copy';
                        button.classList.remove('copied');
                    }, 2000);
                } catch (e) {
                    alert('Failed to copy error details. Please manually select and copy the error message.');
                }
            });
        }
    </script>
</body>
</html>