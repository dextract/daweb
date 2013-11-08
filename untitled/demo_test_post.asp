<%
     response.write("Dear " & Request.Form("name") & ". ")
     response.write("Hope you live well in " & Request.Form("city") & ".")
%>