package civilize;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberRepository memberRepository;
	
	@PostMapping("/Registers")
    public String Register(@ModelAttribute Member user,Model model) {
		try {
			memberRepository.saveMember(user);
        return "redirect:/hotel/";
	} catch (Exception e) {
		return "redirect:/hotel/";
	}
    }
	@PostMapping("/addMemberByAdmin")
    public String AddByAdmin(@ModelAttribute Member user,Model model) {
		try {
			memberRepository.saveMember(user);
        return "redirect:/member/members";
	} catch (Exception e) {
		return "redirect:/member/members";
	}
    }
	
	@GetMapping("/members")
	public String getHotelList(Model model) { 
		List<Member> memberList = memberRepository.findMemberAll();
		model.addAttribute("memberList", memberList);
		return "/member-list";
	}
	
	@GetMapping("/register")
	public String gotoRegister(Model model) { 
		return "/register";
	}
	
	@GetMapping("/addByAdmin")
	public String gotoAdd(Model model) { 
		return "/create-member-byUser";
	}
	
	@GetMapping("/editform/{username}")
	public String loadMember(@PathVariable String username, Model model) {
		Member mb = memberRepository.findByUsername(username);
		model.addAttribute("member", mb);
		return "/edit-member-form";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	
	@GetMapping("/edit") 
	public String updateMmber(@ModelAttribute Member editMember) {
		Member oldMember = memberRepository.findByUsername(editMember.getUsername());
		oldMember.setUsername(editMember.getUsername());
		oldMember.setPassword(editMember.getPassword());
		oldMember.setMemberEmail(editMember.getMemberEmail());
		oldMember.setMemberName(editMember.getMemberName());
		memberRepository.saveMember(oldMember);
		if(oldMember.getUsername()=="admin") {
			return "redirect:/member/members";
		}else {
			return "redirect:/hotel/";
		}
		
	}
	
	@GetMapping("/delete/{username}") // ใชล้ บขอ้ มลู ลกู คำ้ตำมรหสั
	public String deleteMember(@PathVariable String username) {
		memberRepository.delete(username);
		return "redirect:/member/members";// สง่ ไปยงั path แสดงข้อมูลลูกค้ำทั้งหมด
	}
	@GetMapping("/loginPage") 
	public String gotoLogin() {
		return "/logins";
	}
	
	@PostMapping("/login")
	public String Login(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession session,HttpServletRequest request,Model model) {
		if(null != memberRepository.checkLogin(username, password)) {
			Member u = memberRepository.findByUsername(username);
			session.setAttribute("session", u);
			session.setAttribute("username", u.getUsername());
		}else {
			model.addAttribute("Wrong","Wrong!! Please Enter again");
			return "/logins";
		}
		return "redirect:/hotel/";
		
	}
	
	@GetMapping("/logout")
    public String logout(HttpSession session,HttpServletRequest request,Model model)  {
		session.invalidate();
        return "redirect:/hotel/";
    }
	@GetMapping("/searchMember")
	public String gotoSearch( @RequestParam("keyword") String keyword, Model model) {
		List<Member> mb=memberRepository.searchMemberByName(keyword);
		model.addAttribute("memberList", mb);
		return "/member-list";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	
	@GetMapping("/memberDetail/{username}")
	public String gotomemberDetail(@PathVariable String username, Model model ) {
		Member mb = memberRepository.findByUsername(username);
		model.addAttribute("member", mb);
		return "/show-member-detail";// สง่ ไปแสดงผลในฟอรม์ แกไ้ข
	}
	
	@GetMapping("/uploadprofile/{username}")
    public String uploadProfilepage(@PathVariable String username,Model model) {
		Member u = memberRepository.findByUsername(username);
		model.addAttribute("u",u);
        return "/upload";
    }
	
	@PostMapping("/uploads")
	public String upload(Model model,@RequestParam String username,@RequestParam("file") MultipartFile file,HttpSession httpSession) {
		String name = username;
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// Creating the directory to store file
				//String rootPath = System.getProperty("user.dir");
				//File dir = new File(rootPath +File.separator+ "tmpFiles");
				File dir = new File("src/main/resources/static/img");
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
		
		return"/uploadStatus";
	}
}
