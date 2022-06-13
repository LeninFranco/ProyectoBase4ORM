package com.ipn.mx.controlador;

import com.ipn.mx.controlador.exceptions.NonexistentEntityException;
import com.ipn.mx.modelo.entidades.Articulo;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.ipn.mx.modelo.entidades.Categoria;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class ArticuloJpaController implements Serializable {

    public ArticuloJpaController(EntityManagerFactory emf) {
	this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
	return emf.createEntityManager();
    }

    public void create(Articulo articulo) {
	EntityManager em = null;
	try {
	    em = getEntityManager();
	    em.getTransaction().begin();
	    Categoria idCategoria = articulo.getIdCategoria();
	    if (idCategoria != null) {
		idCategoria = em.getReference(idCategoria.getClass(), idCategoria.getIdCategoria());
		articulo.setIdCategoria(idCategoria);
	    }
	    em.persist(articulo);
	    if (idCategoria != null) {
		idCategoria.getArticuloList().add(articulo);
		idCategoria = em.merge(idCategoria);
	    }
	    em.getTransaction().commit();
	} finally {
	    if (em != null) {
		em.close();
	    }
	}
    }

    public void edit(Articulo articulo) throws NonexistentEntityException, Exception {
	EntityManager em = null;
	try {
	    em = getEntityManager();
	    em.getTransaction().begin();
	    Articulo persistentArticulo = em.find(Articulo.class, articulo.getIdArticulo());
	    Categoria idCategoriaOld = persistentArticulo.getIdCategoria();
	    Categoria idCategoriaNew = articulo.getIdCategoria();
	    if (idCategoriaNew != null) {
		idCategoriaNew = em.getReference(idCategoriaNew.getClass(), idCategoriaNew.getIdCategoria());
		articulo.setIdCategoria(idCategoriaNew);
	    }
	    articulo = em.merge(articulo);
	    if (idCategoriaOld != null && !idCategoriaOld.equals(idCategoriaNew)) {
		idCategoriaOld.getArticuloList().remove(articulo);
		idCategoriaOld = em.merge(idCategoriaOld);
	    }
	    if (idCategoriaNew != null && !idCategoriaNew.equals(idCategoriaOld)) {
		idCategoriaNew.getArticuloList().add(articulo);
		idCategoriaNew = em.merge(idCategoriaNew);
	    }
	    em.getTransaction().commit();
	} catch (Exception ex) {
	    String msg = ex.getLocalizedMessage();
	    if (msg == null || msg.length() == 0) {
		Integer id = articulo.getIdArticulo();
		if (findArticulo(id) == null) {
		    throw new NonexistentEntityException("The articulo with id " + id + " no longer exists.");
		}
	    }
	    throw ex;
	} finally {
	    if (em != null) {
		em.close();
	    }
	}
    }

    public void destroy(Integer id) throws NonexistentEntityException {
	EntityManager em = null;
	try {
	    em = getEntityManager();
	    em.getTransaction().begin();
	    Articulo articulo;
	    try {
		articulo = em.getReference(Articulo.class, id);
		articulo.getIdArticulo();
	    } catch (EntityNotFoundException enfe) {
		throw new NonexistentEntityException("The articulo with id " + id + " no longer exists.", enfe);
	    }
	    Categoria idCategoria = articulo.getIdCategoria();
	    if (idCategoria != null) {
		idCategoria.getArticuloList().remove(articulo);
		idCategoria = em.merge(idCategoria);
	    }
	    em.remove(articulo);
	    em.getTransaction().commit();
	} finally {
	    if (em != null) {
		em.close();
	    }
	}
    }

    public List<Articulo> findArticuloEntities() {
	return findArticuloEntities(true, -1, -1);
    }

    public List<Articulo> findArticuloEntities(int maxResults, int firstResult) {
	return findArticuloEntities(false, maxResults, firstResult);
    }

    private List<Articulo> findArticuloEntities(boolean all, int maxResults, int firstResult) {
	EntityManager em = getEntityManager();
	try {
	    CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	    cq.select(cq.from(Articulo.class));
	    Query q = em.createQuery(cq);
	    if (!all) {
		q.setMaxResults(maxResults);
		q.setFirstResult(firstResult);
	    }
	    return q.getResultList();
	} finally {
	    em.close();
	}
    }

    public Articulo findArticulo(Integer id) {
	EntityManager em = getEntityManager();
	try {
	    return em.find(Articulo.class, id);
	} finally {
	    em.close();
	}
    }

    public int getArticuloCount() {
	EntityManager em = getEntityManager();
	try {
	    CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
	    Root<Articulo> rt = cq.from(Articulo.class);
	    cq.select(em.getCriteriaBuilder().count(rt));
	    Query q = em.createQuery(cq);
	    return ((Long) q.getSingleResult()).intValue();
	} finally {
	    em.close();
	}
    }
    
}
