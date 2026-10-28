Option Explicit On
Option Strict On

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_homept2test
    Inherits webenrolmentcontrolvalidate
    Public ReadOnly Property RefNo() As String
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("RefNo")) Then
                Return ""
            Else
                Return CStr(Me.Page.Request("RefNo"))
            End If
        End Get
    End Property
    Public ReadOnly Property Age() As String
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Age")) Then
                Return ""
            Else
                Return CStr(Me.Page.Request("Age"))
            End If
        End Get
    End Property

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering1ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering1ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering1ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering2ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering2ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering2ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering3ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering3ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering3ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering4ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering4ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering4ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering5ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering5ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering5ID"))
            End If
        End Get
    End Property

    ''Load Page

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)


        If Not IsPostBack Then
            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()
            '      ProcessOffer()
            '      LoadAreas()



        End If





    End Sub

    '    Private Sub ProcessOffer()

    '       If Len(RefNo) > 0 Then

    '          Dim tblApplicationInterviews As New vApplicationRequestInterviewDataTable
    '         Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblApplicationInterviews)
    '    v.Columns.AddDBColumns(False, False)
    '     v.Columns.EnsureColumnsAreSelected(True, False, tblApplicationInterviews.ApplicationStageIDColumn, tblApplicationInterviews.ApplicationCreatedDateColumn, tblApplicationInterviews.ApplicationOfferColumn, tblApplicationInterviews.ApplicationRequestEmailColumn, tblApplicationInterviews.ApplicationStageIDColumn, tblApplicationInterviews.ChoiceColumn, tblApplicationInterviews.EnrolmentStartDateColumn, tblApplicationInterviews.EnrolmentCourseCodeColumn, tblApplicationInterviews.EnrolmentCourseNameColumn, tblApplicationInterviews.EnrolmentExpectedEndDateColumn, tblApplicationInterviews.EnrolmentGroupCodeColumn, tblApplicationInterviews.OfferingNameColumn, tblApplicationInterviews.RefNoColumn, tblApplicationInterviews.RoomNameColumn, tblApplicationInterviews.SiteColumn, tblApplicationInterviews.StaffNameColumn)
    '      v.Filters.SetColumnFilter(tblApplicationInterviews.RefNoColumn, RefNo, FilterOperator.OperatorEquals)
    '       v.Filters.SetColumnFilter(tblApplicationInterviews.OfferingNameColumn, Nothing, FilterOperator.OperatorNotIsBlank)
    '        v.SortOrders.SetColumnSortOrder(SortDirection.Descending, tblApplicationInterviews.ApplicationCreatedDateColumn)
    '         tblApplicationInterviews.TableAdapter.Load(tblApplicationInterviews, v)

    '          If tblApplicationInterviews.Rows.Count > 0 Then

    '               offerdetails.Visible = True

    '                With tblApplicationInterviews(0)


    '           If .ApplicationOffer.Length > 0 Then
    '                showoffer.Visible = True
    '                 offertext.InnerText = .ApplicationOffer
    '              End If
    '               If .ApplicationCreatedDate.HasValue Then
    '                    showcreated.Visible = True
    '                     CreatedDate.InnerText = CStr(.ApplicationCreatedDate)
    '                  End If
    '                   If .EnrolmentStartDate.HasValue Then
    '                        showstart.Visible = True
    '            StartDate.InnerText = CStr(.EnrolmentStartDate)
    '         End If
    '          If .EnrolmentExpectedEndDate.HasValue Then
    '               showexp.Visible = True
    '                ExpEndDate.InnerText = CStr(.EnrolmentExpectedEndDate)
    '             End If
    '              If Len(.Site) > 0 Then
    '                   showcampus.Visible = True
    '                    Campustext.InnerText = .Site
    '                 End If



    '              End With

    '           End If

    '        End If



    '    End Sub

    '   Private Sub LoadAreas()


    '        If Len(Age) > 0 Then

    '            'deal with Age


    '           If Age = "1618" Then

    '              Is1618.Visible = True
    '             Is1618.InnerText = "and you are aged 16-18 years old"



    '         ElseIf Age = "19Plus" Then

    '            is19Plus.Visible = True
    '           is19Plus.InnerText = "and you are aged 19+"


    '         End If



    '    End If




    '  End Sub

    Protected Sub PutAllOfferingsInBasket()


        Dim IntOffering1ID As Integer = Me.Offering1ID
        If IntOffering1ID <> -1 Then

            Dim tblOffering1 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.OfferingTypeColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn, tblOffering1.CollegeLevelUserDefined1Column)
            v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, IntOffering1ID)
            tblOffering1.TableAdapter.Load(tblOffering1, v)

            If tblOffering1.Count > 0 AndAlso tblOffering1(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)


                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    Else

                        item.Cost = 0
                    End If

                    item.Description = .GetRowDescription
                    If .WebSiteAvailabilityID = 2 Then

                        item.ItemType = "Application"
                    Else

                        item.ItemType = "Enrolment"
                    End If

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                    If .OfferingType = "Course- HE" Then

                        Session("HE") = "HE"


                    End If

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)

                    End If
                End With

            End If
        End If

        Dim IntOffering2ID As Integer = Me.Offering2ID

        If IntOffering2ID <> -1 Then

            Dim tblOffering2 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering2)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering2.WebSiteAvailabilityIDColumn, tblOffering2.OfferingTypeColumn, tblOffering2.CourseInformationIDColumn, tblOffering2.TotalFeeAmountColumn, tblOffering2.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering2.OfferingIDColumn, IntOffering2ID)
            tblOffering2.TableAdapter.Load(tblOffering2, v)



            If tblOffering2.Count > 0 AndAlso tblOffering2(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering2(0)


                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    Else

                        item.Cost = 0
                    End If

                    item.Description = .GetRowDescription
                    If .WebSiteAvailabilityID = 2 Then

                        item.ItemType = "Application"
                    Else

                        item.ItemType = "Enrolment"
                    End If

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                    If .OfferingType = "Course- HE" Then

                        Session("HE") = "HE"


                    End If
                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If
        Dim IntOffering3ID As Integer = Me.Offering3ID

        If IntOffering3ID <> -1 Then

            Dim tblOffering3 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering3)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering3.WebSiteAvailabilityIDColumn, tblOffering3.OfferingTypeColumn, tblOffering3.CourseInformationIDColumn, tblOffering3.TotalFeeAmountColumn, tblOffering3.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering3.OfferingIDColumn, IntOffering3ID)
            tblOffering3.TableAdapter.Load(tblOffering3, v)


            If tblOffering3.Count > 0 AndAlso tblOffering3(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering3(0)

                    'load shopping cart and add values from offering table depending on WebsiteAvailabilityID

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    Else

                        item.Cost = 0
                    End If

                    item.Description = .GetRowDescription
                    If .WebSiteAvailabilityID = 2 Then

                        item.ItemType = "Application"
                    Else

                        item.ItemType = "Enrolment"
                    End If

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                    If .OfferingType = "Course- HE" Then

                        Session("HE") = "HE"


                    End If

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If

        Dim IntOffering4ID As Integer = Me.Offering4ID

        If IntOffering4ID <> -1 Then

            Dim tblOffering4 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering4)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering4.WebSiteAvailabilityIDColumn, tblOffering4.OfferingTypeColumn, tblOffering4.CourseInformationIDColumn, tblOffering4.TotalFeeAmountColumn, tblOffering4.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering4.OfferingIDColumn, IntOffering4ID)
            tblOffering4.TableAdapter.Load(tblOffering4, v)

            If tblOffering4.Count > 0 AndAlso tblOffering4(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering4(0)

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    Else

                        item.Cost = 0
                    End If

                    item.Description = .GetRowDescription
                    If .WebSiteAvailabilityID = 2 Then

                        item.ItemType = "Application"
                    Else

                        item.ItemType = "Enrolment"
                    End If

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                    If .OfferingType = "Course- HE" Then

                        Session("HE") = "HE"


                    End If
                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If
        Dim IntOffering5ID As Integer = Me.Offering5ID

        If IntOffering5ID <> -1 Then

            Dim tblOffering5 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering5)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering5.WebSiteAvailabilityIDColumn, tblOffering5.OfferingTypeColumn, tblOffering5.CourseInformationIDColumn, tblOffering5.TotalFeeAmountColumn, tblOffering5.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering5.OfferingIDColumn, IntOffering5ID)
            tblOffering5.TableAdapter.Load(tblOffering5, v)



            If tblOffering5.Count > 0 AndAlso tblOffering5(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering5(0)


                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    Else

                        item.Cost = 0
                    End If

                    item.Description = .GetRowDescription
                    If .WebSiteAvailabilityID = 2 Then

                        item.ItemType = "Application"
                    Else

                        item.ItemType = "Enrolment"
                    End If

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                    If .OfferingType = "Course- HE" Then

                        Session("HE") = "HE"


                    End If

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If




        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.OfferingTypeColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)



            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    Else

                        item.Cost = 0
                    End If

                    item.Description = .GetRowDescription
                    If .WebSiteAvailabilityID = 2 Then

                        item.ItemType = "Application"
                    Else

                        item.ItemType = "Enrolment"
                    End If

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                    If .OfferingType = "Course- HE" Then

                        Session("HE") = "HE"


                    End If
                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If



    End Sub


    ''Bring in the Fees
    Protected Sub PopulateOfferingFeeTable()



        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)


        Next
        If stb.Length > 0 Then
            'Load offering table
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            'pick columns to load 
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.NameColumn, tblOffering.EndDateColumn, tblOffering.StartDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.CollegeLevelNameColumn, tblOffering.CourseInformationIDColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)
            'apply filter
            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            Dim tblCourseInfo As New CourseInformationDataTable

            Dim vCourseInfo As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblCourseInfo)
            vCourseInfo.Columns.Clear()
            vCourseInfo.Columns.AddPKColumns()
            With tblOffering(0)
                vCourseInfo.Columns.EnsureColumnsAreSelected(True, False, tblCourseInfo.CourseInformationIDColumn, tblCourseInfo.DescriptionColumn, tblCourseInfo.AcademicYearIDColumn, tblCourseInfo.WebsiteAvailabilityIDColumn)

                vCourseInfo.Filters.SetColumnFilter(tblCourseInfo.CourseInformationIDColumn, tblOffering(0).CourseInformationID, FilterOperator.OperatorEquals)

            End With
            vCourseInfo.SortOrders.Clear()
            vCourseInfo.SortOrders.SetColumnSortOrder(SortDirection.Ascending, tblCourseInfo.DescriptionColumn)
            tblCourseInfo.TableAdapter.Load(tblCourseInfo, vCourseInfo)


            With tblOffering(0)

                startdate1.InnerText = CStr(.StartDate)
                If .EndDate.HasValue Then
                    enddate.InnerText = CStr(.EndDate)
                End If


            End With


            If tblCourseInfo.Rows.Count > 0 Then
                'use the offering table
                With tblCourseInfo(0)



                    coursename.InnerText = .Description


                End With

            Else

                With tblOffering(0)


                    coursename.InnerText = .Name


                End With


            End If

            With tblOffering(0)

                '               If .CollegeLevelName.Length > 0 Then

                '                  Dim StrStart2 As String = .CollegeLevelName.Substring(0, 2)
                '                  Dim StrStart As String = .CollegeLevelName.Substring(0, 1)
                '                  If StrStart2 = "BH" Or StrStart2 = "RH" Then

                '                        HEText.Visible = True


                '                   ElseIf StrStart = "B" Then

                '                      Session("Campus") = "B"

                '                     BBTel.Visible = True

                '                  ElseIf StrStart = "R" Then
                '                       Session("Campus") = "R"
                '                      RRTel.Visible = True

                '                 End If

                '             End If

                If .SiteDescription.Length > 0 AndAlso WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then

                    Dim Strtemplate As String = "You have received a conditional offer from "

                    Dim StrSite As String = .SiteDescription
                    Dim StrAfter As String = " and you meet all conditions of the offer. For example, you have achieved the grades required on your offer letter. "

                    campus.InnerText = Strtemplate & StrSite & StrAfter


                End If


            End With

            ' WorkingData.EnrolmentRequestRow.EnrolmentUserDefined30 = tblOffering(0).OfferingDescription

            '         Collegelevelname.InnerText = tblOffering(0).CollegeLevelName

            Me.GridView1.DataSource = tblOffering
            Me.GridView1.DataBind()

            Me.griddiv.Visible = False
            Me.GridView1.Visible = False


        End If


        If WorkingData.ShoppingCart.Items.Count > 0 Then

            hascourse.Visible = True
            nocourse.Visible = False

        Else
            hascourse.Visible = False
            nocourse.Visible = True


        End If

    End Sub

    ''Databind the Grid
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then


            Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))
            '   Dim CourseOfferingFees As New CourseOfferingFees(OfferingID)

        End If
    End Sub

    '  Public Overrides Sub ValidateControl()
    '
    '       If Not confirm.Checked Then
    '
    '           Dim v As New CustomValidator
    '          v.IsValid = False
    '         v.ErrorMessage = "Please confirm you have met all the conditions above"
    '        Me.Page.Validators.Add(v)
    '   End If

    '  End Sub

    Private Sub SaveData()

        If WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
            If Len(RefNo) > 0 Then

                Session("RefNo") = RefNo.ToString()
                WorkingData.EnrolmentRequestRow.RefNo = RefNo

            End If

            If Len("Age") > 0 Then

                Session("Age") = Age.ToString()

            End If
        ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Application") Then

            If Len(RefNo) > 0 Then

                Session("RefNo") = RefNo.ToString()
                WorkingData.ApplicationRequestRow.RefNo = RefNo

            End If

            If Len("Age") > 0 Then

                Session("Age") = Age.ToString()

            End If

        End If


    End Sub


    Protected Sub btnGetStarted_click(ByVal sender As Object, ByVal e As EventArgs) Handles getstarted.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then

            SaveData()

            If WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then

                If Session("HE") Is "HE" Then
                    Response.Redirect(GetResourceValue("checkout_directenrol_test_aspx"))

                Else

                    Response.Redirect(GetResourceValue("checkout_directenrol_test_aspx"))

                End If

            ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Application") Then


                If Session("HE") Is "HE" Then
                    Response.Redirect(GetResourceValue("checkout_directapplyHE_aspx"))

                Else

                    Response.Redirect(GetResourceValue("checkout_directapply_aspx"))

                End If

            Else

                Response.Redirect(GetResourceValue("checkout_directenrol_test_aspx"))



            End If






        End If




    End Sub





End Class
