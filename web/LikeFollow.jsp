<%@page import="event.eventDAO"%>
<%
    String userID=(String)request.getParameter("param1");
    String eventID=(String)request.getParameter("param2");
    eventDAO edao = new eventDAO();
    edao.AddLike(userID, eventID);
%>