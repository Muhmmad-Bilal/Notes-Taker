<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_js.jsp" %>
</head>
<body>
<div class="container">
    <%@include file="nav_bar.jsp" %>
    <h1>Edit your note</h1>
    <%
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
    Session s=FactoryProvider.getFactory().openSession();
    Note note=(Note)s.get(Note.class, noteId);
    
    
    
    %>
    <form action="UpdateNoteServlet" method="post">
  <input type="hidden" value="<%= note.getId() %>" name="noteId" />
  <div class="form-group">
  
    <label for="title">Note Title</label>
    <input type="text" name="title" required class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter here" value="<%=note.getTitle() %>>"/>
    
  </div>
  <div class="form-group">
    <label for="content">Note Content</label>
   <textarea id="content" name="content" required class="form-control" style="height: 250px" placeholder="Enter your content" ><%=note.getContent() %></textarea>
  </div>
 <div class="container text-center">
  <button type="submit" class="btn btn-success">Save Note</button>
 </div>
</form>
    </div>
    

</body>
</html>