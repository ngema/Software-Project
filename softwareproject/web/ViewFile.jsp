

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <center>
        <h1>Download File</h1>
        <p>Enter the value id of file u want to download below.</p>
    </center>
        <br/>
    <center>
        <form action="downloadFileServlet" method="get" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td> Enter ID: </td>
                    <td><input type="text" name="id" size="100"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                            <input type="submit" value="Download">
                            <br/>
                            <br/>
                            <a href="Upload.jsp">Return to Upload File...</a>
                    </td>
                </tr>
            </table>
            
        </form>
    </center>
</html>
