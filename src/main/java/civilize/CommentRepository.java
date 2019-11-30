package civilize;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class CommentRepository {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional
	public Comment saveComment(Comment comment) {
		entityManager.persist(comment); 
		return comment;
	}
	
	public List<Comment> findCommentAll() {
		Query query = entityManager.createQuery("from Comment"); // สรา้งค าสงั่ SELECT ข ้อมูลจากตาราง customer
		return query.getResultList(); // ดึงรายการผลลัพธ์จากการ Query สง่ กลบั
	}
	
	@Transactional
	public void delete(Integer commentId) {
		Comment c = entityManager.find(Comment.class, commentId); // ค ้นหาตาม id ที่ต ้องการลบ
		entityManager.remove(c); // เริ่มลบจริง
	}
	
	public List<Comment> findById(Integer hotelId) {
		Query query = entityManager.createQuery("from Comment where hotelId = :hotelId");
		query.setParameter("hotelId", hotelId);
		return query.getResultList();
	}
	public List<Comment> findByUsername(String username) {
		Query query = entityManager.createQuery("from Comment where username = :username");
		query.setParameter("username", username);
		return query.getResultList();
	}
	
	
}
