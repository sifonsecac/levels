<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "AcademicNetwork.*" %> 
<%@ page import= "java.util.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Academy | Perfil</title>
<link href="favicon.ico" type="image/x-icon" rel="shortcut icon" />
<link href="styles2.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script>
        function cargar(){
            $("#cssmenu").load("BarraAdmin.jsp");
                        
        }

        </script>
</head>

<body onload="cargar()">
<%
        HttpSession sesion= request.getSession();
        if(sesion.getAttribute("Usuario")!=null){
        String valid=(String) (sesion.getAttribute("Usuario"));
        int id= Integer.parseInt(valid);
        int id2=Integer.parseInt(request.getParameter("id"));
        Conexion BD = new Conexion();
        Profesor obj= new Profesor();
        obj=BD.obtenerDatos(id2);
        String nombre =obj.getNombre();
        String apellido =obj.getApellido();
        String genero =obj.getGenero();
        String fecha =obj.getFecha();
        String correo =obj.getCorreo();
        ArrayList<String> lista= new ArrayList<String>();
        lista=obj.getAcademias();
    %>
      
<div id='cssmenu'>

</div>



<div id="cuerpo3">
  <div >
    <div id="info">


  <fieldset>
      <legend><font size="4px">Informacion</font></legend>
  <table width="540" border="0" align="center" cellpadding="5" id="tablalta">
    <tr>
      <td><div align="left">Nombre:
        <p> <%=nombre %> </p></div></td>
      
      <td><div align="left">Apellidos:
	  <p> <%=apellido %> </p></div></td>
    
	</tr>
    
	<tr> 
      <td><div align="left">E-mail:
	  <p> <%=correo %> </p></div></td>
      
      <td><div align="left">G&eacute;nero:
	      <p> <%=genero %> </p></div></td>
    
	</tr> 
    
	<tr>
      <td><div align="left">Fecha de nacimiento:
	  <p> <%=fecha %> </p></div> </td>
      <td><div align="left">Personal tipo:
	  <p> <%=BD.obtenerTipo(id2) %> </p></div> </td>
            </tr>
  </table>
  
  </fieldset>
</div>
</div>
  </div>
</div>
<% 
               }
               else{
            response.sendRedirect("index.jsp");
        }
                             %>
</body>
</html>
