package civilize;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class HotelRepository {
	@PersistenceContext
	private EntityManager entityManager;
	
	
	@Transactional
	public Hotel save(Hotel hotel) {
		entityManager.persist(hotel); // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object
		return hotel;
	}
	
	public List<Hotel> findAll() {
		Query query = entityManager.createQuery("from Hotel"); // สรา้งค าสงั่ SELECT ข ้อมูลจากตาราง customer
		return query.getResultList(); // ดึงรายการผลลัพธ์จากการ Query สง่ กลบั
	}
	@Transactional
	public void delete(Integer id) {
		Hotel hotel = entityManager.find(Hotel.class, id); // ค ้นหาตาม id ที่ต ้องการลบ
		entityManager.remove(hotel); // เริ่มลบจริง
	}
	
	public Hotel findById(Integer id) {
		return entityManager.find(Hotel.class, id); // 
	}
	
	public List<Hotel> searchByName(String name){
		Query q = entityManager.createQuery("FROM Hotel h WHERE h.hotelName = :NAME");
		q.setParameter("NAME", name);
		return q.getResultList();
	}
	
	
}
