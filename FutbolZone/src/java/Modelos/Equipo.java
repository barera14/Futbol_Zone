package Modelos;
// Generated 29/11/2017 10:23:01 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Equipo generated by hbm2java
 */
public class Equipo  implements java.io.Serializable {


     private Integer idEquipo;
     private Campeonatos campeonatos;
     private Cliente cliente;
     private String nombre;
     private Integer clasificacion;
     private Integer golesFavor;
     private Integer golesContra;
     private Integer puntos;
     private Integer pganados;
     private Integer pperdidos;
     private Set<Jugadores> jugadoreses = new HashSet<Jugadores>(0);
     private Set<Partido> partidosForLocal = new HashSet<Partido>(0);
     private Set<Jugadores> jugadoreses_1 = new HashSet<Jugadores>(0);
     private Set<Partido> partidosForVisitante = new HashSet<Partido>(0);

    public Equipo() {
    }

	
    public Equipo(String nombre, Campeonatos campeonato, Cliente cliente) {
        this.nombre = nombre;
        this.campeonatos = campeonato;
        this.cliente = cliente;
    }
    public Equipo(Campeonatos campeonatos, Cliente cliente, String nombre, Integer clasificacion, Integer golesFavor, Integer golesContra, Integer puntos, Integer pganados, Integer pperdidos) {
       this.campeonatos = campeonatos;
       this.cliente = cliente;
       this.nombre = nombre;
       this.clasificacion = clasificacion;
       this.golesFavor = golesFavor;
       this.golesContra = golesContra;
       this.puntos = puntos;
       this.pganados = pganados;
       this.pperdidos = pperdidos;
       this.jugadoreses = jugadoreses;
       this.partidosForLocal = partidosForLocal;
       this.jugadoreses_1 = jugadoreses_1;
       this.partidosForVisitante = partidosForVisitante;
    }


    public Integer getIdEquipo() {
        return this.idEquipo;
    }
    
    public void setIdEquipo(Integer idEquipo) {
        this.idEquipo = idEquipo;
    }
    public Campeonatos getCampeonatos() {
        return this.campeonatos;
    }
    
    public void setCampeonatos(Campeonatos campeonatos) {
        this.campeonatos = campeonatos;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Integer getClasificacion() {
        return this.clasificacion;
    }
    
    public void setClasificacion(Integer clasificacion) {
        this.clasificacion = clasificacion;
    }
    public Integer getGolesFavor() {
        return this.golesFavor;
    }
    
    public void setGolesFavor(Integer golesFavor) {
        this.golesFavor = golesFavor;
    }
    public Integer getGolesContra() {
        return this.golesContra;
    }
    
    public void setGolesContra(Integer golesContra) {
        this.golesContra = golesContra;
    }
    public Integer getPuntos() {
        return this.puntos;
    }
    
    public void setPuntos(Integer puntos) {
        this.puntos = puntos;
    }
    public Integer getPganados() {
        return this.pganados;
    }
    
    public void setPganados(Integer pganados) {
        this.pganados = pganados;
    }
    public Integer getPperdidos() {
        return this.pperdidos;
    }
    
    public void setPperdidos(Integer pperdidos) {
        this.pperdidos = pperdidos;
    }
    public Set<Jugadores> getJugadoreses() {
        return this.jugadoreses;
    }
    
    public void setJugadoreses(Set<Jugadores> jugadoreses) {
        this.jugadoreses = jugadoreses;
    }
    public Set<Partido> getPartidosForLocal() {
        return this.partidosForLocal;
    }
    
    public void setPartidosForLocal(Set<Partido> partidosForLocal) {
        this.partidosForLocal = partidosForLocal;
    }
    public Set<Jugadores> getJugadoreses_1() {
        return this.jugadoreses_1;
    }
    
    public void setJugadoreses_1(Set<Jugadores> jugadoreses_1) {
        this.jugadoreses_1 = jugadoreses_1;
    }
    public Set<Partido> getPartidosForVisitante() {
        return this.partidosForVisitante;
    }
    
    public void setPartidosForVisitante(Set<Partido> partidosForVisitante) {
        this.partidosForVisitante = partidosForVisitante;
    }




}


