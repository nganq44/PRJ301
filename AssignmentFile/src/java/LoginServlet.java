/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

/**
 *
 * @author AD
 */
public class LoginServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get form data	
  	  String u =req.getParameter("user");
  	  String p=req.getParameter("pass");
          int input;
          int i;
          for(i = 0; i < 10; i++) {
              input = getUserInput();
              System.out.println("User value: " + input);
          }
	  resp.setContentType("text/html");
     	  PrintWriter out = resp.getWriter();
//          resp.sendRedirect("index.html");
      	  out.println("<html><body>");
      	  out.println("<h1>You sent me:</h1>");
  	  out.println(u+"<br>"+p);
  	  out.println("</body></html>");
    }
    public static int getUserInput() {
        int value;
        Scanner sc = new Scanner(System.in);
        System.out.println("\n Enter your value: ");
        value = sc.nextInt();
        return value;
    }
}
