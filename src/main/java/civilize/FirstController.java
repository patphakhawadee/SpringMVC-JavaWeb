package civilize;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/o-o")
public class FirstController {
	@Autowired
	private HotelRepository hotelRepository; 
	
	@Autowired
	private CommentRepository commentRepository;
	

	
	@GetMapping("/showComment/{id}")
	public String showHotel(@PathVariable Integer id, Model model) {
		Hotel hotel = hotelRepository.findById(id);
		model.addAttribute("hotel", hotel);
		List<Comment> commentList = commentRepository.findById(id);
		model.addAttribute("commentList", commentList);
		
		return "/showComment";
	}
	
	@GetMapping("/comment")
	public String gotoComment(Model model) {
		List<Hotel> hotelList = hotelRepository.findAll();
		model.addAttribute("hotelList", hotelList);
		return "/Comment";
	}
	
	@GetMapping("/createComment")
	public String createComment(@ModelAttribute Comment comment,Model model,@RequestParam Integer hotelScore,@RequestParam Integer hotelId) {
		Hotel s =hotelRepository.findById(hotelId);
		s.setHotelScore(hotelScore);
		Comment c=commentRepository.saveComment(comment); //save
		Integer id = c.getHotelId();
		//add count user
		
		return "redirect:/o-o/showComment/"+id;
		
	}
	    
	@GetMapping("/comments")
	public String getCommnetList(Model model) { 
		List<Comment> commentList = commentRepository.findCommentAll();
		model.addAttribute("commentList", commentList);
		return "/comment-list";
	}

	@GetMapping("/delete/{commentId}") // 
	public String deleteComment(@PathVariable Integer commentId) {
		commentRepository.delete(commentId);
		return "redirect:/o-o/comments";// 
	}
	
	@GetMapping("/searchCommentByUsername")
	public String gotoSearchCommentByUser( @RequestParam("keyword") String keyword, Model model) {
		List<Comment> comment=commentRepository.findByUsername(keyword);
		model.addAttribute("commentList", comment);
		return "/member-list";
	}
	
	
}
