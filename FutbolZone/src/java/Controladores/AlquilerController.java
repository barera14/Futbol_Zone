/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.*;
import Modelos.Cliente;
import Modelos.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Alejandro Bernal
 */
public class AlquilerController extends HttpServlet {

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
//            case "create":
//                registrar(request, response);
//                break;
            case "admin":
                Admin(request, response);
                break;
           
            case "Reservar":
                reservar(request, response);
                break;
            case "cancelar":
                cancelar(request, response);
                break;
            case "cancelarC":
                cancelarC(request, response);
                break;
           

        }
    }

 
//    private void registrar(HttpServletRequest request, HttpServletResponse response) {
//        try {
//
//            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd HH:MM");
//            String fecha = request.getParameter("fecha");
//
//            String hini = request.getParameter("horainicio");
//            String hfin = request.getParameter("horafin");
//            String fechaIn = fecha + " " + hini;
//            String fechaFn = fecha + " " + hfin;
//            Date Fechain = formatter.parse(fechaIn);
//            System.out.println("zd "+fechaIn+" dzdzzx "+fechaFn );
//            Date fechaFinn = formatter.parse(fechaFn);
//            String valor = "2000";
//            String estado = "Reservar";
//            Session sesion = HibernateUtil.getSessionFactory().openSession();
//
//            Cancha canchas = (Cancha) sesion.get(Cancha.class, 1);
//            Cliente clientes = (Cliente) sesion.get(Cliente.class, 1);
//            Alquiler salones = new Alquiler(canchas, clientes, fecha, fechaFn, valor, estado);
//
//            sesion.beginTransaction();
//            sesion.save(salones);
//            sesion.getTransaction().commit();
//            sesion.close();
//
//            try {
//                JOptionPane.showMessageDialog(null, "algo");
//                response.sendRedirect("AlquilerC?action=admin");
//            } catch (IOException ex) {
//                Logger.getLogger(AlquilerController.class.getName()).log(Level.SEVERE, null, ex);
//            }
//
//        } catch (ParseException ex) {
//            Logger.getLogger(AlquilerController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//
//    }

private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
         HttpSession session = request.getSession();
           response.setContentType("text/html;charset=UTF-8");
        String perfil = session.getAttribute("perfil").toString();
        Establecimiento user = (Establecimiento) session.getAttribute("setUsuario");
        int id = user.getIdEstablecimiento();
        Query qs = sesion.createQuery("FROM Alquiler where cancha.establecimiento='"+id+"' ");
        
        ArrayList listaObjetos = (ArrayList) qs.list();
     
        ArrayList<Alquiler> cli = new ArrayList<Alquiler>();
        for (Object client : listaObjetos) {
            Alquiler cliente = (Alquiler) client;
            cli.add(cliente);
        }
        request.setAttribute("ArrayAlq", cli);
    
        try {
            request.getRequestDispatcher("AlquileresEstablecimiento.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
   sesion.close();

    }
 private void reservar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Alquiler cliente = (Alquiler) sesion.get(Alquiler.class, Integer.parseInt(request.getParameter("id")));

        response.setContentType("text/html;charset=UTF-8");
        cliente.setEstado("Confirmar");

        sesion.beginTransaction();
        sesion.saveOrUpdate(cliente);
        sesion.getTransaction().commit();

        try {
            response.sendRedirect("AlquilerC?action=admin&rta=esty");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
 private void cancelar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Alquiler cliente = (Alquiler) sesion.get(Alquiler.class, Integer.parseInt(request.getParameter("id")));

        response.setContentType("text/html;charset=UTF-8");
        cliente.setEstado("Cancelar");

        sesion.beginTransaction();
        sesion.saveOrUpdate(cliente);
        sesion.getTransaction().commit();

        try {
            response.sendRedirect("AlquilerC?action=admin&rta=esty");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
 private void cancelarC(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Alquiler cliente = (Alquiler) sesion.get(Alquiler.class, Integer.parseInt(request.getParameter("id")));

        response.setContentType("text/html;charset=UTF-8");
        cliente.setEstado("Cancelar");

        sesion.beginTransaction();
        sesion.saveOrUpdate(cliente);
        sesion.getTransaction().commit();

        try {
            response.sendRedirect("ListarCanchas?action=mis&rta=esty");
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

}
