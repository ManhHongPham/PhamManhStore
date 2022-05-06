package Homework.JW12.ArtFurniture.service.serverside.services;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import Homework.JW12.ArtFurniture.service.serverside.entities.BaseEntity;

public abstract class BaseService<E extends BaseEntity> {

	protected abstract EntityManager em();

	protected abstract Class<E> clazz();

	public E getById(int id) {
		return em().find(clazz(), id);
	}

	public List<E> findAll() {
		Table tbl = clazz().getAnnotation(Table.class);
		return (List<E>) em().createNativeQuery("SELECT * FROM " + tbl.name(), clazz()).getResultList();
	}
	
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) {
			em().persist(entity);
			return entity;
		} else {
			return em().merge(entity);
		}
	}

	public void delete(E entity) {
		em().remove(entity);
	}

	public void deleteById(int id) {
		E entity = this.getById(id);
		delete(entity);
	}

	public List<E> executeNativeSql(String sql) {
		try {
			Query query = em().createNativeQuery(sql, clazz());
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
}
