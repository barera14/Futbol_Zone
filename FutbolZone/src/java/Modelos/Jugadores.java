package Modelos;
// Generated 29/11/2017 10:23:01 AM by Hibernate Tools 4.3.1



/**
 * Jugadores generated by hbm2java
 */
public class Jugadores  implements java.io.Serializable {


     private Integer idJugadores;
     private Equipo equipo;
     private String nombre;
     private long documento;
     private long celular;
     private int dorsal;

    public Jugadores() {
    }

	
    public Jugadores(String nombre, long documento, long celular, int dorsal) {
        this.nombre = nombre;
        this.documento = documento;
        this.celular = celular;
        this.dorsal = dorsal;
    }
    public Jugadores(Equipo equipo, String nombre, long documento, long celular, int dorsal) {
       this.equipo = equipo;
       this.nombre = nombre;
       this.documento = documento;
       this.celular = celular;
       this.dorsal = dorsal;
    }
   
    public Integer getIdJugadores() {
        return this.idJugadores;
    }
    
    public void setIdJugadores(Integer idJugadores) {
        this.idJugadores = idJugadores;
    }
    public Equipo getEquipo() {
        return this.equipo;
    }
    
    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public long getDocumento() {
        return this.documento;
    }
    
    public void setDocumento(long documento) {
        this.documento = documento;
    }
    public long getCelular() {
        return this.celular;
    }
    
    public void setCelular(long celular) {
        this.celular = celular;
    }
    public int getDorsal() {
        return this.dorsal;
    }
    
    public void setDorsal(int dorsal) {
        this.dorsal = dorsal;
    }




}


