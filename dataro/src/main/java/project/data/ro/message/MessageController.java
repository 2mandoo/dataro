package project.data.ro.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {
	
	@Autowired
	MessageService service;
	
	@GetMapping("/message/sendMessage.do")
	@ResponseBody
	public int sendMessage(MessageVO vo) {
		return service.insert(vo);
	}

}
