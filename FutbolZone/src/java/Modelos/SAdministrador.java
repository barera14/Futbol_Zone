package Modelos;
// Generated 29/11/2017 10:23:01 AM by Hibernate Tools 4.3.1



/**
 * SAdministrador generated by hbm2java
 */
public class SAdministrador  implements java.io.Serializable {


     private Integer idSAdministrador;
     private Usuarios usuarios;
     private String nombre;
     private String apellido;
     private long celular;

    public SAdministrador() {
    }

    public SAdministrador(Usuarios usuarios, String nombre, String apellido, long celular) {
       this.usuarios = usuarios;
       this.nombre = nombre;
       this.apellido = apellido;
       this.celular = celular;
    }
   
    public Integer getIdSAdministrador() {
        return this.idSAdministrador;
    }
    
    public void setIdSAdministrador(Integer idSAdministrador) {
        this.idSAdministrador = idSAdministrador;
    }
    public Usuarios getUsuarios() {
        return this.usuarios;
    }
    
    public void setUsuarios(Usuarios usuarios) {
        this.usuarios = usuarios;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido() {
        return this.apellido;
    }
    
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public long getCelular() {
        return this.celular;
    }
    
    public void setCelular(long celular) {
        this.celular = celular;
    }




}


