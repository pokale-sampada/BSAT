package com.omfys.bsat.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.omfys.bsat.repository.MenuGroupDao;
import com.omfys.bsat.model.Bpil_Depot_Master;
import com.omfys.bsat.model.Bpil_MenuGroup;
import com.omfys.bsat.model.Bpil_Menu_FunRegi;
import com.omfys.bsat.model.Bpil_Menu_Header;
import com.omfys.bsat.model.Bpil_Menu_Line;
import com.omfys.bsat.model.Bpil_ReportGroup;
import com.omfys.bsat.model.Bpil_Report_FunRegi;
import com.omfys.bsat.model.Bpil_Report_Lines;
import com.omfys.bsat.model.Bpil_Terr_Master;
import com.omfys.bsat.model.Bpil_User_Assignment;
import com.omfys.bsat.model.Bpil_User_Profiles;
import com.omfys.bsat.model.Bpil_Users;

@Controller
public class MenuGroupController {
	@Autowired
	MenuGroupDao menugroupdao;

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Autowired
	private SessionFactory sessionFactory;

// autofill menugroup
	@RequestMapping("/menugroup1")
	public ModelAndView welcomes5(@RequestParam(value = "menu_group_id") int menu_group_id, HttpServletRequest request,
			ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				System.out.println("menu grp id " + menu_group_id);
				Session session = sessionFactory.openSession();
				Transaction tx = session.beginTransaction();
				Bpil_MenuGroup Company_bean = (Bpil_MenuGroup) session.load(Bpil_MenuGroup.class, menu_group_id);

				DateFormat cre12 = new SimpleDateFormat("dd-MM-yyyy");
				String dateStr2 = cre12.format(Company_bean.getGroup_start_date());
				Company_bean.setGroup_start_date1(dateStr2);
				try {
					System.out.println(cre12.parse(Company_bean.getGroup_start_date1()));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				DateFormat cre1 = new SimpleDateFormat("dd-MM-yyyy");
				String dateStr = cre1.format(Company_bean.getGroup_end_date());
				Company_bean.setGroup_end_date1(dateStr);
				try {
					System.out.println(cre1.parse(Company_bean.getGroup_end_date1()));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				tx.commit();
//					System.out.println("Company_bean in dao="+Company_bean);
				session.close();

				model.addAttribute("menugroup", Company_bean);
				return new ModelAndView("MenuGroup");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

// autofill menu header
	@RequestMapping("/menuheader1")
	public ModelAndView menuheader(@RequestParam(value = "menu_header_id") int menu_header_id,
			HttpServletRequest request, ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				System.out.println("menu header id " + menu_header_id);
				Session session = sessionFactory.openSession();
				Transaction tx = session.beginTransaction();
				Bpil_Menu_Header Company_bean = (Bpil_Menu_Header) session.load(Bpil_Menu_Header.class, menu_header_id);

				Company_bean.getMenu_header_id();
				System.out.println("header " + Company_bean.getMenu_header_id());
				DateFormat cre12 = new SimpleDateFormat("dd-MM-yyyy");
				String dateStr2 = cre12.format(Company_bean.getHeader_start_date());
				Company_bean.setHeader_start_date1(dateStr2);
				try {
					System.out.println(cre12.parse(Company_bean.getHeader_start_date1()));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				DateFormat cre1 = new SimpleDateFormat("dd-MM-yyyy");
				String dateStr = cre1.format(Company_bean.getHeader_end_date());
				Company_bean.setHeader_end_date1(dateStr);
				try {
					System.out.println(cre1.parse(Company_bean.getHeader_end_date1()));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				tx.commit();
				System.out.println("Company_bean in dao=" + Company_bean);
				session.close();

				int menu_group_id = Company_bean.getMenu_group_id();

				ArrayList<Bpil_Menu_Line> dml = (ArrayList<Bpil_Menu_Line>) hibernateTemplate
						.find("from Bpil_Menu_Line where menu_header_id=?", menu_header_id);
				ArrayList<Bpil_MenuGroup> dml1 = (ArrayList<Bpil_MenuGroup>) hibernateTemplate
						.find("from Bpil_MenuGroup where menu_group_id=?", menu_group_id);
				String group_name = dml1.get(0).getGroup_name();

				model.addAttribute("groupname", group_name);
				model.addAttribute("menuheader", Company_bean);
				model.addAttribute("menuline", dml);
				return new ModelAndView("MenuHeaderLine");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

// autofill function
//	@RequestMapping("/updatemenufunction")		
	public ModelAndView updatereportfunction(@RequestParam(value = "menu_function_id") int menu_function_id,
			HttpServletRequest request, Model model, ModelMap map) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			System.out.println("Hii ---------------------------------------"+menu_function_id);
			if (loginString.equals("Y")) {

				ArrayList<Bpil_Menu_FunRegi> dml = (ArrayList<Bpil_Menu_FunRegi>) hibernateTemplate
						.find("from Bpil_Menu_FunRegi where menu_function_id=?", menu_function_id);
				System.out.println("Hii ---------------------------------------"+menu_function_id);
				if (dml.size() > 0) {
					System.out.println("Hii ---------------------------------------"+dml.size() );
					int line_id = dml.get(0).getMenu_line_id();
					ArrayList<Bpil_Menu_Line> linedata = (ArrayList<Bpil_Menu_Line>) hibernateTemplate
							.find("from Bpil_Menu_Line where menu_line_id=?", line_id);

					String line_name = linedata.get(0).getLine_name();
					model.addAttribute("rep_grp_list", dml);
					model.addAttribute("line_name", line_name);
					
				}
				return new ModelAndView("MenuFunction");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/menuheader")
	public ModelAndView welcomes6(HttpServletRequest request, ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				return new ModelAndView("MenuHeaderLine");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

	@RequestMapping("/menufunction")
	public ModelAndView welcomes7(HttpServletRequest request, ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				return new ModelAndView("MenuFunction");
			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

// to show menu group grid
	@RequestMapping("/groupdetails")
	public ModelAndView welcomes3(HttpServletRequest request, ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				List<Bpil_MenuGroup> dml = menugroupdao.grid1();

				// ArrayList<Bpil_MenuGroup> dml = (ArrayList<Bpil_MenuGroup>)
				// hibernateTemplate.find("from Bpil_MenuGroup");
				model.addAttribute("groupdetails", dml);
				return new ModelAndView("MenuGroupDetails");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

// to show header grid
	@RequestMapping("/headerdetails")
	public ModelAndView welcomes(HttpServletRequest request, ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				List<Bpil_Menu_Header> dml = menugroupdao.grid2();
				// ArrayList<Bpil_Menu_Header> dml = (ArrayList<Bpil_Menu_Header>)
				// hibernateTemplate.find("from Bpil_Menu_Header");
				model.addAttribute("headerdetails", dml);
				return new ModelAndView("MenuHeaderDetails");
			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

// to show function grid
	@RequestMapping("/functiondetails")
	// @RequestMapping("/")
	public ModelAndView welcomes1(HttpServletRequest request, ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				ArrayList<Bpil_Menu_FunRegi> dml = (ArrayList<Bpil_Menu_FunRegi>) hibernateTemplate
						.find("from Bpil_Menu_FunRegi");
				model.addAttribute("functiondetails", dml);
				return new ModelAndView("MenuFunctionDetails");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

	// save group menu here
	@RequestMapping(value = "/savegroup", method = RequestMethod.POST)
	public ModelAndView helloWorld(@ModelAttribute Bpil_MenuGroup menugroup, BindingResult result,
			HttpServletRequest request, Model model, ModelMap map) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				Integer userid = (Integer) request.getSession().getAttribute("userid");

				Date startdate = null;
				try {
					if (!request.getParameter("group_start_date").equals("")) {
						startdate = new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("group_start_date"));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}

				Date enddate = null;
				try {
					if (!request.getParameter("group_end_date").equals("")) {
						enddate = new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("group_end_date"));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}

				menugroup.setGroup_start_date(startdate);
				menugroup.setGroup_end_date(enddate);

				menugroup.setCreated_by(userid);
				menugroup.setLast_updated_by(userid);

				int i = menugroupdao.saveGroup(menugroup);

				return new ModelAndView("MenuGroup");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

	// save header line here
	@RequestMapping(value = "/saveHeaderLine", method = RequestMethod.POST)
	public ModelAndView helloWorld(HttpServletRequest request, Model model,
			@ModelAttribute Bpil_Menu_Header menuheaderline, BindingResult result, ModelMap map) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				Integer userid = (Integer) request.getSession().getAttribute("userid");

				Date startdate = null;
				try {
					if (!request.getParameter("header_start_date").equals("")) {
						startdate = new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("header_start_date"));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}

				Date enddate = null;
				try {
					if (!request.getParameter("header_end_date").equals("")) {
						enddate = new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("header_end_date"));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}

				menuheaderline.setHeader_start_date(startdate);
				menuheaderline.setHeader_end_date(enddate);

				menuheaderline.setCreated_by(userid);
				menuheaderline.setLast_updated_by(userid);

				int i = menugroupdao.saveHeader(menuheaderline);

				System.out.println(
						"idddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd11111111111111  "
								+ i);
				if (request.getParameterValues("line_name") != null || request.getParameter("line_name") != " ") {
					String submenu[] = request.getParameterValues("line_name");
					String status[] = request.getParameterValues("para");
					String menu_line_id[] = request.getParameterValues("menu_line_id");

					int count = submenu.length;
					int id = i;

					menugroupdao.saveHeaderLine(id, count, submenu, status, menu_line_id, userid);
				}

				ArrayList<Bpil_Menu_Header> dml = (ArrayList<Bpil_Menu_Header>) hibernateTemplate
						.find("from Bpil_Menu_Header");
				model.addAttribute("headerdetails", dml);
				return new ModelAndView("MenuHeaderDetails");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

//save menu function here
	@RequestMapping(value = "/save_menu_function", method = RequestMethod.POST)
	public ModelAndView save_reportfunction(HttpServletRequest request, Model model, ModelMap map) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				String[] menu_function_id = request.getParameterValues("menu_function_id");
				String[] menu_line_id = request.getParameterValues("menu_line_id");
				String[] function_name = request.getParameterValues("function_name");
				String[] function_action_name = request.getParameterValues("function_action_name");
				String[] active = request.getParameterValues("para");

				int a = function_name.length;
				System.out.println("function name-------------------------------" + a);
				int id1 = menugroupdao.savedata3(menu_function_id, menu_line_id, function_name, function_action_name,
						active);

				ArrayList<Bpil_Menu_FunRegi> dml = (ArrayList<Bpil_Menu_FunRegi>) hibernateTemplate
						.find("from Bpil_Menu_FunRegi");
				model.addAttribute("functiondetails", dml);
				return new ModelAndView("MenuFunctionDetails");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

	@RequestMapping(value = "/loadMenulinename", method = RequestMethod.GET)
	public void loadsubmenuname(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				try {

					ArrayList<Bpil_Menu_Line> dml = (ArrayList<Bpil_Menu_Line>) hibernateTemplate
							.find("from Bpil_Menu_Line");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				response.getWriter().write("Please log in");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			response.getWriter().write("Please log in");
		}

	}

	@RequestMapping(value = "/loadmenugroupname", method = RequestMethod.GET)
	public void loadsubmenuname1(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				try {

					ArrayList<Bpil_MenuGroup> dml = (ArrayList<Bpil_MenuGroup>) hibernateTemplate
							.find("from Bpil_MenuGroup");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				response.getWriter().write("Please log in");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			response.getWriter().write("Please log in");
		}

	}

	@RequestMapping(value = "/loaduserprofile", method = RequestMethod.GET)
	public void loaduserprofile(HttpServletRequest request, Model model, HttpServletResponse response)
			throws IOException {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {
				try {

					ArrayList<Bpil_User_Profiles> dml = (ArrayList<Bpil_User_Profiles>) hibernateTemplate
							.find("from Bpil_User_Profiles");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				response.getWriter().write("Please log in");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			response.getWriter().write("Please log in");
		}

	}

	@RequestMapping(value = "/loadusertype", method = RequestMethod.GET)
	public void loadusertype(@RequestParam(value = "profile_id") String profile_id, HttpServletRequest request,
			Model model, HttpServletResponse response) throws IOException {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				try {

					ArrayList<Bpil_User_Profiles> dml = (ArrayList<Bpil_User_Profiles>) hibernateTemplate
							.find("from Bpil_User_Profiles where profile_id = '" + profile_id + "'");

					String user_type = dml.get(0).getUser_type();
					String json = null;

					json = new Gson().toJson(user_type);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				response.getWriter().write("Please log in");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			response.getWriter().write("Please log in");
		}

	}

	@RequestMapping(value = "/loadsupervisor", method = RequestMethod.GET)
	public void loadsupervisor(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				try {

					ArrayList<Bpil_Users> dml = (ArrayList<Bpil_Users>) hibernateTemplate
							.find("from Bpil_Users where profile_id = 7");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e) {
					try {
						response.getWriter().write("Please log in");
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}

			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			try {
				response.getWriter().write("Please log in");
			} catch (IOException e1) {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
			}
		}

	}

	@RequestMapping(value = "/loadregioncode", method = RequestMethod.GET)
	public void loadregioncode(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				try {

					ArrayList<String> dml = (ArrayList<String>) hibernateTemplate
							.find("select distinct regn from Bpil_Depot_Master where regn is not null");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e) {
					try {
						response.getWriter().write("Please log in");
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			try {
				response.getWriter().write("Please log in");
			} catch (IOException e1) {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e2) {
					// TODO Auto-generated catch block
					e2.printStackTrace();
				}
			}
		}

	}

	@RequestMapping(value = "/loaddepotcode", method = RequestMethod.GET)
	public void loaddepotcode(@RequestParam(value = "region_code") String region_code, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				try {

					ArrayList<Bpil_Depot_Master> dml = (ArrayList<Bpil_Depot_Master>) hibernateTemplate
							.find("from Bpil_Depot_Master where regn = '" + region_code + "'");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e) {
					try {
						response.getWriter().write("Please log in");
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			try {
				response.getWriter().write("Please log in");
			} catch (IOException e2) {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}

	}

	@RequestMapping(value = "/loadtsicode", method = RequestMethod.GET)
	public void loadtsicode(@RequestParam(value = "depot_code") String depot_code, HttpServletRequest request,
			Model model, HttpServletResponse response) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				try {

					ArrayList<Bpil_Terr_Master> dml = (ArrayList<Bpil_Terr_Master>) hibernateTemplate
							.find("from Bpil_Terr_Master where depot_code = '" + depot_code + "'");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e) {
					try {
						response.getWriter().write("Please log in");
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			try {
				response.getWriter().write("Please log in");
			} catch (IOException e3) {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e4) {
					// TODO Auto-generated catch block
					e4.printStackTrace();
				}
			}
		}

	}

	@RequestMapping(value = "/loadmenuuser", method = RequestMethod.GET)
	public void loaduser(HttpServletRequest request, Model model, HttpServletResponse response) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {
				try {

					ArrayList<Bpil_Users> dml = (ArrayList<Bpil_Users>) hibernateTemplate.find("from Bpil_Users");

					String json = null;

					json = new Gson().toJson(dml);
					response.setContentType("application/json");
					response.getWriter().write(json);
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException e3) {
					try {
						response.getWriter().write("Please log in");
					} catch (IOException e4) {
						// TODO Auto-generated catch block
						e4.printStackTrace();
					}
				}
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			try {
				response.getWriter().write("Please log in");
			} catch (IOException e3) {
				try {
					response.getWriter().write("Please log in");
				} catch (IOException w1) {
					// TODO Auto-generated catch block
					w1.printStackTrace();
				}
			}
		}

	}

	@RequestMapping("/Menu_user_assignment")
	public ModelAndView Menu_user_assignment(HttpServletRequest request, ModelMap map, Model model) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");

			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				return new ModelAndView("Menu_user_assignment");

			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

	@Transactional
	@RequestMapping(value = "/save_menu_user", method = RequestMethod.POST)
	public ModelAndView save_menu_user(@ModelAttribute Bpil_User_Assignment user, BindingResult result,
			HttpServletRequest request, Model model, ModelMap map) {

		try {
			String loginString = (String) request.getSession().getAttribute("loginflag");
			Integer profile_id = (Integer) request.getSession().getAttribute("profileid");
			/* Login Checking Code Start */
			if (loginString.equals("Y")) {

				Integer userid = (Integer) request.getSession().getAttribute("userid");

				user.setCreated_by(userid);
				user.setLast_updated_by(userid);
				hibernateTemplate.saveOrUpdate(user);

				return new ModelAndView("Menu_user_assignment");
			} else {
				Bpil_Users kwm_users = new Bpil_Users();
				map.addAttribute("kwm_users", kwm_users);
				System.out.println("Here ------> berger login"); // Cursor comes to here
				return new ModelAndView("login");
			}
			/* Login Checking Code Ends */
		} catch (NullPointerException e) {
			Bpil_Users kwm_users = new Bpil_Users();
			map.addAttribute("kwm_users", kwm_users);
			System.out.println("Here ------> berger login"); // Cursor comes to here
			return new ModelAndView("login");
		}

	}

}
