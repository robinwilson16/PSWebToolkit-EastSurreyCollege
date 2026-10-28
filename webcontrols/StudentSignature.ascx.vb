Imports jSignature.Tools
Imports Svg
Imports System.Drawing.Imaging
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon

Partial Class webcontrols_StudentSignature
    Inherits System.Web.UI.UserControl

    Public ReadOnly Property HasSignature As Boolean
        Get
            Return hidSignature.Value.Trim().Length > 0
        End Get
    End Property

    Public ReadOnly Property Signature As Byte()
        Get
            If Not HasSignature Then
                Return Nothing
            End If

            Try
                Dim output As String = Replace(hidSignature.Value, "image/jsignature;base30,", "")
                Dim base30Converter As New Base30Converter()
                Dim arrBase30Data As Integer()()() = base30Converter.GetData(output)
                Dim strSVG As String = SVGConverter.ToSVG(arrBase30Data)

                Using newStream As New MemoryStream(ASCIIEncoding.[Default].GetBytes(strSVG))
                    Dim mySVG As SvgDocument = SvgDocument.Open(Of SvgDocument)(newStream, Nothing)

                    Using tempStream As New MemoryStream()
                        mySVG.Draw().Save(tempStream, ImageFormat.Png)
                        Return tempStream.ToArray()
                    End Using
                End Using
            Catch
                Return Nothing
            End Try
        End Get
    End Property

End Class