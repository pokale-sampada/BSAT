package com.omfys.bsat.repositoryImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.omfys.bsat.repository.SchemeMasterDao;
import com.omfys.bsat.TilesConfiguration;
import com.omfys.bsat.model.Bpil_Dealer_Master;
import com.omfys.bsat.model.Bpil_Depot_Master;
import com.omfys.bsat.model.Bpil_Fin_Year;
import com.omfys.bsat.model.Bpil_Login_Details;
import com.omfys.bsat.model.Bpil_ReportGroup;
import com.omfys.bsat.model.Bpil_Report_Header;
import com.omfys.bsat.model.Bpil_Report_Lines;
import com.omfys.bsat.model.Bpil_Scheme_Benefit;
import com.omfys.bsat.model.Bpil_Scheme_Doc;
import com.omfys.bsat.model.Bpil_Users;
import com.omfys.bsat.model.New_Scheme_mstr;
import com.omfys.bsat.model.New_Scheme_mstr_for_Crm;
import com.omfys.bsat.model.Student;

@Repository("SchemeMasterDao")
public class SchemeMasterDaoImpl implements SchemeMasterDao {
	@Autowired
	HibernateTemplate hibernatetemplate;

	@Autowired
	private TilesConfiguration hibernateConfiguration;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	HibernateTemplate hibernateTemplate;

