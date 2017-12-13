/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Cliente;
import Modelos.Establecimiento;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import Modelos.HibernateUtil;
import Modelos.SAdministrador;
import Modelos.Usuarios;

/**
 *
 * @author Alejandro Bernal
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        switch (action) {
            case "inicio":
                logout(request, response);
                break;
            case "error404":
                error(request, response);
                break;
            case "error403":
                error3(request, response);
                break;
            case "inio":
                regis(request, response);
                break;
            case "errorS":
                errorU(request, response);
                break;

        }
    }
  private void errorU(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
            response.sendRedirect("Login.jsp?rta=errorS");
    }
  private void error(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
            response.sendRedirect("404.html");
    }
  private void regis(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
            response.sendRedirect("Login.jsp?rta=inio");
    }
  private void error3(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
            response.sendRedirect("403.html");
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        if (session != null) {
            HttpSession httpSesion = request.getSession();
            httpSesion.setAttribute("setUsuario", null);
            httpSesion.setAttribute("perfil", null);
            session.invalidate();
            response.sendRedirect("Login.html");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        String usua = request.getParameter("user");
        String constrae = request.getParameter("pass");
        String encriptMD5 = DigestUtils.md5Hex(constrae);
        ArrayList usuario = new ArrayList();
        ArrayList cliente = new ArrayList();
        ArrayList establecimiento = new ArrayList();
        ArrayList sadministrador = new ArrayList();
        Query q = sesion.createQuery("fROM Usuarios WHERE correo = '" + usua + "' AND contrasena = '" + encriptMD5 + "' ");
        usuario = (ArrayList) q.list();

       
        Establecimiento es = new Establecimiento();
        Cliente cl = new Cliente();
        SAdministrador sA = new SAdministrador();
        HttpSession httpSesion = request.getSession();
        if (usuario.size() == 1) {

            for (Object usuario1 : usuario) {
                Usuarios uss = (Usuarios) usuario1;
                int id = uss.getIdUsuarios();
                System.out.println("asdas id es" + id);
                Query estables = sesion.createQuery("fROM Establecimiento WHERE usuarios =  " + id + "");
                establecimiento = (ArrayList) estables.list();
                Query clie = sesion.createQuery("fROM Cliente WHERE usuarios = '" + id + "'");
                cliente = (ArrayList) clie.list();
                Query sadmin = sesion.createQuery("fROM SAdministrador WHERE usuarios = '" + id + "'");
                sadministrador = (ArrayList) sadmin.list();
                 sesion.close();

            }
            if (establecimiento.size() == 1) {

                for (Object est : establecimiento) {
                    Establecimiento esta = (Establecimiento) est;
                    httpSesion.setAttribute("setUsuario", esta);
                    httpSesion.setAttribute("perfil", "Establecimiento");
                }

            } else if (cliente.size() == 1) {

                for (Object cli : cliente) {
                    Cliente clis = (Cliente) cli;
                    httpSesion.setAttribute("setUsuario", clis);
                    httpSesion.setAttribute("perfil", "Cliente");
                }

            } else if (sadministrador.size() == 1) {

                for (Object saa : sadministrador) {
                    SAdministrador sad = (SAdministrador) saa;
                    httpSesion.setAttribute("setUsuario", sad);
                    httpSesion.setAttribute("perfil", "SuperAdministrador");
                }
            }

            request.getRequestDispatcher("index2.jsp").forward(request, response);
        } else {
            try {

                httpSesion.setAttribute("validacion", "error");
                request.getRequestDispatcher("Login.jsp?rta=error").forward(request, response);
            } catch (IOException ex) {
                Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
