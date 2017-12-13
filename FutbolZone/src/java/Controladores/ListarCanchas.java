/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Alquiler;
import Modelos.Cancha;
import Modelos.Cliente;
import Modelos.Establecimiento;
import Modelos.HibernateUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
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
 * @author Adsi-2k17
 */
public class ListarCanchas extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("ver")) {
            administrar(request, response);
        } else if (action.equalsIgnoreCase("ver2")) {
            administrar2(request, response);
        } else if (action.equalsIgnoreCase("InfoEsta")) {
            administrar2(request, response);
        } else if (action.equalsIgnoreCase("RCacha")) {
            registrar(request, response);
        } else if (action.equalsIgnoreCase("ver3")) {
            administrar3(request, response);
        } else if (action.equalsIgnoreCase("mis")) {
            administrar4(request, response);
        } else if (action.equalsIgnoreCase("estados")) {
            administrar5(request, response);
        }
    }

    private void administrar(HttpServletRequest request, HttpServletResponse response) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from Cancha where estado = 'Activo'");
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarreras", salones);
        try {

            request.getRequestDispatcher("Vista/Canchas.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void administrar2(HttpServletRequest request, HttpServletResponse response) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Query q = session.createQuery("from Establecimiento where id=" + request.getParameter("id"));
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarrerass", salones);
        try {

            request.getRequestDispatcher("Vista/InfoEstablecimiento.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void administrar3(HttpServletRequest request, HttpServletResponse response) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Query q = session.createQuery("from Cancha where id=" + request.getParameter("id"));
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarrerass", salones);

        Query qq = session.createQuery("from Alquiler where  cancha=" + request.getParameter("id"));
        ArrayList sal = (ArrayList) qq.list();

        request.setAttribute("li", sal);
        try {

            request.getRequestDispatcher("Vista/InfoCanchas.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int x = Integer.parseInt(request.getParameter("horafin"));
        String valor = request.getParameter("val");
        int valorr = Integer.parseInt(valor);
        int valorrr = valorr * x;
        String v = String.valueOf(valorrr);
        HttpSession sesions = request.getSession();
        String perfil = sesions.getAttribute("perfil").toString();
        Cliente user = (Cliente) sesions.getAttribute("setUsuario");
        int cliente = user.getIdCliente();

        int cancha = Integer.parseInt(request.getParameter("cancha"));
        // int cliente = Integer.parseInt(request.getParameter("fechainicio")); 
        PrintWriter out = response.getWriter();
        SimpleDateFormat formatter = new SimpleDateFormat("DD/MM/yyyy HH:mm");
        String fecha = request.getParameter("horainicio");
        Date Fechain;
        Date fechaFinn;
        Date FechaFinal = new Date();
        try {
            Fechain = formatter.parse(fecha);

        } catch (Exception e) {
            out.print(e);
            Fechain = null;
        }

        String fechaFin = request.getParameter("horainicio");

        try {

            fechaFinn = formatter.parse(fechaFin);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(fechaFinn);

            calendar.add(Calendar.HOUR, x);
            String s = formatter.format(calendar.getTime());
            FechaFinal = formatter.parse(s);

        } catch (Exception e) {
            out.print(e);
            fechaFinn = null;
        }
        //String valor = request.getParameter("horafinal");

        String estado = "Confirmar";
        //String estado = request.getParameter("horafinal");
        Session sesion = HibernateUtil.getSessionFactory().openSession();

        Cancha canchas = (Cancha) sesion.get(Cancha.class, cancha);
        Cliente clientes = (Cliente) sesion.get(Cliente.class, cliente);
        Alquiler salones = new Alquiler(canchas, clientes, Fechain, FechaFinal, v, estado);
        sesion.beginTransaction();
        sesion.save(salones);
        sesion.getTransaction().commit();
        sesion.close();
        try {
            JOptionPane.showMessageDialog(null, "Alquiler registrado con exito!");
            response.sendRedirect("ListarCanchas?action=ver");
        } catch (IOException ex) {
            JOptionPane.showMessageDialog(null, "Error");

            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void administrar4(HttpServletRequest request, HttpServletResponse response) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        HttpSession sesions = request.getSession();
        String perfil = sesions.getAttribute("perfil").toString();
        Cliente user = (Cliente) sesions.getAttribute("setUsuario");
        int cliente = user.getIdCliente();
        Query q = session.createQuery("from Cancha where id=" + cliente + "");
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarrerass", salones);

//         Query qq = session.createQuery("from Alquiler where  cliente=" + request.getParameter("id"));
        Query qq = session.createQuery("from Alquiler where  cliente=" + cliente + "");
        ArrayList sal = (ArrayList) qq.list();

        request.setAttribute("li", sal);
        try {

            request.getRequestDispatcher("Vista/MisCampeonatos.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void administrar5(HttpServletRequest request, HttpServletResponse response) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        HttpSession sesions = request.getSession();
        String perfil = sesions.getAttribute("perfil").toString();
        Cliente user = (Cliente) sesions.getAttribute("setUsuario");
        int cliente = user.getIdCliente();
        Query q = session.createQuery("from Cancha where id=" + request.getParameter("id"));
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarrerass", salones);

//         Query qq = session.createQuery("from Alquiler where  cliente=" + request.getParameter("id"));
        Query qq = session.createQuery("from Alquiler where  cliente='" + cliente + "'");
        ArrayList sal = (ArrayList) qq.list();

        request.setAttribute("li", sal);
        try {

            request.getRequestDispatcher("Vista/MisCampeonatos.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
      private void buscar(HttpServletRequest request, HttpServletResponse response) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Query q = session.createQuery("from Cancha where establecimiento.nombre='" + request.getParameter("esta")+"'");
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarrerass", salones);
        int a = salones.size();
   

//        Query qq = session.createQuery("from Alquiler where  cancha=" + request.getParameter("id"));
//        ArrayList sal = (ArrayList) qq.list();
//
//        request.setAttribute("li", sal);
        try {

            request.getRequestDispatcher("Vista/BuscarCanchas.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
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
