/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Campeonatos;
import Modelos.Cliente;
import Modelos.Equipo;
import Modelos.Establecimiento;
import Modelos.Jugadores;
import Modelos.HibernateUtil;
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
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Adsi-2k17
 */
public class ListarCampeonatos extends HttpServlet {

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
    if(action.equalsIgnoreCase("ver")){    
     administrar(request, response);
     }else if(action.equalsIgnoreCase("inscribir")){
        administrar2(request, response);
     }else if(action.equalsIgnoreCase("siguiente")){
        administrar3(request, response);
     }else if(action.equalsIgnoreCase("registrar")){
        registrar(request, response);
    }else if(action.equalsIgnoreCase("eliminar")){
        eliminar(request, response);
     }else if(action.equalsIgnoreCase("campeonatos")){
        MisCampeonatos(request, response);     
     }else if(action.equalsIgnoreCase("edit")){
        MisCampeonatosEditar(request, response);
     }else if(action.equalsIgnoreCase("tabla")){
        Admin(request, response);
     }
        
       
        
    }
         private  void administrar (HttpServletRequest request, HttpServletResponse response){
            
         Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from Campeonatos where estado='Confirmado' and cupos<=cupos");
        
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarreras", salones);
        try {
            
            request.getRequestDispatcher("Vista/Campeonatos.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);    
        }
    }
          private  void administrar2 (HttpServletRequest request, HttpServletResponse response){
            
         Session session = HibernateUtil.getSessionFactory().openSession();  
         HttpSession sesion = request.getSession();
        String perfil = sesion.getAttribute("perfil").toString();
        Cliente user = (Cliente) sesion.getAttribute("setUsuario");
        int id = user.getIdCliente();
        Query q = session.createQuery("from Equipo where cliente='"+id+"'");
        ArrayList sa = (ArrayList) q.list();
        

         if (sa.size()==0){

   
             
             
             
             
             
             
                      String nombre=request.getParameter("nom");

         int clasificacion=0;
         int golesFavor=0;
         int golesContra=0;
         //user
     int camp=Integer.parseInt(request.getParameter("n"));

         int puntos=0;
         int pganados=0;
         int pperdidos=0;
         
         String cam=request.getParameter("nn");
      Campeonatos ca =(Campeonatos) session .get(Campeonatos.class, camp);
 Query qq = session.createQuery("from Equipo where nombre='"+nombre+"'");
        ArrayList s = (ArrayList) qq.list();
        if(s.size()==0){
          
//         Equipo eq = new Equipo(ca,user,nombre, clasificacion, golesFavor, golesContra,puntos,pganados,pperdidos);
         Equipo eq = new Equipo(ca, user, nombre, clasificacion, golesFavor, golesContra, puntos, pganados, pperdidos);
    
             session.beginTransaction();
        session.save(eq);
        session.getTransaction().commit();
         session.close();
         
        request.setAttribute("caa", cam);
       
        
        try {
                   
           
//             try {
                 response.sendRedirect("ListarCampeonatos?action=siguiente&nombre="+nombre+"&maxEquipos="+cam);
//                 request.getRequestDispatcher("ListarCampeonatos?action=siguiente&id="+nombre).forward(request, response);
//             } catch (ServletException ex) {
//                 Logger.getLogger(ListarCampeonatos.class.getName()).log(Level.SEVERE, null, ex);
//             }
           
        } catch (IOException ex) {
            Logger.getLogger(ListarCampeonatos.class.getName()).log(Level.SEVERE, null, ex);
        }}else {
        JOptionPane.showMessageDialog(null, "El equipo ya existe!");
             try {
                 response.sendRedirect("ListarCampeonatos?action=ver");
             } catch (IOException ex) {
                 Logger.getLogger(ListarCampeonatos.class.getName()).log(Level.SEVERE, null, ex);
             }
        
        }
          }else {JOptionPane.showMessageDialog(null, "Error ya esta inscrito a un campeonato");
             try {
                 response.sendRedirect("ListarCampeonatos?action=ver");
             } catch (IOException ex) {
                 Logger.getLogger(ListarCampeonatos.class.getName()).log(Level.SEVERE, null, ex);
             }
         }
          
          }
    
    
         
     
                  private  void administrar3 (HttpServletRequest request, HttpServletResponse response){
            
         Session session = HibernateUtil.getSessionFactory().openSession();
    
         
        
//        Query q = session.createQuery("select Nombre from Equipo where Nombre="+request.getParameter("id"));
        Query q = session.createQuery("from Equipo where nombre = '"+request.getParameter("nombre")+"'");
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("lista", salones);
        
         Query qq = session.createQuery("from Jugadores where equipo.nombre = '"+request.getParameter("nombre")+"'");
        ArrayList salone = (ArrayList) qq.list();

        request.setAttribute("juga", salone);
        
        
         Query qqq = session.createQuery("from Jugadores where equipo.nombre = '"+request.getParameter("nombre")+"'");
        ArrayList salon = (ArrayList) qqq.list();
        int aa=salon.size()+1;
        request.setAttribute("a", aa);
        
        String s=request.getParameter("maxEquipos");
        if(s.equals("Futbol 5")){
        request.setAttribute("aaa", 5);  
        }else if(s.equals("Futbol 7")){
         request.setAttribute("aaa", 7);
        }else if(s.equals("Futbol 8")){
         request.setAttribute("aaa", 9);
        }else if(s.equals("Futbol 11")){
         request.setAttribute("aaa", 11);
        }
        
      
            
       try {

            request.getRequestDispatcher("Vista/RegistrarEquipo.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }}
                  
                  private void registrar (HttpServletRequest request, HttpServletResponse response){
              
                  
                 
        String nombre = request.getParameter("nombre");
        
        String documento= request.getParameter("documento");

        long doc = Long.parseLong(documento);
        String telefono = request.getParameter("telefono");
         long tel = Long.parseLong(telefono);
        int dorsal = Integer.parseInt(request.getParameter("dorsal"));
        int equipo =Integer.parseInt(request.getParameter("equipo"));
        Session session =HibernateUtil.getSessionFactory().openSession();
        Equipo eq =(Equipo) session .get(Equipo.class, equipo);
        String na=request.getParameter("na");
        
        if(na.equals("5")){
        na="Futbol 5";
        }else if(na.equals("7")){
        na="Futbol 7";
        }else if(na.equals("8")){
        na="Futbol 8";
        }else if(na.equals("11")){
        na="Futbo l1";
        }
        
        Jugadores salones = new Jugadores(eq, nombre, doc, tel, dorsal);
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        sesion.beginTransaction();
        sesion.save(salones);
        sesion.getTransaction().commit();
           sesion.close(); 

    
         
        
////        Query q = session.createQuery("select Nombre from Equipo where Nombre="+request.getParameter("id"));
//        Query q = session.createQuery("from Jugadores ");
//        ArrayList salone = (ArrayList) q.list();
//
//        request.setAttribute("juga", salone);
//        JOptionPane.showMessageDialog(null, salone);
       try {
            JOptionPane.showMessageDialog(null, "Registrado el jugador");
            
            request.getRequestDispatcher("ListarCampeonatos?action=siguiente&nombre="+request.getParameter("n")+"&maxEquipos="+na).forward(request, response);

        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }
             
        
        
           
                  
                  
              }
                   private void eliminar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Equipo clientes = (Equipo) sesion.get(Equipo.class, Integer.parseInt(request.getParameter("id")));

        sesion.beginTransaction();
        sesion.delete(clientes);
        sesion.getTransaction().commit();
        sesion.close();

        try {
            response.sendRedirect("ListarCampeonatos?action=ver");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
                   
                   
                   
                   
                   
                   private void MisCampeonatos(HttpServletRequest request, HttpServletResponse response) {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        

        Query q = session.createQuery("from Cancha where id=" + request.getParameter("id"));
        ArrayList salones = (ArrayList) q.list();

        request.setAttribute("listarcarrerass", salones);
        HttpSession sesion = request.getSession();
        String perfil = sesion.getAttribute("perfil").toString();
        Cliente user = (Cliente) sesion.getAttribute("setUsuario");
         int id = user.getIdCliente();
//        int p = Integer.parseInt(perfil);
        int pp = 15;
        
//         Query qq = session.createQuery("from Alquiler where  cliente=" + request.getParameter("id"));
        Query qq = session.createQuery("from Jugadores where equipo.cliente='"+id+"'");
        
        ArrayList sal = (ArrayList) qq.list();

        request.setAttribute("li", sal);
        
        
        
         Query qqq = session.createQuery("from Equipo where cliente='"+id+"'");
        
        ArrayList salq = (ArrayList) qqq.list();

        request.setAttribute("liq", salq);
        
        
        
        
        
        
        
        try {

            request.getRequestDispatcher("Vista/CampeonatosCliente.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
//private void VerJugadores  (HttpServletRequest request, HttpServletResponse response){
//                         Session session = HibernateUtil.getSessionFactory().openSession();
//    
//         
//        
////        Query q = session.createQuery("select Nombre from Equipo where Nombre="+request.getParameter("id"));
//        Query q = session.createQuery("from Jugadores where id=1");
//        ArrayList salone = (ArrayList) q.list();
//
//        request.setAttribute("juga", salone);
//            
//       try {
//
//            request.getRequestDispatcher("Vista/RegistrarEquipo.jsp").forward(request, response);
//        } catch (ServletException ex) {
//            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
//        } catch (IOException ex) {
//            Logger.getLogger(ListarCanchas.class.getName()).log(Level.SEVERE, null, ex);
//        }
//                  
//                  }
    
  
                  private void MisCampeonatosEditar(HttpServletRequest request, HttpServletResponse response) {
        
                Session session =HibernateUtil.getSessionFactory().openSession();
          Jugadores salon = (Jugadores) session.get(Jugadores.class,  Integer.parseInt(request.getParameter("id")));
          
         
          
            if(request.getMethod().equalsIgnoreCase("GET")){
                 request.setAttribute("s", salon);
                   try {
           
            request.getRequestDispatcher("Vista/EditarJugador.jsp").forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(ListarCampeonatos.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ListarCampeonatos.class.getName()).log(Level.SEVERE, null, ex);
        }
            }else{
                salon.setNombre(request.getParameter("nombre"));
                salon.setDocumento(Integer.parseInt(request.getParameter("documento")));
                salon.setCelular(Integer.parseInt(request.getParameter("celular")));
                salon.setDorsal(Integer.parseInt(request.getParameter("dorsal")));
                
                session.beginTransaction();
                session.save(salon);
                session.getTransaction().commit();
                session.close();
                
                
              try {
                  response.sendRedirect("ListarCampeonatos?action=campeonatos");
              } catch (IOException ex) {
                  Logger.getLogger(ListarCampeonatos.class.getName()).log(Level.SEVERE, null, ex);
              }
                
            }
    }  private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {
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
