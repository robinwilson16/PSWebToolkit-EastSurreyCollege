Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class account_ccc_UserAccount
    Inherits webenrolmentcontrolvalidate

    Private m_errortext As String

    Protected Overrides Sub OnPreRender(e As EventArgs)
        MyBase.OnPreRender(e)
        errtext.InnerHtml = m_errortext
    End Sub

    Protected Overrides Sub OnLoad(e As EventArgs)

        errtext.InnerHtml = m_errortext

        If WorkingData.CurrentLoggedOnUserRow Is Nothing Then
            Response.Redirect("webenrolment.aspx?page=~/account/ccc/login.ascx")
        End If
        ''CCCPS-80694: Setting information on password field to guide user to set strong password.
        lblPasswordInfo.Text = PasswordValidation.InfoMessage
        Dim tblApplicationInterviews As New vApplicationRequestInterviewDataTable
        Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblApplicationInterviews)
        v.Columns.AddDBColumns(False, False)
        v.Columns.EnsureColumnIsSelected(True, False, tblApplicationInterviews.ApplicationStageIDColumn)
        v.Filters.SetColumnFilter(tblApplicationInterviews.ApplicationRequestEmailColumn, WorkingData.CurrentLoggedOnUserRow.Email)
        v.Filters.SetColumnFilter(tblApplicationInterviews.OfferingNameColumn, Nothing, FilterOperator.OperatorNotIsBlank)
        v.SortOrders.SetColumnSortOrder(SortDirection.Descending, tblApplicationInterviews.ApplicationCreatedDateColumn)
        tblApplicationInterviews.TableAdapter.Load(tblApplicationInterviews, v)

        Me.lstDetails.DataSource = tblApplicationInterviews
        Me.lstDetails.DataBind()
        Me.lstDetails.Visible = True
        ''CCCPS-81197: No need to reload everything on every postback.
        If Not IsPostBack Then
            fillUserDetails()
            WorkingData.PopulateWorkingData(WorkingData.CurrentLoggedOnUserRow)
            txtPostcode.Text = WorkingData.CurrentLoggedOnUserRow.PostcodeOut & WorkingData.CurrentLoggedOnUserRow.PostcodeIn
        End If
        MyBase.OnLoad(e)
    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then



            If Session("HE") = "HE" Then

                redirectString = GetResourceValue("checkout_directenrol_pt1HE_aspx")
            Else





                If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined8 = "Part2" Then


                    dontcollect.Visible = True
                    Exit Sub


                ElseIf WorkingData.EnrolmentRequestRow.EnrolmentUserDefined8 = "Part1" Then

                    If DateDiff(DateInterval.Day, WorkingData.EnrolmentRequestRow.DateOfBirth.Value, Now) < (19 * 365) Then

                        dontcollect.Visible = True
                        Exit Sub



                    Else



                        redirectString = GetResourceValue("checkout_directenrol_pt2_aspx")
                    End If


                ElseIf WorkingData.EnrolmentRequestRow.EnrolmentUserDefined8 = "Part2HE" Then


                    dontcollect.Visible = True
                    Exit Sub

                ElseIf WorkingData.EnrolmentRequestRow.EnrolmentUserDefined8 = "Part1HE" Then

                    If DateDiff(DateInterval.Day, WorkingData.EnrolmentRequestRow.DateOfBirth.Value, Now) < (19 * 365) Then

                        dontcollect.Visible = True
                        Exit Sub



                    Else



                        redirectString = GetResourceValue("checkout_directenrol_pt2HE_aspx")
                    End If

                Else

                    redirectString = GetResourceValue("checkout_directenrol_pt1_aspx")



                End If




                Response.Redirect(redirectString)

            End If

        End If




    End Sub

    Public Sub btnSubmit_OnClick(sender As Object, e As EventArgs)
        m_errortext = ""
        ValidateControl()

        If Me.Page.IsValid Then
            Dim tblWebUser As WebUserDataTable = WorkingData.WebUser
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblWebUser)
            v.Columns.AddDBColumns(True, True)
            v.Filters.SetColumnFilter(tblWebUser.EmailColumn, WorkingData.CurrentLoggedOnUserRow.Email)
            ''CCCPS-80694: TableAdapter.Load fills duplicate row of same user and causes an exception.
            WorkingData.WebUser.Clear()
            tblWebUser.TableAdapter.Load(tblWebUser, v)

            If tblWebUser.Rows.Count = 1 Then
                Dim DataRow As WebUserRow = tblWebUser.Rows(0)
                ''CCCPS-81197: Changes to utilize asp.net controls instead of Enrolment Fields.
                DataRow.Surname = txtSurname.Text.Trim
                DataRow.FirstForename = txtFirstName.Text.Trim
                DataRow.Title = ddlTitle.SelectedValue
                DataRow.Sex = ddlSex.SelectedValue
                If txtDOB.Text IsNot Nothing AndAlso txtDOB.Text.Length > 0 Then
                    DataRow.DateOfBirth = txtDOB.Text.Trim
                End If
                DataRow.Address1 = txtAddress1.Text.Trim
                DataRow.Address2 = txtAddress2.Text.Trim
                DataRow.Address3 = txtAddress3.Text.Trim
                DataRow.Address4 = txtAddress4.Text.Trim
                Dim pcode As String = txtPostcode.Text.Trim
                'postcode stuff            
                If Len(pcode) > 0 Then
                    DataRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
                    DataRow.PostcodeIn = Right(pcode, 3)
                End If
                DataRow.Email = txtEmail.Text.Trim
                ''CCCPS-78454: Validating password based on applied policy.
                If Len(txtPassword.Text) > 0 AndAlso Len(txtNewPassword.Text) > 0 AndAlso Len(txtPassword_Mirror.Text) > 0 Then
                    If CCCAuthenticationLibrary.DoesSpecifiedPasswordMatchEncryptedPassword(txtPassword.Text, DataRow.Password) Then

                        If txtNewPassword.Text <> txtPassword_Mirror.Text Then
                            m_errortext = "Password does not match"
                        ElseIf txtPassword.Text = txtNewPassword.Text Then
                            m_errortext = "You must create a new password that is different from your current one."
                            ' ElseIf PasswordValidation.IsValid(txtNewPassword.Text) Then
                            DataRow.Password = CCCAuthenticationLibrary.EncryptPassword(txtNewPassword.Text)
                            m_errortext = "Password changed"
                        Else
                            m_errortext = PasswordValidation.ErrorMessage
                        End If
                    Else
                        m_errortext = "Incorrect password"
                    End If
                ElseIf Len(txtPassword.Text) > 0 Then
                    m_errortext = "You must enter a 'New Password' and 'Retype New Password' to update the password."
                End If
                tblWebUser.TableAdapter.Save(tblWebUser)
                ''CCCPS-81197: Remapping of user data to enrolment data.
                WorkingData.MapUserDataToWorkingData(WorkingData.CurrentLoggedOnUserRow)
            End If

        End If

    End Sub

    Protected Sub lstDetails_ItemDataBound(sender As Object, e As ListViewItemEventArgs) Handles lstDetails.ItemDataBound
        Dim item As ListViewItem = e.Item
        ' Verify if the item is a data item.
        If item.ItemType = ListViewItemType.DataItem Then
            Dim rowView As System.Data.DataRowView
            rowView = CType(CType(e.Item, System.Web.UI.WebControls.ListViewDataItem).DataItem, Data.DataRowView)

            'Interview Details
            Dim iDateTime As Label = e.Item.FindControl("iDateTime")
            Dim interviewDetails As HtmlGenericControl = e.Item.FindControl("interviewDetails")
            interviewDetails.Visible = Len(iDateTime.Text) > 0

            'Enrolment Details
            Dim iEnrolmentStartDate As Label = e.Item.FindControl("iEnrolmentStartDate")
            Dim enrolmentDetails As HtmlGenericControl = e.Item.FindControl("enrolmentDetails")
            enrolmentDetails.Visible = Len(iEnrolmentStartDate.Text) > 0

            ' Find progress step elements
            Dim stage1 As HtmlGenericControl = e.Item.FindControl("stage1")
            Dim stage2 As HtmlGenericControl = e.Item.FindControl("stage2")
            Dim stage3 As HtmlGenericControl = e.Item.FindControl("stage3")
            Dim stage4 As HtmlGenericControl = e.Item.FindControl("stage4")

            Dim stage1details As HtmlGenericControl = e.Item.FindControl("stage1Details")
            Dim stage2details As HtmlGenericControl = e.Item.FindControl("stage2Details")
            Dim stage3details As HtmlGenericControl = e.Item.FindControl("stage3Details")
            Dim stage4details As HtmlGenericControl = e.Item.FindControl("stage4Details")

            ' Find progress tracker <ol> for data-progress attribute
            Dim progtrckr As HtmlGenericControl = e.Item.FindControl("progtrckr")

            ' Default: only stage 0 is done, stage 1 is current
            Dim progressLevel As Integer = 0

            ' Determine progress level and apply classes
            If Len(rowView("EnrolmentStartDate").ToString) > 0 Then
                ' All stages complete
                progressLevel = 4
                SetStageClasses(stage1, stage1details, "done")
                SetStageClasses(stage2, stage2details, "done")
                SetStageClasses(stage3, stage3details, "done")
                SetStageClasses(stage4, stage4details, "done")

            ElseIf Len(rowView("ApplicationOffer").ToString) > 0 Then
                ' Up to offer made
                progressLevel = 3
                SetStageClasses(stage1, stage1details, "done")
                SetStageClasses(stage2, stage2details, "done")
                SetStageClasses(stage3, stage3details, "done")
                SetStageClasses(stage4, stage4details, "current")

            ElseIf Len(rowView("DateTime").ToString) > 0 Then
                ' Up to interview created
                progressLevel = 2
                SetStageClasses(stage1, stage1details, "done")
                SetStageClasses(stage2, stage2details, "done")
                SetStageClasses(stage3, stage3details, "current")
                SetStageClasses(stage4, stage4details, "todo")

            ElseIf Len(rowView("ApplicationCreatedDate").ToString) > 0 Then
                ' Application created
                progressLevel = 1
                SetStageClasses(stage1, stage1details, "done")
                SetStageClasses(stage2, stage2details, "current")
                SetStageClasses(stage3, stage3details, "todo")
                SetStageClasses(stage4, stage4details, "todo")

            Else
                ' Only submitted
                progressLevel = 0
                SetStageClasses(stage1, stage1details, "current")
                SetStageClasses(stage2, stage2details, "todo")
                SetStageClasses(stage3, stage3details, "todo")
                SetStageClasses(stage4, stage4details, "todo")
            End If

            ' Set the data-progress attribute for the fill line
            progtrckr.Attributes("data-progress") = progressLevel.ToString()

        End If
    End Sub

    ''' <summary>
    ''' Helper to set both the progress step class and the detail card class in one call.
    ''' </summary>
    Private Sub SetStageClasses([step] As HtmlGenericControl, detail As HtmlGenericControl, state As String)
        Select Case state
            Case "done"
                [step].Attributes("class") = "progress-step progtrckr-done"
                detail.Attributes("class") = "stage-detail-card prog-details done"
            Case "current"
                [step].Attributes("class") = "progress-step progtrckr-current"
                detail.Attributes("class") = "stage-detail-card prog-details current"
            Case Else
                [step].Attributes("class") = "progress-step progtrckr-todo"
                detail.Attributes("class") = "stage-detail-card prog-details todo"
        End Select
    End Sub

    ''' <summary>
    ''' CCCPS-81197: Logic to fill all the asp.net control with user data as we have replaced Enrolment Fields with traditional asp.net controls.
    ''' </summary>
    Private Sub fillUserDetails()

        txtSurname.Text = WorkingData.CurrentLoggedOnUserRow.Surname
        txtFirstName.Text = WorkingData.CurrentLoggedOnUserRow.FirstForename
        ddlTitle.SelectedValue = WorkingData.CurrentLoggedOnUserRow.Title
        ddlSex.SelectedValue = WorkingData.CurrentLoggedOnUserRow.Sex
        If WorkingData.CurrentLoggedOnUserRow.DateOfBirth IsNot Nothing Then
            txtDOB.Text = WorkingData.CurrentLoggedOnUserRow.DateOfBirth
        End If
        txtAddress1.Text = WorkingData.CurrentLoggedOnUserRow.Address1
        txtAddress2.Text = WorkingData.CurrentLoggedOnUserRow.Address2
        txtAddress3.Text = WorkingData.CurrentLoggedOnUserRow.Address3
        txtAddress4.Text = WorkingData.CurrentLoggedOnUserRow.Address4
        If WorkingData.CurrentLoggedOnUserRow.PostcodeOut IsNot Nothing Then
            txtPostcode.Text = WorkingData.CurrentLoggedOnUserRow.PostcodeOut
        End If
        If WorkingData.CurrentLoggedOnUserRow.PostcodeIn IsNot Nothing Then
            txtPostcode.Text += WorkingData.CurrentLoggedOnUserRow.PostcodeIn
        End If
        txtEmail.Text = WorkingData.CurrentLoggedOnUserRow.Email
    End Sub
End Class