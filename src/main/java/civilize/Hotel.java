package civilize;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Hotel {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer hotelId;
	private String hotelName;
	private String hotelDetail;
	private Integer hotelScore;
	private Integer countUser;
	public Integer getHotelId() {
		return hotelId;
	}
	public void setHotelId(Integer hotelId) {
		this.hotelId = hotelId;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getHotelDetail() {
		return hotelDetail;
	}
	public void setHotelDetail(String hotelDetail) {
		this.hotelDetail = hotelDetail;
	}
	public Integer getHotelScore() {
		return hotelScore;
	}
	public void setHotelScore(Integer hotelScore) {
		this.hotelScore = hotelScore;
	}
	public Integer getCountUser() {
		return countUser;
	}
	public void setCountUser(Integer countUser) {
		this.countUser = countUser;
	}
	
	
	
}
