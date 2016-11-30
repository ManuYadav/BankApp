package bankapp.listeners;

import javax.servlet.*;

import bankapp.database.EmployeeDB;

/**
 * 
 * Banking Application
 * 
 * Responsible database connection object from the servlet context
 *
 * @file ContextListener.java
 * @package bankapp.listeners
 * @author Manu Yadav
 * @date 30-Nov-2016
 *
 */
public final class ContextListener
    implements ServletContextListener {
    private ServletContext context = null;

    public void contextInitialized(ServletContextEvent event) {
         context = event.getServletContext();
         
         try {
        	EmployeeDB bankDB = new EmployeeDB();
            context.setAttribute("bankDB", bankDB);
         } catch (Exception ex) {
            context.log("Couldn't create bankapp database bean: " + ex.getMessage());
         }
    }
      
    public void contextDestroyed(ServletContextEvent event) {
         context = event.getServletContext();
         EmployeeDB bankDB = (EmployeeDB)context.getAttribute("bankDB");
         if (bankDB != null) {
        	 bankDB.remove();
         }
         if (context != null) {
           context.removeAttribute("bankDB");
         }
    }
}