	public ArrayList<New_Scheme_mstr> masterautofill(int profile_id, int userid, String PMG_ML_Group) {
		String sql = null;

		if (profile_id == 6) { // for marketing
			// sql = "SELECT
			// SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE
			// "
			// + "FROM BPIL_SCHEME_MASTER WHERE CREATED_BY = "+ userid +" ORDER
			// BY SCHEME_ID DESC";
			sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER WHERE (ACTIVE_FLAG='Incomplete' OR ACTIVE_FLAG='Cancel' "
					+ "OR ACTIVE_FLAG='Rejected' OR ACTIVE_FLAG='Pending for Approval' OR ACTIVE_FLAG='Requested' "
					+ "OR ACTIVE_FLAG='Review' OR ACTIVE_FLAG='Fin Analysis Pending' OR ACTIVE_FLAG='Provisioned' "
					+ "OR ACTIVE_FLAG='Ready To Launch' OR ACTIVE_FLAG='Active' OR ACTIVE_FLAG='Ready For Redemption' "
					+ "OR ACTIVE_FLAG='Reward Processing Pending' OR ACTIVE_FLAG='Processed' OR  ACTIVE_FLAG='Freezed' "
					+ "OR ACTIVE_FLAG='Closed' ) " + "AND SCHEME_BUSINESS_LINE = '" + PMG_ML_Group
					+ "' ORDER BY SCHEME_ID DESC";
		} else if (profile_id == 3) { // for IT
			sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER WHERE ACTIVE_FLAG='Requested' ORDER BY SCHEME_ID DESC";
		} else if (profile_id == 2) { // for DEPO
			sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER WHERE (ACTIVE_FLAG='Active' OR  ACTIVE_FLAG='Processed' OR  ACTIVE_FLAG='Freezed' OR  ACTIVE_FLAG='Closed' ) "
					+ "AND SCHEME_ID IN (SELECT SM.SCHEME_ID FROM BPIL_SCHEME_MASTER SM, BPIL_SCHEME_DEPOT_DETAILS SD, "
					+ "BPIL_USERS BU WHERE SM.SCHEME_ID = SD.SCHEME_ID AND SD.SCH_DEPOT_CODE = BU.DEPOT_CODE "
					+ "AND BU.USER_ID = " + userid + ") ORDER BY SCHEME_ID DESC";
		} else if (profile_id == 5) { // for REGION
			sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER WHERE (ACTIVE_FLAG='Active' OR  ACTIVE_FLAG='Processed' OR  ACTIVE_FLAG='Freezed' OR  ACTIVE_FLAG='Closed' ) "
					+ "AND SCHEME_ID IN (SELECT SM.SCHEME_ID FROM BPIL_SCHEME_MASTER SM, BPIL_SCHEME_DEPOT_DETAILS SD, "
					+ "BPIL_USERS BU WHERE SM.SCHEME_ID = SD.SCHEME_ID AND SD.SCH_REGN = BU.REGION_CODE "
					+ "AND BU.USER_ID = " + userid + ") ORDER BY SCHEME_ID DESC";
		} else if (profile_id == 8) { // for TSI
			sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER WHERE (ACTIVE_FLAG='Active' OR  ACTIVE_FLAG='Processed' OR  ACTIVE_FLAG='Freezed' OR  ACTIVE_FLAG='Closed' ) "
					+ "AND SCHEME_ID IN (SELECT SM.SCHEME_ID FROM BPIL_SCHEME_MASTER SM, BPIL_SCHEME_DEPOT_DETAILS SD, Bpil_Dealer_Master dm, "
					+ "BPIL_USERS BU WHERE SM.SCHEME_ID = SD.SCHEME_ID and dm.terr_code = bu.terr_code and SD.sch_depot_code = bu.depot_code "
					+ "AND BU.USER_ID = " + userid + ") ORDER BY SCHEME_ID DESC";
		} else if (profile_id == 1) { // for dealer

//	Old Code		ArrayList<Bpil_Dealer_Master> dml = (ArrayList<Bpil_Dealer_Master>) hibernateTemplate
//					.find("from Bpil_Dealer_Master where user_id=?", userid);
			
			 
			ArrayList<Bpil_Users> busers_dml = (ArrayList<Bpil_Users>) hibernateTemplate
			.find("from Bpil_Users where user_id = "+userid+"");
			
			int dealer_code=Integer.parseInt(busers_dml.get(0).getUser_name());
			
			ArrayList<Bpil_Dealer_Master> dml = (ArrayList<Bpil_Dealer_Master>) hibernateTemplate
					.find("from Bpil_Dealer_Master where dealer_code = "+dealer_code+"");	
			
			String deptcode = dml.get(0).getDepot_code();
			System.out.println("depot code=" + deptcode);
			ArrayList<Bpil_Depot_Master> dml1 = (ArrayList<Bpil_Depot_Master>) hibernateTemplate
					.find("from Bpil_Depot_Master where depot_code='" + deptcode + "'");
			String region_code = dml1.get(0).getRegn();
			System.out.println("depot code=" + region_code);

			sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE FROM BPIL_SCHEME_MASTER WHERE ACTIVE_FLAG='Active' AND APPL_REGN_CODE ='"
					+ region_code + "' ORDER BY SCHEME_ID DESC";

		} else if (profile_id == 7) { // for supervisor of marketing
			sql = "SELECT SM.SCHEME_ID,SM.SCHEME_CODE,SM.SCHEME_NAME,SM.ACTIVE_FLAG,SM.START_DATE,SM.END_DATE,SM.SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER SM, BPIL_USERS BU WHERE (SM.ACTIVE_FLAG='Incomplete' OR SM.ACTIVE_FLAG='Cancel' "
					+ "OR SM.ACTIVE_FLAG='Rejected' OR SM.ACTIVE_FLAG='Pending for Approval' OR SM.ACTIVE_FLAG='Requested' "
					+ "OR SM.ACTIVE_FLAG='Review' OR SM.ACTIVE_FLAG='Fin Analysis Pending' OR SM.ACTIVE_FLAG='Provisioned' "
					+ "OR SM.ACTIVE_FLAG='Ready To Launch' OR SM.ACTIVE_FLAG='Active' OR SM.ACTIVE_FLAG='Ready For Redemption' "
					+ "OR SM.ACTIVE_FLAG='Reward Processing Pending' OR SM.ACTIVE_FLAG='Processed' OR SM.ACTIVE_FLAG='Freezed' "
					+ "OR  SM.ACTIVE_FLAG='Closed' ) " + "AND SM.CREATED_BY = BU.USER_ID and BU.SUPERVISOR_ID ="
					+ userid + " ORDER BY SCHEME_ID DESC";
		} else { // for admin
			sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE,SUBMISSION_DATE FROM BPIL_SCHEME_MASTER ORDER BY SCHEME_ID DESC";
		}

		List<New_Scheme_mstr> dml = jdbcTemplate.query(sql, new RowMapper<New_Scheme_mstr>() {

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
					aContact.setStart_date1(dateStr1);
					// try {
					// System.out.println(ser1.parse(rs.getString("START_DATE")));
					// } catch (ParseException e) {
					// e.printStackTrace();
					// }
				}

				if (rs.getDate("END_DATE") != null) {
					DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
					String dateStr1 = ser1.format(rs.getDate("END_DATE"));
					aContact.setEnd_date1(dateStr1);
					// try {
					// System.out.println(ser1.parse(rs.getString("END_DATE")));
					// } catch (ParseException e) {
					// e.printStackTrace();
					// }
				}

				if (rs.getDate("SUBMISSION_DATE") != null) {
					// DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy
					// hh:mm:ss a");
					DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
					String dateStr1 = ser1.format(rs.getDate("SUBMISSION_DATE"));
					// System.out.println("Submition date = " +dateStr1);
					aContact.setSubmission_date1(dateStr1);
					// try {
					// System.out.println(ser1.parse(rs.getString("SUBMISSION_DATE")));
					// } catch (ParseException e) {
					// e.printStackTrace();
					// }
				}
				
				ArrayList<Bpil_Scheme_Doc> doc_line = docautofill(rs.getInt("SCHEME_ID"));
				
				if(doc_line.size() > 0) {
				aContact.setScheme_doc(doc_line.get(0));
				}
				return aContact;
			}

		});

