package com.main.oneflix.member.client.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.service.DeleteMemberService;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.service.InsertMemberService;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.screen.service.GetScreenListService;
import com.main.oneflix.screen.vo.ScreenVO;
import com.main.oneflix.term.service.GetTermListService;
import com.main.oneflix.term.vo.TermVO;
import com.main.oneflix.util.email.service.EmailService;

@Controller
public class MemberController {
	@Autowired
	private InsertMemberService insertMemberService;
	@Autowired
	private GetTermListService getTermListService;
	@Autowired
	private GetMemberService getMemberService;
	@Autowired
	private UpdateMemberService updateMemberService;
	@Autowired
	private DeleteMemberService deleteMemberService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private GetScreenListService getScreenListService;

	@RequestMapping("/join.do")
	public ModelAndView join(MemberVO vo,ModelAndView mav) {
		List<TermVO> termList = getTermListService.getTermList(new TermVO());
		vo.setKakao(vo.getKakao());
		vo.setNaver(vo.getNaver());
		mav.addObject("termList", termList);
		mav.addObject("member", vo);
		mav.setViewName("join");
		return mav;
	}

	@RequestMapping("/joinProc.do")
	public ModelAndView joinProc(MemberVO vo, ModelAndView mav) {
		vo.setKakao(vo.getKakao());
		vo.setNaver(vo.getNaver());
		
		// member 나이계산
		int memberAge = 0;
		String memberBirth = vo.getBirth();
		int memberBirthYear = Integer.parseInt(memberBirth.substring(0, 4));
		int thisYear = Calendar.getInstance().get(Calendar.YEAR);
		memberAge = thisYear - memberBirthYear + 1;
		vo.setMemberAge(memberAge);
		insertMemberService.insertMember(vo);
		
		mav.addObject("joinResult", "success");
		mav.addObject("member", vo);
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/getMemberProc.do")
	public ModelAndView getMemberProc(ModelAndView mav) {
		mav.setViewName("updateMember");
		return mav;
	}
	
	@RequestMapping("/certMailProcAjax.do")
	@ResponseBody
	public String certMail(MemberVO vo) {
		try {
			InquiryVO inquiry = new InquiryVO();
			inquiry.setEmail(vo.getEmail());
			inquiry.setReplyTitle("[ONEFLIX] " + vo.getNick()+ "님 계정 이메일 주소를 인증해주세요");
			inquiry.setReplyContent("<h2><strong>계정 인증</strong></h2>\r\n" + 
					"<p>"+vo.getNick()+"님 안녕하세요.</p>\r\n" + 
					"<p>원플릭스 계정 보호를 위해 이메일 인증이 필요합니다.<br/>이메일 인증 완료를 위해 아래 버튼을 눌러주세요.</p>" +
					"<br>" +
					"<p>" +
						"<a style=\"text-decoration: none;\" href=\"http://localhost:8080/updateCertProc.do?email=" + vo.getEmail() + "\">" +
							"<button type=\"button\" style=\"border: 1px solid #080808; border-radius: 5px; outline: none; width: 150px; height: 80px; font-size: 15px; color: #FFF; background: #2E2E2E\">ONEFLIX로 가기</button>" + 
						"</a>" +
					"</p>" +
					"<br>" + 
					"<p>감사합니다.<br/>ONEFLIX 드림</p>\r\n" + 
					"<p>Copyright &copy; 2015-2020 ONEFLIX, Inc..<br />All rights reserved.본 메일은 발신 전용입니다.</p>");
			emailService.sendEmail(inquiry);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	@RequestMapping("/updateCertProc.do")
	public ModelAndView updateCertProc(MemberVO vo, ModelAndView mav, HttpSession session) {
		String cert = "Y";
		vo = getMemberService.getMember(vo);
		vo.setCert(cert);
		vo.setUpdateType("info");
		updateMemberService.updateMember(vo);
		session.setAttribute("member", vo);
		mav.addObject("certConfirmResult", "success");
		mav.setViewName("certConfirm");
		return mav;
	}
	@RequestMapping("/updateMemberProc.do")
	public ModelAndView updateMemberProc(MemberVO vo, HttpSession session, ModelAndView mav) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		member.setUpdateType("info");
		member.setNick(vo.getNewNick());
		member.setPass(vo.getNewPass());
		updateMemberService.updateMember(member);
		session.setAttribute("member", member);
		mav.setViewName("redirect:/getMemberProc.do");
		return mav;
	}
	@RequestMapping("/nickCheckProcAjax.do")
	@ResponseBody
	public String nickCheckProcAjax(MemberVO vo) {
		vo.setNick(vo.getNewNick());
		vo = getMemberService.getMember(vo);
		if(vo != null) {
			return "fail";
		}
		return "success";
	}
	@RequestMapping("/memberCheckProcAjax.do")
	@ResponseBody
	public Properties memberCheckProcAjax(MemberVO vo) {
		MemberVO memberEmail = new MemberVO();
		memberEmail.setEmail(vo.getEmail());
		MemberVO memberNick = new MemberVO();
		memberNick.setNick(vo.getNick());
		
		memberEmail = getMemberService.getMember(memberEmail);
		memberNick = getMemberService.getMember(memberNick);
		Properties checkResult = new Properties();
			if(memberEmail != null && memberNick != null) {
				checkResult.put("memberCheck", "fail");
			} else if (memberEmail != null) {
				checkResult.put("emailCheck", "fail");
			} else if (memberNick != null) {
				checkResult.put("nickCheck", "fail");
			} else {
				checkResult.put("memberCheck", "success");
			}
		return checkResult;
	}

	@RequestMapping("/deactivate.do")
	public ModelAndView deactivate(ModelAndView mav) {
		ScreenVO screen = new ScreenVO();
		screen.setScreenType("deactivate");
		List<ScreenVO> screenList = getScreenListService.getScreenList(screen);
		mav.addObject("screenList", screenList);
		mav.setViewName("deactivate");
		return mav;
	}
	@RequestMapping("/deactivateMailProcAjax.do")
	@ResponseBody
	public String deactivateMail(MemberVO vo) {
		try {
			InquiryVO inquiry = new InquiryVO();
			inquiry.setEmail(vo.getEmail());
			inquiry.setReplyTitle("[ONEFLIX] "+vo.getNick()+"님께서 요청하신 탈퇴 메일입니다");
			inquiry.setReplyContent("<h2><strong>탈퇴 요청 확인 메일</strong></h2>\r\n" + 
					"<p>"+vo.getNick()+"님 안녕하세요.</p>\r\n" + 
					"<p>정말로 탈퇴하실 거라면, 아래 버튼을 눌러주세요.</p>" + 
					"<br>" +
					"<p>" +
						"<a style=\"text-decoration: none;\" href=\"http://localhost:8080/deleteMemberProc.do?email=" + vo.getEmail() + "\">" +
							"<button type=\"button\" style=\"border: 1px solid #080808; border-radius: 5px; outline: none; width: 150px; height: 80px; font-size: 15px; color: #FFF; background: #2E2E2E\">탈퇴하러 가기</button>" + 
						"</a>" +
					"</p>" +
					"<br>" + 
					"<p>감사합니다.<br/>ONEFLIX 드림</p>\r\n" + 
					"<p>Copyright &copy; 2015-2020 ONEFLIX, Inc..<br />All rights reserved.본 메일은 발신 전용입니다.</p>");
			emailService.sendEmail(inquiry);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	@RequestMapping("/deleteMemberProc.do")
	public ModelAndView deleteMemberProc(MemberVO vo, ModelAndView mav, HttpSession session) {
		vo = getMemberService.getMember(vo);
		deleteMemberService.deleteMember(vo);
		session.invalidate();
		mav.addObject("deactivateResult", "success");
		mav.setViewName("deactivateConfirm");
		return mav;
	}
}

