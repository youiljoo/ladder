package com.mycompany.teamproject.member.naver;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mycompany.teamproject.member.kakao.KakaoController;
import com.mycompany.teamproject.member.vo.MemberVO;

@Controller
public class LoginController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		model.addAttribute("url", naverAuthUrl);
		model.addAttribute("kakao_url", kakaoUrl);
		return "login";
	}
	
	@RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
	public String callback(Model model, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
			apiResult = naverLoginBO.getUserProfile(oauthToken);
			
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(apiResult);
			JSONObject jsonObj = (JSONObject) obj;
			
			JSONObject response_obj = (JSONObject)jsonObj.get("response");
			String nickname = (String)response_obj.get("nickname");			
			System.out.println(nickname);
			session.setAttribute("isLogOn", true);
			session.setAttribute("memberInfo", memberVO);
			
			model.addAttribute("result", apiResult);
			return "main";
	}
	
	@RequestMapping(value = "/logout", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		
		return "redirect:main.jsp";
	}
	
	@RequestMapping(value="/kakaologin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		JsonNode node = KakaoController.getAccessToken(code);
		JsonNode accessToken = node.get("access_token");
		JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken);
		System.out.println("pp" + userInfo);
		String user_id = null;
		String name = null;
		String gender = null;
		String birthday = null;
		String age = null;
		String image = null;
		
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		user_id = kakao_account.path("email").asText();
		name = properties.path("nickname").asText();
		image = properties.path("profile_image").asText();
		gender = kakao_account.path("gender").asText();
		birthday = kakao_account.path("birthday").asText();
		age = kakao_account.path("age_range").asText();
		session.setAttribute("user_id", user_id);
		session.setAttribute("name", name);
		session.setAttribute("image", image);
		session.setAttribute("gender", gender);
		session.setAttribute("birthday", birthday);
		session.setAttribute("age", age);
		session.setAttribute("isLogOn", true);
		session.setAttribute("memberInfo", memberVO);
		mav.setViewName("main");
		return mav;
	}
}