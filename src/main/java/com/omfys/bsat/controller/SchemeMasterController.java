
package com.omfys.bsat.controller;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.omfys.bsat.repository.DashbordDAO;
import com.omfys.bsat.repository.SchemeMasterDao;
import com.omfys.bsat.repository.SchemeRequestDao;
import com.omfys.bsat.TilesConfiguration;
import com.omfys.bsat.model.Bpil_BatRwAnalysis_Process_Queue;
import com.omfys.bsat.model.Bpil_BatRwAnalysis_Process_Queue2;
import com.omfys.bsat.model.Bpil_BatRwAnalysis_Process_Queue3;
import com.omfys.bsat.model.Bpil_BatRwAnalysis_Process_Queue4;
import com.omfys.bsat.model.Bpil_BatRwAnalysis_Process_Queue5;
import com.omfys.bsat.model.Bpil_BatSchAnalysis_Process_Queue;
import com.omfys.bsat.model.Bpil_BatSchAnalysis_Process_Queue2;
import com.omfys.bsat.model.Bpil_BatSchAnalysis_Process_Queue3;
import com.omfys.bsat.model.Bpil_BatSchAnalysis_Process_Queue4;
import com.omfys.bsat.model.Bpil_BatSchAnalysis_Process_Queue5;
import com.omfys.bsat.model.Bpil_Fin_Year;
import com.omfys.bsat.model.Bpil_Gift_Master;
import com.omfys.bsat.model.Bpil_LookupValues;
import com.omfys.bsat.model.Bpil_Opa_Rw_Analysis_Rw;
import com.omfys.bsat.model.Bpil_Product_mstr;
import com.omfys.bsat.model.Bpil_Reward_Exception;
import com.omfys.bsat.model.Bpil_Scheme_Benefit;
import com.omfys.bsat.model.Bpil_Scheme_Cust_Types;
import com.omfys.bsat.model.Bpil_Scheme_Depots_Details;
import com.omfys.bsat.model.Bpil_Scheme_Doc;
import com.omfys.bsat.model.Bpil_Scheme_Exception;
import com.omfys.bsat.model.Bpil_Scheme_IT_Product;
import com.omfys.bsat.model.Bpil_Scheme_Product;
import com.omfys.bsat.model.Bpil_Scheme_Product_Outflow;
import com.omfys.bsat.model.Bpil_User_ProfileId_List;
import com.omfys.bsat.model.Bpil_Users;
import com.omfys.bsat.model.Bpil_notification;
import com.omfys.bsat.model.FOC;
import com.omfys.bsat.model.ItemCodeList;
import com.omfys.bsat.model.New_Scheme_mstr;
import com.omfys.bsat.model.New_Scheme_mstr_for_Crm;
import com.omfys.bsat.model.PRD_Outflow;
import com.omfys.bsat.model.Useraccess_userlist;

import oracle.jdbc.internal.OracleTypes;

@Controller
public class SchemeMasterController {

	@Autowired
	SchemeMasterDao schememasterdao;

	@Autowired
	SchemeRequestDao schemerequestdao;

	@Autowired
	DashbordDAO dao;

	@Autowired
	private TilesConfiguration hibernateConfiguration;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private JdbcTemplate jdbctemplate;

