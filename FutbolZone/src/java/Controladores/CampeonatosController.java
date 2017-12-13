/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Campeonatos;
import Modelos.Cancha;
import Modelos.Cliente;
import Modelos.Equipo;
import Modelos.Establecimiento;
import Modelos.HibernateUtil;
import Modelos.Jugadores;
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
import javax.servlet.http.HttpSession;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Alejandro Bernal
 */
public class CampeonatosController extends HttpServlet {

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
            case "inactivar":
                inactivar(request, response);
                break;
            case "activar":
                activar(request, response);
                break;
            case "verequipos":
                verequipos(request, response);
                break;
            case "eliminar":
                eliminar(request, response);
                break;
            case "jugadores":
                jugadores(request, response);
                break;

        }
    }
    
    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        Session session = HibernateUtil.getSessionFactory().openSession();
        HttpSession sesion = request.getSession();
        String perfil = sesion.getAttribute("perfil").toString();
        Establecimiento user = (Establecimiento) sesion.getAttribute("setUsuario");
        int id = user.getIdEstablecimiento();
        String nombre = request.getParameter("nombre");
        String cupos = request.getParameter("cupos");
        String premiacion = request.getParameter("premiacion");
        String campeonato = request.getParameter("Campeonato");
        String estado = "Confirmado";
       
        Establecimiento clientes = (Establecimiento) session.get(Establecimiento.class, id);
        
        Campeonatos salon = new Campeonatos(clientes, nombre, cupos, premiacion, campeonato, estado);
        //guardamos objeto en BD
        session.beginTransaction();
        session.save(salon);
        session.getTransaction().commit();
        session.close();

        try {
            response.sendRedirect("CampeonatosC?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(EstablecimientoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
         HttpSession sesions = request.getSession();
        String perfil = sesions.getAttribute("perfil").toString();
        Establecimiento user = (Establecimiento) sesions.getAttribute("setUsuario");
        int id = user.getIdEstablecimiento();
        Query q = sesion.createQuery("FROM Campeonatos WHERE establecimiento='"+id+"'");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) q.list();
     
        ArrayList<Campeonatos> cli = new ArrayList<Campeonatos>();
        for (Object client : listaObjetos) {

            Campeonatos cliente = (Campeonatos) client;
            cli.add(cliente);

        }

        request.setAttribute("ArrayCliente", cli);
        
        
        try {
            request.getRequestDispatcher("AdministrarCampeonatos.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
   sesion.close();

    }
private void verequipos(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
         Campeonatos cliente = (Campeonatos) sesion.get(Campeonatos.class, Integer.parseInt(request.getParameter("id")));
         int id=cliente.getIdCampeonatos();
        Query q = sesion.createQuery("FROM Equipo WHERE campeonatos='"+id+"' ");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) q.list();
     
        ArrayList<Equipo> cli = new ArrayList<Equipo>();
        for (Object client : listaObjetos) {

            Equipo clientes = (Equipo) client;
            cli.add(clientes);

        }

        request.setAttribute("ArrayCliente", cli);
        
        
        try {
            request.getRequestDispatcher("EquipoCampeonato.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
   sesion.close();

    }
private void jugadores(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
         Equipo equipo = (Equipo) sesion.get(Equipo.class, Integer.parseInt(request.getParameter("id")));
         int id=equipo.getIdEquipo();
        Query q = sesion.createQuery("FROM Jugadores WHERE equipo='"+id+"' ");
           ArrayList listaObjetos = (ArrayList) q.list();
     
        ArrayList<Jugadores> cli = new ArrayList<Jugadores>();
        for (Object client : listaObjetos) {
            Jugadores jugadores = (Jugadores) client;
            cli.add(jugadores);
        }

        request.setAttribute("ArrayJug", cli);

        try {
            request.getRequestDispatcher("VerJugadoresCampeonatos.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
   sesion.close();

    }
 private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Equipo clientes = (Equipo) sesion.get(Equipo.class, Integer.parseInt(request.getParameter("id")));

        sesion.beginTransaction();
        sesion.delete(clientes);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("CampeonatosC?action=admin");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
 private void inactivar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Cancha cliente = (Cancha) sesion.get(Cancha.class, Integer.parseInt(request.getParameter("id")));

       
             response.setContentType("text/html;charset=UTF-8");
            cliente.setEstado("Inactivo");
       
            sesion.beginTransaction();
            sesion.saveOrUpdate(cliente);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("CanchasC?action=admin");
            } catch (IOException ex) {
                Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
            }

    }
 private void activar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Cancha cliente = (Cancha) sesion.get(Cancha.class, Integer.parseInt(request.getParameter("id")));

       
             response.setContentType("text/html;charset=UTF-8");
            cliente.setEstado("Activo");
       
            sesion.beginTransaction();
            sesion.saveOrUpdate(cliente);
            sesion.getTransaction().commit();

            try {
                response.sendRedirect("CanchasC?action=admin");
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
