/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Campeonatos;
import Modelos.Cancha;
import Modelos.Equipo;
import Modelos.HibernateUtil;
import Modelos.Partido;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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
public class PartidoController extends HttpServlet {

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
            case "ver":
                verpartido(request, response);
                break;
            case "registrar":
                registrar(request, response);
                break;
            case "registrar2":
                registrar2(request, response);
                break;
            case "select":
                Select(request, response);
                break;
            case "Ejecutar":
                ejecutar(request, response);
                break;

        }
    }
 private void ejecutar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        int ids=Integer.parseInt(request.getParameter("id"));
//       Partido cliente = (Partido) sesion.get(Partido.class, ids);
//        int id=cliente.getCampeonatos().getIdCampeonatos();
//        
         Campeonatos camp = (Campeonatos) sesion.get(Campeonatos.class, ids) ;

        response.setContentType("text/html;charset=UTF-8");
        camp.setEstado("En Ejecucion");

        sesion.beginTransaction();
        sesion.saveOrUpdate(camp);
        sesion.getTransaction().commit();

        try {
            response.sendRedirect("PartidoC?action=select&id="+ids+"&rta=yes");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
        }
 }
    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        int ids=Integer.parseInt(request.getParameter("id"));
        Partido cliente = (Partido) sesion.get(Partido.class, ids);
        int idloc = cliente.getEquipoByLocal().getIdEquipo();
        int idvi = cliente.getEquipoByVisitante().getIdEquipo();
        int id=cliente.getCampeonatos().getIdCampeonatos();

        Equipo equilo = (Equipo) sesion.get(Equipo.class, idloc);
        int dfG = equilo.getClasificacion();
        int GoA = equilo.getGolesFavor();
        int GoC = equilo.getGolesContra();
        int pun = equilo.getPuntos();
        int Pg = equilo.getPganados();
        int Pp = equilo.getPperdidos();
        Equipo equivi = (Equipo) sesion.get(Equipo.class, idvi);
        int VdfG = equivi.getClasificacion();
        int VGoA = equivi.getGolesFavor();
        int VGoC = equivi.getGolesContra();
        int Vpun = equivi.getPuntos();
        int VPg = equivi.getPganados();
        int VPp = equivi.getPperdidos();

        int gollo = Integer.parseInt(request.getParameter("MarLocal"));

        int golvi = Integer.parseInt(request.getParameter("MarVis"));
        int diFGolV = 0;
        int diFGolL=0;
        if (gollo > golvi) {
            diFGolL = gollo - golvi;
             diFGolV = golvi - gollo;
        } else if(golvi>gollo) {
            diFGolV = golvi - gollo;
              diFGolL = gollo - golvi;
        } 

        cliente.setGolLoC(gollo);
        cliente.setEstado("Inactivo");
        cliente.setGolvis(golvi);

        if (gollo > golvi) {
            equilo.setGolesFavor(GoA + gollo);
            equilo.setGolesContra(GoC + golvi);
            equilo.setClasificacion(dfG +diFGolL);
            equilo.setPuntos(pun+3);
            equilo.setPganados(Pg+1);
             equivi.setGolesFavor(VGoA + golvi);
            equivi.setGolesContra(VGoC + gollo);
            equivi.setClasificacion(VdfG +diFGolV);
            equivi.setPperdidos(VPp+1);
            sesion.beginTransaction();
        sesion.saveOrUpdate(equilo);
        sesion.getTransaction().commit();
         sesion.beginTransaction();
        sesion.saveOrUpdate(equivi);
        sesion.getTransaction().commit();

        }else if(golvi>gollo){
         equivi.setGolesFavor(VGoA + golvi);
            equivi.setGolesContra(VGoC + gollo);
            equivi.setClasificacion(VdfG +diFGolV);
            equivi.setPuntos(Vpun+3);
            equivi.setPganados(VPg+1);
             equilo.setGolesFavor(GoA + gollo);
            equilo.setGolesContra(GoC + golvi);
            equilo.setClasificacion(dfG +diFGolL);
            equilo.setPperdidos(Pp+1);
             sesion.beginTransaction();
        sesion.saveOrUpdate(equivi);
        sesion.getTransaction().commit();
           sesion.beginTransaction();
        sesion.saveOrUpdate(equilo);
        sesion.getTransaction().commit();
      
        }else if(golvi==gollo){
         equivi.setGolesFavor(VGoA + golvi);
            equivi.setGolesContra(VGoC + gollo);
            equivi.setClasificacion(VdfG +diFGolV);
            equivi.setPuntos(Vpun+1);
             equilo.setGolesFavor(GoA + gollo);
            equilo.setGolesContra(GoC + golvi);
            equilo.setClasificacion(dfG +diFGolL);
            equilo.setPuntos(pun+1);
             sesion.beginTransaction();
        sesion.saveOrUpdate(equivi);
        sesion.getTransaction().commit();
           sesion.beginTransaction();
        sesion.saveOrUpdate(equilo);
        sesion.getTransaction().commit();
        }
        
         
        
        sesion.beginTransaction();
        sesion.saveOrUpdate(cliente);
        sesion.getTransaction().commit();

        try {
            response.sendRedirect("EquiposC?action=admin&id="+id+"");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();
    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Campeonatos cliente = (Campeonatos) sesion.get(Campeonatos.class, Integer.parseInt(request.getParameter("id")));
        int id = cliente.getIdCampeonatos();
        Query q = sesion.createQuery("FROM Partido WHERE campeonatos='" + id + "'");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) q.list();

        ArrayList<Partido> par = new ArrayList<Partido>();
        for (Object part : listaObjetos) {
            Partido partid = (Partido) part;
            par.add(partid);
        }

        request.setAttribute("ArrayPartido", par);

        try {
            request.getRequestDispatcher("Partidos.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();

    }

    private void verpartido(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Partido equipo = (Partido) sesion.get(Partido.class, Integer.parseInt(request.getParameter("id")));
        int id = equipo.getIdPartido();
        int idc= equipo.getCampeonatos().getIdCampeonatos();
        Query q = sesion.createQuery("FROM Partido WHERE campeonatos='" + idc + "' and idPartido='"+id+"'");
        ArrayList listaObjetos = (ArrayList) q.list();

        ArrayList<Partido> par = new ArrayList<Partido>();
        for (Object part : listaObjetos) {
            Partido partido = (Partido) part;
            par.add(partido);
        }

       request.setAttribute("ArrayPartido", par);

        try {
            request.getRequestDispatcher("VerPartido.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(PartidoController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(PartidoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 private void registrar2(HttpServletRequest request, HttpServletResponse response){
             response.setContentType("text/html;charset=UTF-8");
             
             int coti=Integer.parseInt(request.getParameter("id"));
          int equiV=Integer.parseInt(request.getParameter("IdEquipoV")); 
         int equiL=Integer.parseInt(request.getParameter("IdEquipoL"));
          
       
             
              Session sesion = HibernateUtil.getSessionFactory().openSession();
             Equipo loc=(Equipo) sesion.get(Equipo.class, equiL);
             Campeonatos emps=(Campeonatos) sesion.get(Campeonatos.class, coti);
            Equipo vis=(Equipo) sesion.get(Equipo.class, equiV);
          String estado="Activo";
          Date fecha = new Date();
            //Creamos objeto con datos de formulario
            Partido ida= new Partido(emps,loc,vis,estado, fecha);
            Partido vuel= new Partido(emps,vis,loc,estado, fecha);
            //guardamos objeto en BD
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(ida);
            session.getTransaction().commit();
            session.beginTransaction();
            session.save(vuel);
            session.getTransaction().commit();
            
        try {
            response.sendRedirect("PartidoC?action=select&id="+coti+"");
        } catch (IOException ex) {
            Logger.getLogger(PartidoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        session.close();
      
 }
 private void Select(HttpServletRequest request, HttpServletResponse response){
        
          
              Session sesion = HibernateUtil.getSessionFactory().openSession();
                 
              Campeonatos empleado = (Campeonatos) sesion.get(Campeonatos.class, Integer.parseInt(request.getParameter("id")));
            int id=empleado.getIdCampeonatos();
            
             Query q = sesion.createQuery("FROM Equipo WHERE campeonatos='"+id+"' ");
             Query qs = sesion.createQuery("FROM Partido WHERE campeonatos='"+id+"' ");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) q.list();
     
        ArrayList<Equipo> cli = new ArrayList<Equipo>();
        for (Object client : listaObjetos) {

            Equipo clientes = (Equipo) client;
            cli.add(clientes);

        }
        ArrayList listaObjetoss = (ArrayList) qs.list();
     
        ArrayList<Partido> ss = new ArrayList<Partido>();
        for (Object client : listaObjetoss) {

            Partido clientes = (Partido) client;
            ss.add(clientes);

        }
        request.setAttribute("ArrayCliente", cli);
        request.setAttribute("ArrayPa", ss);
        
        try {
            request.getRequestDispatcher("RegistrarPartido.jsp").forward(request, response);//Redirecionar
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
