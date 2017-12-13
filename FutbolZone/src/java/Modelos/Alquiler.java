package Modelos;
// Generated 29/11/2017 10:23:01 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Alquiler generated by hbm2java
 */
public class Alquiler  implements java.io.Serializable {


     private Integer idAlquiler;
     private Cancha cancha;
     private Cliente cliente;
     private Date fecha;
     private Date fechaFin;
     private String valor;
     private String estado;
 private int ian;

    public int getIan() {
        return ian;
    }

    public void setIan(int ian) {
        this.ian = ian;
    }
    public Alquiler() {
    }

    public Alquiler(Cancha cancha, Cliente cliente, Date fecha, Date fechaFin, String valor, String estado) {
       this.cancha = cancha;
       this.cliente = cliente;
       this.fecha = fecha;
       this.fechaFin = fechaFin;
       this.valor = valor;
       this.estado = estado;
    }
   
    public Integer getIdAlquiler() {
        return this.idAlquiler;
    }
    
    public void setIdAlquiler(Integer idAlquiler) {
        this.idAlquiler = idAlquiler;
    }
    public Cancha getCancha() {
        return this.cancha;
    }
    
    public void setCancha(Cancha cancha) {
        this.cancha = cancha;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public Date getFechaFin() {
        return this.fechaFin;
    }
    
    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }
    public String getValor() {
        return this.valor;
    }
    
    public void setValor(String valor) {
        this.valor = valor;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }




}


