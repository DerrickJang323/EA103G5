package com.tracking_list.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.course.model.CourseService;
import com.course.model.CourseVO;
import com.members.model.MembersVO;
import com.report_detail.model.ReportDetailService;
import com.report_detail.model.ReportDetailVO;
import com.tracking_list.model.TrackingListService;
import com.tracking_list.model.TrackingListVO;

public class TrackingListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");
		String action = req.getParameter("action");

		System.out.println(action);
		
		
		MembersVO membersVO = (MembersVO) req.getSession().getAttribute("loginMembersVO");
		String memno = membersVO.getMemno();
		
		String courseno = req.getParameter("courseno");

		if ("insert".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {

				TrackingListService trackinglistSvc = new TrackingListService();

				trackinglistSvc.addTracking(memno, courseno);
			} catch (Exception e) {
				errorMsgs.add("無法取得要新增的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("新增失敗小視窗.jsp");
				failureView.forward(req, res);
			}

		}

		if ("delete".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				System.out.println(memno + " , " + courseno);
				TrackingListService trackinglistSvc = new TrackingListService();
				int count = trackinglistSvc.deleteTracking(memno, courseno);
				
				String result = "false";
				
				if(count > 0) {
					result = "true";
				}
				
				
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.write(result);
				out.flush();
				
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("新增失敗小視窗.jsp");
				failureView.forward(req, res);
			}
		}

		if ("shoppingCart".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			CourseService courseSvc = new CourseService();

			CourseVO userSelectedCourse = courseSvc.getOneCourse(courseno);

			String jsonStr = "false";
			//刪除判斷旗標
			String remove = req.getParameter("remove");
			
			List<CourseVO> shoppingList = (List<CourseVO>) req.getSession().getAttribute("shoppingList");

			try {
				if (shoppingList == null) {
					shoppingList = new ArrayList<>();
				}
				if (shoppingList != null && !(shoppingList.contains(userSelectedCourse))) {

					shoppingList.add(userSelectedCourse);
					jsonStr = new JSONObject(userSelectedCourse).toString();
					
				} 
				else if("remove".equals(remove)) {
					System.out.println("刪除購物車");
					shoppingList.remove(userSelectedCourse);
				}
				
				
				
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.write(jsonStr);
				out.flush();
				out.close();
				
				
				req.getSession().setAttribute("shoppingList", shoppingList);
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("新增失敗小視窗.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getAllTrackingListByMemno".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				CourseService courseSvc = new CourseService();
				
				TrackingListService trackilistSvc = new TrackingListService();
				List<TrackingListVO> trackinglistVOList = trackilistSvc.getAll(memno);
				
				List<CourseVO> courseProductList = new ArrayList<>();
				
				for(TrackingListVO vo : trackinglistVOList) {
					courseProductList.add(courseSvc.getOneCourse(vo.getCourseno()));
				}
				
				
				String str = new JSONArray(courseProductList).toString();

				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.write(str);
				out.flush();
				out.close();

			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("新增失敗小視窗.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
