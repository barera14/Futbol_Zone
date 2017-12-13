/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Cancha;
import Modelos.Establecimiento;
import Modelos.HibernateUtil;
import Modelos.Usuarios;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.codec.digest.DigestUtils;
import org.hibernate.Session;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.hibernate.Query;

/**
 *
 * @author Alejandro Bernal
 */
public class CanchasController extends HttpServlet {

    private final String UPLOAD_DIRECTORY = "C:\\Users\\Alejandro Bernal\\Desktop\\Final\\Algo\\FutbolZone\\web\\Fotos";

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
            case "update":
                actualizar(request, response);
                break;

        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");

        Session session = HibernateUtil.getSessionFactory().openSession();

        String tCancha = "";
        int valor = 0;
        String Estado = "Activo";
        String foto = "";
        HttpSession sessions = request.getSession();
        String perfil = sessions.getAttribute("perfil").toString();
        Establecimiento user = (Establecimiento) sessions.getAttribute("setUsuario");
        int id = user.getIdEstablecimiento();
        Establecimiento cliente = (Establecimiento) session.get(Establecimiento.class, id);
        System.out.print(foto);

        if (ServletFileUpload.isMultipartContent(request)) {
            String fname;
            try {
                List<FileItem> multiparte = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparte) {
                    if (!item.isFormField()) {
                        fname = new File(item.getName()).getName();
                        item.write(new File(UPLOAD_DIRECTORY + File.separator + fname));
                    } else {
                        switch (item.getFieldName()) {
                            case "tCancha":
                                tCancha = item.getString();
                                break;
                            case "valor":
                                valor = Integer.parseInt(item.getString());
                                break;
                            case "foto":
                                foto = item.getString();
                                break;
                        }
                    }
                }
                Cancha canc = new Cancha(cliente, tCancha, Estado, foto, valor);

                session.beginTransaction();
                session.save(canc);
                session.getTransaction().commit();
                session.close();

            } catch (FileUploadException ex) {
                Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (Exception ex) {
                Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

        try {
            response.sendRedirect("CanchasC?action=admin&rta=yes");
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void Admin(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Session sesion = HibernateUtil.getSessionFactory().openSession();
        HttpSession session = request.getSession();
        String perfil = session.getAttribute("perfil").toString();
        Establecimiento user = (Establecimiento) session.getAttribute("setUsuario");
        int id = user.getIdEstablecimiento();
        Query q = sesion.createQuery("FROM Cancha WHERE establecimiento='" + id + "'");
        //Query q = sesion.createQuery("FROM Odontologos WHERE especialidad = 'General'"); Con el WHERE para condición
        ArrayList listaObjetos = (ArrayList) q.list();

        ArrayList<Cancha> cli = new ArrayList<Cancha>();
        for (Object client : listaObjetos) {

            Cancha cliente = (Cancha) client;
            cli.add(cliente);

        }
        HttpSession httpSesion = request.getSession();
        //    httpSesion.setAttribute("sesion", "adminCanchas");
        request.setAttribute("ArrayCliente", cli);

        try {
            request.getRequestDispatcher("AdministrarCanchas.jsp").forward(request, response);//Redirecionar
        } catch (ServletException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
        }
        sesion.close();

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
            response.sendRedirect("CanchasC?action=admin&rta=esty");
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
            response.sendRedirect("CanchasC?action=admin&rta=esty");
        } catch (IOException ex) {
            Logger.getLogger(ClientesController.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) {
        Session sesion = HibernateUtil.getSessionFactory().openSession();
        Cancha cancha = (Cancha) sesion.get(Cancha.class, Integer.parseInt(request.getParameter("id")));
        if (request.getMethod().equalsIgnoreCase("GET")) {
            request.setAttribute("Cancha", cancha);

            try {
                request.getRequestDispatcher("UpdateCancha.jsp").forward(request, response);
            } catch (ServletException ex) {
                Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IOException ex) {
                Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            String tCancha = "";
            int valor = 0;
            String Estado = "Activo";
            String foto = "";
            HttpSession sessions = request.getSession();
            String perfil = sessions.getAttribute("perfil").toString();
            Establecimiento user = (Establecimiento) sessions.getAttribute("setUsuario");
            int id = user.getIdEstablecimiento();
            Establecimiento cliente = (Establecimiento) sesion.get(Establecimiento.class, id);
            System.out.print(foto);

            if (ServletFileUpload.isMultipartContent(request)) {
                String fname;
                try {
                    List<FileItem> multiparte = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

                    for (FileItem item : multiparte) {
                        if (!item.isFormField()) {
                            fname = new File(item.getName()).getName();
                            item.write(new File(UPLOAD_DIRECTORY + File.separator + fname));
                        } else {
                            switch (item.getFieldName()) {
                                case "tCancha":
                                    tCancha = item.getString();
                                    break;
                                case "valor":
                                    valor = Integer.parseInt(item.getString());
                                    break;
                                case "foto":
                                    foto = item.getString();
                                    break;
                            }
                        }
                    }
                    
                    cancha.setTipoCancha(tCancha);
                    cancha.setValor(valor);
                    cancha.setFoto(foto);
                    sesion.beginTransaction();
                    sesion.saveOrUpdate(cancha);
                    sesion.getTransaction().commit();
                    sesion.close();
                } catch (FileUploadException ex) {
                    Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (Exception ex) {
                    Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
                }

            }

            try {
                response.sendRedirect("CanchasC?action=admin&rta=yes");
            } catch (IOException ex) {
                Logger.getLogger(CanchasController.class.getName()).log(Level.SEVERE, null, ex);
            }

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