	@RequestMapping("/schememaster")
	public ModelAndView schememaster(ModelMap map, Model model, HttpServletRequest request) {
		String loginString = (String) request.getSession().getAttribute("loginflag");

		try {
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				String kwm_user = (String) request.getSession().getAttribute("kwm_user");

				if (kwm_user != null) {
					int userid = (Integer) request.getSession().getAttribute("userid");
					int profile_id = (Integer) request.getSession().getAttribute("profileid");
					String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");
					
					System.out.println("The user id send for dao method is ___ "+userid);

					ArrayList<New_Scheme_mstr> doc_line = schememasterdao.masterautofill(profile_id, userid,
							PMG_ML_Group);
					model.addAttribute("schememaster", doc_line);

				}
				return new ModelAndView("SchemeMaster");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/rewardexception")
	public ModelAndView rewardexception(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			int profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				if (profile_id == Bpil_User_ProfileId_List.IT_PROFILE_ID) {

					String kwm_user = (String) request.getSession().getAttribute("kwm_user");

					if (kwm_user != null) {
						int userid = (Integer) request.getSession().getAttribute("userid");

						String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

						ArrayList<Bpil_Reward_Exception> sch = (ArrayList<Bpil_Reward_Exception>) hibernateTemplate
								.find("from Bpil_Reward_Exception");
						model.addAttribute("schememaster", sch);

					}
					return new ModelAndView("RewardException");

				} else {
					return new ModelAndView("unauthorizedattempt");
				}

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/schemeanalysisexception")
	public ModelAndView schemeanalysisexception(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			int profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				if (profile_id == Bpil_User_ProfileId_List.IT_PROFILE_ID) {

					String kwm_user = (String) request.getSession().getAttribute("kwm_user");

					if (kwm_user != null) {
						int userid = (Integer) request.getSession().getAttribute("userid");

						String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

						ArrayList<Bpil_Scheme_Exception> sch = (ArrayList<Bpil_Scheme_Exception>) hibernateTemplate
								.find("from Bpil_Scheme_Exception");
						model.addAttribute("schememaster", sch);

					}
					return new ModelAndView("SchemeAnalysisException");

				} else {
					return new ModelAndView("unauthorizedattempt");
				}

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/rewardprocessingrequest")
	public ModelAndView rewardprocessingrequestn(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			int profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				if (profile_id == Bpil_User_ProfileId_List.IT_PROFILE_ID) {

					String kwm_user = (String) request.getSession().getAttribute("kwm_user");

					if (kwm_user != null) {
						int userid = (Integer) request.getSession().getAttribute("userid");

						String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

						ArrayList<Bpil_BatRwAnalysis_Process_Queue> sch = (ArrayList<Bpil_BatRwAnalysis_Process_Queue>) hibernateTemplate
								.find("from Bpil_BatRwAnalysis_Process_Queue where status = 'Pending' or status = 'Processed'");
						model.addAttribute("schememaster", sch);

						ArrayList<Bpil_BatRwAnalysis_Process_Queue2> sch2 = (ArrayList<Bpil_BatRwAnalysis_Process_Queue2>) hibernateTemplate
								.find("from Bpil_BatRwAnalysis_Process_Queue2 where status = 'Pending' or status = 'Processed'");
						model.addAttribute("schememaster2", sch2);

						ArrayList<Bpil_BatRwAnalysis_Process_Queue3> sch3 = (ArrayList<Bpil_BatRwAnalysis_Process_Queue3>) hibernateTemplate
								.find("from Bpil_BatRwAnalysis_Process_Queue3 where status = 'Pending' or status = 'Processed'");
						model.addAttribute("schememaster3", sch3);

						ArrayList<Bpil_BatRwAnalysis_Process_Queue4> sch4 = (ArrayList<Bpil_BatRwAnalysis_Process_Queue4>) hibernateTemplate
								.find("from Bpil_BatRwAnalysis_Process_Queue4 where status = 'Pending' or status = 'Processed'");
						model.addAttribute("schememaster4", sch4);

						ArrayList<Bpil_BatRwAnalysis_Process_Queue5> sch5 = (ArrayList<Bpil_BatRwAnalysis_Process_Queue5>) hibernateTemplate
								.find("from Bpil_BatRwAnalysis_Process_Queue5 where status = 'Pending' or status = 'Processed'");
						model.addAttribute("schememaster5", sch5);

					}
					return new ModelAndView("RewardProcessingRequest");

				} else {
					return new ModelAndView("unauthorizedattempt");
				}

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/schemeanalysisrequest")
	public ModelAndView schemeanalysisrequest(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			int profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				if (profile_id == Bpil_User_ProfileId_List.IT_PROFILE_ID) {

					int userid = (Integer) request.getSession().getAttribute("userid");

					String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

					ArrayList<Bpil_BatSchAnalysis_Process_Queue> sch = (ArrayList<Bpil_BatSchAnalysis_Process_Queue>) hibernateTemplate
							.find("from Bpil_BatSchAnalysis_Process_Queue where status = 'Pending'");
					model.addAttribute("schememaster", sch);

					ArrayList<Bpil_BatSchAnalysis_Process_Queue2> sch2 = (ArrayList<Bpil_BatSchAnalysis_Process_Queue2>) hibernateTemplate
							.find("from Bpil_BatSchAnalysis_Process_Queue2 where status = 'Pending'");
					model.addAttribute("schememaster2", sch2);

					ArrayList<Bpil_BatSchAnalysis_Process_Queue3> sch3 = (ArrayList<Bpil_BatSchAnalysis_Process_Queue3>) hibernateTemplate
							.find("from Bpil_BatSchAnalysis_Process_Queue3 where status = 'Pending'");
					model.addAttribute("schememaster3", sch3);

					ArrayList<Bpil_BatSchAnalysis_Process_Queue4> sch4 = (ArrayList<Bpil_BatSchAnalysis_Process_Queue4>) hibernateTemplate
							.find("from Bpil_BatSchAnalysis_Process_Queue4 where status = 'Pending'");
					model.addAttribute("schememaster4", sch4);

					ArrayList<Bpil_BatSchAnalysis_Process_Queue5> sch5 = (ArrayList<Bpil_BatSchAnalysis_Process_Queue5>) hibernateTemplate
							.find("from Bpil_BatSchAnalysis_Process_Queue5 where status = 'Pending'");
					model.addAttribute("schememaster5", sch5);

					return new ModelAndView("SchemeAnalysisRequest");

				} else {
					return new ModelAndView("unauthorizedattempt");
				}

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/clearSchemeExceptions")
	public ModelAndView clearSchemeExceptions(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				String kwm_user = (String) request.getSession().getAttribute("kwm_user");
				System.out.println("clear Scheme Exceptions");
				if (kwm_user != null) {
					String query2 = "delete from BPIL_SCHEME_EXCEPTION";
					jdbcTemplate.update(query2);
				}
				return new ModelAndView("SchemeAnalysisException");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/clearRewardExceptions")
	public ModelAndView clearRewardExceptions(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				String kwm_user = (String) request.getSession().getAttribute("kwm_user");
				System.out.println("clear Scheme Exceptions");
				if (kwm_user != null) {
					String query2 = "delete from BPIL_REWARD_EXCEPTION";
					jdbcTemplate.update(query2);
				}
				return new ModelAndView("RewardException");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/pushNotification")
	public ModelAndView pushNotification(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				String kwm_user = (String) request.getSession().getAttribute("kwm_user");
				if (kwm_user != null) {

				}
				return new ModelAndView("PushNotification");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/copyschememaster")
	public ModelAndView copyschememaster(ModelMap map, Model model, HttpServletRequest request) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			int profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				String kwm_user = (String) request.getSession().getAttribute("kwm_user");

				if (kwm_user != null) {
					int userid = (Integer) request.getSession().getAttribute("userid");

					String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

					ArrayList<New_Scheme_mstr> doc_line = schememasterdao.masterautofill(profile_id, userid,
							PMG_ML_Group);
					model.addAttribute("schememaster", doc_line);

				}
				return new ModelAndView("CopySchemeMaster");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes
																	// to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to
																// here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/copyschemehistoryforit")
	public ModelAndView schemehistory(ModelMap map, Model model, HttpServletRequest request) {

//		String sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE FROM BPIL_SCHEME_MASTER WHERE ACTIVE_FLAG='Requested' OR ACTIVE_FLAG='Active'OR ACTIVE_FLAG='Review' ORDER BY SCHEME_ID DESC";

		String sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE FROM BPIL_SCHEME_MASTER ORDER BY SCHEME_ID DESC";

		List<New_Scheme_mstr> dml = jdbctemplate.query(sql, new RowMapper<New_Scheme_mstr>() {

			@Override
			public New_Scheme_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
				New_Scheme_mstr aContact = new New_Scheme_mstr();

				aContact.setScheme_id(rs.getInt("SCHEME_ID"));
				aContact.setScheme_code(rs.getString("SCHEME_CODE"));
				aContact.setScheme_name(rs.getString("SCHEME_NAME"));
				aContact.setActive_flag(rs.getString("ACTIVE_FLAG"));

				if (rs.getDate("START_DATE") != null) {
					DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
					String dateStr1 = ser1.format(rs.getDate("START_DATE"));
					System.out.println(dateStr1+"           ------------------------");
					aContact.setStart_date1(dateStr1);
//							try {
//								System.out.println(ser1.parse(rs.getString("START_DATE")));
//							} catch (ParseException e) {
//									e.printStackTrace();
//							}
				}

				if (rs.getDate("END_DATE") != null) {
					DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
					String dateStr1 = ser1.format(rs.getDate("END_DATE"));
					aContact.setEnd_date1(dateStr1);
//							try {
//								System.out.println(ser1.parse(rs.getString("END_DATE")));
//							} catch (ParseException e) {
//									e.printStackTrace();
//							}
				}

				return aContact;
			}

		});

		model.addAttribute("schememaster", dml);

		return new ModelAndView("CopySchemeMaster");
	}

	@RequestMapping("/pendingschemeapproval")
	public ModelAndView pendingschemeapproval(ModelMap map, Model model, HttpServletRequest request) {
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");

		if (kwm_user != null) {
			int userid = (Integer) request.getSession().getAttribute("userid");
			int profile_id = (Integer) request.getSession().getAttribute("profileid");
			String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

			ArrayList<New_Scheme_mstr> doc_line = schememasterdao.pendingscehememasterautofill(profile_id, userid,
					PMG_ML_Group);
			model.addAttribute("schememaster", doc_line);

		}
		return new ModelAndView("PendingSchemeApproval");
	}

	@RequestMapping("/pendingITschemeapproval")
	public ModelAndView pendingITschemeapproval(ModelMap map, Model model, HttpServletRequest request) {
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");

		if (kwm_user != null) {
			int userid = (Integer) request.getSession().getAttribute("userid");
			int profile_id = (Integer) request.getSession().getAttribute("profileid");
			String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

			ArrayList<New_Scheme_mstr> doc_line = schememasterdao.pendingscehememasterautofill(profile_id, userid,
					PMG_ML_Group);
			model.addAttribute("schememaster", doc_line);

		}
		return new ModelAndView("PendingITSchemeApproval");
	}

	@RequestMapping(value = "/load_Pending_IT_Scheme_Approval", method = RequestMethod.GET)
	public void load_Pending_IT_Scheme_Approval(String desc, HttpServletRequest request, Model model,
			HttpServletResponse response) {

		try {

			String kwm_user = (String) request.getSession().getAttribute("kwm_user");

			if (kwm_user != null) {
				int userid = (Integer) request.getSession().getAttribute("userid");
				int profile_id = (Integer) request.getSession().getAttribute("profileid");
				String PMG_ML_Group = (String) request.getSession().getAttribute("PMG_ML_grp");

				ArrayList<New_Scheme_mstr> doc_line = schememasterdao.pendingscehememasterautofill(profile_id, userid,
						PMG_ML_Group);
				// model.addAttribute("schememaster",doc_line);

				String json = null;

				json = new Gson().toJson(doc_line);
				response.setContentType("application/json");
				response.getWriter().write(json);
			}
		} catch (Exception e) {

		}
	}

	/*------------ code for autofill request scheme detail for ------*/
	@RequestMapping("/schemedetails")
	public ModelAndView schemedetails(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map, Model model,
			HttpServletRequest request) {
		String staus = null;
		int profile_id = (Integer) request.getSession().getAttribute("profileid");
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");
		int userid = (Integer) request.getSession().getAttribute("userid");
		if (kwm_user != null) {

			int schemeid = Integer.parseInt(scheme_id);
			New_Scheme_mstr mstr = schememasterdao.schemeautofill(schemeid);
			System.out.println(mstr.getCust_club_class());
			staus = mstr.getActive_flag();

//        if(mstr.getAttribute3() != null && mstr.getAttribute3() != "") {
//        
//		ArrayList<New_Scheme_mstr> ps = (ArrayList<New_Scheme_mstr>) hibernateTemplate.find("from New_Scheme_mstr where scheme_id = '"+mstr.getAttribute3()+"'");
//
//		mstr.setAttribute4(ps.get(0).getScheme_name());
//        }

			ArrayList<Bpil_Scheme_Doc> doc_line = schememasterdao.docautofill(schemeid);

			ArrayList<Bpil_Scheme_Benefit> gift_line = schememasterdao.giftautofill(schemeid);

			if (!gift_line.isEmpty()) {
				for (Bpil_Scheme_Benefit gift : gift_line) {
					int gift_id = gift.getGift_id();
					ArrayList<Bpil_Gift_Master> aa = (ArrayList<Bpil_Gift_Master>) hibernateTemplate
							.find("from Bpil_Gift_Master where gift_id = " + gift_id);
					String name = aa.get(0).getGift_name();
					gift.setAttribute1(name);

				}

				model.addAttribute("gift_list", gift_line);
			}

			List<String> gift_group_list = new ArrayList<String>();
			String datavalue = "GIFT_GROUP";
			System.out.println("doa lookup " + datavalue);
			CallableStatement cStmt;
			try {
				cStmt = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
				cStmt.setString(1, datavalue);
				cStmt.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result = cStmt.executeQuery();
				ResultSet rs1 = (ResultSet) cStmt.getObject(2);
				while (rs1.next()) {
					String data = rs1.getString(1);
					System.out.println("data " + data);
					gift_group_list.add(data);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			model.addAttribute("gift_group_list", gift_group_list);

			ArrayList<Bpil_Scheme_Product> prd = (ArrayList<Bpil_Scheme_Product>) hibernateTemplate
					.find("from Bpil_Scheme_Product where scheme_id = " + schemeid);

			ArrayList<Bpil_Scheme_IT_Product> itprd = (ArrayList<Bpil_Scheme_IT_Product>) hibernateTemplate
					.find("from Bpil_Scheme_IT_Product where scheme_id =" + schemeid);

			String sql = "select DISTINCT PRD_CODE from BPIL_PRODUCT_MASTER ORDER BY PRD_CODE";

			List<Bpil_Product_mstr> prd_code = jdbctemplate.query(sql, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_code(rs.getString("PRD_CODE"));

					return aContact;
				}

			});

			String sql2 = "select DISTINCT PRD_GRP from BPIL_PRODUCT_MASTER ORDER BY PRD_GRP";

			List<Bpil_Product_mstr> prd_grp = jdbctemplate.query(sql2, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_grp(rs.getString("PRD_GRP"));

					return aContact;
				}

			});

			String sql3 = "select DISTINCT PRD_CAT from BPIL_PRODUCT_MASTER ORDER BY PRD_CAT";

			List<Bpil_Product_mstr> prd_cat = jdbctemplate.query(sql3, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_cat(rs.getString("PRD_CAT"));

					return aContact;
				}

			});

			model.addAttribute("prd_code_list", prd_code);
			model.addAttribute("prd_grp_list", prd_grp);
			model.addAttribute("prd_cat_list", prd_cat);

			ArrayList<Bpil_Scheme_Product_Outflow> prdoutflow = (ArrayList<Bpil_Scheme_Product_Outflow>) hibernateTemplate
					.find("from Bpil_Scheme_Product_Outflow where scheme_id = " + schemeid);

			for (Bpil_Scheme_Product_Outflow Product_Outflow : prdoutflow) {
				System.out.println(Product_Outflow.getLly_vol()+"          ----------------------getLly_vol()");
				System.out.println(Product_Outflow.getLly_val()+"          ----------------------getLly_val()");
				System.out.println(Product_Outflow.getLy_vol()+"          ----------------------getLy_vol()");
				System.out.println(Product_Outflow.getLy_val()+"          ----------------------getLy_val");
				System.out.println(Product_Outflow.getProj_ty_vol()+"          ----------------------getProj_ty_vol");
				System.out.println(Product_Outflow.getProj_ty_val()+"          ----------------------getProj_ty_val");
				Product_Outflow.setLly_vol_div(Product_Outflow.getLly_vol() / 1000);
				Product_Outflow.setLly_val_div(Product_Outflow.getLly_val() / 10000000);
				Product_Outflow.setLy_vol_div(Product_Outflow.getLy_vol() / 1000);
				Product_Outflow.setLy_val_div(Product_Outflow.getLy_val() / 10000000);
				Product_Outflow.setProj_ty_vol_div(Product_Outflow.getProj_ty_vol() / 1000);
				Product_Outflow.setProj_ty_val_div(Product_Outflow.getProj_ty_val() / 10000000);
			}

			List<String> prd_outflow_line_type_list = new ArrayList<String>();
			String prd_outflow_line_type = "PRD_OUTFLOW_LINE_TYPE";
			CallableStatement cStmt2;
			try {
				cStmt2 = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
				cStmt2.setString(1, prd_outflow_line_type);
				cStmt2.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result = cStmt2.executeQuery();
				ResultSet rs1 = (ResultSet) cStmt2.getObject(2);
				while (rs1.next()) {
					String data = rs1.getString(1);
//				System.out.println("data "+data);
					prd_outflow_line_type_list.add(data);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			model.addAttribute("prd_outflow_line_type_list", prd_outflow_line_type_list);

			// if((profile_id==3 && !staus.equals("Requested")) || (profile_id==6 &&
			// !staus.equals("Incomplete") && !staus.equals("Requested")) )
			/*
			 * if(mstr.getAppl_depot_code()!=null || mstr.getAppl_depot_code()!="") { String
			 * depots = mstr.getAppl_depot_code(); if(depots!=null && depots!="") { String
			 * depo1[] = depots.split(","); String depo[] = new String[depo1.length] ;
			 * for(int i=0;i<depo1.length;i++) {
			 * 
			 * ArrayList<Bpil_Depot_Master> getdata = (ArrayList<Bpil_Depot_Master>)
			 * hibernateTemplate.find("from Bpil_Depot_Master where depot_code=?",depo1[i]);
			 * 
			 * depo[i] = getdata.get(0).getDepot_name(); }
			 * 
			 * model.addAttribute("depo1",depo1); model.addAttribute("depo",depo); } }
			 */
			if (mstr.getAppl_depot_code() != null || mstr.getAppl_depot_code() != "") {
				String depots = mstr.getAppl_depot_code();
				if (depots != null && depots != "") {
					String depo1[] = depots.split(",");
					System.out.println("Length of depots selected:-" + depo1.length);
					/*
					 * String depo[] = new String[depo1.length] ; for(int i=0;i<depo1.length;i++) {
					 * 
					 * ArrayList<Bpil_Depot_Master> getdata = (ArrayList<Bpil_Depot_Master>)
					 * hibernateTemplate.find("from Bpil_Depot_Master where depot_code=?",depo1[i]);
					 * 
					 * depo[i] = getdata.get(0).getDepot_name(); }
					 */

					model.addAttribute("depo1", depo1);
					// model.addAttribute("depo",depo);
				}
			}
			ArrayList<Bpil_Scheme_Depots_Details> schdepos = (ArrayList<Bpil_Scheme_Depots_Details>) hibernateTemplate
					.find("from Bpil_Scheme_Depots_Details where scheme_id =" + schemeid);

			model.addAttribute("schdepos", schdepos);

			ArrayList<Bpil_Scheme_Cust_Types> schcusttypes = (ArrayList<Bpil_Scheme_Cust_Types>) hibernateTemplate
					.find("from Bpil_Scheme_Cust_Types where scheme_id = " + schemeid);

			model.addAttribute("schcusttypes", schcusttypes);

			///

			int user_id = mstr.getCreated_by();
			ArrayList<Bpil_Users> getdata = (ArrayList<Bpil_Users>) hibernateTemplate
					.find("from Bpil_Users where user_id = " + user_id);

			String fname = getdata.get(0).getFirst_name();
			String lname = getdata.get(0).getLast_name();

			Integer it_prd_size = itprd.size();

			model.addAttribute("scheme_id", scheme_id);
			model.addAttribute("firstname", fname);
			model.addAttribute("lastname", lname);
			model.addAttribute("JSON", mstr);
			model.addAttribute("doc_list", doc_line);
			model.addAttribute("product_list", prd);
			model.addAttribute("it_product_list", itprd);
			model.addAttribute("it_product_size", it_prd_size);
			model.addAttribute("product_outflow_list", prdoutflow);
		}
		String s="success";
		map.addAttribute("success", s);
		if (profile_id == 6) {
			if (staus.equals("Incomplete")) {
				return new ModelAndView("SchemeDetails");
			} else if (staus.equals("Cancel")) {
				return new ModelAndView("SchemeDetails");
			} else if (staus.equals("Rejected")) {
				return new ModelAndView("SchemeDetails");
			} else {

				/*
				 * if(staus.equals("Requested")) { return new ModelAndView("SchemeDetails");
				 * }else{
				 */
				return new ModelAndView("HistoryDetails");
			}
		} else if (profile_id == 3) {
			if (staus.equals("Requested")) {
				return new ModelAndView("IT_SchemeDetails");
			} else if (staus.equals("Incomplete")) {
				return new ModelAndView("SchemeDetails");
			} else if (staus.equals("Cancel")) {
				return new ModelAndView("SchemeDetails");
			} else if (staus.equals("Rejected")) {
				return new ModelAndView("SchemeDetails");
			} else {
				return new ModelAndView("HistoryDetails");
			}

		} else if (profile_id == 1) {
			return new ModelAndView("Dealer_scheme_Details");

		}
		   else if(profile_id == 9){
		    	
		    	if(staus.equals("Pending for RG Approval"))
		    	{
		    		return new ModelAndView("SchemeDetails");
		    	}else {
		    		
		    		return new ModelAndView("HistoryDetails");
		    	}
		    }
		else {
			return new ModelAndView("HistoryDetails");

		}
	}

	@RequestMapping("/copyschemedetails")
	public ModelAndView copyschemedetails(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map,
			Model model, HttpServletRequest request) {
		String staus = null;
		int profile_id = (Integer) request.getSession().getAttribute("profileid");
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");
		int userid = (Integer) request.getSession().getAttribute("userid");
		if (kwm_user != null) {

			int schemeid = Integer.parseInt(scheme_id);

			// String username = (String) request.getSession().getAttribute("username");

			New_Scheme_mstr mstr = schememasterdao.schemeautofill(schemeid);
			System.out.println(mstr.getCust_club_class());
			staus = mstr.getActive_flag();

			int schemeId = schememasterdao.getLastSchemeId();
			System.out.println(schemeId);
			schemeId = schemeId + 1;
			mstr.setScheme_id(schemeId);

			String scheme_code = mstr.getScheme_code().substring(0, 9);
			scheme_code = scheme_code + schemeId;
			System.out.println("scheme code " + scheme_code);

			mstr.setScheme_code(scheme_code);
			mstr.setActive_flag("Incomplete");
			mstr.setRevision(1);

			System.out.println("mstr " + mstr.getScheme_code() + "mstr scheme id " + mstr.getScheme_id());

//        if(mstr.getAttribute3() != null && mstr.getAttribute3() != "") {
//        
//		ArrayList<New_Scheme_mstr> ps = (ArrayList<New_Scheme_mstr>) hibernateTemplate.find("from New_Scheme_mstr where scheme_id = '"+mstr.getAttribute3()+"'");
//
//		mstr.setAttribute4(ps.get(0).getScheme_name());
//        }

			ArrayList<Bpil_Scheme_Doc> doc_line = schememasterdao.docautofill(schemeid);

			ArrayList<Bpil_Scheme_Benefit> gift_line = schememasterdao.giftautofill(schemeid);

			if (!gift_line.isEmpty()) {
				for (Bpil_Scheme_Benefit gift : gift_line) {
					int gift_id = gift.getGift_id();
					ArrayList<Bpil_Gift_Master> aa = (ArrayList<Bpil_Gift_Master>) hibernateTemplate
							.find("from Bpil_Gift_Master where gift_id =" + gift_id);
					String name = aa.get(0).getGift_name();
					gift.setAttribute1(name);

				}

				model.addAttribute("gift_list", gift_line);
			}

			List<String> gift_group_list = new ArrayList<String>();
			String datavalue = "GIFT_GROUP";
			System.out.println("doa lookup " + datavalue);
			CallableStatement cStmt;
			try {
				cStmt = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
				cStmt.setString(1, datavalue);
				cStmt.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result = cStmt.executeQuery();
				ResultSet rs1 = (ResultSet) cStmt.getObject(2);
				while (rs1.next()) {
					String data = rs1.getString(1);
					System.out.println("data " + data);
					gift_group_list.add(data);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			model.addAttribute("gift_group_list", gift_group_list);

			ArrayList<Bpil_Scheme_Product> prd = (ArrayList<Bpil_Scheme_Product>) hibernateTemplate
					.find("from Bpil_Scheme_Product where scheme_id =" + schemeid);

			ArrayList<Bpil_Scheme_IT_Product> itprd = (ArrayList<Bpil_Scheme_IT_Product>) hibernateTemplate
					.find("from Bpil_Scheme_IT_Product where scheme_id =" + schemeid);

			String sql = "select DISTINCT PRD_CODE from BPIL_PRODUCT_MASTER ORDER BY PRD_CODE";

			List<Bpil_Product_mstr> prd_code = jdbctemplate.query(sql, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_code(rs.getString("PRD_CODE"));

					return aContact;
				}

			});

			String sql2 = "select DISTINCT PRD_GRP from BPIL_PRODUCT_MASTER ORDER BY PRD_GRP";

			List<Bpil_Product_mstr> prd_grp = jdbctemplate.query(sql2, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_grp(rs.getString("PRD_GRP"));

					return aContact;
				}

			});

			String sql3 = "select DISTINCT PRD_CAT from BPIL_PRODUCT_MASTER ORDER BY PRD_CAT";

			List<Bpil_Product_mstr> prd_cat = jdbctemplate.query(sql3, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_cat(rs.getString("PRD_CAT"));

					return aContact;
				}

			});

			model.addAttribute("prd_code_list", prd_code);
			model.addAttribute("prd_grp_list", prd_grp);
			model.addAttribute("prd_cat_list", prd_cat);

			ArrayList<Bpil_Scheme_Product_Outflow> prdoutflow = (ArrayList<Bpil_Scheme_Product_Outflow>) hibernateTemplate
					.find("from Bpil_Scheme_Product_Outflow where scheme_id =" + schemeid);

			for (Bpil_Scheme_Product_Outflow Product_Outflow : prdoutflow) {
				Product_Outflow.setLly_vol_div(Product_Outflow.getLly_vol() / 1000);
				Product_Outflow.setLly_val_div(Product_Outflow.getLly_val() / 10000000);
				Product_Outflow.setLy_vol_div(Product_Outflow.getLy_vol() / 1000);
				Product_Outflow.setLy_val_div(Product_Outflow.getLy_val() / 10000000);
				Product_Outflow.setProj_ty_vol_div(Product_Outflow.getProj_ty_vol() / 1000);
				Product_Outflow.setProj_ty_val_div(Product_Outflow.getProj_ty_val() / 10000000);
			}

			List<String> prd_outflow_line_type_list = new ArrayList<String>();
			String prd_outflow_line_type = "PRD_OUTFLOW_LINE_TYPE";
			CallableStatement cStmt2;
			try {
				cStmt2 = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
				cStmt2.setString(1, prd_outflow_line_type);
				cStmt2.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result = cStmt2.executeQuery();
				ResultSet rs1 = (ResultSet) cStmt2.getObject(2);
				while (rs1.next()) {
					String data = rs1.getString(1);
//				System.out.println("data "+data);
					prd_outflow_line_type_list.add(data);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			model.addAttribute("prd_outflow_line_type_list", prd_outflow_line_type_list);

			// if((profile_id==3 && !staus.equals("Requested")) || (profile_id==6 &&
			// !staus.equals("Incomplete") && !staus.equals("Requested")) )
			/*
			 * if(mstr.getAppl_depot_code()!=null || mstr.getAppl_depot_code()!="") { String
			 * depots = mstr.getAppl_depot_code(); if(depots!=null && depots!="") { String
			 * depo1[] = depots.split(","); String depo[] = new String[depo1.length] ;
			 * for(int i=0;i<depo1.length;i++) {
			 * 
			 * ArrayList<Bpil_Depot_Master> getdata = (ArrayList<Bpil_Depot_Master>)
			 * hibernateTemplate.find("from Bpil_Depot_Master where depot_code=?",depo1[i]);
			 * 
			 * depo[i] = getdata.get(0).getDepot_name(); }
			 * 
			 * model.addAttribute("depo1",depo1); model.addAttribute("depo",depo); } }
			 */
			ArrayList<Bpil_Scheme_Depots_Details> schdepos = (ArrayList<Bpil_Scheme_Depots_Details>) hibernateTemplate
					.find("from Bpil_Scheme_Depots_Details where scheme_id = " + schemeid);

			model.addAttribute("schdepos", schdepos);

			ArrayList<Bpil_Scheme_Cust_Types> schcusttypes = (ArrayList<Bpil_Scheme_Cust_Types>) hibernateTemplate
					.find("from Bpil_Scheme_Cust_Types where scheme_id = " + schemeid);

			model.addAttribute("schcusttypes", schcusttypes);

			///

			int user_id = mstr.getCreated_by();
			ArrayList<Bpil_Users> getdata = (ArrayList<Bpil_Users>) hibernateTemplate
					.find("from Bpil_Users where user_id = " + user_id);

			String fname = getdata.get(0).getFirst_name();
			String lname = getdata.get(0).getLast_name();

			Integer it_prd_size = itprd.size();

			mstr.setScheme_name("");

			model.addAttribute("scheme_id", mstr.getScheme_id());
			model.addAttribute("firstname", fname);
			model.addAttribute("lastname", lname);
			model.addAttribute("JSON", mstr);
			model.addAttribute("doc_list", doc_line);
			model.addAttribute("product_list", prd);
			model.addAttribute("it_product_list", itprd);
			model.addAttribute("it_product_size", it_prd_size);
			model.addAttribute("product_outflow_list", prdoutflow);
		}

		String status = "Incomplete";
		if (profile_id == 6) {
			if (status.equals("Incomplete")) {
				return new ModelAndView("CopySchemeDetails");
			} else if (status.equals("Cancel")) {
				return new ModelAndView("CopySchemeDetails");
			} else if (status.equals("Rejected")) {
				return new ModelAndView("CopySchemeDetails");
			} else {

				/*
				 * if(staus.equals("Requested")) { return new ModelAndView("SchemeDetails");
				 * }else{
				 */
				return new ModelAndView("HistoryDetails");
			}
		} else if (profile_id == 3) {
			if (status.equals("Requested")) {
				return new ModelAndView("IT_SchemeDetails");
			} else if (status.equals("Incomplete")) {
				return new ModelAndView("CopySchemeDetails");
			} else if (status.equals("Cancel")) {
				return new ModelAndView("CopySchemeDetails");
			} else if (status.equals("Rejected")) {
				return new ModelAndView("CopySchemeDetails");
			} else {
				return new ModelAndView("HistoryDetails");
			}

		} else if (profile_id == 1) {
			return new ModelAndView("Dealer_scheme_Details");

		} else {
			return new ModelAndView("HistoryDetails");

		}
	}

	@RequestMapping("/pendingschemeaprdetails")
	public ModelAndView pendingschemeaprdetails(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map,
			Model model, HttpServletRequest request) {
		String staus = null;
		int profile_id = (Integer) request.getSession().getAttribute("profileid");
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");
		int userid = (Integer) request.getSession().getAttribute("userid");
		if (kwm_user != null) {

			int schemeid = Integer.parseInt(scheme_id);

			// String username = (String) request.getSession().getAttribute("username");

			New_Scheme_mstr mstr = schememasterdao.schemeautofill(schemeid);
			System.out.println(mstr.getCust_club_class());
			staus = mstr.getActive_flag();

			////////////////////////////////////////// dash board notification
			////////////////////////////////////////// //////////////////////////////////
			List<Bpil_notification> DashbordApprover_List = dao.DashbordApprover_List(userid, schemeid);

//        if(mstr.getAttribute3() != null && mstr.getAttribute3() != "") {
//        
//		ArrayList<New_Scheme_mstr> ps = (ArrayList<New_Scheme_mstr>) hibernateTemplate.find("from New_Scheme_mstr where scheme_id = '"+mstr.getAttribute3()+"'");
//
//		mstr.setAttribute4(ps.get(0).getScheme_name());
//        }

			ArrayList<Bpil_Scheme_Doc> doc_line = schememasterdao.docautofill(schemeid);

			ArrayList<Bpil_Scheme_Benefit> gift_line = schememasterdao.giftautofill(schemeid);

			if (!gift_line.isEmpty()) {
				for (Bpil_Scheme_Benefit gift : gift_line) {
					int gift_id = gift.getGift_id();
					ArrayList<Bpil_Gift_Master> aa = (ArrayList<Bpil_Gift_Master>) hibernateTemplate
							.find("from Bpil_Gift_Master where gift_id=" + gift_id);
					String name = aa.get(0).getGift_name();
					gift.setAttribute1(name);

				}

				model.addAttribute("gift_list", gift_line);
			}

			List<String> gift_group_list = new ArrayList<String>();
			String datavalue = "GIFT_GROUP";
			System.out.println("doa lookup " + datavalue);
			CallableStatement cStmt;
			try {
				cStmt = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
				cStmt.setString(1, datavalue);
				cStmt.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result = cStmt.executeQuery();
				ResultSet rs1 = (ResultSet) cStmt.getObject(2);
				while (rs1.next()) {
					String data = rs1.getString(1);
					System.out.println("data " + data);
					gift_group_list.add(data);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			model.addAttribute("gift_group_list", gift_group_list);

			ArrayList<Bpil_Scheme_Product> dml = (ArrayList<Bpil_Scheme_Product>) hibernateTemplate
					.find("from Bpil_Scheme_Product where scheme_id=" + schemeid);

			ArrayList<Bpil_Scheme_IT_Product> itprd = (ArrayList<Bpil_Scheme_IT_Product>) hibernateTemplate
					.find("from Bpil_Scheme_IT_Product where scheme_id=" + schemeid);

			ArrayList<Bpil_Scheme_Product_Outflow> prdoutflow = (ArrayList<Bpil_Scheme_Product_Outflow>) hibernateTemplate
					.find("from Bpil_Scheme_Product_Outflow where scheme_id=" + schemeid);

			for (Bpil_Scheme_Product_Outflow Product_Outflow : prdoutflow) {
				Product_Outflow.setLly_vol_div(Product_Outflow.getLly_vol() / 1000);
				Product_Outflow.setLly_val_div(Product_Outflow.getLly_val() / 10000000);
				Product_Outflow.setLy_vol_div(Product_Outflow.getLy_vol() / 1000);
				Product_Outflow.setLy_val_div(Product_Outflow.getLy_val() / 10000000);
				Product_Outflow.setProj_ty_vol_div(Product_Outflow.getProj_ty_vol() / 1000);
				Product_Outflow.setProj_ty_val_div(Product_Outflow.getProj_ty_val() / 10000000);
			}

			List<String> prd_outflow_line_type_list = new ArrayList<String>();
			String prd_outflow_line_type = "PRD_OUTFLOW_LINE_TYPE";
			CallableStatement cStmt2;
			try {
				cStmt2 = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
				cStmt2.setString(1, prd_outflow_line_type);
				cStmt2.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result = cStmt2.executeQuery();
				ResultSet rs1 = (ResultSet) cStmt2.getObject(2);
				while (rs1.next()) {
					String data = rs1.getString(1);
					// System.out.println("data "+data);
					prd_outflow_line_type_list.add(data);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			model.addAttribute("prd_outflow_line_type_list", prd_outflow_line_type_list);

			// if((profile_id==3 && !staus.equals("Requested")) || (profile_id==6 &&
			// !staus.equals("Incomplete") && !staus.equals("Requested")) )
			/*
			 * if(mstr.getAppl_depot_code()!=null || mstr.getAppl_depot_code()!="") { String
			 * depots = mstr.getAppl_depot_code(); if(depots!=null && depots!="") { String
			 * depo1[] = depots.split(","); String depo[] = new String[depo1.length] ;
			 * for(int i=0;i<depo1.length;i++) {
			 * 
			 * ArrayList<Bpil_Depot_Master> getdata = (ArrayList<Bpil_Depot_Master>)
			 * hibernateTemplate.find("from Bpil_Depot_Master where depot_code=?",depo1[i]);
			 * 
			 * depo[i] = getdata.get(0).getDepot_name(); }
			 * 
			 * model.addAttribute("depo1",depo1); model.addAttribute("depo",depo); } }
			 */
			ArrayList<Bpil_Scheme_Depots_Details> schdepos = (ArrayList<Bpil_Scheme_Depots_Details>) hibernateTemplate
					.find("from Bpil_Scheme_Depots_Details where scheme_id=" + schemeid);

			model.addAttribute("schdepos", schdepos);

			ArrayList<Bpil_Scheme_Cust_Types> schcusttypes = (ArrayList<Bpil_Scheme_Cust_Types>) hibernateTemplate
					.find("from Bpil_Scheme_Cust_Types where scheme_id=" + schemeid);

			model.addAttribute("schcusttypes", schcusttypes);

			///

			int user_id = mstr.getCreated_by();
			ArrayList<Bpil_Users> getdata = (ArrayList<Bpil_Users>) hibernateTemplate
					.find("from Bpil_Users where user_id=" + user_id);

			String fname = getdata.get(0).getFirst_name();
			String lname = getdata.get(0).getLast_name();

			int Wf_notification_id = 0;
			if (DashbordApprover_List.size() > 0) {
				Wf_notification_id = DashbordApprover_List.get(0).getWf_notification_id();
			}

			model.addAttribute("scheme_id", scheme_id);
			model.addAttribute("wf_notification_id", Wf_notification_id);
			model.addAttribute("firstname", fname);
			model.addAttribute("lastname", lname);
			model.addAttribute("JSON", mstr);
			model.addAttribute("doc_list", doc_line);
			model.addAttribute("product_list", dml);
			model.addAttribute("it_product_list", itprd);
			model.addAttribute("product_outflow_list", prdoutflow);
		}

		if (profile_id == 7) {
			if (staus.equals("Pending for Approval")) {
				return new ModelAndView("PendingSchemeAprDetails");
			} else {

				return new ModelAndView("HistoryDetails");
			}
		}
		if (profile_id == 3) {
			if (staus.equals("Pending for Approval")) {
				return new ModelAndView("PendingITSchemeAprDetails");
			} else {

				return new ModelAndView("HistoryDetails");
			}
		}
		if (profile_id == 8) {
			if (staus.equals("Pending for NA Approval")) {
				return new ModelAndView("PendingSchemeAprDetails");
			} else {

				return new ModelAndView("HistoryDetails");
			}
		}

		if (profile_id == 9) {
			if (staus.equals("Pending for RG Approval")) {
				return new ModelAndView("PendingSchemeAprDetails");
			} else {

				return new ModelAndView("HistoryDetails");
			}
		}
		if (profile_id == 11) {
			if (staus.equals("Pending for HQ Approval")) {
				return new ModelAndView("PendingSchemeAprDetails");
			} else {

				return new ModelAndView("HistoryDetails");
			}
		} else {
			return new ModelAndView("HistoryDetails");

		}
	}

/////////////////////////////////////////// code for review scheme autofill////////////////////////////////////////

	@RequestMapping("/reviewschemedetailsautofill")
	public ModelAndView reviewschemedetails(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map,
			Model model, HttpServletRequest request) {
		int profile_id = (Integer) request.getSession().getAttribute("profileid");
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");
		if (kwm_user != null) {

			int schemeid = Integer.parseInt(scheme_id);

			String username = (String) request.getSession().getAttribute("username");

			New_Scheme_mstr mstr = schememasterdao.schemeautofill(schemeid);

			// String gift_id=mstr.getSch_reward_item();

			ArrayList<Bpil_Scheme_Doc> doc_line = schememasterdao.docautofill(schemeid);

//		if(profile_id==3)
//		{

			int gift_id = Integer.parseInt(mstr.getSch_reward_item());

			ArrayList<Bpil_Gift_Master> dml = (ArrayList<Bpil_Gift_Master>) hibernateTemplate
					.find("from Bpil_Gift_Master where gift_id=?", gift_id);
			String name = dml.get(0).getGift_name();

			mstr.setGift_name(name);

			ArrayList<Bpil_Scheme_Benefit> gift_line = schememasterdao.giftautofill(schemeid);

			String depots = mstr.getAppl_depot_code();
			if (depots != null) {
				String depo[] = depots.split(",");
				model.addAttribute("depo", depo);
			}
			model.addAttribute("gift_list", gift_line);

//		}
			ArrayList<Bpil_Scheme_Benefit> gift_line1 = schememasterdao.giftautofill(schemeid);

			ArrayList<Bpil_Scheme_Product> prod = (ArrayList<Bpil_Scheme_Product>) hibernateTemplate
					.find("from Bpil_Scheme_Product where scheme_id=?", schemeid);

			/*
			 * if(profile_id==3) { String depots=mstr.getAppl_depot_code(); String
			 * depo[]=depots.split(","); model.addAttribute("depo",depo); }
			 */

			int user_id = mstr.getCreated_by();
			ArrayList<Bpil_Users> getdata = (ArrayList<Bpil_Users>) hibernateTemplate
					.find("from Bpil_Users where user_id=?", user_id);

			String fname = getdata.get(0).getFirst_name();
			String lname = getdata.get(0).getLast_name();

			model.addAttribute("scheme_id", scheme_id);
			model.addAttribute("firstname", fname);
			model.addAttribute("lastname", lname);
			model.addAttribute("JSON", mstr);
			model.addAttribute("doc_list", doc_line);
			model.addAttribute("gift_list", gift_line1);
			model.addAttribute("product_list", prod);

		}

		return new ModelAndView("ReviewSchemeDetails");

	}

	@RequestMapping("/starthistfinancialanalysis")
	public ModelAndView starthistfinancialanalysis(@RequestParam(value = "scheme_id") String scheme_id,
			@RequestParam(value = "process_flag") String process_flag, ModelMap map, Model model,
			HttpServletRequest request) {

		System.out.println("starthistfinancialanalysis");
		int schemeid = Integer.parseInt(scheme_id);

		/*
		 * CallableStatement cStmt; try { cStmt = hibernateConfiguration.dataSource()
		 * .getConnection().prepareCall("{call BPIL_PROCESS_QUEUE_ENTRY(?,?)}");
		 * 
		 * cStmt.setInt(1,schemeid); cStmt.setString(2,process_flag ); ResultSet rs1 =
		 * cStmt.executeQuery();
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); } catch (Exception e) {
		 * System.out.println(e.getMessage()); } System.out.println(""+schemeid);
		 */

		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_FIN_ANALYSIS_QUEUE_ENTRY(?)}");

			cStmt.setInt(1, schemeid);
			ResultSet rs1 = cStmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("" + schemeid);

		return new ModelAndView("redirect:/reviewscheme");
	}

	@RequestMapping("/startrewardprocess")
	public ModelAndView startrewardprocess(@RequestParam(value = "scheme_id") String scheme_id,
			@RequestParam(value = "process_flag") String process_flag, ModelMap map, Model model,
			HttpServletRequest request) {

		if (scheme_id != null && scheme_id != "") {
			System.out.println("startrewardprocess");
			int schemeid = Integer.parseInt(scheme_id);

			/*
			 * CallableStatement cStmt; try { cStmt = hibernateConfiguration.dataSource()
			 * .getConnection().prepareCall("{call BPIL_PROCESS_QUEUE_ENTRY(?,?)}");
			 * 
			 * cStmt.setInt(1,schemeid); cStmt.setString(2,process_flag ); ResultSet rs1 =
			 * cStmt.executeQuery();
			 * 
			 * } catch (SQLException e) { e.printStackTrace(); } catch (Exception e) {
			 * System.out.println(e.getMessage()); } System.out.println(""+schemeid);
			 */

			CallableStatement cStmt;
			try {
				cStmt = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_RW_ANALYSIS_QUEUE_ENTRY(?)}");

				cStmt.setInt(1, schemeid);
				ResultSet rs1 = cStmt.executeQuery();

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			System.out.println("" + schemeid);
		}
		return new ModelAndView("redirect:/rewardanalysis");
	}

	@RequestMapping("/startschemerewardprocess")
	public ModelAndView startschemerewardprocess(@RequestParam(value = "process_flag") String process_flag,
			ModelMap map, Model model, HttpServletRequest request) {

		System.out.println("startschemerewardprocess");

		/*
		 * CallableStatement cStmt; try { cStmt = hibernateConfiguration.dataSource()
		 * .getConnection().prepareCall("{call BPIL_PROCESS_QUEUE_ENTRY(?,?)}");
		 * 
		 * cStmt.setInt(1,schemeid); cStmt.setString(2,process_flag ); ResultSet rs1 =
		 * cStmt.executeQuery();
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); } catch (Exception e) {
		 * System.out.println(e.getMessage()); } System.out.println(""+schemeid);
		 */

//	CallableStatement cStmt;
//	try {
//	cStmt = hibernateConfiguration.dataSource()
//			.getConnection().prepareCall("{call BPIL_RW_ANALYSIS_QUEUE_ENTRY(?)}");
//	
//	cStmt.setInt(1,schemeid);		
//	ResultSet rs1 = cStmt.executeQuery();
//		 	
//	} catch (SQLException e) {
//	e.printStackTrace();
//	}
//	catch (Exception e) {
//	System.out.println(e.getMessage());
//	} 

		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_RW_BATCH_AN_QUEUE_ENTRY()}");

			ResultSet rs1 = cStmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return new ModelAndView("redirect:/schemerewardanalysis");
	}

	@RequestMapping("/startschemerewardfreeze")
	public ModelAndView startschemerewardfreeze(@RequestParam(value = "process_flag") String process_flag, ModelMap map,
			Model model, HttpServletRequest request) {

		System.out.println("startschemerewardfreeze");

		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_RW_BATCH_AN_FREEZE_SCH()}");

			ResultSet result = cStmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return new ModelAndView("redirect:/schemerewardfreeze");
	}

	@RequestMapping("/startschemerewardclose")
	public ModelAndView startschemerewardclose(@RequestParam(value = "process_flag") String process_flag, ModelMap map,
			Model model, HttpServletRequest request) {

		System.out.println("startschemerewardclose");

		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_RW_BATCH_AN_CLOSE_SCH()}");

			ResultSet result = cStmt.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return new ModelAndView("redirect:/schemerewardclose");
	}

	@RequestMapping("/reviewschememodify")
	public ModelAndView reviewschememodify(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map,
			Model model, HttpServletRequest request) {

		System.out.println("");
		int schemeid = Integer.parseInt(scheme_id);
		String query = "update BPIL_SCHEME_MASTER set active_flag='Incomplete' WHERE scheme_id='" + schemeid + "'";
		jdbctemplate.update(query);
		System.out.println(".............................." + schemeid);
		return new ModelAndView("redirect:/reviewscheme");
	}

	@RequestMapping("/launchschememodify")
	public ModelAndView launchschememodify(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map,
			Model model, HttpServletRequest request) {

		System.out.println("launchschememodify");
		int schemeid = Integer.parseInt(scheme_id);

		String query = "update BPIL_SCHEME_MASTER set active_flag='Active' WHERE scheme_id='" + schemeid + "'";
		jdbctemplate.update(query);

		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_SCH_ANALYSIS_QUEUE_ENTRY(?)}");

			cStmt.setInt(1, schemeid);
			ResultSet rs1 = cStmt.executeQuery();

			ArrayList<New_Scheme_mstr> dml = (ArrayList<New_Scheme_mstr>) hibernateTemplate
					.find("from New_Scheme_mstr where scheme_id=" + scheme_id);
			String schemecode = dml.get(0).getScheme_code();
			int createdby = dml.get(0).getCreated_by();
			ArrayList<Bpil_Users> dml1 = (ArrayList<Bpil_Users>) hibernateTemplate
					.find("from Bpil_Users where user_id=" + createdby);
			String createdby1 = dml1.get(0).getUser_name();

			CallableStatement cStmt2;

			cStmt2 = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_MAIL_ENTRY(?,?,?,?,?)}");

			cStmt2.setInt(1, createdby);
			cStmt2.setInt(2, schemeid);
			cStmt2.setString(3, "LS");
			cStmt2.setString(4, "Scheme " + schemecode + " Launched Successfully");
			cStmt2.registerOutParameter(5, Types.VARCHAR);
			ResultSet result = cStmt2.executeQuery();
			String flag = cStmt2.getString(5);
			System.out.println("scheme launch mail flag " + flag);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("" + schemeid);
		return new ModelAndView("redirect:/launchscheme");

//	
//	  ArrayList<New_Scheme_mstr> prod = (ArrayList<New_Scheme_mstr>) hibernateTemplate.find("from New_Scheme_mstr where scheme_id=?",schemeid);
//	  String schemename=prod.get(0).getScheme_name();
//	  
////	  NotifyDealer n1=new NotifyDealer(schemename);
//	System.out.println(".............................."+schemeid);
//	return new ModelAndView("redirect:/launchscheme");
	}

//approval status
	@RequestMapping("/approveschememodify")
	public ModelAndView approveschememodify(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map,
			Model model, HttpServletRequest request) {

		int user_id = (Integer) request.getSession().getAttribute("userid");

		int schemeid = Integer.parseInt(scheme_id);
//	DateFormat ser1 = new SimpleDateFormat("dd-MMM-yyyy hh:mm:ss a");
		DateFormat ser1 = new SimpleDateFormat("dd-MMM-yyyy");
		String dateStr1 = ser1.format(new Date());

		ArrayList<New_Scheme_mstr> dml = (ArrayList<New_Scheme_mstr>) hibernateTemplate
				.find("from New_Scheme_mstr where scheme_id=" + scheme_id);
		String schemecode = dml.get(0).getScheme_code();
		int createdby = dml.get(0).getCreated_by();
		String status = dml.get(0).getActive_flag();
		ArrayList<Bpil_Users> dml1 = (ArrayList<Bpil_Users>) hibernateTemplate
				.find("from Bpil_Users where user_id=" + createdby);
		String createdby1 = dml1.get(0).getUser_name();

		System.out.println("Submition date = " + dateStr1);
		String query = "update BPIL_SCHEME_MASTER set active_flag='Pending for Approval', submission_date = '"
				+ dateStr1 + "'  WHERE scheme_id='" + schemeid + "'";
		jdbctemplate.update(query);
		System.out.println(".............................." + schemeid);

		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_WF_NOTIFICATION_ENTRY(?,?,?)}");

			cStmt.setInt(1, createdby);
			cStmt.setInt(2, schemeid);
			cStmt.registerOutParameter(3, Types.VARCHAR);
			ResultSet rs1 = cStmt.executeQuery();

			String str111 = cStmt.getString(3);
			System.out.println("msg is=" + str111);

			CallableStatement cStmt2;

			cStmt2 = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_MAIL_ENTRY(?,?,?,?,?)}");

			cStmt2.setInt(1, createdby);
			cStmt2.setInt(2, schemeid);
			cStmt2.setString(3, "SA");
			cStmt2.setString(4, "Scheme " + schemecode + " Submited for Approval to Supervisor");
			cStmt2.registerOutParameter(5, Types.VARCHAR);
			ResultSet result = cStmt2.executeQuery();
			String flag = cStmt2.getString(5);
			System.out.println("scheme approval mail flag " + flag);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (status.equals("Incomplete")) {

			return new ModelAndView("redirect:/pendingrequest");
		} else if (status.equals("Provisioned")) {
			return new ModelAndView("redirect:/reviewscheme");
		} else {
			return new ModelAndView("redirect:/pendingrequest");
		}
	}

///////////////////////////////////////// code end here for review autofill ////////////////////////////////////////
	@RequestMapping("/schemedetails1")
	public ModelAndView schemedetails1(@RequestParam(value = "scheme_id") String scheme_id,
			@RequestParam(value = "budget") String budget, ModelMap map, Model model, HttpServletRequest request) {

		System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
		int schemeid = Integer.parseInt(scheme_id);
		int budget1 = Integer.parseInt(budget);
		System.out.println(".............................." + schemeid);
		model.addAttribute("scheme_id", schemeid);
		model.addAttribute("budget", budget1);
		System.out.println(".............................." + schemeid);
		return new ModelAndView("blankpage");
	}

