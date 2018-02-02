package controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.SignUtil;
import entity.User;

@RequestMapping("/test")
@Controller
public class TestController {

	@RequestMapping("/fromWeixin")
	public String fromWeixin(HttpServletRequest request) {
		
		 //微信加密签名
        String signature = request.getParameter("signature");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
        // 随机字符串
        String echostr = request.getParameter("echostr");
		
        if (SignUtil.checkSignature(signature, timestamp, nonce)) {
            request.setAttribute("echostr", echostr);
        }
        
		return "";
	}
	
}
