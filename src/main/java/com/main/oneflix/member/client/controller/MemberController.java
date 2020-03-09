package com.main.oneflix.member.client.controller;

import java.util.Calendar;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.oneflix.inquiry.service.GetInquiryListService;
import com.main.oneflix.inquiry.service.InsertInquiryService;
import com.main.oneflix.inquiry.vo.InquiryVO;
import com.main.oneflix.member.service.DeleteMemberService;
import com.main.oneflix.member.service.GetMemberService;
import com.main.oneflix.member.service.InsertMemberService;
import com.main.oneflix.member.service.UpdateMemberService;
import com.main.oneflix.member.vo.MemberVO;
import com.main.oneflix.util.email.service.EmailService;

@Controller
public class MemberController {
	@Autowired
	InsertMemberService insertMemberService;
	@Autowired
	GetMemberService getMemberService;
	@Autowired
	UpdateMemberService updateMemberService;
	@Autowired
	DeleteMemberService deleteMemberService;
	@Autowired
	InsertInquiryService insertInquiryService;
	@Autowired
	GetInquiryListService getInquiryListService;
	@Autowired
	EmailService emailService;

	@RequestMapping("/join.do")
	public ModelAndView join(MemberVO vo,ModelAndView mav) {
		vo.setKakao(vo.getKakao());
		vo.setNaver(vo.getNaver());
		vo.setGoogle(vo.getGoogle());
		mav.addObject("member", vo);
		mav.setViewName("join");
		return mav;
	}

	@RequestMapping("/joinProc.do")
	public ModelAndView joinProc(MemberVO vo, HttpSession session, ModelAndView mav) {
		vo.setKakao(vo.getKakao());
		vo.setNaver(vo.getNaver());
		vo.setGoogle(vo.getGoogle());
		
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
	public ModelAndView certMail(HttpSession session,ModelAndView mav) {
		MemberVO vo = new MemberVO();
		vo = (MemberVO) session.getAttribute("member");
		
		try {
			InquiryVO inquiry = new InquiryVO();
			inquiry.setEmail(vo.getEmail());
			inquiry.setReplyTitle("[ONEFLIX] 계정 이메일 주소를 인증해주세요");
			inquiry.setReplyContent("<h2><strong>계정 인증</strong></h2>\r\n" + 
					"<p>"+vo.getNick()+"님 안녕하세요.</p>\r\n" + 
					"<p>원플릭스 계정 보호를 위해 이메일 인증이 필요합니다.<br/>이메일 인증 완료를 위해 아래 버튼을 눌러주세요.</p>\r\n" + 
					"<p><a href=\"http://localhost:8080/updateCertProc.do?email="+vo.getEmail()+"\">ONEFLIX로 가기</a></p>\r\n" + 
					"<p>감사합니다.<br/>ONEFLIX 드림</p>\r\n" + 
					"<p>Copyright &copy; 2019-2020 ONEFLIX, Inc..<br />All rights reserved.본 메일은 발신 전용입니다.</p>");
			emailService.sendEmail(inquiry);
			mav.addObject("certMailResult","success");
			mav.setViewName("redirect:/getMemberProc.do");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("certMailResult","fail");
			mav.setViewName("redirect:/getMemberProc.do");
		}
		return mav;
	}
	@RequestMapping("/updateCertProc.do")
	public ModelAndView updateCertProc(ModelAndView mav,HttpServletRequest request) {
		String email = (String) request.getParameter("email");
		String cert = "Y";
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo = getMemberService.getMember(vo);
		vo.setCert(cert);
		vo.setUpdateType("info");
		updateMemberService.updateMember(vo);
		
		mav.addObject("certConfirmResult", "success");
		mav.setViewName("certConfirm");
		return mav;
	}
	@RequestMapping("/updateMemberProc.do")
	public ModelAndView updateMemberProc(@RequestParam("newNick") String newNick,
			@RequestParam("newPass") String newPass, HttpSession session, ModelAndView mav) {
		MemberVO vo = (MemberVO) session.getAttribute("member");
		vo.setUpdateType("info");
		if(newNick == null || newNick.equals("")) {
			newNick = vo.getNick();
		} else if (newPass == null || newPass.equals("")) {
			newPass = vo.getPass();
		}
		vo.setNick(newNick);
		vo.setPass(newPass);
		updateMemberService.updateMember(vo);
		session.setAttribute("member", vo);
		mav.setViewName("redirect:/getMemberProc.do");
		return mav;
	}
	@RequestMapping(value = "/nickCheckProcAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public Properties nickCheckProcAjax(HttpSession session, @RequestParam("newNick") String newNick) {
		MemberVO memberNick = new MemberVO();
		memberNick.setNick(newNick);
		memberNick = getMemberService.getMember(memberNick);
		
		MemberVO vo = new MemberVO();
		vo = (MemberVO) session.getAttribute("member");
		
		Properties checkResult = new Properties();
		if(memberNick != null) {
			checkResult.put("newNickCheck", "fail");
		}
		return checkResult;
	}
	@RequestMapping(value = "/memberCheckProcAjax.do", method = RequestMethod.POST)
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
	public ModelAndView deleteDefense(ModelAndView mav) {
		mav.setViewName("deactivate");
		return mav;
	}
	@RequestMapping("/deactivateMailProcAjax.do")
	@ResponseBody
	public ModelAndView deactivateMail(HttpSession session,ModelAndView mav) {
		MemberVO vo = new MemberVO();
		vo = (MemberVO) session.getAttribute("member");
		
		try {
			InquiryVO inquiry = new InquiryVO();
			inquiry.setEmail(vo.getEmail());
			inquiry.setReplyTitle("[ONEFLIX] "+vo.getNick()+"님께서 요청하신 탈퇴 메일입니다");
			inquiry.setReplyContent("<h2><strong>탈퇴 요청 확인 메일</strong></h2>\r\n" + 
					"<p>"+vo.getNick()+"님 안녕하세요.</p>\r\n" + 
					"<p>정말로 탈퇴하실 거라면, 아래 버튼을 눌러주세요.<br/></p>\r\n" + 
					"<p><a href=\"http://localhost:8080/deleteMemberProc.do?email="+vo.getEmail()+"\">탈퇴하러 가기</a></p>\r\n" + 
					"<p>감사합니다.<br/>ONEFLIX 드림</p>\r\n" + 
					"<p>Copyright &copy; 2019-2020 ONEFLIX, Inc..<br />All rights reserved.본 메일은 발신 전용입니다.</p>");
			emailService.sendEmail(inquiry);
			mav.addObject("deactivateMailResult","success");
			mav.setViewName("redirect:/deactivate.do");
		} catch (Exception e) {
			e.printStackTrace();
			mav.addObject("deactivateMailResult","fail");
			mav.setViewName("redirect:/deactivate.do");
		}
		return mav;
	}
	@RequestMapping("/deleteMemberProc.do")
	public ModelAndView deleteMemberProc(ModelAndView mav,HttpServletRequest request,HttpSession session) {
		String email = (String) request.getParameter("email");
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		vo = getMemberService.getMember(vo);
		deleteMemberService.deleteMember(vo);
		session.invalidate();
		mav.addObject("deactivateResult", "success");
		mav.setViewName("deactivateConfirm");
		return mav;
	}
}

