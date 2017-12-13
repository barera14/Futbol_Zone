/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Campeonatos;
import Modelos.Equipo;
import Modelos.HibernateUtil;
import Modelos.Partido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Alejandro Bernal
 */
public class EquiposController extends HttpServlet {

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
            case "admin":
                Admin(request, response);
                break;
            

        }
    }
     private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Campeonatos cliente = (Campeonatos) sesion.get(Campeonatos.class, Integer.parseInt(request.getParameter("id")));
        int id = cliente.getIdCampeonatos();
        Query q = sesion.createQuery("FROM Equipo WHERE campeonatos='"+id+"' ORDER BY puntos DESC  ");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) q.list();

        ArrayList<Equipo> par = new ArrayList<Equipo>();
        for (Object part : listaObjetos) {
            Equipo partid = (Equipo) part;
            par.add(partid);
        }

        request.setAttribute("ArrayEquipo", par);

        try {
            request.getRequestDispatcher("TablaPosiciones.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();

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
