package civilize;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Transactional
	public Member saveMember(Member mb) {
		entityManager.persist(mb); // insert กรณีไม่มีค่า id ใน object หรือ update กรณีมีค่า id ใน object
		return mb;
	}
		
	public List<Member> findMemberAll() {
		Query query = entityManager.createQuery("from Member"); // สรา้งค าสงั่ SELECT ข ้อมูลจากตาราง customer
		return query.getResultList(); // ดึงรายการผลลัพธ์จากการ Query สง่ กลบั
	}
	
	public Member findByUsername(String Username) {
		return entityManager.find(Member.class,Username);
	}
	
	@Transactional
	public void delete(String username) {
		Member member = entityManager.find(Member.class, username); // ค ้นหาตาม id ที่ต ้องการลบ
		entityManager.remove(member); // เริ่มลบจริง
	}
	
		public Member checkLogin(String username,String password) {
			Query query = entityManager.createNativeQuery("select * from Member where username=:USERNAME and password=:PASSWORD",Member.class);
			query.setParameter("USERNAME", username);
			query.setParameter("PASSWORD", password);
			List resultList = query.getResultList();
			return   resultList.isEmpty() ? null: (Member) resultList.get(0);
			}
	
	public List<Member> searchMemberByName(String name){
		Query q = entityManager.createQuery("FROM Member m WHERE m.memberName = :NAME");
		q.setParameter("NAME", name);
		return q.getResultList();
	}
	
}
