Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class account_ccc_Logout
    Inherits webenrolmentcontrolvalidate



    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        WorkingData.WebUser.Clear()
		''CCCPS-80182: Clear all the request data when user logs out so new requests gets generated when user tries to continue with login.
        WorkingData.ClearRequestData()
        WorkingData.ClearCart()
        ''Resetting below properties to default so code runs normally like before.
        WorkingData.TriggerSaveForLaterOnNextLoad = False
        WorkingData.SaveForLaterInObject = WorkingData.SaveForLaterObjects.All

        Response.Redirect(GetResourceValue("search_aspx"))
    End Sub
End Class
