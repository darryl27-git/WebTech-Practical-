import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CalcServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Corrected parameter names (assuming form field names are t1 and c2)
            int a = Integer.parseInt(request.getParameter("t1"));
            int b = Integer.parseInt(request.getParameter("t2"));

            int c = 0;
            String op = request.getParameter("btn");

            if (op.equals("+")) {
                c = a + b;
            } else if (op.equals("-")) {
                c = a - b;
            } else if (op.equals("*")) { // Corrected multiplication operator
                c = a * b;
            } else if (op.equals("/")) {
                if (b == 0) { // Handle division by zero
                    out.println("<b>Error: Division by zero!</b>");
                } else {
                    c = a / b;
                }
            } else {
                out.println("<b>Invalid operator!</b>");
            }

            out.println("<b>" + a + op + b + " = " + c + "</b>");
        } catch (NumberFormatException e) { // Handle invalid input
            out.println("<b>Please enter valid numbers!</b>");
        }
    }
}
