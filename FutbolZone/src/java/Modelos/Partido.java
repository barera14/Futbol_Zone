package Modelos;
// Generated 29/11/2017 10:23:01 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Partido generated by hbm2java
 */
public class Partido  implements java.io.Serializable {


     private Integer idPartido;
     private Campeonatos campeonatos;
     private Equipo equipoByLocal;
     private Equipo equipoByVisitante;
     private Date fecha;
     private Integer golvis;
     private Integer golLoC;
     private String estado;

    public Partido() {
    }

	
    public Partido(Campeonatos campeonatos, Equipo equipoByLocal, Equipo equipoByVisitante, String estado, Date Fecha) {
        this.campeonatos = campeonatos;
        this.equipoByLocal = equipoByLocal;
        this.equipoByVisitante = equipoByVisitante;
        this.estado = estado;
        this.fecha = Fecha;
    }
    
    public Partido(Campeonatos campeonatos, Equipo equipoByLocal, Equipo equipoByVisitante, Date fecha, Integer golvis, Integer golLoC, String estado) {
       this.campeonatos = campeonatos;
       this.equipoByLocal = equipoByLocal;
       this.equipoByVisitante = equipoByVisitante;
       this.fecha = fecha;
       this.golvis = golvis;
       this.golLoC = golLoC;
       this.estado = estado;
    }
   
    public Integer getIdPartido() {
        return this.idPartido;
    }
    
    public void setIdPartido(Integer idPartido) {
        this.idPartido = idPartido;
    }
    public Campeonatos getCampeonatos() {
        return this.campeonatos;
    }
    
    public void setCampeonatos(Campeonatos campeonatos) {
        this.campeonatos = campeonatos;
    }
    public Equipo getEquipoByLocal() {
        return this.equipoByLocal;
    }
    
    public void setEquipoByLocal(Equipo equipoByLocal) {
        this.equipoByLocal = equipoByLocal;
    }
    public Equipo getEquipoByVisitante() {
        return this.equipoByVisitante;
    }
    
    public void setEquipoByVisitante(Equipo equipoByVisitante) {
        this.equipoByVisitante = equipoByVisitante;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public Integer getGolvis() {
        return this.golvis;
    }
    
    public void setGolvis(Integer golvis) {
        this.golvis = golvis;
    }
    public Integer getGolLoC() {
        return this.golLoC;
    }
    
    public void setGolLoC(Integer golLoC) {
        this.golLoC = golLoC;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }




}


