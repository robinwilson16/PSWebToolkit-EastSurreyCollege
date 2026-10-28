Imports Elmah

Partial Public Class GenericError
    Inherits System.Web.UI.Page

    Private Property ExceptionContainer() As Exception
        Get
            If Session("LastError") IsNot Nothing Then
                Return DirectCast(Session("LastError"), Exception)
            End If
            Return Nothing
        End Get
        Set(ByVal value As Exception)
            Session("LastError") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Try
                ' Check if there's an exception to display
                If ExceptionContainer IsNot Nothing Then
                    Try
                        Elmah.ErrorSignal.FromCurrentContext.Raise(ExceptionContainer)
                    Catch
                        ' Ignore Elmah logging errors
                    End Try
                    DisplayError()
                Else
                    ' No exception - display test/placeholder error
                    DisplayTestError()
                End If

            Catch ex As Exception
                ' Fallback error handling if display fails
                DisplayFallbackError(ex)
            End Try
        End If
    End Sub

    Private Sub DisplayError()
        Try
            Dim errorToDisplay = ExceptionContainer

            ' Get the error type
            If errorToDisplay.InnerException IsNot Nothing Then
                If errorToDisplay.InnerException.GetType Is GetType(HttpUnhandledException) Then
                    errorToDisplay = errorToDisplay.GetBaseException
                Else
                    errorToDisplay = errorToDisplay.InnerException
                End If
            End If

            ' Show the error type on screen
            lblErrorType.Text = errorToDisplay.GetType.ToString

            ' Only try to get the referring page if there is one
            If Request.UrlReferrer IsNot Nothing Then
                lblErrorPage.Text = Request.UrlReferrer.PathAndQuery
            Else
                lblErrorPage.Text = Request.Url.PathAndQuery
            End If

            ' Handle specific error types with custom messages
            If errorToDisplay.Message.Contains("Unable to get DataSource") Then
                lblErrorType.Text = "Database Connection Error"
                lblErrorMessage.Text = "Unable to connect to database with the specified connection details. The server was not found or is not accessible."
            ElseIf errorToDisplay.GetType Is GetType(HttpRequestValidationException) Then
                lblErrorMessage.Text = "You have entered data that could be considered hostile."
            Else
                ' Display the actual error message - don't HTML encode, let the label handle it
                lblErrorMessage.Text = errorToDisplay.Message
            End If

        Catch ex As Exception
            ' Fallback if error processing fails
            DisplayFallbackError(ex)
        End Try
    End Sub

    Private Sub DisplayFallbackError(ex As Exception)
        lblErrorType.Text = "Error Processing Exception Details"
        lblErrorMessage.Text = "An error occurred while processing the error details." & vbCrLf & vbCrLf & "Error: " & ex.Message
        lblErrorPage.Text = If(Request.UrlReferrer IsNot Nothing, Request.UrlReferrer.PathAndQuery, Request.Url.PathAndQuery)
    End Sub

    Private Sub DisplayTestError()
        ' Display a test error when no exception is present (useful for testing the page)
        lblErrorType.Text = "Test Error - No Server Response"
        lblErrorMessage.Text = "The server did not respond within the expected time frame. This is typically caused by:" & vbCrLf & vbCrLf & "• High server load or temporary connectivity issues" & vbCrLf & "• Database timeout or unavailability" & vbCrLf & "• Network connectivity problems" & vbCrLf & vbCrLf & "Please try again in a few moments. If the problem persists, contact IT support."
        lblErrorPage.Text = Request.Url.PathAndQuery
    End Sub
End Class