	@RequestMapping("/reloadRwApr")
	public ModelAndView reloadRwApr(ModelMap map, Model model, HttpServletRequest request) {

		return new ModelAndView("blankpage");
	}

	/// code for update budget
	@RequestMapping("/updatebudget")
	public ModelAndView updatebudget1(@RequestParam(value = "scheme_id") String scheme_id,
			@RequestParam(value = "budget") String budget, HttpServletRequest request, Model model) {

		int id1 = Integer.parseInt(scheme_id);
		int budget1 = Integer.parseInt(budget);

		String query = "update BPIL_SCHEME_MASTER set scheme_budget='" + budget1 + "' WHERE scheme_id='" + id1 + "'";
		jdbctemplate.update(query);
		System.out.println("done");
		// hibernateTemplate.saveOrUpdate(new_scheme);
		return new ModelAndView("SchemeDetails");
	}
//		}
//		else if(profile_id == 1){
//			return new ModelAndView("Dealer_scheme_Details");
//
//		}
//		else
//		{
//			return new ModelAndView("SchemeDetails");
//
//		}
//	}

	@RequestMapping(value = "/loadfinyear", method = RequestMethod.GET)
	public void loadsubmenuname1(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

			ArrayList<Bpil_Fin_Year> dml = (ArrayList<Bpil_Fin_Year>) hibernateTemplate.find("from Bpil_Fin_Year");
			System.out.println("fin");
			String json = null;

			json = new Gson().toJson(dml);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadschemebusinessline", method = RequestMethod.GET)
	public void loadschemebusinessline(@RequestParam(value = "bline") String bline,HttpServletRequest request,Model model,HttpServletResponse response) {

	int user_id = (Integer) request.getSession().getAttribute("userid");

	ArrayList<Bpil_Users> dml = (ArrayList<Bpil_Users>) hibernateTemplate.find("from Bpil_Users where user_id = " + user_id);


	List<String> region_list = new ArrayList<String>();
	// System.out.println("doa lookup region " + bline);
	CallableStatement cStmt;
	try {
	cStmt = hibernateConfiguration.dataSource().getConnection()
	// .prepareCall("{call SP_CUST_SEGMENT(?)}");
	.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
	cStmt.setString(1, bline );
	cStmt.registerOutParameter(2, OracleTypes.CURSOR);
	ResultSet result = cStmt.executeQuery();
	ResultSet rs1 = (ResultSet) cStmt.getObject(2);
	while (rs1.next()) {
	String data = rs1.getString(1);
	//System.out.println("data is ----------- "+data);
	if(data.equals(dml.get(0).getPmg_ml_group())) {
	region_list.add(data);
	}

	}
	} catch (SQLException e) {
	e.printStackTrace();
	}
	catch (Exception e) {
	System.out.println(e.getMessage());
	}




	try {
	String json = null;
	// System.out.println("line");





	json = new Gson().toJson(region_list);
	response.setContentType("application/json");
	response.getWriter().write(json);
	} catch (IOException e) {
	e.printStackTrace();
	}
	// }
	}

	// download file
	@RequestMapping(value = "/DowdDocument", method = RequestMethod.GET)
	public byte[] DownloadDocument(@RequestParam(value = "Doc_id") String doc_id, ModelAndView model,
			HttpServletResponse response) {

		int docment_id = Integer.parseInt(doc_id);
		@SuppressWarnings("unchecked")
		ArrayList<Bpil_Scheme_Doc> Doc_List = (ArrayList<Bpil_Scheme_Doc>) hibernateTemplate
				.find("from Bpil_Scheme_Doc where scheme_doc_id=" + docment_id);

		for (int i = 0; i < Doc_List.size(); i++) {
			System.out.println(Doc_List.get(i).getDoc_title());
		}

		response.setContentType(Doc_List.get(0).getDoc_type());
		response.setContentLength(Doc_List.get(0).getDoc_file().length);
		response.setHeader("Content-Disposition", "attachment; filename =\"" + Doc_List.get(0).getDoc_title() + "\"");
		try {
			FileCopyUtils.copy(Doc_List.get(0).getDoc_file(), response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}

		return Doc_List.get(0).getDoc_file();
	}

	@RequestMapping(value = "/DowdRwDocument", method = RequestMethod.GET)
	public byte[] DownloadRwDocument(@RequestParam(value = "rw_opa_id") String rw_opa_id,
			@RequestParam(value = "rw_sch_id") String rw_sch_id, ModelAndView model, HttpServletResponse response) {

		int rw_docment_id = Integer.parseInt(rw_opa_id);
		int rw_scheme_id = Integer.parseInt(rw_sch_id);
		@SuppressWarnings("unchecked")
		ArrayList<Bpil_Opa_Rw_Analysis_Rw> Doc_List = (ArrayList<Bpil_Opa_Rw_Analysis_Rw>) hibernateTemplate
				.find("from Bpil_Opa_Rw_Analysis_Rw where opa_analysis_id = " + rw_docment_id + " and scheme_id = "
						+ rw_scheme_id);

		for (int i = 0; i < Doc_List.size(); i++) {
			System.out.println(Doc_List.get(i).getDoc_title());
		}
		if (Doc_List.get(0).getDoc_file() != null) {
			response.setContentLength(Doc_List.get(0).getDoc_file().length);
		}
		response.setHeader("Content-Disposition", "attachment; filename =\"" + Doc_List.get(0).getDoc_title() + "\"");
		try {
			if (Doc_List.get(0).getDoc_file() != null) {
				FileCopyUtils.copy(Doc_List.get(0).getDoc_file(), response.getOutputStream());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return Doc_List.get(0).getDoc_file();
	}
	// delete file

	@RequestMapping(value = "/DeleteDoc", method = RequestMethod.GET)
	public String DeleteDoc(@RequestParam(value = "Doc_id") String doc_id,
			@RequestParam(value = "scheme_id") String scheme_id, HttpServletResponse response, Model model) {
		System.out.println("in ");
		int new_id = Integer.parseInt(doc_id);
		int schemeid = Integer.parseInt(scheme_id);
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Bpil_Scheme_Doc doc = (Bpil_Scheme_Doc) session.load(Bpil_Scheme_Doc.class, new_id);

		session.delete(doc);
		tx.commit();

		model.addAttribute("doc", doc);
		System.out.println("out");

		return "redirect:/schemedetails?scheme_id=" + schemeid + "";
	}

	@RequestMapping(value = "/loadregion", method = RequestMethod.GET)
	public void loadregion(@RequestParam(value = "region") String region, HttpServletRequest request, Model model,
			HttpServletResponse response) {

		List<String> region_list = new ArrayList<String>();
		System.out.println("doa lookup region " + region);
		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
			cStmt.setString(1, region);
			cStmt.registerOutParameter(2, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(2);
			while (rs1.next()) {
				String data = rs1.getString(1);
				System.out.println("data " + data);
				region_list.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;
			System.out.println("line");

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loadDSRregion", method = RequestMethod.GET)
	public void loadDSRregion(HttpServletRequest request, Model model, HttpServletResponse response) {

		System.out.println("Region Is Selected here ..............");

		List<String> region_list = new ArrayList<String>();
		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection().prepareCall("{call BPIL_GET_DSR_REGN(?)}");
			cStmt.registerOutParameter(1, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(1);
			while (rs1.next()) {
				String data = rs1.getString(1);
				System.out.println("dsr_regn " + data);
				region_list.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loaddependentregion", method = RequestMethod.GET)
	public void loaddependentregion(@RequestParam(value = "ava_region") String ava_region, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		ArrayList<Useraccess_userlist> region_list = new ArrayList<Useraccess_userlist>();
		System.out.println("doa lookup " + ava_region);
		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection().prepareCall("{call BPIL_GET_DEPOTS(?,?)}");
			cStmt.setString(1, ava_region);
			cStmt.registerOutParameter(2, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(2);
			while (rs1.next()) {
				String data = rs1.getString(1);
				String data1 = rs1.getString(2);
				System.out.println("data " + data);

				Useraccess_userlist user = new Useraccess_userlist();
				user.setDepot_code(data);
				user.setDepot_name(data1);

				region_list.add(user);
				// region_list.add(data1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;
			System.out.println("line");

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loaddependentDSRregion", method = RequestMethod.GET)
	public void loaddependentDSRregion(@RequestParam(value = "ava_region") String ava_region,
			HttpServletRequest request, Model model, HttpServletResponse response) {

		System.out.println("------ ---->>loaddependentDSRregion------ava_region---->>" + ava_region);

		String[] year = ava_region.split(",");
		ArrayList<Useraccess_userlist> region_list = new ArrayList<Useraccess_userlist>();

		for (int i = 0; i < year.length; i++) {
			System.out.println("year--->>" + year[i]);

			System.out.println("doa lookup " + year[i]);
			CallableStatement cStmt;
			try {
				cStmt = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_DSR_REGN_DEPOTS(?,?)}");
				cStmt.setString(1, year[i]);
				cStmt.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result = cStmt.executeQuery();
				ResultSet rs1 = (ResultSet) cStmt.getObject(2);
				while (rs1.next()) {
					String data = rs1.getString(1);
					String data1 = rs1.getString(2);

					System.out.println("Depo code " + data + " Depo name " + data1);

					Useraccess_userlist user = new Useraccess_userlist();
					user.setDepot_code(data);
					user.setDepot_name(data1);

					region_list.add(user);
				}

			}

			/*
			 * ArrayList<Useraccess_userlist> region_list = new
			 * ArrayList<Useraccess_userlist>(); System.out.println("doa lookup " +
			 * ava_region); CallableStatement cStmt; try { cStmt =
			 * hibernateConfiguration.dataSource().getConnection()
			 * .prepareCall("{call BPIL_GET_DSR_REGN_DEPOTS(?,?)}"); cStmt.setString(1,
			 * ava_region ); cStmt.registerOutParameter(2, OracleTypes.CURSOR); ResultSet
			 * result = cStmt.executeQuery(); ResultSet rs1 = (ResultSet)
			 * cStmt.getObject(2); while (rs1.next()) { String data = rs1.getString(1);
			 * String data1 = rs1.getString(2);
			 * System.out.println("Depo code "+data+" Depo name "+data1);
			 * 
			 * Useraccess_userlist user = new Useraccess_userlist();
			 * user.setDepot_code(data); user.setDepot_name(data1);
			 * 
			 * 
			 * 
			 * 
			 * region_list.add(user); }
			 */
			catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}

		try {
			String json = null;
			System.out.println("---region_list--->>" + region_list.size());
			System.out.println("---region_list--->>" + region_list);

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loaddependentregion1", method = RequestMethod.GET)
	public void loaddependentregion1(@RequestParam(value = "ava_region") String ava_region, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		Useraccess_userlist user = null;
		ArrayList<Useraccess_userlist> region_list = new ArrayList<Useraccess_userlist>();
		System.out.println("doa lookup " + ava_region);
		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection().prepareCall("{call BPIL_GET_DEPOTS(?,?)}");
			cStmt.setString(1, ava_region);
			cStmt.registerOutParameter(2, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(2);
			while (rs1.next()) {
				String data = rs1.getString(1);
				String data1 = rs1.getString(2);
				System.out.println("data " + data);

				user = new Useraccess_userlist();
				user.setDepot_code(data);
				user.setDepot_name(data1);

				region_list.add(user);
				// region_list.add(data1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;
			System.out.println("line");

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loadschemetype", method = RequestMethod.GET)
	public void loadschemetype(@RequestParam(value = "scheme") String scheme, HttpServletRequest request, Model model,
			HttpServletResponse response) {

		List<String> region_list = new ArrayList<String>();
//				System.out.println("doa lookup schemem " + scheme);
		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
			cStmt.setString(1, scheme);
			cStmt.registerOutParameter(2, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(2);
			while (rs1.next()) {
				String data = rs1.getString(1);
//					System.out.println("data "+data);
				region_list.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;
//							 System.out.println("line");

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/crmloadschemetype", method = RequestMethod.GET)
	public void crmloadschemetype(@RequestParam(value = "scheme") String scheme, HttpServletRequest request, Model model,
			HttpServletResponse response) {

		List<String> region_list = new ArrayList<String>();
//				System.out.println("doa lookup schemem " + scheme);
		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
			cStmt.setString(1, scheme);
			cStmt.registerOutParameter(2, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(2);
			while (rs1.next()) {
				String data = rs1.getString(1);
//					System.out.println("data "+data);
				region_list.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;
//							 System.out.println("line");

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/loadcusttype", method = RequestMethod.GET)
	public void loadcusttype(@RequestParam(value = "custype") String custype, HttpServletRequest request, Model model,
			HttpServletResponse response) {

		List<ItemCodeList> region_list = new ArrayList<ItemCodeList>();
//				System.out.println("doa lookup schemem " + custype);
		CallableStatement cStmt, cStmt2;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
			cStmt.setString(1, custype);
			cStmt.registerOutParameter(2, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(2);
			while (rs1.next()) {
				String data = rs1.getString(1);
//					System.out.println("data "+data);
				cStmt2 = hibernateConfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
				cStmt2.setString(1, data);
				cStmt2.registerOutParameter(2, OracleTypes.CURSOR);
				ResultSet result2 = cStmt2.executeQuery();
				ResultSet rs12 = (ResultSet) cStmt2.getObject(2);
				String nos = "";
				while (rs12.next()) {
					String data2 = rs12.getString(1);
//							System.out.println("data2 "+data2);
					nos = nos + data2 + ", ";
				}
				ItemCodeList codeList = new ItemCodeList();
				codeList.setITEM_CODE(data);
				codeList.setITEM_CODEDESCRIPTION(data + " - " + nos);
				region_list.add(codeList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;
//							 System.out.println("line");

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loadschemegroup1", method = RequestMethod.GET)
	public void loadschemegroup1(@RequestParam(value = "datavalue") String datavalue, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		List<String> region_list = new ArrayList<String>();
		System.out.println("doa lookup " + datavalue);
		CallableStatement cStmt;
		try {
			cStmt = hibernateConfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_GET_LOOKUP_VALUES(?,?)}");
			cStmt.setString(1, datavalue);
			cStmt.registerOutParameter(2, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rs1 = (ResultSet) cStmt.getObject(2);
			while (rs1.next()) {
				String data = rs1.getString(1);
				System.out.println("data " + data);
				region_list.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			String json = null;
			System.out.println("line");

			json = new Gson().toJson(region_list);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/loadavailabledepots", method = RequestMethod.GET)
	public void loadavailabledepots(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

			ArrayList<Bpil_LookupValues> dml = (ArrayList<Bpil_LookupValues>) hibernateTemplate
					.find("from Bpil_LookupValues");

			String json = null;
			System.out.println("line");

			json = new Gson().toJson(dml);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	/*----------------------------------code for lov for product ----------------------------------------------------*/
	@RequestMapping(value = "/loadproductcode", method = RequestMethod.GET)
	public void loadproductcode(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

//	ArrayList<Bpil_Product_mstr> dml = (ArrayList<Bpil_Product_mstr>) hibernateTemplate.find("select DISTINCT prd_code from Bpil_Product_mstr");

			String sql = "select DISTINCT PRD_CODE from BPIL_PRODUCT_MASTER ORDER BY PRD_CODE";

			List<Bpil_Product_mstr> dml = jdbctemplate.query(sql, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_code(rs.getString("PRD_CODE"));

					return aContact;
				}

			});

			String json = null;

			json = new Gson().toJson(dml);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadproductgrp", method = RequestMethod.GET)
	public void loadproductgrp(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

//	ArrayList<Bpil_Product_mstr> dml = (ArrayList<Bpil_Product_mstr>) hibernateTemplate.find("select DISTINCT prd_code from Bpil_Product_mstr");

			String sql = "select DISTINCT PRD_GRP from BPIL_PRODUCT_MASTER ORDER BY PRD_GRP";

			List<Bpil_Product_mstr> dml = jdbctemplate.query(sql, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_grp(rs.getString("PRD_GRP"));

					return aContact;
				}

			});

			String json = null;

			json = new Gson().toJson(dml);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadproductcat", method = RequestMethod.GET)
	public void loadproductcat(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

//	ArrayList<Bpil_Product_mstr> dml = (ArrayList<Bpil_Product_mstr>) hibernateTemplate.find("select DISTINCT prd_code from Bpil_Product_mstr");

			String sql = "select DISTINCT PRD_CAT from BPIL_PRODUCT_MASTER ORDER BY PRD_CAT";

			List<Bpil_Product_mstr> dml = jdbctemplate.query(sql, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_cat(rs.getString("PRD_CAT"));

					return aContact;
				}

			});

			String json = null;

			json = new Gson().toJson(dml);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadqmisproductgrp", method = RequestMethod.GET)
	public void loadqmisproductgrp(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

//	ArrayList<Bpil_Product_mstr> dml = (ArrayList<Bpil_Product_mstr>) hibernateTemplate.find("select DISTINCT prd_code from Bpil_Product_mstr");

			String sql = "select DISTINCT GRP from BPIL_QMIS_PRD ORDER BY GRP";

			List<Bpil_Product_mstr> dml = jdbctemplate.query(sql, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_cat(rs.getString("GRP"));

					return aContact;
				}

			});

			String json = null;

			json = new Gson().toJson(dml);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadproductcatdesc", method = RequestMethod.GET)
	public void loadproductcatdesc(@RequestParam(value = "datavalue") String datavalue, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		try {

//	ArrayList<Bpil_Product_mstr> dml = (ArrayList<Bpil_Product_mstr>) hibernateTemplate.find("select DISTINCT prd_code from Bpil_Product_mstr");

			String sql = "select DISTINCT PRD_CAT_DESC from BPIL_PRODUCT_MASTER WHERE PRD_CAT = '" + datavalue
					+ "' ORDER BY PRD_CAT_DESC";

			List<Bpil_Product_mstr> dml = jdbctemplate.query(sql, new RowMapper<Bpil_Product_mstr>() {

				@Override
				public Bpil_Product_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					Bpil_Product_mstr aContact = new Bpil_Product_mstr();

					aContact.setPrd_cat_desc(rs.getString("PRD_CAT_DESC"));

					return aContact;
				}

			});

			String json = null;

			json = new Gson().toJson(dml);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadproductdesc", method = RequestMethod.GET)
	public void loadproductdesc(@RequestParam(value = "groupname") String groupname, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		try {

			int prod_id = Integer.parseInt(groupname);

			ArrayList<Bpil_Product_mstr> dml = (ArrayList<Bpil_Product_mstr>) hibernateTemplate
					.find("from Bpil_Product_mstr where product_id=?", prod_id);

			String name = dml.get(0).getPrd_desc();
			System.out.println("gggggggggggggggggggg=" + dml.get(0).getPrd_desc());
			String json = null;

			json = new Gson().toJson(name);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/loadproductoutflow", method = RequestMethod.GET)
	public void loadproductoutflow(@RequestParam(value = "datavalue") String datavalue,
			@RequestParam(value = "prdvalue") String prdvalue, @RequestParam(value = "startdate") String startdate,
			@RequestParam(value = "enddate") String enddate, @RequestParam(value = "depotcodes") String depotcodes,
			@RequestParam(value = "custtypes") String custtypes,
			@RequestParam(value = "sch_prd_spread_tgt_vol") String sch_prd_spread_tgt_vol,
			@RequestParam(value = "sch_prd_spread_tgt_val") String sch_prd_spread_tgt_val, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		try {

//		 		String datavalue = request.getParameter("datavalue");
//		 		String prdvalue = request.getParameter("prdvalue");
//		 		String startdate = request.getParameter("startdate");
//		 		String enddate = request.getParameter("enddate");
//		 		String depotcodes = request.getParameter("depotcodes");
			
			startdate="22-03-22";
			enddate="23-03-22";

			System.out.println("datavalue " + datavalue);
			System.out.println("prdvalue " + prdvalue);

			String productval;
			if (prdvalue.equals("All")) {
				productval = "";
			} else {
				productval = prdvalue;
			}

			System.out.println("startdate " + startdate);
			System.out.println("enddate " + enddate);
			System.out.println("depotcodes " + depotcodes);

			Set<String> set = new HashSet<>();

			String str[] = depotcodes.split(",");
			for (int i = 0; i < str.length; i++) {
				set.add(str[i]);
			}

			System.out.println("Set value : " + set.toString());
			String depots = "";
			int line = 0;

			Iterator<String> itr = set.iterator();
			while (itr.hasNext()) {
				String s = itr.next();
				depots += s;

				if (line < set.size() - 1) // Avoiding the last comma
				{
					depots += ",";
				}
				line++;
			}

			System.out.println("depots : " + depots);
			System.out.println("this is aslo run for aribbha outflow ");

			System.out.println("custtypes " + custtypes);
			System.out.println("sch_prd_spread_tgt_vol " + sch_prd_spread_tgt_vol);
			System.out.println("sch_prd_spread_tgt_val " + sch_prd_spread_tgt_val);

//		 		String str[] = request.getParameterValues("depotcodes"); // string separate by ,
//		 		System.out.println("depotcodes "+str[0]);
//				String str1 = "";
//				for(int i=0;i<str.length;i++)
//				{
//						System.out.println("in ctrl"+str[i]);
//						str1+=str[i];
//						
//					    if(i<str.length-1) // Avoiding the last comma
//					    {
//					    	str1+=",";
//					    }
//				}

//		 		String sql_lly = ""
//				+ " SELECT 	NVL(SUM(PRD_VOL),0) LLY_VOL, "
//				+ " 		NVL(SUM(PRD_VAL),0) LLY_VAL, "
//				+ " 		COUNT(DISTINCT PRD_BILL_TO) SPREAD_MTD_LLY "
//				+ " FROM   BPIL_DEALER_MASTER_N BDM "
//				+ "        ,(  SELECT  INV.SLS_BILL_TO PRD_BILL_TO "
//				+ "                       ,INV.PRODUCT PRD_NAME "
//				+ "                       ,INV.PRD_CAT "
//				+ "                       ,INV.PRD_CAT_DESC "
//				+ "                       ,INV.PRD_GRP "
//				+ "                       ,INV.PRD_CODE "
//				+ "                       ,INV.PRD_SHD_CODE "
//				+ "                       ,INV.SLS_TRX_DATE PRD_INV_DT "
//				+ "                       ,INV.PRD_UOM "
//				+ "                       ,INV.PRD_PCK_SIZE "
//				+ "                       ,(INV.SLS_VOL + NVL(CM.SLS_VOL,0))          PRD_VOL "
//				+ "                       ,(INV.SLS_FNL_VOL + NVL(CM.SLS_FNL_VOL,0))  PRD_FNL_VOL "
//				+ "                       ,(INV.SLS_VAL + NVL(CM.SLS_VAL,0))          PRD_VAL "
//				+ "               FROM    ( SELECT  BTM.SLS_BILL_TO "
//				+ "                                 ,PRD.* "
//				+ "                                 ,BTM.SLS_TRX_ID "
//				+ "                                 ,BTM.SLS_TRX_DATE "
//				+ "                                 ,BTM.SLS_TRX_IND "
//				+ "                                 ,BTM.SLS_VOL "
//				+ "                                 ,BTM.SLS_FNL_VOL "
//				+ "                                 ,BTM.SLS_VAL "
//				+ "                         FROM    BPIL_TRX_MASTER BTM "
//				+ "                                 ,(SELECT  BPM.PRODUCT "
//				+ "                                           ,BPM.PRD_CAT        PRD_CAT "
//				+ "                                           ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//				+ "                                           ,BPM.PRD_GRP        PRD_GRP "
//				+ "                                           ,BPM.PRD_CODE       PRD_CODE "
//				+ "                                           ,BPM.SHD_CODE       PRD_SHD_CODE "
//				+ "                                           ,BPM.PRD_UOM        PRD_UOM "
//				+ "                                           ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//				+ "                                   FROM    BPIL_PRODUCT_MASTER BPM "
//				+ "                                   WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//				+ "                                   OR      BPM.PRD_CAT = '"+prdvalue+"' "
//				+ "                                 ) PRD "
//				+ "                         WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//				+ "                         AND     BTM.SLS_TRX_TYPE = 'INV' "
//				+ "                         AND     ((TRUNC(BTM.SLS_TRX_DATE) >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-24)) "
//				+ "                                   AND TRUNC(BTM.SLS_TRX_DATE) <= (ADD_MONTHS(TO_DATE('"+enddate+"','DD-MM-YYYY'),-24))) " 
//				+ "                                 ) "
//				+ "                       ) INV "
//				+ "                       ,(SELECT  BTM.SLS_BILL_TO "
//				+ "                                 ,PRD.PRODUCT "
//				+ "                                 ,BTM.SLS_INV_TRX_ID "
//				+ "                                 ,BTM.SLS_VOL "
//				+ "                                 ,BTM.SLS_FNL_VOL "
//				+ "                                 ,BTM.SLS_VAL "
//				+ "                         FROM    BPIL_TRX_MASTER BTM "
//				+ "                                 ,(SELECT  BPM.PRODUCT "
//				+ "                                           ,BPM.PRD_CAT        PRD_CAT "
//				+ "                                           ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//				+ "                                           ,BPM.PRD_GRP        PRD_GRP "
//				+ "                                           ,BPM.PRD_CODE       PRD_CODE "
//				+ "                                           ,BPM.SHD_CODE       PRD_SHD_CODE "
//				+ "                                           ,BPM.PRD_UOM        PRD_UOM "
//				+ "                                           ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//				+ "                                   FROM    BPIL_PRODUCT_MASTER BPM "
//				+ "                                   WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//				+ "                                   OR      BPM.PRD_CAT = '"+prdvalue+"' "
//				+ "                                 ) PRD "
//				+ "                         WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//				+ "                         AND     BTM.SLS_TRX_TYPE = 'CM' "
//				+ "                         AND     BTM.SLS_TRX_DATE >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-24)) "
//				+ "                         AND     BTM.SLS_TRX_DATE <= SYSDATE "
//				+ "                       ) CM "
//				+ "               WHERE   INV.SLS_TRX_ID = CM.SLS_INV_TRX_ID(+) "
//				+ "               AND     INV.PRODUCT = CM.PRODUCT(+) "
//				+ "               AND     (INV.SLS_VOL + NVL(CM.SLS_VOL,0)) > 0 "
//				+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,6) <> 'DAMAGE' "
//				+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,5) <> 'SCRAP' "
//				+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'NMV' "
//				+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'FOC' "
//				+ "      ) TRX "
//				+ "     WHERE   BDM.BILL_TO_ID = TRX.PRD_BILL_TO "
//				+ "		AND     BDM.CUST_TYPE IN ("+custtypes+") "
//				+ "     AND     BDM.DEPOT_CODE IN ("+depotcodes+")";

//		 		String sql_lly = ""
//				+ " 	SELECT NVL(SUM(MTD_VOL),0) LLY_VOL, "
//				+ " 	       NVL(SUM(MTD_VAL),0) LLY_VAL, "
//				+ " 	       SUM(CASE WHEN MTD_VOL >= "+ sch_prd_spread_tgt_vol +" THEN 1 ELSE 0 END) SPREAD_MTD_LLY_VOL, "
//				+ " 	       SUM(CASE WHEN MTD_VAL >= "+ sch_prd_spread_tgt_val +" THEN 1 ELSE 0 END) SPREAD_MTD_LLY_VAL  "
//				+ " 	FROM ( SELECT BDM.BILL_TO_ID,   "
//				+ " 	              NVL(SUM(TRX.PRD_VOL),0) MTD_VOL, "
//				+ " 	              NVL(SUM(TRX.PRD_VAL),0) MTD_VAL "
//				+ " 	        FROM   BPIL_DEALER_MASTER_NEW BDM "
//				+ " 	       ,(  SELECT  INV.SLS_BILL_TO PRD_BILL_TO "
//				+ " 	                      ,INV.PRODUCT PRD_NAME "
//				+ " 	                      ,INV.PRD_CAT "
//				+ " 	                      ,INV.PRD_CAT_DESC "
//				+ " 	                      ,INV.PRD_GRP "
//				+ " 	                      ,INV.PRD_CODE "
//				+ " 	                      ,INV.PRD_SHD_CODE "
//				+ " 	                      ,INV.SLS_TRX_DATE PRD_INV_DT "
//				+ " 	                      ,INV.PRD_UOM "
//				+ " 	                      ,INV.PRD_PCK_SIZE "
//				+ " 	                      ,(INV.SLS_VOL + NVL(CM.SLS_VOL,0))          PRD_VOL "
//				+ " 	                      ,(INV.SLS_FNL_VOL + NVL(CM.SLS_FNL_VOL,0))  PRD_FNL_VOL "
//				+ " 	                      ,(INV.SLS_VAL + NVL(CM.SLS_VAL,0))          PRD_VAL "
//				+ " 	              FROM    ( SELECT  BTM.SLS_BILL_TO "
//				+ " 	                                ,PRD.* "
//				+ " 	                                ,BTM.SLS_TRX_ID "
//				+ " 	                                ,BTM.SLS_TRX_DATE "
//				+ " 	                                ,BTM.SLS_TRX_IND "
//				+ " 	                                ,BTM.SLS_VOL "
//				+ " 	                                ,BTM.SLS_FNL_VOL "
//				+ " 	                                ,BTM.SLS_VAL "
//				+ " 	                        FROM    BPIL_TRX_MASTER BTM "
//				+ " 	                                ,(SELECT  BPM.PRODUCT "
//				+ " 	                                          ,BPM.PRD_CAT        PRD_CAT "
//				+ " 	                                          ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//				+ " 	                                          ,BPM.PRD_GRP        PRD_GRP "
//				+ " 	                                          ,BPM.PRD_CODE       PRD_CODE "
//				+ " 	                                          ,BPM.SHD_CODE       PRD_SHD_CODE "
//				+ " 	                                          ,BPM.PRD_UOM        PRD_UOM "
//				+ " 	                                          ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//				+ " 	                                  FROM    BPIL_PRODUCT_MASTER BPM "
//				+ " 	                                  WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//				+ " 	                                  OR      BPM.PRD_CAT = '"+prdvalue+"' "
//				+ " 	                                ) PRD "
//				+ " 	                        WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//				+ " 	                        AND     BTM.SLS_TRX_TYPE = 'INV' "
//				+ "                             AND     BTM.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID " 
//				+ "        													FROM    BPIL_DEALER_MASTER_NEW BDM2 "
//				+ "        													WHERE   BDM2.DEPOT_CODE IN ("+depots+") "
//                + "        													AND     BDM2.CUST_TYPE IN ("+custtypes+") "
//                + "       													) "
//				+ " 	                        AND     ((TRUNC(BTM.SLS_TRX_DATE) >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-24)) "
//				+ " 	                                  AND TRUNC(BTM.SLS_TRX_DATE) <= (ADD_MONTHS(TO_DATE('"+enddate+"','DD-MM-YYYY'),-24))) " 
//				+ " 	                                ) "
//				+ " 	                      ) INV "
//				+ " 	                      ,(SELECT  BTM.SLS_BILL_TO "
//				+ " 	                                ,PRD.PRODUCT "
//				+ " 	                                ,BTM.SLS_INV_TRX_ID "
//				+ " 	                                ,BTM.SLS_VOL "
//				+ " 	                                ,BTM.SLS_FNL_VOL "
//				+ " 	                                ,BTM.SLS_VAL "
//				+ " 	                        FROM    BPIL_TRX_MASTER BTM "
//				+ " 	                                ,(SELECT  BPM.PRODUCT "
//				+ " 	                                          ,BPM.PRD_CAT        PRD_CAT "
//				+ " 	                                          ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//				+ " 	                                          ,BPM.PRD_GRP        PRD_GRP "
//				+ " 	                                          ,BPM.PRD_CODE       PRD_CODE "
//				+ " 	                                          ,BPM.SHD_CODE       PRD_SHD_CODE "
//				+ " 	                                          ,BPM.PRD_UOM        PRD_UOM "
//				+ " 	                                          ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//				+ " 	                                  FROM    BPIL_PRODUCT_MASTER BPM "
//				+ " 	                                  WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//				+ " 	                                  OR      BPM.PRD_CAT = '"+prdvalue+"' "
//				+ " 	                                ) PRD "
//				+ " 	                        WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//				+ " 	                        AND     BTM.SLS_TRX_TYPE = 'CM' "
//				+ "                             AND     BTM.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID " 
//				+ "        													FROM    BPIL_DEALER_MASTER_NEW BDM2 "
//				+ "        													WHERE   BDM2.DEPOT_CODE IN ("+depots+") "
//                + "        													AND     BDM2.CUST_TYPE IN ("+custtypes+") "
//                + "       													) "
//				+ " 	                        AND     BTM.SLS_TRX_DATE >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-24)) "
//				+ " 	                        AND     BTM.SLS_TRX_DATE <= SYSDATE "
//				+ " 	                      ) CM "
//				+ " 	              WHERE   INV.SLS_TRX_ID = CM.SLS_INV_TRX_ID(+) "
//				+ " 	              AND     INV.PRODUCT = CM.PRODUCT(+) "
//				+ " 	              AND     (INV.SLS_VOL + NVL(CM.SLS_VOL,0)) > 0 "
//				+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,6) <> 'DAMAGE' "
//				+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,5) <> 'SCRAP' "
//				+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'NMV' "
//				+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'FOC' "
//				+ " 	        ) TRX "
//				+ " 	        WHERE   BDM.BILL_TO_ID = TRX.PRD_BILL_TO "
//				+ " 	        AND     BDM.DEPOT_CODE IN ("+depots+") "
//				+ "				AND     BDM.CUST_TYPE IN ("+custtypes+") "
//				+ " 	        GROUP by BDM.BILL_TO_ID) ";

			String sql_lly = "";
			if (datavalue.equals("Product Category")) {

				sql_lly = "" + " 	SELECT NVL(SUM(MTD_VOL),0) LLY_VOL, " + "            NVL(SUM(MTD_VAL),0) LLY_VAL, "
						+ "            SUM(CASE WHEN MTD_VOL >= " + sch_prd_spread_tgt_vol
						+ " THEN 1 ELSE 0 END) SPREAD_MTD_LLY_VOL, " + "            SUM(CASE WHEN MTD_VAL >= "
						+ sch_prd_spread_tgt_val + " THEN 1 ELSE 0 END) SPREAD_MTD_LLY_VAL "
						+ "     FROM (SELECT ML_LLY.PRD_BILL_TO,    "
						+ "                  NVL(SUM(ML_LLY.PRD_VOL),0) MTD_VOL, "
						+ "                  NVL(SUM(ML_LLY.PRD_VAL),0) MTD_VAL  "
						+ "           FROM   (SELECT  TRX.SLS_BILL_TO PRD_BILL_TO "
						+ "						      ,BDM.BILL_TO_ID  "
						+ "							  ,PRD.PRODUCT PRD_NAME "
						+ "							  ,TRX.SLS_SKU_CODE " + "							  ,PRD.PRD_CAT "
						+ "							  ,PRD.PRD_CAT_DESC "
						+ "							  ,PRD.PRD_GRP  " + "							  ,PRD.PRD_CODE  "
						+ "							  ,PRD.PRD_SHD_CODE "
						+ "							  ,PRD.PRD_UOM  "
						+ "							  ,PRD.PRD_PCK_SIZE "
						+ "							  ,TRX.SLS_TRX_ID "
						+ "							  ,TRX.SLS_INV_TRX_ID "
						+ "							  ,TRX.SLS_TRX_DATE "
						+ "							  ,TRX.SLS_INV_DATE PRD_INV_DT "
						+ "							  ,TRX.SLS_TRX_IND  "
						+ "							  ,TRX.SLS_VOL PRD_VOL "
						+ "							  ,TRX.SLS_FNL_VOL  PRD_FNL_VOL "
						+ "							  ,TRX.SLS_VAL PRD_VAL "
						+ "					  FROM    BPIL_DEALER_MASTER_NEW BDM "
						+ "							  ,BPIL_TRX_MASTER2 TRX  "
						+ "							  ,(SELECT  BPM.PRODUCT  "
						+ "										,BPM.PRD_CAT        PRD_CAT "
						+ "										,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
						+ "										,BPM.PRD_GRP        PRD_GRP  "
						+ "										,BPM.PRD_CODE       PRD_CODE  "
						+ "										,BPM.SHD_CODE       PRD_SHD_CODE "
						+ "										,BPM.PRD_UOM        PRD_UOM  "
						+ "										,BPM.PACK_SIZE      PRD_PCK_SIZE "
						+ "								FROM    BPIL_PRODUCT_MASTER BPM  "
						+ "								WHERE   BPM.PRD_CODE IN (SELECT PRODUCT FROM BPIL_QMIS_PRD WHERE GRP = '"
						+ productval + "') " + "							  ) PRD  "
						+ "					  WHERE   TRX.SLS_SKU_CODE = PRD.PRODUCT "
						+ "					  AND     BDM.BILL_TO_ID = TRX.SLS_BILL_TO "
						+ "					  AND     TRX.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID "
						+ "												  FROM    BPIL_DEALER_MASTER_NEW BDM2 "
						+ "												  WHERE   BDM2.DEPOT_CODE IN (" + depots + ")  "
						+ "												  AND     BDM2.CUST_TYPE IN (" + custtypes
						+ ")  " + "												 ) "
						+ "				      AND     ((TRUNC(TRX.SLS_INV_DATE) >= (ADD_MONTHS(TO_DATE('" + startdate
						+ "','DD-MM-YYYY'),-24)) "
						+ "					  			AND TRUNC(TRX.SLS_INV_DATE) <= (ADD_MONTHS(TO_DATE('" + enddate
						+ "','DD-MM-YYYY'),-24))) " + "							  ) " + "					  ) ML_LLY "
						+ "				GROUP by ML_LLY.PRD_BILL_TO) ";

			} else {

				sql_lly = "" + " 	SELECT NVL(SUM(MTD_VOL),0) LLY_VOL, " + "            NVL(SUM(MTD_VAL),0) LLY_VAL, "
						+ "            SUM(CASE WHEN MTD_VOL >= " + sch_prd_spread_tgt_vol
						+ " THEN 1 ELSE 0 END) SPREAD_MTD_LLY_VOL, " + "            SUM(CASE WHEN MTD_VAL >= "
						+ sch_prd_spread_tgt_val + " THEN 1 ELSE 0 END) SPREAD_MTD_LLY_VAL "
						+ "     FROM (SELECT ML_LLY.PRD_BILL_TO,    "
						+ "                  NVL(SUM(ML_LLY.PRD_VOL),0) MTD_VOL, "
						+ "                  NVL(SUM(ML_LLY.PRD_VAL),0) MTD_VAL  "
						+ "           FROM   (SELECT  TRX.SLS_BILL_TO PRD_BILL_TO "
						+ "						      ,BDM.BILL_TO_ID  "
						+ "							  ,PRD.PRODUCT PRD_NAME "
						+ "							  ,TRX.SLS_SKU_CODE " + "							  ,PRD.PRD_CAT "
						+ "							  ,PRD.PRD_CAT_DESC "
						+ "							  ,PRD.PRD_GRP  " + "							  ,PRD.PRD_CODE  "
						+ "							  ,PRD.PRD_SHD_CODE "
						+ "							  ,PRD.PRD_UOM  "
						+ "							  ,PRD.PRD_PCK_SIZE "
						+ "							  ,TRX.SLS_TRX_ID "
						+ "							  ,TRX.SLS_INV_TRX_ID "
						+ "							  ,TRX.SLS_TRX_DATE "
						+ "							  ,TRX.SLS_INV_DATE PRD_INV_DT "
						+ "							  ,TRX.SLS_TRX_IND  "
						+ "							  ,TRX.SLS_VOL PRD_VOL "
						+ "							  ,TRX.SLS_FNL_VOL  PRD_FNL_VOL "
						+ "							  ,TRX.SLS_VAL PRD_VAL "
						+ "					  FROM    BPIL_DEALER_MASTER_NEW BDM "
						+ "							  ,BPIL_TRX_MASTER TRX  "
						+ "							  ,(SELECT  BPM.PRODUCT  "
						+ "										,BPM.PRD_CAT        PRD_CAT "
						+ "										,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
						+ "										,BPM.PRD_GRP        PRD_GRP  "
						+ "										,BPM.PRD_CODE       PRD_CODE  "
						+ "										,BPM.SHD_CODE       PRD_SHD_CODE "
						+ "										,BPM.PRD_UOM        PRD_UOM  "
						+ "										,BPM.PACK_SIZE      PRD_PCK_SIZE "
						+ "								FROM    BPIL_PRODUCT_MASTER BPM  "
						+ "								WHERE   BPM.PRD_CODE = NVL('" + productval + "',BPM.PRD_CODE)  "
						+ "								OR      BPM.PRD_CAT = NVL('" + productval + "',BPM.PRD_CAT) "
						+ "							  ) PRD  "
						+ "					  WHERE   TRX.SLS_SKU_CODE = PRD.PRODUCT "
						+ "					  AND     BDM.BILL_TO_ID = TRX.SLS_BILL_TO "
						+ "					  AND     TRX.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID "
						+ "												  FROM    BPIL_DEALER_MASTER_NEW BDM2 "
						+ "												  WHERE   BDM2.DEPOT_CODE IN (" + depots + ")  "
						+ "												  AND     BDM2.CUST_TYPE IN (" + custtypes
						+ ")  " + "												 ) "
						+ "				      AND     ((TRUNC(TRX.SLS_INV_DATE) >= (ADD_MONTHS(TO_DATE('" + startdate
						+ "','DD-MM-YYYY'),-24)) "
						+ "					  			AND TRUNC(TRX.SLS_INV_DATE) <= (ADD_MONTHS(TO_DATE('" + enddate
						+ "','DD-MM-YYYY'),-24))) " + "							  ) " + "					  ) ML_LLY "
						+ "				GROUP by ML_LLY.PRD_BILL_TO) ";

			}

			List<PRD_Outflow> prdlly = jdbctemplate.query(sql_lly, new RowMapper<PRD_Outflow>() {

				@Override
				public PRD_Outflow mapRow(ResultSet rs, int rowNum) throws SQLException {
					PRD_Outflow prd_out = new PRD_Outflow();

//						if(rs.getFloat("LLY_VOL") != 0.0) {
//							prd_out.setLLY_VOL(rs.getFloat("LLY_VOL") / 1000);
//						} else {
					prd_out.setLLY_VOL(rs.getFloat("LLY_VOL"));
//						}

//						if(rs.getFloat("LLY_VAL") != 0.0) {
//							prd_out.setLLY_VAL(rs.getFloat("LLY_VAL") / 10000000);
//						} else {
					prd_out.setLLY_VAL(rs.getFloat("LLY_VAL"));
//						}

					prd_out.setSPREAD_MTD_LLY_VOL(rs.getInt("SPREAD_MTD_LLY_VOL"));
					prd_out.setSPREAD_MTD_LLY_VAL(rs.getInt("SPREAD_MTD_LLY_VAL"));

					return prd_out;
				}

			});

//				String sql_ly = ""
//						+ " SELECT 	NVL(SUM(PRD_VOL),0) LY_VOL, "
//						+ " 		NVL(SUM(PRD_VAL),0) LY_VAL, "
//						+ " 		COUNT(DISTINCT PRD_BILL_TO) SPREAD_MTD_LY "
//						+ " FROM   BPIL_DEALER_MASTER_N BDM "
//						+ "        ,(  SELECT  INV.SLS_BILL_TO PRD_BILL_TO "
//						+ "                       ,INV.PRODUCT PRD_NAME "
//						+ "                       ,INV.PRD_CAT "
//						+ "                       ,INV.PRD_CAT_DESC "
//						+ "                       ,INV.PRD_GRP "
//						+ "                       ,INV.PRD_CODE "
//						+ "                       ,INV.PRD_SHD_CODE "
//						+ "                       ,INV.SLS_TRX_DATE PRD_INV_DT "
//						+ "                       ,INV.PRD_UOM "
//						+ "                       ,INV.PRD_PCK_SIZE "
//						+ "                       ,(INV.SLS_VOL + NVL(CM.SLS_VOL,0))          PRD_VOL "
//						+ "                       ,(INV.SLS_FNL_VOL + NVL(CM.SLS_FNL_VOL,0))  PRD_FNL_VOL "
//						+ "                       ,(INV.SLS_VAL + NVL(CM.SLS_VAL,0))          PRD_VAL "
//						+ "               FROM    ( SELECT  BTM.SLS_BILL_TO "
//						+ "                                 ,PRD.* "
//						+ "                                 ,BTM.SLS_TRX_ID "
//						+ "                                 ,BTM.SLS_TRX_DATE "
//						+ "                                 ,BTM.SLS_TRX_IND "
//						+ "                                 ,BTM.SLS_VOL "
//						+ "                                 ,BTM.SLS_FNL_VOL "
//						+ "                                 ,BTM.SLS_VAL "
//						+ "                         FROM    BPIL_TRX_MASTER BTM "
//						+ "                                 ,(SELECT  BPM.PRODUCT "
//						+ "                                           ,BPM.PRD_CAT        PRD_CAT "
//						+ "                                           ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//						+ "                                           ,BPM.PRD_GRP        PRD_GRP "
//						+ "                                           ,BPM.PRD_CODE       PRD_CODE "
//						+ "                                           ,BPM.SHD_CODE       PRD_SHD_CODE "
//						+ "                                           ,BPM.PRD_UOM        PRD_UOM "
//						+ "                                           ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//						+ "                                   FROM    BPIL_PRODUCT_MASTER BPM "
//						+ "                                   WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//						+ "                                   OR      BPM.PRD_CAT = '"+prdvalue+"' "
//						+ "                                 ) PRD "
//						+ "                         WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//						+ "                         AND     BTM.SLS_TRX_TYPE = 'INV' "
//						+ "                         AND     ((TRUNC(BTM.SLS_TRX_DATE) >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-12)) "
//						+ "                                   AND TRUNC(BTM.SLS_TRX_DATE) <= (ADD_MONTHS(TO_DATE('"+enddate+"','DD-MM-YYYY'),-12))) " 
//						+ "                                 ) "
//						+ "                       ) INV "
//						+ "                       ,(SELECT  BTM.SLS_BILL_TO "
//						+ "                                 ,PRD.PRODUCT "
//						+ "                                 ,BTM.SLS_INV_TRX_ID "
//						+ "                                 ,BTM.SLS_VOL "
//						+ "                                 ,BTM.SLS_FNL_VOL "
//						+ "                                 ,BTM.SLS_VAL "
//						+ "                         FROM    BPIL_TRX_MASTER BTM "
//						+ "                                 ,(SELECT  BPM.PRODUCT "
//						+ "                                           ,BPM.PRD_CAT        PRD_CAT "
//						+ "                                           ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//						+ "                                           ,BPM.PRD_GRP        PRD_GRP "
//						+ "                                           ,BPM.PRD_CODE       PRD_CODE "
//						+ "                                           ,BPM.SHD_CODE       PRD_SHD_CODE "
//						+ "                                           ,BPM.PRD_UOM        PRD_UOM "
//						+ "                                           ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//						+ "                                   FROM    BPIL_PRODUCT_MASTER BPM "
//						+ "                                   WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//						+ "                                   OR      BPM.PRD_CAT = '"+prdvalue+"' "
//						+ "                                 ) PRD "
//						+ "                         WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//						+ "                         AND     BTM.SLS_TRX_TYPE = 'CM' "
//						+ "                         AND     BTM.SLS_TRX_DATE >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-12)) "
//						+ "                         AND     BTM.SLS_TRX_DATE <= SYSDATE "
//						+ "                       ) CM "
//						+ "               WHERE   INV.SLS_TRX_ID = CM.SLS_INV_TRX_ID(+) "
//						+ "               AND     INV.PRODUCT = CM.PRODUCT(+) "
//						+ "               AND     (INV.SLS_VOL + NVL(CM.SLS_VOL,0)) > 0 "
//						+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,6) <> 'DAMAGE' "
//						+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,5) <> 'SCRAP' "
//						+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'NMV' "
//						+ "               AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'FOC' "
//						+ "      ) TRX "
//						+ "     WHERE   BDM.BILL_TO_ID = TRX.PRD_BILL_TO "
//						+ "		AND     BDM.CUST_TYPE IN ("+custtypes+") "				
//						+ "     AND     BDM.DEPOT_CODE IN ("+depotcodes+")";

//				String sql_ly = ""
//						+ " 	SELECT NVL(SUM(MTD_VOL),0) LY_VOL, "
//						+ " 	       NVL(SUM(MTD_VAL),0) LY_VAL, "
//						+ " 	       SUM(CASE WHEN MTD_VOL >= "+ sch_prd_spread_tgt_vol +" THEN 1 ELSE 0 END) SPREAD_MTD_LY_VOL, "
//						+ " 	       SUM(CASE WHEN MTD_VAL >= "+ sch_prd_spread_tgt_val +" THEN 1 ELSE 0 END) SPREAD_MTD_LY_VAL  "
//						+ " 	FROM ( SELECT BDM.BILL_TO_ID,   "
//						+ " 	              NVL(SUM(TRX.PRD_VOL),0) MTD_VOL, "
//						+ " 	              NVL(SUM(TRX.PRD_VAL),0) MTD_VAL "
//						+ " 	        FROM  BPIL_DEALER_MASTER_NEW BDM "
//						+ " 	       ,(  SELECT  INV.SLS_BILL_TO PRD_BILL_TO "
//						+ " 	                      ,INV.PRODUCT PRD_NAME "
//						+ " 	                      ,INV.PRD_CAT "
//						+ " 	                      ,INV.PRD_CAT_DESC "
//						+ " 	                      ,INV.PRD_GRP "
//						+ " 	                      ,INV.PRD_CODE "
//						+ " 	                      ,INV.PRD_SHD_CODE "
//						+ " 	                      ,INV.SLS_TRX_DATE PRD_INV_DT "
//						+ " 	                      ,INV.PRD_UOM "
//						+ " 	                      ,INV.PRD_PCK_SIZE "
//						+ " 	                      ,(INV.SLS_VOL + NVL(CM.SLS_VOL,0))          PRD_VOL "
//						+ " 	                      ,(INV.SLS_FNL_VOL + NVL(CM.SLS_FNL_VOL,0))  PRD_FNL_VOL "
//						+ " 	                      ,(INV.SLS_VAL + NVL(CM.SLS_VAL,0))          PRD_VAL "
//						+ " 	              FROM    ( SELECT  BTM.SLS_BILL_TO "
//						+ " 	                                ,PRD.* "
//						+ " 	                                ,BTM.SLS_TRX_ID "
//						+ " 	                                ,BTM.SLS_TRX_DATE "
//						+ " 	                                ,BTM.SLS_TRX_IND "
//						+ " 	                                ,BTM.SLS_VOL "
//						+ " 	                                ,BTM.SLS_FNL_VOL "
//						+ " 	                                ,BTM.SLS_VAL "
//						+ " 	                        FROM    BPIL_TRX_MASTER BTM "
//						+ " 	                                ,(SELECT  BPM.PRODUCT "
//						+ " 	                                          ,BPM.PRD_CAT        PRD_CAT "
//						+ " 	                                          ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//						+ " 	                                          ,BPM.PRD_GRP        PRD_GRP "
//						+ " 	                                          ,BPM.PRD_CODE       PRD_CODE "
//						+ " 	                                          ,BPM.SHD_CODE       PRD_SHD_CODE "
//						+ " 	                                          ,BPM.PRD_UOM        PRD_UOM "
//						+ " 	                                          ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//						+ " 	                                  FROM    BPIL_PRODUCT_MASTER BPM "
//						+ " 	                                  WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//						+ " 	                                  OR      BPM.PRD_CAT = '"+prdvalue+"' "
//						+ " 	                                ) PRD "
//						+ " 	                        WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//						+ " 	                        AND     BTM.SLS_TRX_TYPE = 'INV' "
//						+ "                             AND     BTM.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID " 
//						+ "        													FROM    BPIL_DEALER_MASTER_NEW BDM2 "
//						+ "        													WHERE   BDM2.DEPOT_CODE IN ("+depots+") "
//		                + "        													AND     BDM2.CUST_TYPE IN ("+custtypes+") "
//		                + "       													) "
//						+ " 	                        AND     ((TRUNC(BTM.SLS_TRX_DATE) >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-12)) "
//						+ " 	                                  AND TRUNC(BTM.SLS_TRX_DATE) <= (ADD_MONTHS(TO_DATE('"+enddate+"','DD-MM-YYYY'),-12))) " 
//						+ " 	                                ) "
//						+ " 	                      ) INV "
//						+ " 	                      ,(SELECT  BTM.SLS_BILL_TO "
//						+ " 	                                ,PRD.PRODUCT "
//						+ " 	                                ,BTM.SLS_INV_TRX_ID "
//						+ " 	                                ,BTM.SLS_VOL "
//						+ " 	                                ,BTM.SLS_FNL_VOL "
//						+ " 	                                ,BTM.SLS_VAL "
//						+ " 	                        FROM    BPIL_TRX_MASTER BTM "
//						+ " 	                                ,(SELECT  BPM.PRODUCT "
//						+ " 	                                          ,BPM.PRD_CAT        PRD_CAT "
//						+ " 	                                          ,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
//						+ " 	                                          ,BPM.PRD_GRP        PRD_GRP "
//						+ " 	                                          ,BPM.PRD_CODE       PRD_CODE "
//						+ " 	                                          ,BPM.SHD_CODE       PRD_SHD_CODE "
//						+ " 	                                          ,BPM.PRD_UOM        PRD_UOM "
//						+ " 	                                          ,BPM.PACK_SIZE      PRD_PCK_SIZE "
//						+ " 	                                  FROM    BPIL_PRODUCT_MASTER BPM "
//						+ " 	                                  WHERE   BPM.PRD_CODE = '"+prdvalue+"' "
//						+ " 	                                  OR      BPM.PRD_CAT = '"+prdvalue+"' "
//						+ " 	                                ) PRD "
//						+ " 	                        WHERE   BTM.SLS_SKU_CODE = PRD.PRODUCT "
//						+ " 	                        AND     BTM.SLS_TRX_TYPE = 'CM' "
//						+ "                             AND     BTM.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID " 
//						+ "        													FROM    BPIL_DEALER_MASTER_NEW BDM2 "
//						+ "        													WHERE   BDM2.DEPOT_CODE IN ("+depots+") "
//		                + "        													AND     BDM2.CUST_TYPE IN ("+custtypes+") "
//		                + "       													) "
//						+ " 	                        AND     BTM.SLS_TRX_DATE >= (ADD_MONTHS(TO_DATE('"+startdate+"','DD-MM-YYYY'),-12)) "
//						+ " 	                        AND     BTM.SLS_TRX_DATE <= SYSDATE "
//						+ " 	                      ) CM "
//						+ " 	              WHERE   INV.SLS_TRX_ID = CM.SLS_INV_TRX_ID(+) "
//						+ " 	              AND     INV.PRODUCT = CM.PRODUCT(+) "
//						+ " 	              AND     (INV.SLS_VOL + NVL(CM.SLS_VOL,0)) > 0 "
//						+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,6) <> 'DAMAGE' "
//						+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,5) <> 'SCRAP' "
//						+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'NMV' "
//						+ " 	              AND     SUBSTR(INV.SLS_TRX_IND,5,3) <> 'FOC' "
//						+ " 	        ) TRX "
//						+ " 	        WHERE   BDM.BILL_TO_ID = TRX.PRD_BILL_TO "
//						+ " 	        AND     BDM.DEPOT_CODE IN ("+depots+") "
//						+ "				AND     BDM.CUST_TYPE IN ("+custtypes+") "
//						+ " 	        GROUP by BDM.BILL_TO_ID) ";

			String sql_ly = "";
			if (datavalue.equals("Product Category")) {

				sql_ly = "" + " 	SELECT NVL(SUM(MTD_VOL),0) LY_VOL, " + "            NVL(SUM(MTD_VAL),0) LY_VAL, "
						+ "            SUM(CASE WHEN MTD_VOL >= " + sch_prd_spread_tgt_vol
						+ " THEN 1 ELSE 0 END) SPREAD_MTD_LY_VOL, " + "            SUM(CASE WHEN MTD_VAL >= "
						+ sch_prd_spread_tgt_val + " THEN 1 ELSE 0 END) SPREAD_MTD_LY_VAL "
						+ "     FROM (SELECT ML_LY.PRD_BILL_TO,    "
						+ "                  NVL(SUM(ML_LY.PRD_VOL),0) MTD_VOL, "
						+ "                  NVL(SUM(ML_LY.PRD_VAL),0) MTD_VAL  "
						+ "           FROM   (SELECT  TRX.SLS_BILL_TO PRD_BILL_TO "
						+ "						      ,BDM.BILL_TO_ID  "
						+ "							  ,PRD.PRODUCT PRD_NAME "
						+ "							  ,TRX.SLS_SKU_CODE " + "							  ,PRD.PRD_CAT "
						+ "							  ,PRD.PRD_CAT_DESC "
						+ "							  ,PRD.PRD_GRP  " + "							  ,PRD.PRD_CODE  "
						+ "							  ,PRD.PRD_SHD_CODE "
						+ "							  ,PRD.PRD_UOM  "
						+ "							  ,PRD.PRD_PCK_SIZE "
						+ "							  ,TRX.SLS_TRX_ID "
						+ "							  ,TRX.SLS_INV_TRX_ID "
						+ "							  ,TRX.SLS_TRX_DATE "
						+ "							  ,TRX.SLS_INV_DATE PRD_INV_DT "
						+ "							  ,TRX.SLS_TRX_IND  "
						+ "							  ,TRX.SLS_VOL PRD_VOL "
						+ "							  ,TRX.SLS_FNL_VOL  PRD_FNL_VOL "
						+ "							  ,TRX.SLS_VAL PRD_VAL "
						+ "					  FROM    BPIL_DEALER_MASTER_NEW BDM "
						+ "							  ,BPIL_TRX_MASTER2 TRX  "
						+ "							  ,(SELECT  BPM.PRODUCT  "
						+ "										,BPM.PRD_CAT        PRD_CAT "
						+ "										,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
						+ "										,BPM.PRD_GRP        PRD_GRP  "
						+ "										,BPM.PRD_CODE       PRD_CODE  "
						+ "										,BPM.SHD_CODE       PRD_SHD_CODE "
						+ "										,BPM.PRD_UOM        PRD_UOM  "
						+ "										,BPM.PACK_SIZE      PRD_PCK_SIZE "
						+ "								FROM    BPIL_PRODUCT_MASTER BPM  "
						+ "								WHERE   BPM.PRD_CODE IN (SELECT PRODUCT FROM BPIL_QMIS_PRD WHERE GRP = '"
						+ productval + "') " + "							  ) PRD  "
						+ "					  WHERE   TRX.SLS_SKU_CODE = PRD.PRODUCT "
						+ "					  AND     BDM.BILL_TO_ID = TRX.SLS_BILL_TO "
						+ "					  AND     TRX.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID "
						+ "												  FROM    BPIL_DEALER_MASTER_NEW BDM2 "
						+ "												  WHERE   BDM2.DEPOT_CODE IN (" + depots + ")  "
						+ "												  AND     BDM2.CUST_TYPE IN (" + custtypes
						+ ")  " + "												 ) "
						+ "				      AND     ((TRUNC(TRX.SLS_INV_DATE) >= (ADD_MONTHS(TO_DATE('" + startdate
						+ "','DD-MM-YYYY'),-12)) "
						+ "					  			AND TRUNC(TRX.SLS_INV_DATE) <= (ADD_MONTHS(TO_DATE('" + enddate
						+ "','DD-MM-YYYY'),-12))) " + "							  ) " + "					  ) ML_LY "
						+ "				GROUP by ML_LY.PRD_BILL_TO) ";

			} else {

				sql_ly = "" + " 	SELECT NVL(SUM(MTD_VOL),0) LY_VOL, " + "            NVL(SUM(MTD_VAL),0) LY_VAL, "
						+ "            SUM(CASE WHEN MTD_VOL >= " + sch_prd_spread_tgt_vol
						+ " THEN 1 ELSE 0 END) SPREAD_MTD_LY_VOL, " + "            SUM(CASE WHEN MTD_VAL >= "
						+ sch_prd_spread_tgt_val + " THEN 1 ELSE 0 END) SPREAD_MTD_LY_VAL "
						+ "     FROM (SELECT ML_LY.PRD_BILL_TO,    "
						+ "                  NVL(SUM(ML_LY.PRD_VOL),0) MTD_VOL, "
						+ "                  NVL(SUM(ML_LY.PRD_VAL),0) MTD_VAL  "
						+ "           FROM   (SELECT  TRX.SLS_BILL_TO PRD_BILL_TO "
						+ "						      ,BDM.BILL_TO_ID  "
						+ "							  ,PRD.PRODUCT PRD_NAME "
						+ "							  ,TRX.SLS_SKU_CODE " + "							  ,PRD.PRD_CAT "
						+ "							  ,PRD.PRD_CAT_DESC "
						+ "							  ,PRD.PRD_GRP  " + "							  ,PRD.PRD_CODE  "
						+ "							  ,PRD.PRD_SHD_CODE "
						+ "							  ,PRD.PRD_UOM  "
						+ "							  ,PRD.PRD_PCK_SIZE "
						+ "							  ,TRX.SLS_TRX_ID "
						+ "							  ,TRX.SLS_INV_TRX_ID "
						+ "							  ,TRX.SLS_TRX_DATE "
						+ "							  ,TRX.SLS_INV_DATE PRD_INV_DT "
						+ "							  ,TRX.SLS_TRX_IND  "
						+ "							  ,TRX.SLS_VOL PRD_VOL "
						+ "							  ,TRX.SLS_FNL_VOL  PRD_FNL_VOL "
						+ "							  ,TRX.SLS_VAL PRD_VAL "
						+ "					  FROM    BPIL_DEALER_MASTER_NEW BDM "
						+ "							  ,BPIL_TRX_MASTER TRX  "
						+ "							  ,(SELECT  BPM.PRODUCT  "
						+ "										,BPM.PRD_CAT        PRD_CAT "
						+ "										,BPM.PRD_CAT_DESC   PRD_CAT_DESC "
						+ "										,BPM.PRD_GRP        PRD_GRP  "
						+ "										,BPM.PRD_CODE       PRD_CODE  "
						+ "										,BPM.SHD_CODE       PRD_SHD_CODE "
						+ "										,BPM.PRD_UOM        PRD_UOM  "
						+ "										,BPM.PACK_SIZE      PRD_PCK_SIZE "
						+ "								FROM    BPIL_PRODUCT_MASTER BPM  "
						+ "								WHERE   BPM.PRD_CODE = NVL('" + productval + "',BPM.PRD_CODE)  "
						+ "								OR      BPM.PRD_CAT = NVL('" + productval + "',BPM.PRD_CAT) "
						+ "							  ) PRD  "
						+ "					  WHERE   TRX.SLS_SKU_CODE = PRD.PRODUCT "
						+ "					  AND     BDM.BILL_TO_ID = TRX.SLS_BILL_TO "
						+ "					  AND     TRX.SLS_BILL_TO IN (SELECT  BDM2.BILL_TO_ID "
						+ "												  FROM    BPIL_DEALER_MASTER_NEW BDM2 "
						+ "												  WHERE   BDM2.DEPOT_CODE IN (" + depots + ")  "
						+ "												  AND     BDM2.CUST_TYPE IN (" + custtypes
						+ ")  " + "												 ) "
						+ "				      AND     ((TRUNC(TRX.SLS_INV_DATE) >= (ADD_MONTHS(TO_DATE('" + startdate
						+ "','DD-MM-YYYY'),-12)) "
						+ "					  			AND TRUNC(TRX.SLS_INV_DATE) <= (ADD_MONTHS(TO_DATE('" + enddate
						+ "','DD-MM-YYYY'),-12))) " + "							  ) " + "					  ) ML_LY "
						+ "				GROUP by ML_LY.PRD_BILL_TO) ";

			}

			List<PRD_Outflow> prdly = jdbctemplate.query(sql_ly, new RowMapper<PRD_Outflow>() {

				@Override
				public PRD_Outflow mapRow(ResultSet rs, int rowNum) throws SQLException {
					PRD_Outflow prd_out = new PRD_Outflow();

//												if(rs.getFloat("LY_VOL") != 0.0) {
//													prd_out.setLY_VOL(rs.getFloat("LY_VOL") / 1000);
//												} else {
					prd_out.setLY_VOL(rs.getFloat("LY_VOL"));
//												}

//												if(rs.getFloat("LY_VAL") != 0.0) {
//													prd_out.setLY_VAL(rs.getFloat("LY_VAL") / 10000000);
//												} else {
					prd_out.setLY_VAL(rs.getFloat("LY_VAL"));
//												}

					prd_out.setSPREAD_MTD_LY_VOL(rs.getInt("SPREAD_MTD_LY_VOL"));
					prd_out.setSPREAD_MTD_LY_VAL(rs.getInt("SPREAD_MTD_LY_VAL"));

					return prd_out;
				}

			});

			System.out.println("the LLy volume is " + prdlly.get(0).getLLY_VOL());

			System.out.println("the Ly volume is " + prdly.get(0).getLY_VOL());

			PRD_Outflow prd_out = new PRD_Outflow();

//			prd_out.setLLY_VOL(prdlly.get(0).getLLY_VOL());
//			prd_out.setLLY_VAL(prdlly.get(0).getLLY_VAL());
//			prd_out.setSPREAD_MTD_LLY_VOL(prdlly.get(0).getSPREAD_MTD_LLY_VOL());
//			prd_out.setSPREAD_MTD_LLY_VAL(prdlly.get(0).getSPREAD_MTD_LLY_VAL());
//			prd_out.setLY_VOL(prdly.get(0).getLY_VOL());
//			prd_out.setLY_VAL(prdly.get(0).getLY_VAL());
//			prd_out.setSPREAD_MTD_LY_VOL(prdly.get(0).getSPREAD_MTD_LY_VOL());
//			prd_out.setSPREAD_MTD_LY_VAL(prdly.get(0).getSPREAD_MTD_LY_VAL());
			
			//float t=0.8;
			
			
			//prd_out.setLLY_VOL();
			prd_out.setLLY_VAL((float) 568.57);
			prd_out.setSPREAD_MTD_LLY_VOL(0);
			prd_out.setSPREAD_MTD_LLY_VAL(0);
			prd_out.setLY_VOL((float) 987.22);
			prd_out.setLY_VAL((float) 984.46);
			prd_out.setSPREAD_MTD_LY_VOL(0);
			prd_out.setSPREAD_MTD_LY_VAL(0);

//		 		 CallableStatement cStmt = hibernateConfiguration.dataSource()
//		 				.getConnection().prepareCall("{call BPIL_OPA_PRD_OUTFLOW(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");
//		 		
//		 		cStmt.setString(1,prdvalue);		
//		 		cStmt.setString(2,startdate );
//		 		cStmt.setString(3,enddate);		
//		 		cStmt.setString(4,depotcodes );
//		 		cStmt.setFloat(5,Float.parseFloat(sch_prd_spread_tgt_vol) );
//		 		cStmt.setFloat(6,Float.parseFloat(sch_prd_spread_tgt_val) );
//		 		cStmt.registerOutParameter(7,Types.DECIMAL);
//		 		cStmt.registerOutParameter(8,Types.DECIMAL);
//		 		cStmt.registerOutParameter(9,Types.INTEGER);
//		 		cStmt.registerOutParameter(10,Types.INTEGER);
//		 		cStmt.registerOutParameter(11,Types.DECIMAL);
//		 		cStmt.registerOutParameter(12,Types.DECIMAL);
//		 		cStmt.registerOutParameter(13,Types.INTEGER);
//		 		cStmt.registerOutParameter(14,Types.INTEGER);
//		 		ResultSet rs1 = cStmt.executeQuery();
//		 		
//		 		PRD_Outflow prd_out = new PRD_Outflow();
//		 			 	
//		 		prd_out.setLLY_VOL(cStmt.getFloat(7));
//		 		prd_out.setLLY_VAL(cStmt.getFloat(8));
//		 		prd_out.setSPREAD_MTD_LLY_VOL(cStmt.getInt(9));
//		 		prd_out.setSPREAD_MTD_LLY_VAL(cStmt.getInt(10));
//		 		prd_out.setLY_VOL(cStmt.getFloat(11));
//		 		prd_out.setLY_VAL(cStmt.getFloat(12));
//		 		prd_out.setSPREAD_MTD_LY_VOL(cStmt.getInt(13));
//		 		prd_out.setSPREAD_MTD_LY_VAL(cStmt.getInt(14));

			String json = null;

			json = new Gson().toJson(prd_out);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
//		 	catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}

	}

	@RequestMapping("/schemecancel")
	public ModelAndView histfinancialanalysis(@RequestParam(value = "schemeid") String schemeid, ModelMap map,
			Model model, HttpServletRequest request) {
		// model.addAttribute("price",price);
		model.addAttribute("schemeid", schemeid);
		return new ModelAndView("SchemeCancel");
	}

	@RequestMapping("/save_schemecancel_comment")
	public ModelAndView save_schemecancel_comment(@RequestParam(value = "schemeid") String schemeid,
			@RequestParam(value = "comment") String comment, ModelMap map, Model model, HttpServletRequest request) {
		int userid = (Integer) request.getSession().getAttribute("userid");
//Date canceldate=
		Date canceldate1 = new java.sql.Date(new java.util.Date().getTime());
		System.out.println("canel " + canceldate1);

//redemp_date = new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("redemption_date"));

		String canceldate = new SimpleDateFormat("dd-MMM-yyyy").format(canceldate1);
		System.out.println("cancel " + canceldate);

		String sql = "update BPIL_SCHEME_MASTER set CANCEL_REASON='" + comment + "',ACTIVE_FLAG='Cancel',CANCELLED_BY='"
				+ userid + "',CANCEL_DATE='" + canceldate + "' where SCHEME_ID=" + schemeid;
		System.out.println(sql);
		int up = jdbctemplate.update(sql);
		System.out.println(up);

		String sql2 = "update BPIL_SCH_ANALYSIS_QUEUE set STATUS='Cancelled' where SCHEME_ID=" + schemeid;
		System.out.println(sql2);
		int up2 = jdbctemplate.update(sql2);
		System.out.println(up2);

		String sql3 = "update BPIL_SCH_ANALYSIS_QUEUE2 set STATUS='Cancelled' where SCHEME_ID=" + schemeid;
		System.out.println(sql3);
		int up3 = jdbctemplate.update(sql3);
		System.out.println(up3);

		String sql4 = "update BPIL_SCH_TSI_ANALYSIS_QUEUE set STATUS='Cancelled' where SCHEME_ID=" + schemeid;
		System.out.println(sql4);
		int up4 = jdbctemplate.update(sql4);
		System.out.println(up4);

		String sql5 = "update BPIL_SCH_TSI_ANALYSIS_QUEUE2 set STATUS='Cancelled' where SCHEME_ID=" + schemeid;
		System.out.println(sql5);
		int up5 = jdbctemplate.update(sql5);
		System.out.println(up5);

		String sqln = "SELECT WF_NOTIFICATION_ID,SCHEME_ID FROM BPIL_WF_NOTIFICATIONS WHERE STATUS='Pending' AND SCHEME_ID="
				+ schemeid;

		List<Bpil_notification> notifications = jdbctemplate.query(sqln, new RowMapper<Bpil_notification>() {

			@Override
			public Bpil_notification mapRow(ResultSet rs, int rowNum) throws SQLException {
				Bpil_notification notification = new Bpil_notification();

				notification.setWf_notification_id(rs.getInt("WF_NOTIFICATION_ID"));
				notification.setScheme_id(rs.getInt("SCHEME_ID"));

				return notification;
			}

		});

		for (Bpil_notification bpil_notification : notifications) {

			String sql6 = "update BPIL_WF_NOTIFICATIONS set STATUS='Cancelled' where WF_NOTIFICATION_ID = "
					+ bpil_notification.getWf_notification_id() + " AND SCHEME_ID=" + schemeid;
			System.out.println(sql6);
			int up6 = jdbctemplate.update(sql6);
			System.out.println(up6);
		}

		return new ModelAndView("redirect:/schememaster");
	}

	// --------------------------------------------------Code for Show all doc on
	// scheme
	// details-------------------------------------------------------------------------------------

	@RequestMapping("/show_doc")

	public ModelAndView showall(@RequestParam(value = "scheme_id") String schemeid, Bpil_Scheme_Doc bsd, Model model) // @RequestParam(value
																														// =
																														// "schemeid")
																														// String
																														// schemeid,

	{
		List<Bpil_Scheme_Doc> abc = schememasterdao.showdoc(schemeid);

		int s = abc.size();
		System.out.println("show doc");
		// System.out.println("-----------------------------------------------scheme
		// id----------->"+schemeid);

		model.addAttribute("sss", abc);
		return new ModelAndView("All_doc");

	}

//------------------------------------------------------code for historical logs----------------------------------------------------------------

	@RequestMapping("/show_log")

	public ModelAndView logg(@RequestParam(value = "scheme_id") String s_id, Model model) //

	{
		int scheme_id = Integer.parseInt(s_id);

		// ArrayList<New_Scheme_mstr> al=(ArrayList<New_Scheme_mstr>)
		// hibernateTemplate.find("from New_Scheme_mstr where scheme_id=",+scheme_id);
		// ArrayList<New_Scheme_mstr>
		// al=(ArrayList<New_Scheme_mstr>)hibernateTemplate.find("from New_Scheme_mstr
		// where ");

		String query = "SELECT * FROM BPIL_SCHEME_MASTER WHERE SCHEME_ID=" + scheme_id;

		List<New_Scheme_mstr> foc = jdbctemplate.query(query, new RowMapper<New_Scheme_mstr>() {

			@Override
			public New_Scheme_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
				New_Scheme_mstr foc = new New_Scheme_mstr();

				foc.setScheme_id(rs.getInt("SCHEME_ID"));
				foc.setScheme_code(rs.getString("SCHEME_CODE"));
				foc.setScheme_name(rs.getString("SCHEME_NAME"));
				foc.setScheme_type(rs.getString("SCHEME_TYPE"));

				return foc;
			}

		});

		model.addAttribute("logs", foc);
		return new ModelAndView("All_Logs");

	}

	@RequestMapping(value = "/loadFOC", method = RequestMethod.GET)
	public void loadFOC(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

			String query = "select SKU, DESCRIPTION from BPIL_price_list where substr(SKU,1,3)='F00' AND SKU NOT LIKE '%BULK%' AND S_BL='RETAIL' AND SUBSTR(SKU,16,1) NOT IN ('7','8') ORDER BY 1";

			List<FOC> foc = jdbctemplate.query(query, new RowMapper<FOC>() {

				@Override
				public FOC mapRow(ResultSet rs, int rowNum) throws SQLException {
					FOC foc = new FOC();

					foc.setSKU(rs.getString("SKU"));
					foc.setDescription(rs.getString("DESCRIPTION"));

					return foc;
				}

			});

			String json = null;

			json = new Gson().toJson(foc);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/getDesc", method = RequestMethod.GET)
	public void getDesc(String desc, HttpServletRequest request, Model model, HttpServletResponse response) {

		try {

			String query = "select DESCRIPTION from BPIL_price_list where SKU = '" + desc + "'";

			ResultSet rs = hibernateConfiguration.dataSource().getConnection().prepareStatement(query).executeQuery();

			String foc = "";
			while (rs.next()) {
				foc = rs.getString("DESCRIPTION");
			}

			System.out.println("FOC Val " + foc);

			String json = null;

			json = new Gson().toJson(foc);
			response.setContentType("application/json");
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	@RequestMapping("/CrmSchemeDetails")
	public ModelAndView crmschemedetails(@RequestParam(value = "scheme_id") String scheme_id, ModelMap map, Model model,
			HttpServletRequest request) {
		String staus = null;
		int profile_id = (Integer) request.getSession().getAttribute("profileid");
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");
		int userid = (Integer) request.getSession().getAttribute("userid");
		
		System.out.println("Hey CrmSchemeDetails");

		if (kwm_user != null) {

			String query = "SELECT * FROM BPIL_SCHEME_MASTER_CRM WHERE SCHEME_ID=" + scheme_id;
			
			List<New_Scheme_mstr_for_Crm> foc = jdbctemplate.query(query, new RowMapper<New_Scheme_mstr_for_Crm>() {

				@Override
				public New_Scheme_mstr_for_Crm mapRow(ResultSet rs, int rowNum) throws SQLException {
					New_Scheme_mstr_for_Crm foc = new New_Scheme_mstr_for_Crm();
                    int SCHEME_ID=rs.getInt("SCHEME_ID");
                    String SCHEME_CODE=rs.getString("SCHEME_CODE");                   
                    String  SCHEME_NAME= rs.getString("SCHEME_NAME");
                    String SCHEME_TYPE= rs.getString("SCHEME_TYPE");
                    String ACTIVE_FLAG= rs.getString("ACTIVE_FLAG");
                    String  COMPANY_TYPE= rs.getString("COMPANY_TYPE");                    
                    String  BUDGET_AVAILABLE= rs.getString("BUDGET_AVAILABLE");
                    String CREATED_BY=  rs.getString("CREATED_BY");
                    String SCHEME_BUSINESS_LINE=  rs.getString("SCHEME_BUSINESS_LINE");
                    int SCHEME_BUDGET=rs.getInt("SCHEME_BUDGET");
                    int REVISION=rs.getInt("REVISION");
                    String SCHEME_FIN_MONTH=rs.getString("SCHEME_FIN_MONTH");
                    int SCHEM_FIN_YEAR=rs.getInt("SCHEM_FIN_YEAR");
                    String SCHEME_LEVEL=rs.getString("SCHEME_LEVEL");
                    String SCHEME_SRL_NO=rs.getString("SCHEME_SRL_NO");
                    String SCH_OBJECTIVE=rs.getString("SCH_OBJECTIVE");
                    int PROVISION_ID=rs.getInt("PROVISION_ID");
                    Date START_DATE=rs.getDate("START_DATE");
                    Date END_DATE=rs.getDate("END_DATE");
                    Date REDEMPTION_DATE=rs.getDate("REDEMPTION_DATE");
                    
				    foc.setScheme_id(rs.getInt("SCHEME_ID"));
					foc.setScheme_code(rs.getString("SCHEME_CODE"));
					foc.setScheme_name(rs.getString("SCHEME_NAME"));
					foc.setScheme_type(rs.getString("SCHEME_TYPE"));
					foc.setActive_flag(rs.getString("ACTIVE_FLAG"));
					foc.setCompany_type(rs.getString("COMPANY_TYPE"));
					foc.setBudget_available(rs.getString("BUDGET_AVAILABLE"));
					foc.setCreated_by(rs.getInt("CREATED_BY"));
					foc.setScheme_business_line(rs.getString("SCHEME_BUSINESS_LINE"));	
					foc.setScheme_budget(rs.getInt("SCHEME_BUDGET"));
					foc.setRevision(rs.getInt("REVISION"));
					foc.setScheme_fin_month(rs.getString("SCHEME_FIN_MONTH"));
					foc.setScheme_fin_yr(rs.getInt("SCHEM_FIN_YEAR"));
					foc.setScheme_level(rs.getString("SCHEME_LEVEL"));
					foc.setScheme_srl_no(rs.getString("SCHEME_SRL_NO"));
					foc.setObjective(rs.getString("SCH_OBJECTIVE"));
					foc.setProvision_id(rs.getInt("PROVISION_ID"));
					
					model.addAttribute("SCHEME_NAME", SCHEME_NAME);
					model.addAttribute("SCHEME_CODE", SCHEME_CODE);
					model.addAttribute("ACTIVE_FLAG", ACTIVE_FLAG);
					model.addAttribute("COMPANY_TYPE", COMPANY_TYPE);
					model.addAttribute("BUDGET_AVAILABLE", BUDGET_AVAILABLE);
					model.addAttribute("SCHEME_TYPE", SCHEME_TYPE);
					model.addAttribute("SCHEME_BUDGET", SCHEME_BUDGET);
					model.addAttribute("SCHEME_BUSINESS_LINE", SCHEME_BUSINESS_LINE);
					model.addAttribute("SCHEME_FIN_MONTH",SCHEME_FIN_MONTH );
					model.addAttribute("SCHEM_FIN_YEAR",SCHEM_FIN_YEAR );
					model.addAttribute("SCHEME_LEVEL",SCHEME_LEVEL );
					model.addAttribute("CREATED_BY",CREATED_BY );
					model.addAttribute("SCHEME_SRL_NO",SCHEME_SRL_NO );
					model.addAttribute("SCH_OBJECTIVE",SCH_OBJECTIVE );
					model.addAttribute("PROVISION_ID",PROVISION_ID );
					model.addAttribute("REVISION",REVISION );
					
					model.addAttribute("START_DATE",START_DATE );
					model.addAttribute("END_DATE",END_DATE );
					model.addAttribute("REDEMPTION_DATE",REDEMPTION_DATE );
					return foc;
				}
			});
			
			System.out.println(foc.toString());
		}
		
     	
			return new ModelAndView("CrmSchemeDetails");

		
	}

}
