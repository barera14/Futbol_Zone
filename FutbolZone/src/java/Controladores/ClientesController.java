/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Cancha;
import Modelos.Cliente;
import Modelos.Establecimiento;
import Modelos.HibernateUtil;
import Modelos.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Alejandro Bernal
 */
public class ClientesController extends HttpServlet {

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
            case "create":
                registrar(request, response);
                break;
            case "admin":
                Admin(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
                
             case "inactivar":
                inactivar(request, response);
                break;
            case "activar":
                activar(request, response);
                break;

        }
    }
     private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        String correo = request.getParameter("email");
        String passSIn = request.getParameter("password");
        String encriptMD5 = DigestUtils.md5Hex(passSIn);
        Usuarios data = new Usuarios(correo, encriptMD5, "Cliente");
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(data);
        session.getTransaction().commit();
       
       

        String nombre = request.getParameter("nombre");
        String apelldio = request.getParameter("apellidos");
        String nit = request.getParameter("nit");
        String telefono = request.getParameter("telefono");
        long celular = Long.parseLong(telefono);
        String Estado = "Activo";
     
        
        Cliente salon = new Cliente(data, nombre, apelldio, nit, celular, Estado);
        //guardamos objeto en BD
        session.beginTransaction();
        session.save(salon);
        session.getTransaction().commit();
        session.close();

        try {
            response.sendRedirect("loginUser?action=inio");
        } catch (IOException ex) {
            Logger.getLogger(EstablecimientoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Query q = sesion.createQuery("FROM Cliente");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) q.list();
     
        ArrayList<Cliente> cli = new ArrayList<Cliente>();
        for (Object client : listaObjetos) {

            Cliente cliente = (Cliente) client;
            cli.add(cliente);

        }

        request.setAttribute("ArrayCliente", cli);
        
        
        try {
            request.getRequestDispatcher("AdministrarClientes.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
   sesion.close();

    }
private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Cliente clientes = (Cliente) sesion.get(Cliente.class, Integer.parseInt(request.getParameter("id")));

        sesion.beginTransaction();
        sesion.delete(clientes);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("ClientesC?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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

    private void inactivar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Cliente cliente = (Cliente) sesion.get(Cliente.class, Integer.parseInt(request.getParameter("id")));

       
             response.setContentType("text/html;charset=UTF-8");
            cliente.setEstado("Inactivo");
       
            sesion.beginTransaction();
            sesion.saveOrUpdate(cliente);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("ClientesC?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
            }

    }

    private void activar(HttpServletRequest request, HttpServletResponse response) {
           Session sesion = HibernateUtil.getSessionFactory().openSession();
        Cliente cliente = (Cliente) sesion.get(Cliente.class, Integer.parseInt(request.getParameter("id")));

       
             response.setContentType("text/html;charset=UTF-8");
            cliente.setEstado("Activo");
       
            sesion.beginTransaction();
            sesion.saveOrUpdate(cliente);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("ClientesC?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
            }
    }

}
