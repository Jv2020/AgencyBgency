package NWH.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NWH.member.dao.MemberDao;
import NWH.member.dto.MemberDto;

@WebServlet("/memberinsert")
public class MemberInsert extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("memberId");
		String password = request.getParameter("memberPassword");
		String name = request.getParameter("memberName");
		String phone = request.getParameter("memberPhone");
		String email1 = request.getParameter("memberEmail1");
		String email2 = request.getParameter("memberEmail2");
		String year = request.getParameter("memberYear");
		String month = request.getParameter("memberMonth");
		String date = request.getParameter("memberDate");
		String gender = request.getParameter("memberGender");
		String PostCode = request.getParameter("memberPostCode");
		String StreetName = request.getParameter("memberStreetName");
		String DetailStreetName = request.getParameter("memberDetailStreetName");
		String question = request.getParameter("memberQuestion");
		String hint = request.getParameter("memberAnswer");
		String exhibit_name = request.getParameter("memberExhibit_name");
		String certi_num = request.getParameter("memberCerti_num");
		String sauth = request.getParameter("memberAuth");
		int auth = Integer.parseInt(sauth);

		System.out.println("memberId: " + id);
		System.out.println("memberPassword: " + password);
		System.out.println("memberName: " + name);
		System.out.println("memberPhone: " + phone);
		System.out.println("memberEmail1: " + email1);
		System.out.println("memberEmail2: " + email2);
		String email = email1 + "@" + email2;
		System.out.println("memberEmail: " + email);
		System.out.println("memberYear: " + year);
		System.out.println("memberMonth: " + month);
		if (date.length() < 2) {
			date = "0" + date;
		}
		System.out.println("0작업후 : " + date);
		String birthday = year + "-" + month + "-" + date;
		System.out.println("memberBirth: " + birthday);
		System.out.println("memberGender: " + gender);
		System.out.println("memberPostCode: " + PostCode);
		System.out.println("memberStreetName: " + StreetName);
		System.out.println("memberDetailStreetName: " + DetailStreetName);
		String address = PostCode + "/" + StreetName + "/" + DetailStreetName;
		System.out.println("memberAddress: " + address);
		System.out.println("memberQuestion: " + question);
		System.out.println("memberAnswer: " + hint);
		System.out.println("memberExhibit_name: " + exhibit_name);
		System.out.println("memberCerti_num: " + certi_num);
		System.out.println("memberAuth: " + auth);

		// date가 한자리 수일때 0 붙여주는 작업

		MemberDao dao = MemberDao.getInstance();

		boolean isS = dao.addMember(new MemberDto(id, password, name, email, address, birthday, gender, phone, question,
				hint, exhibit_name, certi_num, 0, auth));

		
			resp.sendRedirect(request.getContextPath() + "/member/joinAf.jsp?isS"+isS);

	}

}