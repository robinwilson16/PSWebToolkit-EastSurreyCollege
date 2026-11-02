Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.IO
Imports System.Drawing.Imaging
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Linq

Partial Class photo
    Inherits CheckoutBaseControl

    Public tblOffering As New OfferingDataTable
    Public OfferingRow As OfferingRow

    Public ReferenceDate As Date
    Public Age19DOB As Date
    Public IsUnder19 As Boolean
    Public IsUnder18 As Boolean

    Public IsPhotoRequired As Boolean = True

    Protected Overrides Sub OnLoad(e As EventArgs)

        MyBase.OnLoad(e)

        SetAgeChecks()
        GetCourseDetails()

        If Not WorkingData.EnrolmentRequestRow.Photo Is Nothing Then
            Dim base64String As String = Convert.ToBase64String(WorkingData.EnrolmentRequestRow.Photo, 0, WorkingData.EnrolmentRequestRow.Photo.Length)
            Image1.ImageUrl = "data:image/png;base64," & base64String
        Else
            Image1.ImageUrl = "/PSWebEnrolment/images/BlankPhoto.png"
        End If

        'If PaymentSubmitter.AllowEmptyBasket And WorkingData.ShoppingCart.Items.Count = 0 Then
        '    Session("RequestMode") = RequestMode.EnrolmentRequest
        'End If

        If Not IsPostBack Then
            Session("Image") = Nothing
            PutAllOfferingsInBasket()
        Else
            Session("Image") = FileUpload1.PostedFile

        End If
    End Sub

    Protected Sub PutAllOfferingsInBasket()

        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)

            With tblOffering(0)

                If tblOffering.Count > 0 AndAlso tblOffering(0).OfferingTypeID.HasValue Then

                    Dim OfferingTypeSelect As String = .OfferingTypeID.Value.ToString

                    If OfferingTypeSelect.ToString.Length > 0 Then

                        '  WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42 = OfferingTypeSelect
                        '   ddlCourseType.SelectedValue = OfferingTypeSelect

                    End If

                End If
            End With

            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If



    End Sub

    Protected Sub Upload(ByVal sender As Object, ByVal e As EventArgs)
        Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic"}

        Page.MaintainScrollPositionOnPostBack = True
        Session("Image") = FileUpload1.PostedFile
        Dim fs As Stream = FileUpload1.PostedFile.InputStream()
        Dim br As BinaryReader = New BinaryReader(fs)
        Dim bytes As Byte() = br.ReadBytes(CInt(fs.Length))
        Dim base64String As String = Convert.ToBase64String(bytes, 0, bytes.Length)
        Dim imgPath As String = "data:image/png;base64," & base64String
        Dim fileName As String = FileUpload1.PostedFile.FileName
        PhotoFilename.Text = fileName

        'Panel1.Visible = True
        'Response.BinaryWrite(bytes)

        'Check Image is Valid
        If Not IsNothing(fileName) Then
            If String.IsNullOrEmpty(fileName) Then
                PhotoPathValidator.ErrorMessage = "Please click Choose File above first to browse your device for the photo you wish to use. If you cannot provide evidence at present, please instead select a reason why below."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf fileName.LastIndexOf(".") <= 0 Then
                PhotoPathValidator.ErrorMessage = "This type of file is not valid. Please upload a valid image file"
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf validExtensions.Contains(fileName.Substring(fileName.LastIndexOf(".")).ToLower) = False Then
                PhotoPathValidator.ErrorMessage = "This type of file is not valid. Please upload a valid image file"
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf FileUpload1.FileBytes.Length > 5 * 1000 * 1000 Then
                PhotoPathValidator.ErrorMessage = "This file is " + Math.Round((FileUpload1.FileBytes.Length / 1000 / 1000), 2).ToString + "MB which is too large as the maximum permitted file size is 5MB. Please choose a smaller file."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            Else
                Image1.ImageUrl = imgPath
                WorkingData.EnrolmentRequestRow.Photo = bytes
            End If
        End If
    End Sub

    Protected Sub Save(ByVal sender As Object, ByVal e As EventArgs)

        Page.MaintainScrollPositionOnPostBack = True
        'Panel1.Visible = False
        'Panel2.Visible = True

    End Sub

    Protected Sub Cancel(ByVal sender As Object, ByVal e As EventArgs)
        Page.MaintainScrollPositionOnPostBack = True
        Session("Image") = Nothing
        WorkingData.EnrolmentRequestRow.Photo = Nothing
        Response.Redirect(Request.Url.AbsoluteUri)

    End Sub




    Public Overrides Sub ValidateControl()

        'Photo Validation
        Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic"}

        If Not IsNothing(StudentDetailUserDefined24) Then
            If WorkingData.EnrolmentRequestRow.Photo Is Nothing And (CType(StudentDetailUserDefined24.Value, String) = "" Or CType(StudentDetailUserDefined24.Value, String) = "OK") And IsPhotoRequired = True Then
                PhotoPathValidator.ErrorMessage = "Please upload your photo by clicking on Choose File. If you cannot upload your photo then please state the reason why."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        Else
            If WorkingData.EnrolmentRequestRow.Photo Is Nothing And IsPhotoRequired = True Then
                PhotoPathValidator.ErrorMessage = "Please upload your photo by clicking on Choose File. If you cannot upload your photo then please state the reason why."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then
            Response.Redirect(GetResourceValue("checkout_dataprotection_FE_aspx"))
        End If

    End Sub

    Public Function SetAgeChecks() As Boolean
        Dim dateOfBirthDate As Date?
        Dim referenceDate As DateTime = CDate(Today().Year & "-08-31")

        If Not IsNothing(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
            If Not String.IsNullOrEmpty(WorkingData.EnrolmentRequestRow.DateOfBirth.Value) Then
                dateOfBirthDate = CType(WorkingData.EnrolmentRequestRow.DateOfBirth.Value, Date)
            End If
            Dim age19DOB As DateTime = referenceDate.AddYears(-19)
            If Not IsNothing(dateOfBirthDate) And dateOfBirthDate > age19DOB Then 'Under 19
                IsUnder19 = True
            Else
                IsUnder19 = False
            End If
            Dim age18DOB As DateTime = referenceDate.AddYears(-18)
            If Not IsNothing(dateOfBirthDate) And dateOfBirthDate > age18DOB Then 'Under 18
                IsUnder18 = True
            Else
                IsUnder18 = False
            End If
        End If
        Return True
    End Function

    Private Sub GetCourseDetails()
        Dim intOfferingID As Integer = OfferingID()
        If intOfferingID <> -1 Then

            'Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(
                True,
                False,
                tblOffering.AcademicYearIDColumn,
                tblOffering.WebSiteAvailabilityIDColumn,
                tblOffering.CollegeLevelCodeColumn,
                tblOffering.CollegeLevelNameColumn,
                tblOffering.CourseInformationColumn,
                tblOffering.CourseHeaderNameColumn,
                tblOffering.CourseInformationIDColumn,
                tblOffering.TotalFeeAmountColumn,
                tblOffering.OfferingTypeIDColumn,
                tblOffering.StartTimeColumn,
                tblOffering.DayOfWeekColumn,
                tblOffering.StartDateColumn,
                tblOffering.EndDateColumn,
                tblOffering.SiteDescriptionColumn,
                tblOffering.EndTimeColumn,
                tblOffering.SIDColumn
            )
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)
            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            OfferingRow = tblOffering.FirstOrDefault()
        Else
            OfferingRow = tblOffering.NewRow
        End If
    End Sub

    Public ReadOnly Property OfferingID() As Integer
        Get
            If CInt(HttpContext.Current.Request.QueryString("OfferingID")) > 0 Then
                Return CInt(HttpContext.Current.Request.QueryString("OfferingID"))
            ElseIf Not IsNothing(WorkingData.ShoppingCart.Items(0).OfferingID) Then
                Return WorkingData.ShoppingCart.Items(0).OfferingID
            ElseIf Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return Nothing
            End If
        End Get
    End Property
End Class