		return (ArrayList<New_Scheme_mstr>) dml;

	}

	public ArrayList<New_Scheme_mstr> pendingscehememasterautofill(int profile_id, int userid, String PMG_ML_Group) {
		String sql = null;
		List<New_Scheme_mstr> dml = new ArrayList<New_Scheme_mstr>();

		if (profile_id == 7) { // for supervisor of marketing
			sql = "SELECT SM.SCHEME_ID,SM.SCHEME_CODE,SM.SCHEME_NAME,SM.ACTIVE_FLAG,SM.START_DATE,SM.END_DATE,SM.SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER SM, BPIL_USERS BU WHERE SM.ACTIVE_FLAG='Pending for Approval' "
					+ "AND SM.CREATED_BY = BU.USER_ID and BU.SUPERVISOR_ID =" + userid + " ORDER BY SCHEME_ID DESC";

			dml = jdbcTemplate.query(sql, new RowMapper<New_Scheme_mstr>() {

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
						aContact.setStart_date1(dateStr1);
						// try {
						// System.out.println(ser1.parse(rs.getString("START_DATE")));
						// } catch (ParseException e) {
						// e.printStackTrace();
						// }
					}

					if (rs.getDate("END_DATE") != null) {
						DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
						String dateStr1 = ser1.format(rs.getDate("END_DATE"));
						aContact.setEnd_date1(dateStr1);
						// try {
						// System.out.println(ser1.parse(rs.getString("END_DATE")));
						// } catch (ParseException e) {
						// e.printStackTrace();
						// }
					}

					if (rs.getDate("SUBMISSION_DATE") != null) {
						// DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy
						// hh:mm:ss a");
						DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
						String dateStr1 = ser1.format(rs.getDate("SUBMISSION_DATE"));
						// System.out.println("Submition date = " +dateStr1);
						aContact.setSubmission_date1(dateStr1);
						// try {
						// System.out.println(ser1.parse(rs.getString("SUBMISSION_DATE")));
						// } catch (ParseException e) {
						// e.printStackTrace();
						// }
					}

					return aContact;
				}

			});
		}
		
		if (profile_id == 3) { // for supervisor of marketing
			sql = "SELECT SM.SCHEME_ID,SM.SCHEME_CODE,SM.SCHEME_NAME,SM.ACTIVE_FLAG,SM.START_DATE,SM.END_DATE,SM.SUBMISSION_DATE "
					+ "FROM BPIL_SCHEME_MASTER SM, BPIL_USERS BU WHERE SM.ACTIVE_FLAG='Pending for Approval' "
					+ "AND SM.CREATED_BY = BU.USER_ID ORDER BY SCHEME_ID DESC";

			dml = jdbcTemplate.query(sql, new RowMapper<New_Scheme_mstr>() {

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
						aContact.setStart_date1(dateStr1);
						// try {
						// System.out.println(ser1.parse(rs.getString("START_DATE")));
						// } catch (ParseException e) {
						// e.printStackTrace();
						// }
					}

					if (rs.getDate("END_DATE") != null) {
						DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
						String dateStr1 = ser1.format(rs.getDate("END_DATE"));
						aContact.setEnd_date1(dateStr1);
						// try {
						// System.out.println(ser1.parse(rs.getString("END_DATE")));
						// } catch (ParseException e) {
						// e.printStackTrace();
						// }
					}

					if (rs.getDate("SUBMISSION_DATE") != null) {
						// DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy
						// hh:mm:ss a");
						DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
						String dateStr1 = ser1.format(rs.getDate("SUBMISSION_DATE"));
						// System.out.println("Submition date = " +dateStr1);
						aContact.setSubmission_date1(dateStr1);
						// try {
						// System.out.println(ser1.parse(rs.getString("SUBMISSION_DATE")));
						// } catch (ParseException e) {
						// e.printStackTrace();
						// }
					}

					return aContact;
				}

			});
		}

		return (ArrayList<New_Scheme_mstr>) dml;

	}

	public New_Scheme_mstr schemeautofill(int schemeid) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		New_Scheme_mstr Scheme_bean = (New_Scheme_mstr) session.load(New_Scheme_mstr.class, schemeid);

		if (Scheme_bean.getStart_date() != null) {
			DateFormat cre12 = new SimpleDateFormat("dd-MM-yyyy");
			System.out.println("$$$$$$$$$$$$$$shilpi"+Scheme_bean.getStart_date());
			String dateStr2 = cre12.format(Scheme_bean.getStart_date());
			System.out.println(dateStr2+"         ---------------------------1");
			//Scheme_bean.setStart_date1(dateStr2);  
			Scheme_bean.setStart_date1(dateStr2);
			
			DateFormat cre1 = new SimpleDateFormat("dd-MM-yyyy");
			String dateStr = cre1.format(Scheme_bean.getEnd_date());

			System.out.println(dateStr+"         ---------------------------2");

			Scheme_bean.setEnd_date1(dateStr);
			
			
		}
		
		
		DateFormat cre2 = new SimpleDateFormat("dd-MM-yyyy");
		System.out.println("************"+Scheme_bean.getCreation_date());
		String dateStrr = cre2.format(Scheme_bean.getCreation_date());
		Scheme_bean.setCreation_date1(dateStrr);
		if (Scheme_bean.getRedemption_date() != null) {
			DateFormat cre4 = new SimpleDateFormat("dd-MM-yyyy");
			String redemp_date = cre4.format(Scheme_bean.getRedemption_date());
			System.out.println(redemp_date+"         ---------------------------3");
			Scheme_bean.setRedemp_date1(redemp_date);
		}
		tx.commit();
		// System.out.println("Scheme_bean in dao="+Scheme_bean);
		session.close();
		return Scheme_bean;

	}
	
	public New_Scheme_mstr_for_Crm crmschemeautofill(int schemeid) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		New_Scheme_mstr_for_Crm Scheme_bean = (New_Scheme_mstr_for_Crm) session.load(New_Scheme_mstr_for_Crm.class, schemeid);

		if (Scheme_bean.getStart_date() != null) {
			DateFormat cre12 = new SimpleDateFormat("dd-MM-yyyy");
			System.out.println("$$$$$$$$$$$$$$shilpi"+Scheme_bean.getStart_date());
			String dateStr2 = cre12.format(Scheme_bean.getStart_date());
			System.out.println(dateStr2+"         ---------------------------1");
			//Scheme_bean.setStart_date1(dateStr2);  
			Scheme_bean.setStart_date1(dateStr2);
			
			DateFormat cre1 = new SimpleDateFormat("dd-MM-yyyy");
			String dateStr = cre1.format(Scheme_bean.getEnd_date());

			System.out.println(dateStr+"         ---------------------------2");

			Scheme_bean.setEnd_date1(dateStr);
			
			
		}
		
		
		DateFormat cre2 = new SimpleDateFormat("dd-MM-yyyy");
		System.out.println("************"+Scheme_bean.getCreation_date());
		String dateStrr = cre2.format(Scheme_bean.getCreation_date());
		Scheme_bean.setCreation_date1(dateStrr);
		if (Scheme_bean.getRedemption_date() != null) {
			DateFormat cre4 = new SimpleDateFormat("dd-MM-yyyy");
			String redemp_date = cre4.format(Scheme_bean.getRedemption_date());
			System.out.println(redemp_date+"         ---------------------------3");
			Scheme_bean.setRedemp_date1(redemp_date);
		}
		tx.commit();
		// System.out.println("Scheme_bean in dao="+Scheme_bean);
		session.close();
		return Scheme_bean;

	}

	public ArrayList<Bpil_Scheme_Doc> docautofill(int schemeid) {
		// ArrayList<Bpil_Scheme_Doc> dml = (ArrayList<Bpil_Scheme_Doc>)
		// hibernatetemplate.find("from Bpil_Scheme_Doc where
		// scheme_id=?",schemeid);
		String sql = "SELECT SCHEME_DOC_ID,DOC_TYPE,DOC_TITLE,DOC_UPLOAD_DATE,REVISION FROM BPIL_SCHEME_DOCS WHERE SCHEME_ID="
				+ schemeid
				+ " AND DOC_TYPE='Scheme Document' AND  REVISION  = (SELECT MAX(REVISION) FROM BPIL_SCHEME_DOCS WHERE SCHEME_ID = "
				+ schemeid + "  AND DOC_TYPE='Scheme Document')";

		List<Bpil_Scheme_Doc> dml = jdbcTemplate.query(sql, new RowMapper<Bpil_Scheme_Doc>() {

			@Override
			public Bpil_Scheme_Doc mapRow(ResultSet rs, int rowNum) throws SQLException {
				Bpil_Scheme_Doc aContact = new Bpil_Scheme_Doc();

				aContact.setScheme_doc_id(rs.getInt("SCHEME_DOC_ID"));
				aContact.setDoc_type(rs.getString("DOC_TYPE"));
				aContact.setDoc_title(rs.getString("DOC_TITLE"));
				aContact.setRevision(rs.getInt("REVISION"));
				if (rs.getDate("DOC_UPLOAD_DATE") != null) {
					DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
					String dateStr1 = ser1.format(rs.getDate("DOC_UPLOAD_DATE"));
					aContact.setDoc_upload_date1(dateStr1);
					// try {
					// System.out.println(ser1.parse(rs.getString("DOC_UPLOAD_DATE")));
					// } catch (ParseException e) {
					// e.printStackTrace();
					// }
				}

				return aContact;
			}

		});

		return (ArrayList<Bpil_Scheme_Doc>) dml;

	}

	public ArrayList<Bpil_Scheme_Benefit> giftautofill(int schemeid) {
		ArrayList<Bpil_Scheme_Benefit> dml = (ArrayList<Bpil_Scheme_Benefit>) hibernatetemplate
				.find("from Bpil_Scheme_Benefit where scheme_id= "+schemeid);
		return dml;
	}

	// rewards history
	public ArrayList<New_Scheme_mstr> gethistory(int userid) {
		String sql = "SELECT SCHEME_ID,SCHEME_CODE,SCHEME_NAME,ACTIVE_FLAG,START_DATE,END_DATE FROM BPIL_SCHEME_MASTER WHERE ACTIVE_FLAG='Freezed' OR ACTIVE_FLAG='Closed' ORDER BY SCHEME_ID DESC";
		List<New_Scheme_mstr> dml = jdbcTemplate.query(sql, new RowMapper<New_Scheme_mstr>() {

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
					aContact.setStart_date1(dateStr1);
					try {
						System.out.println(ser1.parse(rs.getString("START_DATE")));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}

				if (rs.getDate("END_DATE") != null) {
					DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
					String dateStr1 = ser1.format(rs.getDate("END_DATE"));
					aContact.setEnd_date1(dateStr1);
					try {
						System.out.println(ser1.parse(rs.getString("END_DATE")));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}

				return aContact;
			}

		});

		return (ArrayList<New_Scheme_mstr>) dml;

	}

	public List<Bpil_Scheme_Doc> showdoc(String schemeid)

	{
		String sql = "select SCHEME_DOC_ID,DOC_TYPE,DOC_TITLE,REVISION,DOC_UPLOAD_DATE,COMMENTS from BPIL_SCHEME_DOCS where SCHEME_ID="
				+ schemeid;

		List<Bpil_Scheme_Doc> list = jdbcTemplate.query(sql, new RowMapper<Bpil_Scheme_Doc>()

		{
			@Override

			public Bpil_Scheme_Doc mapRow(ResultSet rs, int num) throws SQLException

			{
				Bpil_Scheme_Doc aContact = new Bpil_Scheme_Doc();

				aContact.setScheme_doc_id(rs.getInt("SCHEME_DOC_ID"));
				aContact.setDoc_type(rs.getString("DOC_TYPE"));

				aContact.setDoc_title(rs.getString("DOC_TITLE"));

				aContact.setRevision(rs.getInt("REVISION"));
				aContact.setComments(rs.getString("COMMENTS"));

				// aContact.setDoc_upload_date(rs.getDate("DOC_UPLOAD_DATE"));
				if (rs.getDate("DOC_UPLOAD_DATE") != null) {
					DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
					String dateStr1 = ser1.format(rs.getDate("DOC_UPLOAD_DATE"));
					aContact.setDoc_upload_date1(dateStr1);
					try {
						System.out.println(ser1.parse(rs.getString("DOC_UPLOAD_DATE")));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}

				return aContact;

			}

		});

		return list;

	}

	@Override
	public boolean updateUser(Bpil_Users bpil_Users) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
			String query = "update Bpil_Users set last_login = :last_login where user_id = :id";
			Query sql = session.createQuery(query);
			sql.setParameter("id", bpil_Users.getUser_id());
			sql.setParameter("last_login", bpil_Users.getLast_login());
			
			sql.executeUpdate();

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			tx.commit();
			session.close();
			System.gc();
		}
		return false;
	}

	@Override
	public boolean updateLoginCount(Bpil_Login_Details bpil_Login_Details) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(bpil_Login_Details);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			tx.commit();
			session.close();
			System.gc();
		}
		return false;
	}
	
	@Override
	public boolean addLoginCount(Bpil_Login_Details bpil_Login_Details) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(bpil_Login_Details);
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			tx.commit();
			session.close();
			System.gc();
		}
		return false;
	}

	@Override
	public Bpil_Login_Details getLoginCount(int userId, String month) {
		Session session = hibernateTemplate.getSessionFactory().openSession();
		Transaction tx = null;
		Bpil_Login_Details loginDetails = null;
		try {
			tx = session.beginTransaction();
			
			String query = "from Bpil_Login_Details b where b.bpil_user_id.user_id = :id and b.month = :month";
			Query sql = session.createQuery(query);
			sql.setParameter("id", userId);
			sql.setParameter("month", month);
			
			loginDetails = (Bpil_Login_Details) sql.uniqueResult();

			return loginDetails;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			tx.commit();
			session.close();
			System.gc();
		}
		return loginDetails;
	}

	@Override
	public Bpil_Users getUserById(int userId) {
		Bpil_Users user = null;
		Transaction tx = null;
		Session session = hibernatetemplate.getSessionFactory().openSession();
		try{
			tx = session.beginTransaction();
			
			String query = "from Bpil_Users where user_id = :userId";
			Query sql = session.createQuery(query);
			sql.setParameter("userId", userId);
			
			user = (Bpil_Users) sql.uniqueResult();
			
			return user;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			tx.commit();
			session.close();
			System.gc();
		}
		return user;
	}

	@Override
	public int getLastSchemeId() {
		int scheme_id = 0;
		Transaction tx = null;
		Session session = hibernatetemplate.getSessionFactory().openSession();
		try{
			tx = session.beginTransaction();
			
			String query = "select max(sm.scheme_id) from New_Scheme_mstr sm";
			Query sql = session.createQuery(query);
			
			scheme_id = (int) sql.uniqueResult();
			
			return scheme_id;
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			tx.commit();
			session.close();
			System.gc();
		}
		return 0;
	}
	
	@Override
	public List<Bpil_Users> getall() {
	String sql="SELECT * FROM Bpil_Users";

	List<Bpil_Users> dml=new ArrayList<Bpil_Users>();
	dml = (ArrayList<Bpil_Users>) jdbcTemplate.query(sql, new RowMapper<Bpil_Users>()
	{

	@Override
	public Bpil_Users mapRow(ResultSet rs, int num) throws SQLException
	{
		Bpil_Users aContact = new Bpil_Users();

	aContact.setUser_id(rs.getInt("USER_ID"));
	int i=Integer.parseInt(rs.getString("PROFILE_ID").toString());
	aContact.setProfile_id(i);
	int j=Integer.parseInt(rs.getString("SUPERVISOR_ID").toString());
	aContact.setSupervisor_id(j);

	

	return aContact;

	// TODO Auto-generated method stunull;
	}

	});
	return dml;
	}

	@Override
	public void getall2(Student s) {
		
		this.hibernatetemplate.save(s);

	}



}