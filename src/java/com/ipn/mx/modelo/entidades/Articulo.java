package com.ipn.mx.modelo.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "articulo", catalog = "bhhharru9bknfrgin7et", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Articulo.findAll", query = "SELECT a FROM Articulo a")
    , @NamedQuery(name = "Articulo.findByIdArticulo", query = "SELECT a FROM Articulo a WHERE a.idArticulo = :idArticulo")
    , @NamedQuery(name = "Articulo.findByNombreArticulo", query = "SELECT a FROM Articulo a WHERE a.nombreArticulo = :nombreArticulo")
    , @NamedQuery(name = "Articulo.findByDescripcionArticulo", query = "SELECT a FROM Articulo a WHERE a.descripcionArticulo = :descripcionArticulo")
    , @NamedQuery(name = "Articulo.findByPrecioUnitario", query = "SELECT a FROM Articulo a WHERE a.precioUnitario = :precioUnitario")
    , @NamedQuery(name = "Articulo.findByExistencias", query = "SELECT a FROM Articulo a WHERE a.existencias = :existencias")
    , @NamedQuery(name = "Articulo.findByStockMinimo", query = "SELECT a FROM Articulo a WHERE a.stockMinimo = :stockMinimo")
    , @NamedQuery(name = "Articulo.findByStockMaximo", query = "SELECT a FROM Articulo a WHERE a.stockMaximo = :stockMaximo")})
public class Articulo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idArticulo", nullable = false)
    private Integer idArticulo;
    @Basic(optional = false)
    @Column(name = "nombreArticulo", nullable = false, length = 50)
    private String nombreArticulo;
    @Basic(optional = false)
    @Column(name = "descripcionArticulo", nullable = false, length = 100)
    private String descripcionArticulo;
    @Basic(optional = false)
    @Column(name = "precioUnitario", nullable = false)
    private float precioUnitario;
    @Basic(optional = false)
    @Column(name = "existencias", nullable = false)
    private int existencias;
    @Basic(optional = false)
    @Column(name = "stockMinimo", nullable = false)
    private int stockMinimo;
    @Basic(optional = false)
    @Column(name = "stockMaximo", nullable = false)
    private int stockMaximo;
    @JoinColumn(name = "idCategoria", referencedColumnName = "idCategoria", nullable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Categoria idCategoria;

    public Articulo() {
    }

    public Articulo(Integer idArticulo) {
	this.idArticulo = idArticulo;
    }

    public Articulo(Integer idArticulo, String nombreArticulo, String descripcionArticulo, float precioUnitario, int existencias, int stockMinimo, int stockMaximo) {
	this.idArticulo = idArticulo;
	this.nombreArticulo = nombreArticulo;
	this.descripcionArticulo = descripcionArticulo;
	this.precioUnitario = precioUnitario;
	this.existencias = existencias;
	this.stockMinimo = stockMinimo;
	this.stockMaximo = stockMaximo;
    }

    public Integer getIdArticulo() {
	return idArticulo;
    }

    public void setIdArticulo(Integer idArticulo) {
	this.idArticulo = idArticulo;
    }

    public String getNombreArticulo() {
	return nombreArticulo;
    }

    public void setNombreArticulo(String nombreArticulo) {
	this.nombreArticulo = nombreArticulo;
    }

    public String getDescripcionArticulo() {
	return descripcionArticulo;
    }

    public void setDescripcionArticulo(String descripcionArticulo) {
	this.descripcionArticulo = descripcionArticulo;
    }

    public float getPrecioUnitario() {
	return precioUnitario;
    }

    public void setPrecioUnitario(float precioUnitario) {
	this.precioUnitario = precioUnitario;
    }

    public int getExistencias() {
	return existencias;
    }

    public void setExistencias(int existencias) {
	this.existencias = existencias;
    }

    public int getStockMinimo() {
	return stockMinimo;
    }

    public void setStockMinimo(int stockMinimo) {
	this.stockMinimo = stockMinimo;
    }

    public int getStockMaximo() {
	return stockMaximo;
    }

    public void setStockMaximo(int stockMaximo) {
	this.stockMaximo = stockMaximo;
    }

    public Categoria getIdCategoria() {
	return idCategoria;
    }

    public void setIdCategoria(Categoria idCategoria) {
	this.idCategoria = idCategoria;
    }

    @Override
    public int hashCode() {
	int hash = 0;
	hash += (idArticulo != null ? idArticulo.hashCode() : 0);
	return hash;
    }

    @Override
    public boolean equals(Object object) {
	// TODO: Warning - this method won't work in the case the id fields are not set
	if (!(object instanceof Articulo)) {
	    return false;
	}
	Articulo other = (Articulo) object;
	if ((this.idArticulo == null && other.idArticulo != null) || (this.idArticulo != null && !this.idArticulo.equals(other.idArticulo))) {
	    return false;
	}
	return true;
    }

    @Override
    public String toString() {
	return "com.ipn.mx.modelo.entidades.Articulo[ idArticulo=" + idArticulo + " ]";
    }
    
}
