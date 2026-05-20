<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<%
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    String indexStr = request.getParameter("index");

    if(cart != null && indexStr != null){
        try{
            int index = Integer.parseInt(indexStr);

            if(index >= 0 && index < cart.size()){
                cart.remove(index);
            }

            session.setAttribute("cart", cart);

        } catch(Exception e){
            e.printStackTrace();
        }
    }

    response.sendRedirect("giohang.jsp");
%>