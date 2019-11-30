package civilize;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	@Autowired
	private HotelRepository hotelRepository; 
	
	
	@GetMapping("/create") // ใชเ้พมิ่ ข้อมูลลูกค้ำ
	public String create(@ModelAttribute Hotel hotel,Model model) {
		hotelRepository.save(hotel);
		return "redirect:/hotel/hotels";
	}
	
	@GetMapping("/hotels")
	public String getHotelList(Model model) { 
		List<Hotel> hotelList = hotelRepository.findAll();
		model.addAttribute("hotelList", hotelList);
		return "/hotel-list";
	}
	
	@GetMapping("/hotelForm")
	public String gotoHotelForm(Model model) { 
		return "/create-hotel-form";
	}
	
	@GetMapping("/delete/{id}") // ใชล้ บขอ้ มลู ลกู คำ้ตำมรหสั
	public String deleteHotel(@PathVariable Integer id) {
		hotelRepository.delete(id);
		return "redirect:/hotel/hotels";// สง่ ไปยงั path แสดงข้อมูลลูกค้ำทั้งหมด
	}
	
	@GetMapping("/editform/{id}")
	public String loadHotel(@PathVariable Integer id, Model model) {
		Hotel hotel = hotelRepository.findById(id);
		model.addAttribute("hotel", hotel);
		return "/edit-hotel-form";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	@GetMapping("/edit") 
	public String updateHotel(@ModelAttribute Hotel editHotel) {
		Hotel oldHotel = hotelRepository.findById(editHotel.getHotelId());
		oldHotel.setHotelId(editHotel.getHotelId());
		oldHotel.setHotelName(editHotel.getHotelName());
		oldHotel.setHotelDetail(editHotel.getHotelDetail());
		oldHotel.setHotelScore(editHotel.getHotelScore());
		hotelRepository.save(oldHotel);
		return "redirect:/hotel/hotels";
	}

	@GetMapping("/search")
	public String gotoSearch( @RequestParam("keyword") String keyword, Model model) {
		if(keyword==null) {
			return "redirect:/hotel/hotels";
		}else {
		List<Hotel> h=hotelRepository.searchByName(keyword);
		model.addAttribute("hotelList", h);
		return "/hotel-list";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข}
		}
	}
	
	@GetMapping("/test")
	public String gotoTest( Model model) {
		return "/test";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	@GetMapping("/")
	public String gotoHome(Model model) { 
		List<Hotel> hotelList = hotelRepository.findAll();
		model.addAttribute("hotelList", hotelList);
		return "/home";
	}
	@GetMapping("/searchHotel")
	public String userSearch( @RequestParam("keyword") String keyword, Model model) {
		List<Hotel> h=hotelRepository.searchByName(keyword);
		model.addAttribute("hotelList", h);
		return "/search-hotel";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	@GetMapping("/searchHome")
	public String userSearchHome( @RequestParam("keyword") String keyword, Model model) {

			List<Hotel> h=hotelRepository.searchByName(keyword);
			model.addAttribute("hotelList", h);
			return "/home";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข

	}
	@GetMapping("/searchGoToComment")
	public String userSearchComment( @RequestParam("keyword") String keyword, Model model) {
		List<Hotel> h=hotelRepository.searchByName(keyword);
		model.addAttribute("hotelList", h);
		return "/Comment";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	//uploadHotelPicture
	@GetMapping("/uploadHotelPicture/{hotelId}")
    public String uploadHotelPicPage(@PathVariable Integer hotelId,Model model) {
		Hotel hotel = hotelRepository.findById(hotelId);
		String hotelName = hotel.getHotelName();
		model.addAttribute("hotelName",hotelName);
        return "/uploadHotelPic";
    }
	
	@PostMapping("/uploads")
	public String upload(Model model,@RequestParam String hotelName,@RequestParam("file") MultipartFile file,HttpSession httpSession) {
		String name = hotelName;
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Creating the directory to store file
				//String rootPath = System.getProperty("user.dir");
				//File dir = new File(rootPath +File.separator+ "tmpFiles");
				File dir = new File("src/main/resources/static/hotelPicture");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name+".png");
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				//logger.info("Server File Location="+ serverFile.getAbsolutePath());
				
				//System.out.println(serverFile.getAbsolutePath());
				model.addAttribute("uploadStatus", "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath());
				//return "You successfully uploaded file= " + name+"<br>"+serverFile.getAbsolutePath();
			} catch (Exception e) {
				model.addAttribute("uploadStatus","You failed to upload " + name + " => " + e.getMessage());
			}
		} else {
			model.addAttribute("uploadStatus", "You failed to upload " + name + " because the file was empty.");
		}
		
		return"/uploadHotelStatus";
	}
}
