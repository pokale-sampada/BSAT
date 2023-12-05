package com.omfys.bsat.controller;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.json.JsonObject;
import javax.json.JsonObjectBuilder;
import javax.json.JsonReader;
import javax.json.JsonValue;
import javax.json.JsonWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.soap.MessageFactory;
import javax.xml.soap.MimeHeaders;
import javax.xml.soap.Name;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPFactory;
import javax.xml.soap.SOAPHeader;
import javax.xml.soap.SOAPHeaderElement;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
import com.omfys.bsat.repository.SchemeMasterDao;
import com.omfys.bsat.model.Maxlife_Adm;
import com.omfys.bsat.model.Maxlife_Agent;
import com.omfys.bsat.model.Maxlife_Transaction;
import com.omfys.bsat.TilesConfiguration;
import com.omfys.bsat.model.Bpil_DealerOPAInput;
import com.omfys.bsat.model.Bpil_Dealers;
import com.omfys.bsat.model.Bpil_Opa_Rw_Analysis_Rw;
import com.omfys.bsat.model.Bpil_Opa_Sch_Analysis_Rw;
import com.omfys.bsat.model.Bpil_ProductOPAInput;
import com.omfys.bsat.model.Bpil_Products;
import com.omfys.bsat.model.Bpil_RewardOPAOutput;
import com.omfys.bsat.model.Bpil_SalesReps;
import com.omfys.bsat.model.Bpil_Scheme_Doc;
import com.omfys.bsat.model.Bpil_Users;
import com.omfys.bsat.model.Bpil_opa_scheme_analysis;
import com.omfys.bsat.model.New_Scheme_mstr;
import com.omfys.bsat.model.OPA_Output_table;
import com.omfys.bsat.model.Staging_Table;

import oracle.jdbc.internal.OracleTypes;

@Transactional
@Controller
public class CallOPA_RewardsAnalysis {

	@Autowired
	HibernateTemplate hibernateTemplate;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	TilesConfiguration hibernateconfiguration;

	@Autowired
	SchemeMasterDao schememasterdao;

	@Autowired
	private Environment environment;

	public int callopaprocess(String depot_code, String scheme_id, String finanalysis) {

		int Scheme_budget = 0;

		System.out.println("scheme_id = " + scheme_id + " depot_name = " + depot_code);

		String sql = "select SCHEME_CODE,START_DATE,END_DATE,ACTIVE_FLAG, APPL_DEPOT_CODE, APPL_PRODUCT_CODES , SCH_OPA_URL from BPIL_SCHEME_MASTER WHERE SCHEME_ID = '"
				+ scheme_id + "'";

		System.out.println(sql);

		List<New_Scheme_mstr> Scheme = jdbcTemplate.query(sql, new RowMapper<New_Scheme_mstr>() {

			@Override
			public New_Scheme_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
				String schemecode = rs.getString("SCHEME_CODE");

				System.out.println("schemecode " + schemecode);

				Date START_DATE = rs.getDate("START_DATE");

				System.out.println("START_DATE " + START_DATE);

				Date END_DATE = rs.getDate("END_DATE");

				System.out.println("END_DATE " + END_DATE);

				String ACTIVE_FLAG = rs.getString("ACTIVE_FLAG");

				System.out.println("ACTIVE_FLAG " + ACTIVE_FLAG);

				String APPL_DEPOT_CODE = rs.getString("APPL_DEPOT_CODE");

				System.out.println("APPL_DEPOT_CODE " + APPL_DEPOT_CODE);

				String SCH_PRODUCT_CODES = rs.getString("APPL_PRODUCT_CODES");

				System.out.println("SCH_PRODUCT_CODES " + SCH_PRODUCT_CODES);

				String SCH_OPA_URL = rs.getString("SCH_OPA_URL");

				System.out.println("SCH_OPA_URL " + SCH_OPA_URL);

				New_Scheme_mstr Scheme_mstr = new New_Scheme_mstr();
				Scheme_mstr.setScheme_code(schemecode);
				Scheme_mstr.setStart_date(START_DATE);
				Scheme_mstr.setEnd_date(END_DATE);
				Scheme_mstr.setActive_flag(ACTIVE_FLAG);
				Scheme_mstr.setAppl_depot_code(APPL_DEPOT_CODE);
				Scheme_mstr.setSch_product_codes(SCH_PRODUCT_CODES);
				Scheme_mstr.setSch_opa_url(SCH_OPA_URL);

				return Scheme_mstr;
			}

		});

		List<Bpil_Dealers> Dealers = new ArrayList<Bpil_Dealers>();
		List<Bpil_Products> Products = new ArrayList<Bpil_Products>();
		List<Bpil_SalesReps> SalesReps = new ArrayList<Bpil_SalesReps>();

		String Scheme_code = Scheme.get(0).getScheme_code();
		Date START_DATE = Scheme.get(0).getStart_date();
		Date END_DATE = Scheme.get(0).getEnd_date();
		String ACTIVE_FLAG = Scheme.get(0).getActive_flag();
		String APPL_DEPOT_CODE = Scheme.get(0).getAppl_depot_code();
		String SCH_PRODUCT_CODES = Scheme.get(0).getSch_product_codes();
		String SCH_OPA_URL = Scheme.get(0).getSch_opa_url();
		System.out.println("Scheme id = " + scheme_id + " Scheme_code = " + Scheme_code + " START_DATE = " + START_DATE
				+ " END_DATE = " + END_DATE + " ACTIVE_FLAG = " + ACTIVE_FLAG + " APPL_DEPOT_CODE = " + APPL_DEPOT_CODE
				+ " SCH_PRODUCT_CODES = " + SCH_PRODUCT_CODES + " SCH_OPA_URL = " + SCH_OPA_URL);

		CallableStatement cStmt;
		try {
			cStmt = hibernateconfiguration.dataSource().getConnection()
					.prepareCall("{call BPIL_GET_OPA_INPUT(?,?,?,?,?,?)}");
			cStmt.setInt(1, Integer.parseInt(scheme_id));
			// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1")) {
			// cStmt.setString(2, "");
			// } else {
			cStmt.setString(2, depot_code);
			cStmt.setString(3, finanalysis);
			// }

			cStmt.registerOutParameter(4, OracleTypes.CURSOR);
			cStmt.registerOutParameter(5, OracleTypes.CURSOR);
			cStmt.registerOutParameter(6, OracleTypes.CURSOR);
			ResultSet result = cStmt.executeQuery();
			ResultSet rssales = (ResultSet) cStmt.getObject(4);
			ResultSet rsdealers = (ResultSet) cStmt.getObject(5);
			ResultSet rsproducts = (ResultSet) cStmt.getObject(6);

			while (rssales.next()) {
				Bpil_SalesReps bpil_SalesReps = new Bpil_SalesReps();

				bpil_SalesReps.setREGN(rssales.getString("REGN"));
				bpil_SalesReps.setDEPOT_CODE(rssales.getString("DEPOT_CODE"));
				bpil_SalesReps.setDEPOT_NAME(rssales.getString("DEPOT_NAME"));
				bpil_SalesReps.setTERR_CODE(rssales.getString("TERR_CODE"));
				bpil_SalesReps.setTERR_NAME(rssales.getString("TERR_NAME"));

				SalesReps.add(bpil_SalesReps);
			}

			while (rsdealers.next()) {
				Bpil_Dealers bpil_Dealers = new Bpil_Dealers();

				bpil_Dealers.setREGN(rsdealers.getString("REGN"));
				bpil_Dealers.setDEPOT_CODE(rsdealers.getString("DEPOT_CODE"));
				bpil_Dealers.setDEPOT_NAME(rsdealers.getString("DEPOT_NAME"));
				bpil_Dealers.setBILL_TO_ID(rsdealers.getInt("BILL_TO_ID"));
				bpil_Dealers.setDLR_AC_NO(rsdealers.getString("DLR_AC_NO"));
				bpil_Dealers.setDLR_AC_NAME(rsdealers.getString("DLR_AC_NAME"));
				bpil_Dealers.setDLR_CAT(rsdealers.getString("DLR_CAT"));
				bpil_Dealers.setCUST_TYPE(rsdealers.getString("CUST_TYPE"));
				bpil_Dealers.setTERR_CODE(rsdealers.getString("TERR_CODE"));

				Dealers.add(bpil_Dealers);
			}

			while (rsproducts.next()) {
				Bpil_Products bpil_Products = new Bpil_Products();

				bpil_Products.setBILL_TO_ID(rsproducts.getInt("BILL_TO_ID"));
				bpil_Products.setPRD_CAT(rsproducts.getString("PRD_CAT"));
				bpil_Products.setPRD_CODE(rsproducts.getString("PRD_CODE"));
				bpil_Products.setSHD_CODE(rsproducts.getString("SHD_CODE"));
				bpil_Products.setPRD_UOM(rsproducts.getString("PRD_UOM"));
				bpil_Products.setPACK_SIZE(rsproducts.getInt("PACK_SIZE"));
				bpil_Products.setSLS_TRX_DATE(rsproducts.getDate("SLS_TRX_DATE"));
				bpil_Products.setSLS_VOL(rsproducts.getInt("SLS_VOL"));
				bpil_Products.setSLS_FNL_VOL(rsproducts.getInt("SLS_FNL_VOL"));
				bpil_Products.setSLS_VAL(rsproducts.getInt("SLS_VAL"));
				bpil_Products.setSLS_VOL_RW(rsproducts.getInt("SLS_VOL_RW"));
				bpil_Products.setSLS_FNL_VOL_RW(rsproducts.getInt("SLS_FNL_VOL_RW"));
				bpil_Products.setSLS_VAL_RW(rsproducts.getInt("SLS_VAL_RW"));

				Products.add(bpil_Products);
			}

			// SalesReps = (List<Bpil_SalesReps>) rssales;
			// Dealers = (List<Bpil_Dealers>) rsdealers;
			// Products = (List<Bpil_Products>) rsproducts;

			System.out.println("SalesReps size = " + SalesReps.size() + " Dealers size = " + Dealers.size()
					+ " Products = " + Products.size());

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		// Date LYSD = START_DATE, LYED = END_DATE, L2LSD = START_DATE, L2LED =
		// END_DATE;
		//
		// Calendar cal = Calendar.getInstance();
		// cal.setTime(LYSD);
		// cal.add(Calendar.YEAR, -1);
		// LYSD = cal.getTime();
		//
		// System.out.println("LYSD " + LYSD);
		//
		// Calendar cal2 = Calendar.getInstance();
		// cal2.setTime(LYED);
		// cal2.add(Calendar.YEAR, -1);
		// LYED = cal2.getTime();
		//
		// System.out.println("LYED " + LYED);
		//
		// Calendar cal3 = Calendar.getInstance();
		// cal3.setTime(L2LSD);
		// cal3.add(Calendar.YEAR, -2);
		// L2LSD = cal3.getTime();
		//
		// System.out.println("L2LSD " + L2LSD);
		//
		// Calendar cal4 = Calendar.getInstance();
		// cal4.setTime(L2LED);
		// cal4.add(Calendar.YEAR, -2);
		// L2LED = cal4.getTime();
		//
		// System.out.println("L2LED " + L2LED);
		//
		// List<Staging_Table> Dealers = new ArrayList<Staging_Table>();
		// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1")) {
		// Dealers = getDealers(depot_name, LYSD, LYED, L2LSD, L2LED,
		// APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
		// finanalysis);
		// } else {
		// Dealers = getDealers(depot_name, START_DATE, END_DATE, LYSD, LYED,
		// APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
		// finanalysis);
		// }
		//
		// System.out.println("Dealer size "+Dealers.size());

		// for (int i = 0; i < Dealers.size(); i++) {
		//
		// String prntcode = Dealers.get(i).getPrnt_code();
		//
		// int billtocode = Dealers.get(i).getChild_code();
		//
		// System.out.println("prntcode " + prntcode);
		//
		// System.out.println("billtocode " + billtocode);

		// String sql2 = "select depo_name from BPIL_OPA_STG_TRX_DETAILS
		// where PRNT_CODE = '" + prntcode + "'";

		// String sql2 = "select depo_name, PRNT_CODE from
		// BPIL_OPA_STG_TRX_DETAILS where CHILD_CODE = '"
		// + billtocode + "'";
		//
		// System.out.println(sql2);
		//
		// List<Staging_Table> depo_prnt_code = jdbcTemplate.query(sql2, new
		// RowMapper<Staging_Table>() {
		//
		// @Override
		// public Staging_Table mapRow(ResultSet rs, int rowNum) throws
		// SQLException {
		// String deponame = rs.getString("depo_name");
		// String PRNT_CODE = rs.getString("PRNT_CODE");
		//
		// System.out.println("deponame = " + deponame + " PRNT_CODE = " +
		// PRNT_CODE);
		//
		// Staging_Table st_depo_prnt = new Staging_Table();
		// st_depo_prnt.setDepo_name(deponame);
		// st_depo_prnt.setPrnt_code(PRNT_CODE);
		//
		// return st_depo_prnt;
		//
		// }
		//
		// });

		// Dealers.get(i).setDepo_name(depo_prnt_code.get(0).getDepo_name());
		// Dealers.get(i).setPrnt_code(depo_prnt_code.get(0).getPrnt_code());
		// }

		// Date LYSD = START_DATE, LYED = END_DATE, L2LSD = START_DATE, L2LED =
		// END_DATE;

		// Calendar cal = Calendar.getInstance();
		// cal.setTime(LYSD);
		// cal.add(Calendar.YEAR, -1);
		// LYSD = cal.getTime();

		// System.out.println("LYSD " + LYSD);
		//
		// Calendar cal2 = Calendar.getInstance();
		// cal2.setTime(LYED);
		// cal2.add(Calendar.YEAR, -1);
		// LYED = cal2.getTime();

		// System.out.println("LYED " + LYED);
		//
		// Calendar cal3 = Calendar.getInstance();
		// cal3.setTime(L2LSD);
		// cal3.add(Calendar.YEAR, -2);
		// L2LSD = cal3.getTime();

		// System.out.println("L2LSD " + L2LSD);
		//
		// Calendar cal4 = Calendar.getInstance();
		// cal4.setTime(L2LED);
		// cal4.add(Calendar.YEAR, -2);
		// L2LED = cal4.getTime();
		//
		// System.out.println("L2LED " + L2LED);

		// List<Staging_Table> Products = new ArrayList<Staging_Table>();
		// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1")) {
		// Products = getProducts(depot_name, 0, LYSD, LYED, L2LSD, L2LED,
		// APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
		// finanalysis);
		// } else {
		// Products = getProducts(depot_name, 0, START_DATE, END_DATE, LYSD,
		// LYED, APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
		// finanalysis);
		// }

		// System.out.println("Products size " + Products.size());

		Date Sd = new Date();
		System.out.println("Start call to webservice" + Sd);

		Scheme_budget = callsoap_webservice(Dealers, Products, scheme_id, Scheme_code, SCH_OPA_URL, finanalysis);

		Date Ed = new Date();
		System.out.println("End call to webservice" + Ed);

		System.out.println("Total time : Sw " + Sd + " Ew " + Ed);

		System.out.println("Scheme_budget = " + Scheme_budget);

		return Scheme_budget;

	}

	@RequestMapping("/callopa")
	public void callopa(@RequestParam(value = "depot_name") String depot_name,
			@RequestParam(value = "scheme_id") String scheme_id,
			@RequestParam(value = "finanalysis") String finanalysis, ModelMap map, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		String kwm_user = (String) request.getSession().getAttribute("kwm_user");
		int Scheme_budget = 0;
		if (kwm_user != null) {

			System.out.println("scheme_id = " + scheme_id + " depot_name = " + depot_name);

			String sql = "select SCHEME_CODE,START_DATE,END_DATE,ACTIVE_FLAG, APPL_DEPOT_CODE, APPL_PRODUCT_CODES , SCH_OPA_URL from BPIL_SCHEME_MASTER WHERE SCHEME_ID = '"
					+ scheme_id + "'";

			System.out.println(sql);

			List<New_Scheme_mstr> Scheme = jdbcTemplate.query(sql, new RowMapper<New_Scheme_mstr>() {

				@Override
				public New_Scheme_mstr mapRow(ResultSet rs, int rowNum) throws SQLException {
					String schemecode = rs.getString("SCHEME_CODE");

					System.out.println("schemecode " + schemecode);

					Date START_DATE = rs.getDate("START_DATE");

					System.out.println("START_DATE " + START_DATE);

					Date END_DATE = rs.getDate("END_DATE");

					System.out.println("END_DATE " + END_DATE);

					String ACTIVE_FLAG = rs.getString("ACTIVE_FLAG");

					System.out.println("ACTIVE_FLAG " + ACTIVE_FLAG);

					String APPL_DEPOT_CODE = rs.getString("APPL_DEPOT_CODE");

					System.out.println("APPL_DEPOT_CODE " + APPL_DEPOT_CODE);

					String SCH_PRODUCT_CODES = rs.getString("APPL_PRODUCT_CODES");

					System.out.println("SCH_PRODUCT_CODES " + SCH_PRODUCT_CODES);

					String SCH_OPA_URL = rs.getString("SCH_OPA_URL");

					System.out.println("SCH_OPA_URL " + SCH_OPA_URL);

					New_Scheme_mstr Scheme_mstr = new New_Scheme_mstr();
					Scheme_mstr.setScheme_code(schemecode);
					Scheme_mstr.setStart_date(START_DATE);
					Scheme_mstr.setEnd_date(END_DATE);
					Scheme_mstr.setActive_flag(ACTIVE_FLAG);
					Scheme_mstr.setAppl_depot_code(APPL_DEPOT_CODE);
					Scheme_mstr.setSch_product_codes(SCH_PRODUCT_CODES);
					Scheme_mstr.setSch_opa_url(SCH_OPA_URL);

					return Scheme_mstr;
				}

			});

			List<Bpil_Dealers> Dealers = new ArrayList<Bpil_Dealers>();
			List<Bpil_Products> Products = new ArrayList<Bpil_Products>();
			List<Bpil_SalesReps> SalesReps = new ArrayList<Bpil_SalesReps>();

			String Scheme_code = Scheme.get(0).getScheme_code();
			Date START_DATE = Scheme.get(0).getStart_date();
			Date END_DATE = Scheme.get(0).getEnd_date();
			String ACTIVE_FLAG = Scheme.get(0).getActive_flag();
			String APPL_DEPOT_CODE = Scheme.get(0).getAppl_depot_code();
			String SCH_PRODUCT_CODES = Scheme.get(0).getSch_product_codes();
			String SCH_OPA_URL = Scheme.get(0).getSch_opa_url();
			System.out.println("Scheme id = " + scheme_id + " Scheme_code = " + Scheme_code + " START_DATE = "
					+ START_DATE + " END_DATE = " + END_DATE + " ACTIVE_FLAG = " + ACTIVE_FLAG + " APPL_DEPOT_CODE = "
					+ APPL_DEPOT_CODE + " SCH_PRODUCT_CODES = " + SCH_PRODUCT_CODES + " SCH_OPA_URL = " + SCH_OPA_URL);

			CallableStatement cStmt;
			try {
				cStmt = hibernateconfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_OPA_INPUT(?,?,?,?,?,?)}");
				cStmt.setInt(1, Integer.parseInt(scheme_id));
				// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1"))
				// {
				// cStmt.setString(2, "");
				// } else {
				cStmt.setString(2, depot_name);
				cStmt.setString(3, finanalysis);
				// }

				cStmt.registerOutParameter(4, OracleTypes.CURSOR);
				cStmt.registerOutParameter(5, OracleTypes.CURSOR);
				cStmt.registerOutParameter(6, OracleTypes.CURSOR);
				ResultSet result = cStmt.executeQuery();
				ResultSet rssales = (ResultSet) cStmt.getObject(4);
				ResultSet rsdealers = (ResultSet) cStmt.getObject(5);
				ResultSet rsproducts = (ResultSet) cStmt.getObject(6);

				while (rssales.next()) {
					Bpil_SalesReps bpil_SalesReps = new Bpil_SalesReps();

					bpil_SalesReps.setREGN(rssales.getString("REGN"));
					bpil_SalesReps.setDEPOT_CODE(rssales.getString("DEPOT_CODE"));
					bpil_SalesReps.setDEPOT_NAME(rssales.getString("DEPOT_NAME"));
					bpil_SalesReps.setTERR_CODE(rssales.getString("TERR_CODE"));
					bpil_SalesReps.setTERR_NAME(rssales.getString("TERR_NAME"));

					SalesReps.add(bpil_SalesReps);
				}

				while (rsdealers.next()) {
					Bpil_Dealers bpil_Dealers = new Bpil_Dealers();

					bpil_Dealers.setREGN(rsdealers.getString("REGN"));
					bpil_Dealers.setDEPOT_CODE(rsdealers.getString("DEPOT_CODE"));
					bpil_Dealers.setDEPOT_NAME(rsdealers.getString("DEPOT_NAME"));
					bpil_Dealers.setBILL_TO_ID(rsdealers.getInt("BILL_TO_ID"));
					bpil_Dealers.setDLR_AC_NO(rsdealers.getString("DLR_AC_NO"));
					bpil_Dealers.setDLR_AC_NAME(rsdealers.getString("DLR_AC_NAME"));
					bpil_Dealers.setDLR_CAT(rsdealers.getString("DLR_CAT"));
					bpil_Dealers.setCUST_TYPE(rsdealers.getString("CUST_TYPE"));
					bpil_Dealers.setTERR_CODE(rsdealers.getString("TERR_CODE"));

					Dealers.add(bpil_Dealers);
				}

				while (rsproducts.next()) {
					Bpil_Products bpil_Products = new Bpil_Products();

					bpil_Products.setBILL_TO_ID(rsproducts.getInt("BILL_TO_ID"));
					bpil_Products.setPRD_CAT(rsproducts.getString("PRD_CAT"));
					bpil_Products.setPRD_CODE(rsproducts.getString("PRD_CODE"));
					bpil_Products.setSHD_CODE(rsproducts.getString("SHD_CODE"));
					bpil_Products.setPRD_UOM(rsproducts.getString("PRD_UOM"));
					bpil_Products.setPACK_SIZE(rsproducts.getInt("PACK_SIZE"));
					bpil_Products.setSLS_TRX_DATE(rsproducts.getDate("SLS_TRX_DATE"));
					bpil_Products.setSLS_VOL(rsproducts.getInt("SLS_VOL"));
					bpil_Products.setSLS_FNL_VOL(rsproducts.getInt("SLS_FNL_VOL"));
					bpil_Products.setSLS_VAL(rsproducts.getInt("SLS_VAL"));
					bpil_Products.setSLS_VOL_RW(rsproducts.getInt("SLS_VOL_RW"));
					bpil_Products.setSLS_FNL_VOL_RW(rsproducts.getInt("SLS_FNL_VOL_RW"));
					bpil_Products.setSLS_VAL_RW(rsproducts.getInt("SLS_VAL_RW"));

					Products.add(bpil_Products);
				}

				// SalesReps = (List<Bpil_SalesReps>) rssales;
				// Dealers = (List<Bpil_Dealers>) rsdealers;
				// Products = (List<Bpil_Products>) rsproducts;

				System.out.println("SalesReps size = " + SalesReps.size() + " Dealers size = " + Dealers.size()
						+ " Products = " + Products.size());

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			// Date LYSD = START_DATE, LYED = END_DATE, L2LSD = START_DATE,
			// L2LED = END_DATE;
			//
			// Calendar cal = Calendar.getInstance();
			// cal.setTime(LYSD);
			// cal.add(Calendar.YEAR, -1);
			// LYSD = cal.getTime();
			//
			// System.out.println("LYSD " + LYSD);
			//
			// Calendar cal2 = Calendar.getInstance();
			// cal2.setTime(LYED);
			// cal2.add(Calendar.YEAR, -1);
			// LYED = cal2.getTime();
			//
			// System.out.println("LYED " + LYED);
			//
			// Calendar cal3 = Calendar.getInstance();
			// cal3.setTime(L2LSD);
			// cal3.add(Calendar.YEAR, -2);
			// L2LSD = cal3.getTime();
			//
			// System.out.println("L2LSD " + L2LSD);
			//
			// Calendar cal4 = Calendar.getInstance();
			// cal4.setTime(L2LED);
			// cal4.add(Calendar.YEAR, -2);
			// L2LED = cal4.getTime();
			//
			// System.out.println("L2LED " + L2LED);
			//
			// List<Staging_Table> Dealers = new ArrayList<Staging_Table>();
			// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1")) {
			// Dealers = getDealers(depot_name, LYSD, LYED, L2LSD, L2LED,
			// APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
			// finanalysis);
			// } else {
			// Dealers = getDealers(depot_name, START_DATE, END_DATE, LYSD,
			// LYED, APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
			// finanalysis);
			// }
			//
			// System.out.println("Dealer size "+Dealers.size());

			// for (int i = 0; i < Dealers.size(); i++) {
			//
			// String prntcode = Dealers.get(i).getPrnt_code();
			//
			// int billtocode = Dealers.get(i).getChild_code();
			//
			// System.out.println("prntcode " + prntcode);
			//
			// System.out.println("billtocode " + billtocode);

			// String sql2 = "select depo_name from BPIL_OPA_STG_TRX_DETAILS
			// where PRNT_CODE = '" + prntcode + "'";

			// String sql2 = "select depo_name, PRNT_CODE from
			// BPIL_OPA_STG_TRX_DETAILS where CHILD_CODE = '"
			// + billtocode + "'";
			//
			// System.out.println(sql2);
			//
			// List<Staging_Table> depo_prnt_code = jdbcTemplate.query(sql2, new
			// RowMapper<Staging_Table>() {
			//
			// @Override
			// public Staging_Table mapRow(ResultSet rs, int rowNum) throws
			// SQLException {
			// String deponame = rs.getString("depo_name");
			// String PRNT_CODE = rs.getString("PRNT_CODE");
			//
			// System.out.println("deponame = " + deponame + " PRNT_CODE = " +
			// PRNT_CODE);
			//
			// Staging_Table st_depo_prnt = new Staging_Table();
			// st_depo_prnt.setDepo_name(deponame);
			// st_depo_prnt.setPrnt_code(PRNT_CODE);
			//
			// return st_depo_prnt;
			//
			// }
			//
			// });

			// Dealers.get(i).setDepo_name(depo_prnt_code.get(0).getDepo_name());
			// Dealers.get(i).setPrnt_code(depo_prnt_code.get(0).getPrnt_code());
			// }

			// Date LYSD = START_DATE, LYED = END_DATE, L2LSD = START_DATE,
			// L2LED = END_DATE;

			// Calendar cal = Calendar.getInstance();
			// cal.setTime(LYSD);
			// cal.add(Calendar.YEAR, -1);
			// LYSD = cal.getTime();

			// System.out.println("LYSD " + LYSD);
			//
			// Calendar cal2 = Calendar.getInstance();
			// cal2.setTime(LYED);
			// cal2.add(Calendar.YEAR, -1);
			// LYED = cal2.getTime();

			// System.out.println("LYED " + LYED);
			//
			// Calendar cal3 = Calendar.getInstance();
			// cal3.setTime(L2LSD);
			// cal3.add(Calendar.YEAR, -2);
			// L2LSD = cal3.getTime();

			// System.out.println("L2LSD " + L2LSD);
			//
			// Calendar cal4 = Calendar.getInstance();
			// cal4.setTime(L2LED);
			// cal4.add(Calendar.YEAR, -2);
			// L2LED = cal4.getTime();
			//
			// System.out.println("L2LED " + L2LED);

			// List<Staging_Table> Products = new ArrayList<Staging_Table>();
			// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1")) {
			// Products = getProducts(depot_name, 0, LYSD, LYED, L2LSD, L2LED,
			// APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
			// finanalysis);
			// } else {
			// Products = getProducts(depot_name, 0, START_DATE, END_DATE, LYSD,
			// LYED, APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
			// finanalysis);
			// }

			// System.out.println("Products size " + Products.size());

			Date Sd = new Date();
			System.out.println("Start call to webservice" + Sd);

			Scheme_budget = callsoap_webservice(Dealers, Products, scheme_id, Scheme_code, SCH_OPA_URL, finanalysis
			// , request
			);

			Date Ed = new Date();
			System.out.println("End call to webservice" + Ed);

			System.out.println("Total time : Sw " + Sd + " Ew " + Ed);

			System.out.println("Scheme_budget = " + Scheme_budget);
			model.addAttribute("Scheme_budget", Scheme_budget);
			try {
				String json = null;

				json = new Gson().toJson(Scheme_budget);
				response.setContentType("application/json");
				response.getWriter().write(json);
			} catch (IOException e) {
				e.printStackTrace();
			}

		}

		// return new ModelAndView("RewardAnalysis");
	}

	private List<Staging_Table> getDealers(String depot_name, Date sd, Date ed, Date lsd, Date led,
			String APPL_DEPOT_CODE, String SCH_PRODUCT_CODES, String finanalysis) {

		DateFormat datformat = new SimpleDateFormat("dd-MMM-YYYY");
		String TYSD = datformat.format(sd);
		String TYED = datformat.format(ed);
		String LYSD = datformat.format(lsd);
		String LYED = datformat.format(led);

		String depo_code[] = null;
		if (APPL_DEPOT_CODE != null) {
			depo_code = APPL_DEPOT_CODE.split(",");

		}
		String depoqr = "";
		for (int i = 0; i < depo_code.length; i++) {
			if (i == 0) {
				depoqr = depoqr.concat("DEPO_NAME = '" + depo_code[i] + "'");
			} else {
				depoqr = depoqr.concat(" OR DEPO_NAME = '" + depo_code[i] + "'");
			}
		}

		System.out.println(depoqr);

		String product_code[] = null;
		if (SCH_PRODUCT_CODES != null) {
			product_code = SCH_PRODUCT_CODES.split(",");

		}
		String prdqr = "";
		for (int i = 0; i < product_code.length; i++) {
			if (i == 0) {
				prdqr = prdqr.concat("PRODUCT = '" + product_code[i] + "'");
			} else {
				prdqr = prdqr.concat(" OR PRODUCT = '" + product_code[i] + "'");
			}
		}

		System.out.println(prdqr);

		List<Staging_Table> Dealers = new ArrayList<Staging_Table>();

		if (finanalysis.equals("1")) {

			String sql = "SELECT  DISTINCT REGN, "
					// + "" + " DEPO_NAME, "
					+ "" + " TERR_CODE, "
					// + " PRNT_CODE, "
					+ " CUST_NAME, " + " DLR_CAT, " + " DLR_RET, " + " DLR_SO, " + " SDLR_CNT, " + " CHILD_CODE, "
					+ " CUST_TYPE " + " FROM    BPIL_OPA_STG_TRX_DETAILS " + " WHERE   " + "(" + depoqr + ") " + " AND "
					// + "DEPO_NAME = '" + depot_name + "' " + " AND "
					+ "(" + prdqr + ") " + " AND     CUST_TYPE IN ('3','5','7','55','54') "
					+ " AND     (DOC_DATE BETWEEN '" + TYSD + "' AND '" + TYED + "' " + " OR DOC_DATE BETWEEN '" + LYSD
					+ "' AND '" + LYED + "')";

			System.out.println(sql);

			Dealers = jdbcTemplate.query(sql, new RowMapper<Staging_Table>() {

				@Override
				public Staging_Table mapRow(ResultSet rs, int rowNum) throws SQLException {
					Staging_Table dealer = new Staging_Table();

					dealer.setRegn(rs.getString("REGN"));
					dealer.setTerr_code(rs.getInt("TERR_CODE"));
					// dealer.setTerr_name(rs.getString("TERR_NAME"));
					// dealer.setDepo_name(rs.getString("DEPO_NAME"));
					// dealer.setPrnt_code(rs.getString("PRNT_CODE"));
					dealer.setCust_name(rs.getString("CUST_NAME"));
					dealer.setCust_type(rs.getString("CUST_TYPE"));
					dealer.setDlr_cat(rs.getString("DLR_CAT"));
					dealer.setChild_code(rs.getInt("CHILD_CODE"));

					System.out.println("CHILD_CODE - Bill to " + rs.getString("CHILD_CODE") + " CUST_NAME "
							+ rs.getString("CUST_NAME"));

					return dealer;
				}

			});

		} else {
			String sql = "SELECT  DISTINCT REGN, "
					// + "" + " DEPO_NAME, "
					+ "" + " TERR_CODE, "
					// + " PRNT_CODE, "
					+ " CUST_NAME, " + " DLR_CAT, " + " DLR_RET, " + " DLR_SO, " + " SDLR_CNT, " + " CHILD_CODE, "
					+ " CUST_TYPE " + " FROM    BPIL_OPA_STG_TRX_DETAILS " + " WHERE   "
					// + "(" + depoqr + ") " + " AND "
					+ "DEPO_NAME = '" + depot_name + "' " + " AND " + "(" + prdqr + ") "
					+ " AND     CUST_TYPE IN ('3','5','7','55','54') " + " AND     (DOC_DATE BETWEEN '" + TYSD
					+ "' AND '" + TYED + "' " + " OR DOC_DATE BETWEEN '" + LYSD + "' AND '" + LYED + "')";

			System.out.println(sql);

			Dealers = jdbcTemplate.query(sql, new RowMapper<Staging_Table>() {

				@Override
				public Staging_Table mapRow(ResultSet rs, int rowNum) throws SQLException {
					Staging_Table dealer = new Staging_Table();

					dealer.setRegn(rs.getString("REGN"));
					dealer.setTerr_code(rs.getInt("TERR_CODE"));
					// dealer.setTerr_name(rs.getString("TERR_NAME"));
					// dealer.setDepo_name(rs.getString("DEPO_NAME"));
					// dealer.setPrnt_code(rs.getString("PRNT_CODE"));
					dealer.setCust_name(rs.getString("CUST_NAME"));
					dealer.setCust_type(rs.getString("CUST_TYPE"));
					dealer.setDlr_cat(rs.getString("DLR_CAT"));
					dealer.setChild_code(rs.getInt("CHILD_CODE"));

					System.out.println("CHILD_CODE - Bill to " + rs.getString("CHILD_CODE") + " CUST_NAME "
							+ rs.getString("CUST_NAME"));

					return dealer;
				}

			});

		}

		return Dealers;

	}

	private List<Staging_Table> getProducts(String depot_name, int dealbilltocode, Date sd, Date ed, Date lsd, Date led,
			String APPL_DEPOT_CODE, String SCH_PRODUCT_CODES, String finanalysis) {

		DateFormat datformat = new SimpleDateFormat("dd-MMM-YYYY");
		String TYSD = datformat.format(sd);
		String TYED = datformat.format(ed);
		String LYSD = datformat.format(lsd);
		String LYED = datformat.format(led);

		String depo_code[] = null;
		if (APPL_DEPOT_CODE != null) {
			depo_code = APPL_DEPOT_CODE.split(",");

		}
		String depoqr = "";
		for (int i = 0; i < depo_code.length; i++) {
			if (i == 0) {
				depoqr = depoqr.concat("DEPO_NAME = '" + depo_code[i] + "'");
			} else {
				depoqr = depoqr.concat(" OR DEPO_NAME = '" + depo_code[i] + "'");
			}
		}

		System.out.println(depoqr);

		String product_code[] = null;
		if (SCH_PRODUCT_CODES != null) {
			product_code = SCH_PRODUCT_CODES.split(",");

		}
		String prdqr = "";
		for (int i = 0; i < product_code.length; i++) {
			if (i == 0) {
				prdqr = prdqr.concat("PRODUCT = '" + product_code[i] + "'");
			} else {
				prdqr = prdqr.concat(" OR PRODUCT = '" + product_code[i] + "'");
			}
		}

		System.out.println(prdqr);

		List<Staging_Table> Products = new ArrayList<Staging_Table>();

		if (finanalysis.equals("1")) {

			String sql = "SELECT  PRNT_CODE," + " CHILD_CODE, " + " PRD_GRP, " + " PRD_CAT, " + " PRODUCT, "
					+ " SHADE, " + " DOC_DATE, " + " PACK_SIZE, " + " PRD_VOLUME, " + " PRD_FNL_VOLUME, "
					+ " PRD_VALUE, " + " PRD_VOL_RW, " + " PRD_FNL_VOL_RW, " + " PRD_SALES_VAL_RW, " + " LYTY "
					+ " FROM    BPIL_OPA_STG_TRX_DETAILS " + " WHERE   " + "(" + depoqr + ") " + " AND "
					// + "DEPO_NAME = '" + depot_name + "' " + " AND "
					+ "(" + prdqr + ") "
					// + " AND CHILD_CODE = '" + dealbilltocode + "' "
					+ " AND     CUST_TYPE IN ('3','5','7','55','54') " + " AND     (DOC_DATE BETWEEN '" + TYSD
					+ "' AND '" + TYED + "' " + " OR DOC_DATE BETWEEN '" + LYSD + "' AND '" + LYED + "')";

			System.out.println(sql);

			Products = jdbcTemplate.query(sql, new RowMapper<Staging_Table>() {

				@Override
				public Staging_Table mapRow(ResultSet rs, int rowNum) throws SQLException {
					Staging_Table product = new Staging_Table();

					product.setPrnt_code(rs.getString("PRNT_CODE"));
					product.setChild_code(rs.getInt("CHILD_CODE"));
					product.setPrd_grp(rs.getString("PRD_GRP"));
					product.setPrd_cat(rs.getString("PRD_CAT"));
					product.setProduct(rs.getString("PRODUCT"));
					product.setShade(rs.getString("SHADE"));
					product.setDoc_date(rs.getDate("DOC_DATE"));
					product.setPack_size(rs.getString("PACK_SIZE"));
					product.setPrd_volume(rs.getInt("PRD_VOLUME"));
					product.setPrd_fnl_volume(rs.getInt("PRD_FNL_VOLUME"));
					product.setPrd_value(rs.getInt("PRD_VALUE"));
					product.setPrd_vol_rw(rs.getInt("PRD_VOL_RW"));
					product.setPrd_fnl_vol_rw(rs.getInt("PRD_FNL_VOL_RW"));
					product.setPrd_sales_val_rw(rs.getInt("PRD_SALES_VAL_RW"));
					product.setLyty(rs.getInt("LYTY"));

					System.out.println(
							"CHILD_CODE " + rs.getInt("CHILD_CODE") + " PRD_FNL_VOLUME " + rs.getInt("PRD_FNL_VOLUME"));

					return product;
				}

			});

		} else {

			String sql = "SELECT  PRNT_CODE," + " CHILD_CODE, " + " PRD_GRP, " + " PRD_CAT, " + " PRODUCT, "
					+ " SHADE, " + " DOC_DATE, " + " PACK_SIZE, " + " PRD_VOLUME, " + " PRD_FNL_VOLUME, "
					+ " PRD_VALUE, " + " PRD_VOL_RW, " + " PRD_FNL_VOL_RW, " + " PRD_SALES_VAL_RW, " + " LYTY "
					+ " FROM    BPIL_OPA_STG_TRX_DETAILS " + " WHERE   "
					// + "(" + depoqr + ") " + " AND "
					+ "DEPO_NAME = '" + depot_name + "' " + " AND " + "(" + prdqr + ") "
					// + " AND CHILD_CODE = '" + dealbilltocode + "' "
					+ " AND     CUST_TYPE IN ('3','5','7','55','54') " + " AND     (DOC_DATE BETWEEN '" + TYSD
					+ "' AND '" + TYED + "' " + " OR DOC_DATE BETWEEN '" + LYSD + "' AND '" + LYED + "')";

			System.out.println(sql);

			Products = jdbcTemplate.query(sql, new RowMapper<Staging_Table>() {

				@Override
				public Staging_Table mapRow(ResultSet rs, int rowNum) throws SQLException {
					Staging_Table product = new Staging_Table();

					product.setPrnt_code(rs.getString("PRNT_CODE"));
					product.setChild_code(rs.getInt("CHILD_CODE"));
					product.setPrd_grp(rs.getString("PRD_GRP"));
					product.setPrd_cat(rs.getString("PRD_CAT"));
					product.setProduct(rs.getString("PRODUCT"));
					product.setShade(rs.getString("SHADE"));
					product.setDoc_date(rs.getDate("DOC_DATE"));
					product.setPack_size(rs.getString("PACK_SIZE"));
					product.setPrd_volume(rs.getInt("PRD_VOLUME"));
					product.setPrd_fnl_volume(rs.getInt("PRD_FNL_VOLUME"));
					product.setPrd_value(rs.getInt("PRD_VALUE"));
					product.setPrd_vol_rw(rs.getInt("PRD_VOL_RW"));
					product.setPrd_fnl_vol_rw(rs.getInt("PRD_FNL_VOL_RW"));
					product.setPrd_sales_val_rw(rs.getInt("PRD_SALES_VAL_RW"));
					product.setLyty(rs.getInt("LYTY"));

					System.out.println(
							"CHILD_CODE " + rs.getInt("CHILD_CODE") + " PRD_FNL_VOLUME " + rs.getInt("PRD_FNL_VOLUME"));

					return product;
				}

			});

		}

		return Products;

	}

	private int callsoap_webservice(List<Bpil_Dealers> dealers, List<Bpil_Products> products, String scheme_id,
			String scheme_code, String SCH_OPA_URL, String finanalysis
	// , HttpServletRequest request
	) {
		// TODO Auto-generated method stub

		// Create SOAP Connection

		int Scheme_budget = 0;
		try {
			SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();

			SOAPConnection soapConnection = soapConnectionFactory.createConnection();

			// Send SOAP Message to SOAP Server
			// final String url =
			// "https://omfys-opa.custhelp.com/determinations-server/assess/soap/generic/12.2.1/BPIL__Seal__O__Prime__November__Dhamaka__Offer?wsdl";
			final String url = SCH_OPA_URL;
			SOAPMessage soapRequest = createSOAPRequest(dealers, products, finanalysis);

//			TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
//			Transformer transformerReq = transformerFactoryReq.newTransformer();
//			Source sourceContentReq = soapRequest.getSOAPPart().getContent();

			// String reqxmlpath =
			// request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

			// System.out.println("xmlpath = " + reqxmlpath);

			// StreamResult resultReq3 = new StreamResult(new FileOutputStream(
			// new File("D:\\Berger Paint\\BSAT\\BERGER
			// PAINTS\\src\\main\\java\\com\\report\\soaprequest.xml")));
			// transformerReq.transform(sourceContentReq, resultReq3);

			SOAPMessage soapResponse = soapConnection.call(soapRequest, url);

			// Process the SOAP Response
			Scheme_budget = printSOAPResponse(soapRequest, soapResponse, dealers, scheme_id, scheme_code, finanalysis
			// , request
			);

			soapConnection.close();

		} catch (UnsupportedOperationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SOAPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return Scheme_budget;

	}

	private SOAPMessage createSOAPRequest(List<Bpil_Dealers> dealers, List<Bpil_Products> products, String finanalysis)
			throws SOAPException, IOException {
		// TODO Auto-generated method stub

		MessageFactory messageFactory = MessageFactory.newInstance();
		SOAPMessage soapMessage = messageFactory.createMessage();
		SOAPPart soapPart = soapMessage.getSOAPPart();

		final String serverURI = "http://oracle.com/determinations/server/12.2.1/rulebase/assess/types";

		// SOAP Envelope
		SOAPEnvelope envelope = soapPart.getEnvelope();
		envelope.addNamespaceDeclaration("typ", serverURI);

		SOAPFactory soapFactory = SOAPFactory.newInstance();

		System.out.println("SOAP Envelope");

		// SOAP Header
		SOAPHeader soapHeader = envelope.getHeader();

		final String seqHeader = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";
		Name headerName = soapFactory.createName("Security", "o", seqHeader);

		SOAPHeaderElement headerElement = soapHeader.addHeaderElement(headerName);
		headerElement.setMustUnderstand(true);

		final String Username = "omfys";
		final String Password = "omfysTest1@123";

		SOAPElement soapUserToken = headerElement.addChildElement("UsernameToken", "o");
		SOAPElement sopaUser = soapUserToken.addChildElement("Username", "o");
		sopaUser.addTextNode(Username);
		SOAPElement sopaPass = soapUserToken.addChildElement("Password", "o");
		sopaPass.addTextNode(Password);

		SOAPHeader header = soapMessage.getSOAPHeader();
		SOAPBody body = soapMessage.getSOAPBody();

		System.out.println("SOAP Header");

		// SOAP Body
		SOAPBody soapBody = envelope.getBody();

		SOAPElement soapBodyElem = soapBody.addChildElement("assess-request", "typ");

		System.out.println("SOAP Body");

		SOAPElement config = soapBodyElem.addChildElement("config", "typ");

		SOAPElement outcome = config.addChildElement("outcome", "typ");

		ArrayList<String> outcome_entity_type = new ArrayList<String>();

		outcome_entity_type.add("global");
		outcome_entity_type.add("DEALER");
		outcome_entity_type.add("PRODUCT");
		outcome_entity_type.add("REWARD");

		ArrayList<String> global_outcome = new ArrayList<String>();
		ArrayList<String> thedealer_outcome = new ArrayList<String>();
		ArrayList<String> theproduct_outcome = new ArrayList<String>();
		ArrayList<String> thereward_outcome = new ArrayList<String>();

		for (String outcome_entity : outcome_entity_type) {

			if (outcome_entity.equals("global")) {
				// global_outcome.add("EB_RNG");
				// global_outcome.add("EXT_MO_RNG");
				// global_outcome.add("FM_RNG");
				// global_outcome.add("MO_RNG");
				global_outcome.add("SCH_NAME");
				global_outcome.add("SCH_BDGT");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String global_att : global_outcome) {
					// System.out.println("global outcome att = " + global_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), global_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("DEALER")) {
				// thedealer_outcome.add("PARTA_VOL");
				// thedealer_outcome.add("PARTA_CN");
				// thedealer_outcome.add("LY_VOL");
				// thedealer_outcome.add("LY_VAL");
				// thedealer_outcome.add("PARTB_VAL");
				// thedealer_outcome.add("TY_VOL");
				// thedealer_outcome.add("TY_VAL");
				// thedealer_outcome.add("PARTB_VOL");
				// thedealer_outcome.add("EXT_PARTB_VOL");
				// thedealer_outcome.add("FNL_PARTB_VOL");
				//// thedealer_outcome.add("TGT_GRWTH");
				// thedealer_outcome.add("GWTH_PCT");
				// thedealer_outcome.add("PARTB_CN");
				// thedealer_outcome.add("TOT_CN");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String thedealer_att : thedealer_outcome) {
					System.out.println("thedealer outcome att = " + thedealer_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), thedealer_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("PRODUCT")) {

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String theproduct_att : theproduct_outcome) {
					System.out.println("theproduct outcome att = " + theproduct_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), theproduct_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("REWARD")) {

				thereward_outcome.add("RW_ID");
				thereward_outcome.add("RW_REGN");
				thereward_outcome.add("RW_DEPOT");
				thereward_outcome.add("RW_TERR");
				thereward_outcome.add("RW_DLR_CODE");
				thereward_outcome.add("RW_DLR_CAT");
				thereward_outcome.add("RW_DLR_BILL_TO");
				thereward_outcome.add("RW_DLR_TYPE");
				thereward_outcome.add("RW_DLR_NAME");
				thereward_outcome.add("RW_SEC");
				thereward_outcome.add("RW_TYPE");
				thereward_outcome.add("RW_PRD");
				thereward_outcome.add("RW_UNIT");
				thereward_outcome.add("RW_DT");
				thereward_outcome.add("RW_LY");
				thereward_outcome.add("RW_PEND_TGT");
				thereward_outcome.add("RW_TGT");
				thereward_outcome.add("RW_TY");
				thereward_outcome.add("RW_ADDITIONAL");
				thereward_outcome.add("RW_BASE_TOTAL");
				thereward_outcome.add("RW_Q_STATUS");
				thereward_outcome.add("RW_TOTAL");
				thereward_outcome.add("RW_GFT_TO_CN");
				thereward_outcome.add("RW_CNVRTD_CN");
				thereward_outcome.add("RW_I_STATUS");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String reward_att : thereward_outcome) {
					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), reward_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}
			}
		}

		ArrayList<String> dealer_instances = new ArrayList<String>();

		for (Bpil_Dealers dealer : dealers) {
			dealer_instances.add(Integer.toString(dealer.getBILL_TO_ID()));
		}

		ArrayList<String> thedealer_attributes = new ArrayList<String>();
		ArrayList<String> thedealer_attributes_type = new ArrayList<String>();
		ArrayList<String> thedealer_attributes_value = new ArrayList<String>();

		thedealer_attributes.add("DLR_BILL_TO");
		thedealer_attributes.add("DLR_AC_NO");
		thedealer_attributes.add("DLR_TYPE");
		thedealer_attributes.add("TERR");
		thedealer_attributes.add("REGN");
		thedealer_attributes.add("DEPOT");
		thedealer_attributes.add("DLR_NAME");
		thedealer_attributes.add("DLR_CAT");

		thedealer_attributes_type.add("number-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");

		int Prodcnt = 0;

		ArrayList<String> procuct_instances = new ArrayList<String>();

		for (Bpil_Products product : products) {
			Prodcnt++;
			procuct_instances.add(Integer.toString(Prodcnt));

		}

		ArrayList<String> theproduct_attributes = new ArrayList<String>();
		ArrayList<String> theproduct_attributes_type = new ArrayList<String>();
		ArrayList<String> theproduct_attributes_value = new ArrayList<String>();

		theproduct_attributes.add("PRD");
		theproduct_attributes.add("PRD_BILL_TO");
		theproduct_attributes.add("PRD_UOM");
		theproduct_attributes.add("PRD_CODE");
		theproduct_attributes.add("PRD_CAT");
		theproduct_attributes.add("PRD_INV_DT");
		theproduct_attributes.add("PRD_VAL");
		theproduct_attributes.add("PRD_FNL_VOL");

		theproduct_attributes.add("PRD_FNL_VOL_RW");
		theproduct_attributes.add("PRD_PACK_SIZE");
		theproduct_attributes.add("PRD_VAL_RW");
		theproduct_attributes.add("PRD_VOL");
		theproduct_attributes.add("PRD_VOL_RW");

		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("date-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");

		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");

		SOAPElement globalinstance = soapBodyElem.addChildElement("global-instance", "typ");

		SOAPElement finattribute = globalinstance.addChildElement("attribute", "typ");
		finattribute.addAttribute(soapFactory.createName("id"), "FIN_AN_FLAG");
		SOAPElement finattributeDataType = finattribute.addChildElement("text-val", "typ");
		finattributeDataType.addTextNode(finanalysis);

		SOAPElement thedealer_entity = globalinstance.addChildElement("entity", "typ");
		thedealer_entity.addAttribute(soapFactory.createName("id"), "DEALER");

		// System.out.println("dealer_entity");

		for (int j = 0; j < dealer_instances.size(); j++) {

			SOAPElement dealer_entity_instance = thedealer_entity.addChildElement("instance", "typ");
			dealer_entity_instance.addAttribute(soapFactory.createName("id"), dealer_instances.get(j));

			// System.out.println("dealer_instances = " +
			// dealer_instances.get(j));

			thedealer_attributes_value.clear();

			Bpil_Dealers dealer = dealers.get(j);

			thedealer_attributes_value.add(Integer.toString(dealer.getBILL_TO_ID()));
			thedealer_attributes_value.add(dealer.getDLR_AC_NO());
			thedealer_attributes_value.add(dealer.getCUST_TYPE());
			thedealer_attributes_value.add(dealer.getTERR_CODE());
			thedealer_attributes_value.add(dealer.getREGN());
			thedealer_attributes_value.add(dealer.getDEPOT_NAME());
			thedealer_attributes_value.add(dealer.getDLR_AC_NAME());
			thedealer_attributes_value.add(dealer.getDLR_CAT());

			for (int i = 0; i < thedealer_attributes.size(); i++) {

				SOAPElement attribute = dealer_entity_instance.addChildElement("attribute", "typ");
				attribute.addAttribute(soapFactory.createName("id"), thedealer_attributes.get(i));
				SOAPElement attributeDataType = attribute.addChildElement(thedealer_attributes_type.get(i), "typ");
				attributeDataType.addTextNode(thedealer_attributes_value.get(i));

				// System.out.println("thedealer_attributes = " +
				// thedealer_attributes.get(i));

			}

			// SOAPElement theproduct_entity =
			// dealer_entity_instance.addChildElement("entity", "typ");
			// theproduct_entity.addAttribute(soapFactory.createName("id"),
			// "theproduct");
			//
			// System.out.println("product_entity");
			//
			// procuct_instances.clear();
			//
			// Date LYSD = START_DATE, LYED = END_DATE, L2LSD = START_DATE,
			// L2LED = END_DATE;
			//
			// Calendar cal = Calendar.getInstance();
			// cal.setTime(LYSD);
			// cal.add(Calendar.YEAR, -1);
			// LYSD = cal.getTime();
			//
			// System.out.println("LYSD " + LYSD);
			//
			// Calendar cal2 = Calendar.getInstance();
			// cal2.setTime(LYED);
			// cal2.add(Calendar.YEAR, -1);
			// LYED = cal2.getTime();
			//
			// System.out.println("LYED " + LYED);
			//
			// Calendar cal3 = Calendar.getInstance();
			// cal3.setTime(L2LSD);
			// cal3.add(Calendar.YEAR, -2);
			// L2LSD = cal3.getTime();
			//
			// System.out.println("L2LSD " + L2LSD);
			//
			// Calendar cal4 = Calendar.getInstance();
			// cal4.setTime(L2LED);
			// cal4.add(Calendar.YEAR, -2);
			// L2LED = cal4.getTime();
			//
			// System.out.println("L2LED " + L2LED);
			//
			// List<Staging_Table> Products = new ArrayList<Staging_Table>();
			// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1")) {
			// Products = getProducts(depot_name, dealer.getChild_code(), LYSD,
			// LYED, L2LSD, L2LED, APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
			// finanalysis);
			// } else {
			// Products = getProducts(depot_name, dealer.getChild_code(),
			// START_DATE, END_DATE, LYSD, LYED,
			// APPL_DEPOT_CODE, SCH_PRODUCT_CODES, finanalysis);
			// }
			//
			// // List<Staging_Table> Products = getProducts(depot_name,
			// // dealer.getPrnt_code());
			//
			// for (Staging_Table Product : Products) {
			// Prodcnt++;
			// procuct_instances.add(Integer.toString(Prodcnt));
			//
			// }
			//
			// for (int k = 0; k < procuct_instances.size(); k++) {
			//
			// SOAPElement procuct_entity_instance =
			// theproduct_entity.addChildElement("instance", "typ");
			// procuct_entity_instance.addAttribute(soapFactory.createName("id"),
			// procuct_instances.get(k));
			//
			// System.out.println("dealer_instances = " +
			// procuct_instances.get(k));
			//
			// theproduct_attributes_value.clear();
			//
			// Staging_Table Product = Products.get(k);
			//
			// theproduct_attributes_value.add(Integer.toString(Product.getChild_code()));
			// theproduct_attributes_value.add(procuct_instances.get(k));
			// theproduct_attributes_value.add(Product.getProduct());
			//
			// DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd");
			// String dateStr = datformat.format(Product.getDoc_date());
			//
			// theproduct_attributes_value.add(dateStr);
			// theproduct_attributes_value.add(Integer.toString(Product.getPrd_value()));
			// theproduct_attributes_value.add(Integer.toString(Product.getPrd_volume()));
			//
			// for (int i = 0; i < theproduct_attributes.size(); i++) {
			//
			// SOAPElement attribute =
			// procuct_entity_instance.addChildElement("attribute", "typ");
			// attribute.addAttribute(soapFactory.createName("id"),
			// theproduct_attributes.get(i));
			// SOAPElement attributeDataType =
			// attribute.addChildElement(theproduct_attributes_type.get(i),
			// "typ");
			// attributeDataType.addTextNode(theproduct_attributes_value.get(i));
			//
			// System.out.println("theproduct_attributes = " +
			// theproduct_attributes.get(i));
			//
			// }
			// }

		}

		SOAPElement theproduct_entity = globalinstance.addChildElement("entity", "typ");
		theproduct_entity.addAttribute(soapFactory.createName("id"), "PRODUCT");

		// System.out.println("product_entity");

		// procuct_instances.clear();

		// Date LYSD = START_DATE, LYED = END_DATE, L2LSD = START_DATE, L2LED =
		// END_DATE;

		// Calendar cal = Calendar.getInstance();
		// cal.setTime(LYSD);
		// cal.add(Calendar.YEAR, -1);
		// LYSD = cal.getTime();

		// System.out.println("LYSD " + LYSD);

		// Calendar cal2 = Calendar.getInstance();
		// cal2.setTime(LYED);
		// cal2.add(Calendar.YEAR, -1);
		// LYED = cal2.getTime();

		// System.out.println("LYED " + LYED);

		// Calendar cal3 = Calendar.getInstance();
		// cal3.setTime(L2LSD);
		// cal3.add(Calendar.YEAR, -2);
		// L2LSD = cal3.getTime();

		// System.out.println("L2LSD " + L2LSD);

		// Calendar cal4 = Calendar.getInstance();
		// cal4.setTime(L2LED);
		// cal4.add(Calendar.YEAR, -2);
		// L2LED = cal4.getTime();

		// System.out.println("L2LED " + L2LED);

		// List<Staging_Table> Products = new ArrayList<Staging_Table>();
		// if (ACTIVE_FLAG.equals("Review") && finanalysis.equals("1")) {
		// Products = getProducts(depot_name, 0, LYSD, LYED, L2LSD, L2LED,
		// APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
		// finanalysis);
		// } else {
		// Products = getProducts(depot_name, 0, START_DATE, END_DATE, LYSD,
		// LYED, APPL_DEPOT_CODE, SCH_PRODUCT_CODES,
		// finanalysis);
		// }

		// System.out.println("Products size " + Products.size());

		// List<Staging_Table> Products = getProducts(depot_name,
		// dealer.getPrnt_code());

		// for (Staging_Table Product : Products) {
		// Prodcnt++;
		// procuct_instances.add(Integer.toString(Prodcnt));
		//
		// }

		for (int k = 0; k < procuct_instances.size(); k++) {

			SOAPElement procuct_entity_instance = theproduct_entity.addChildElement("instance", "typ");
			procuct_entity_instance.addAttribute(soapFactory.createName("id"), procuct_instances.get(k));

			// System.out.println("dealer_instances = " +
			// procuct_instances.get(k));

			theproduct_attributes_value.clear();

			Bpil_Products product = products.get(k);

			theproduct_attributes_value.add(procuct_instances.get(k));
			theproduct_attributes_value.add(Integer.toString(product.getBILL_TO_ID()));
			theproduct_attributes_value.add(product.getPRD_UOM());
			theproduct_attributes_value.add(product.getPRD_CODE());
			theproduct_attributes_value.add(product.getPRD_CAT());

			DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd");
			String dateStr = datformat.format(product.getSLS_TRX_DATE());

			theproduct_attributes_value.add(dateStr);
			theproduct_attributes_value.add(Integer.toString(product.getSLS_VAL()));
			theproduct_attributes_value.add(Integer.toString(product.getSLS_FNL_VOL()));

			theproduct_attributes_value.add(Integer.toString(product.getSLS_FNL_VOL_RW()));
			theproduct_attributes_value.add(Integer.toString(product.getPACK_SIZE()));
			theproduct_attributes_value.add(Integer.toString(product.getSLS_VAL_RW()));
			theproduct_attributes_value.add(Integer.toString(product.getSLS_VOL()));
			theproduct_attributes_value.add(Integer.toString(product.getSLS_VOL_RW()));

			for (int i = 0; i < theproduct_attributes.size(); i++) {

				SOAPElement attribute = procuct_entity_instance.addChildElement("attribute", "typ");
				attribute.addAttribute(soapFactory.createName("id"), theproduct_attributes.get(i));
				SOAPElement attributeDataType = attribute.addChildElement(theproduct_attributes_type.get(i), "typ");
				attributeDataType.addTextNode(theproduct_attributes_value.get(i));

				// System.out.println("theproduct_attributes = " +
				// theproduct_attributes.get(i));

			}
		}

		final String SOAPAction = "http://oracle.com/determinations/server/12.2.1/rulebase/types/Assess";

		MimeHeaders headers = soapMessage.getMimeHeaders();
		headers.addHeader("SOAPAction", SOAPAction);

		soapMessage.saveChanges();

		/* Print the request message */
		 System.out.print("Request SOAP Message = ");
		 soapMessage.writeTo(System.out);
		 System.out.println();

		return soapMessage;

	}

	@Transactional
	private int printSOAPResponse(SOAPMessage soapRequest, SOAPMessage soapResponse, List<Bpil_Dealers> dealers,
			String scheme_id, String scheme_code, String finanalysis
	// , HttpServletRequest request
	) throws SOAPException, TransformerException, ParserConfigurationException, SAXException, IOException,
			XPathExpressionException, ParseException {
		// TODO Auto-generated method stub
		TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
		Transformer transformerReq = transformerFactoryReq.newTransformer();
		Source sourceContentReq = soapRequest.getSOAPPart().getContent();

		// System.out.print("\nRequest SOAP Message = ");
		// StreamResult resultReq = new StreamResult(System.out);
		// transformerReq.transform(sourceContentReq, resultReq);

		// String reqxmlpath =
		// request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

		// System.out.println("xmlpath = " + reqxmlpath);

		// StreamResult resultReq3 = new StreamResult(new FileOutputStream(
		// new File("D:\\Berger Paint\\BSAT\\BERGER
		// PAINTS\\src\\main\\java\\com\\report\\soaprequest.xml")));
		// transformerReq.transform(sourceContentReq, resultReq3);

		ByteArrayOutputStream osReq = new ByteArrayOutputStream();

		StreamResult resultReq2 = new StreamResult(osReq);
		transformerReq.transform(sourceContentReq, resultReq2);

		String xmlReq = new String(osReq.toByteArray(), "UTF-8");

		// System.out.println("\n");
		// System.out.println(xmlReq);

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		Source sourceContent = soapResponse.getSOAPPart().getContent();

		// System.out.print("\nResponse SOAP Message = ");
		// StreamResult result = new StreamResult(System.out);
		// transformer.transform(sourceContent, result);

		// StreamResult result3 = new StreamResult(new FileOutputStream(
		// new File("D:\\Berger Paint\\BSAT\\BERGER
		// PAINTS\\src\\main\\java\\com\\report\\soapresponse.xml")));
		// transformer.transform(sourceContent, result3);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		StreamResult result2 = new StreamResult(os);
		transformer.transform(sourceContent, result2);

		String xml = new String(os.toByteArray(), "UTF-8");

		// System.out.println("\n");
		// System.out.println(xml);

		int Scheme_budget = 0;

		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = builderFactory.newDocumentBuilder();

		Document xmlDocument = builder.parse(new ByteArrayInputStream(xml.getBytes()));

		XPath xPath = XPathFactory.newInstance().newXPath();

		ArrayList<String> global_outcome = new ArrayList<String>();
		// ArrayList<String> global_outcome_value = new ArrayList<String>();

		// ArrayList<String> thedealer_outcome = new ArrayList<String>();
		// ArrayList<String> thedealer_outcome_value = new ArrayList<String>();

		ArrayList<String> reward_outcome = new ArrayList<String>();
		ArrayList<String> reward_outcome_instance_id = new ArrayList<String>();
		// ArrayList<String> reward_outcome_value = new ArrayList<String>();

		// global_outcome.add("EB_RNG");
		// global_outcome.add("EXT_MO_RNG");
		// global_outcome.add("FM_RNG");
		// global_outcome.add("MO_RNG");
		global_outcome.add("SCH_NAME");
		global_outcome.add("SCH_BDGT");

		// thedealer_outcome.add("PARTA_VOL");
		// thedealer_outcome.add("PARTA_CN");
		// thedealer_outcome.add("LY_VOL");
		// thedealer_outcome.add("LY_VAL");
		// thedealer_outcome.add("PARTB_VAL");
		// thedealer_outcome.add("TY_VOL");
		// thedealer_outcome.add("TY_VAL");
		// thedealer_outcome.add("PARTB_VOL");
		// thedealer_outcome.add("EXT_PARTB_VOL");
		// thedealer_outcome.add("FNL_PARTB_VOL");
		// thedealer_outcome.add("TGT_GRWTH");
		// thedealer_outcome.add("GWTH_PCT");
		// thedealer_outcome.add("PARTB_CN");
		// thedealer_outcome.add("TOT_CN");

		// thedealer_outcome.add("DLR_BILL_TO");
		// thedealer_outcome.add("DLR_AC_NO");
		// thedealer_outcome.add("DLR_TYPE");
		// thedealer_outcome.add("TERR");
		// thedealer_outcome.add("REGN");
		// thedealer_outcome.add("DEPOT");
		// thedealer_outcome.add("DLR_NAME");
		// thedealer_outcome.add("DLR_CAT");

		reward_outcome.add("RW_ID");
		reward_outcome.add("RW_REGN");
		reward_outcome.add("RW_DEPOT");
		reward_outcome.add("RW_TERR");
		reward_outcome.add("RW_DLR_CODE");
		reward_outcome.add("RW_DLR_CAT");
		reward_outcome.add("RW_DLR_BILL_TO");
		reward_outcome.add("RW_DLR_TYPE");
		reward_outcome.add("RW_DLR_NAME");
		reward_outcome.add("RW_SEC");
		reward_outcome.add("RW_TYPE");
		reward_outcome.add("RW_PRD");
		reward_outcome.add("RW_UNIT");
		reward_outcome.add("RW_DT");
		reward_outcome.add("RW_LY");
		reward_outcome.add("RW_PEND_TGT");
		reward_outcome.add("RW_TGT");
		reward_outcome.add("RW_TY");
		reward_outcome.add("RW_ADDITIONAL");
		reward_outcome.add("RW_BASE_TOTAL");
		reward_outcome.add("RW_Q_STATUS");
		reward_outcome.add("RW_TOTAL");
		reward_outcome.add("RW_GFT_TO_CN");
		reward_outcome.add("RW_CNVRTD_CN");
		reward_outcome.add("RW_I_STATUS");

		for (String global_att : global_outcome) {

			String xmlpath = "/Envelope/Body/assess-response/global-instance/attribute";
			String expression = xmlpath + "[@id='" + global_att + "']";
			// System.out.println(expression);

			String global_value = xPath.compile(expression).evaluate(xmlDocument);
			// global_outcome_value.add(global_value);

			// System.out.println(global_att + " = " + global_value);

			if (global_att.equals("SCH_BDGT")) {
				Float f = Float.parseFloat(global_value);

				int v = Math.round(f);
				Scheme_budget = v;

				// ArrayList<New_Scheme_mstr> scms =
				// (ArrayList<New_Scheme_mstr>) hibernateTemplate
				// .find("from New_Scheme_mstr where scheme_id='" + scheme_id +
				// "'");

				// New_Scheme_mstr scm = scms.get(0);

				// scm.setScheme_budget(v);
				// scm.setActive_flag("Processed");

				// hibernateTemplate.saveOrUpdate(scm);
			}

			// read an xml node using xpath
			// Node node2 = (Node)
			// xPath.compile(expression).evaluate(xmlDocument,
			// XPathConstants.NODE);
			//
			// if (null != node2) {
			// NodeList nodeListn2 = node2.getChildNodes();
			// for (int j = 0; null != nodeListn2 && j < nodeListn2.getLength();
			// j++) {
			// Node nod2 = nodeListn2.item(j);
			// if (nod2.getNodeType() == Node.ELEMENT_NODE) {
			// System.out.println(nodeListn2.item(j).getNodeName() + " : " +
			// nod2.getFirstChild().getNodeValue());
			// }
			// }
			// }

		}

		if (!finanalysis.equals("1")) {

			ArrayList<String> dealer_instances = new ArrayList<String>();

			for (Bpil_Dealers dealer : dealers) {
				dealer_instances.add(Integer.toString(dealer.getBILL_TO_ID()));
			}

			for (String dealer_instance : dealer_instances) {

				// thedealer_outcome_value.clear();
				// reward_outcome_value.clear();
				reward_outcome_instance_id.clear();

				// OPA_Output_table bpil_opa_sch_tbl = new OPA_Output_table();
				//
				// int infonum = bpil_opa_sch_tbl.getScheme_output_id();
				//
				// bpil_opa_sch_tbl.setScheme_output_id(infonum);
				// bpil_opa_sch_tbl.setScheme_id(Integer.parseInt(scheme_id));
				// bpil_opa_sch_tbl.setScheme_code(scheme_code);
				// bpil_opa_sch_tbl.setSch_reward_type("CN Points");
				// bpil_opa_sch_tbl.setSch_status("Analysed");
				// bpil_opa_sch_tbl.setAttribute1("N");

				// for (String thedealer_att : thedealer_outcome) {
				//
				// String xmlpath =
				// "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"
				// + dealer_instance + "']/attribute";
				// String expression = xmlpath + "[@id='" + thedealer_att +
				// "']";
				// System.out.println(expression);
				//
				// String dealer_value =
				// xPath.compile(expression).evaluate(xmlDocument);
				// thedealer_outcome_value.add(dealer_value);
				//
				// System.out.println(thedealer_att + " = " + dealer_value);
				//
				// if (thedealer_att.equals("REGN")) {
				// bpil_opa_sch_tbl.setSch_regn(dealer_value);
				// } else if (thedealer_att.equals("DEPOT")) {
				// bpil_opa_sch_tbl.setSch_depot(dealer_value);
				// } else if (thedealer_att.equals("TERR")) {
				// bpil_opa_sch_tbl.setSch_terr(dealer_value);
				// } else if (thedealer_att.equals("DLR_CODE")) {
				// bpil_opa_sch_tbl.setSch_dlr_code(dealer_value);
				// } else if (thedealer_att.equals("DLR_NAME")) {
				// bpil_opa_sch_tbl.setSch_dlr_name(dealer_value);
				// } else if (thedealer_att.equals("DLR_CAT")) {
				// bpil_opa_sch_tbl.setSch_dlr_cat(dealer_value);
				// } else if (thedealer_att.equals("BILL_TO")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setSch_dlr_bill_to(v);
				//
				//// bpil_opa_sch_tbl.setSch_dlr_bill_to(Integer.parseInt(dealer_value));
				// } else if (thedealer_att.equals("CUST_TYPE")) {
				// bpil_opa_sch_tbl.setSch_dlr_type(Integer.parseInt(dealer_value));
				// } else if (thedealer_att.equals("LY_VOL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// if (finanalysis.equals("1")) {
				// bpil_opa_sch_tbl.setLly_volume(v);
				// } else {
				// bpil_opa_sch_tbl.setLy_volume(v);
				// }
				//
				// } else if (thedealer_att.equals("LY_VAL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// if (finanalysis.equals("1")) {
				// bpil_opa_sch_tbl.setLly_value(v);
				// } else {
				// bpil_opa_sch_tbl.setLy_value(v);
				// }
				//
				// } else if (thedealer_att.equals("TY_VOL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// if (finanalysis.equals("1")) {
				// bpil_opa_sch_tbl.setLy_volume(v);
				// } else {
				// bpil_opa_sch_tbl.setTy_volume(v);
				// }
				//
				// } else if (thedealer_att.equals("TY_VAL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// if (finanalysis.equals("1")) {
				// bpil_opa_sch_tbl.setLy_value(v);
				// } else {
				// bpil_opa_sch_tbl.setTy_value(v);
				// }
				//
				// } else if (thedealer_att.equals("TGT_GRWTH")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setSch_tgt_grw_pct(v);
				//
				// } else if (thedealer_att.equals("GRWTH")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setSch_act_grw_pct(v);
				//
				// } else if (thedealer_att.equals("EB_VOL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setPart1_volume(v);
				// } else if (thedealer_att.equals("MO_FNL_VOL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setPart2_volume(v);
				// } else if (thedealer_att.equals("MO_VAL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setPart2_value(v);
				// } else if (thedealer_att.equals("EXT_MO_VOL")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setPart2_ext_vol(v);
				// } else if (thedealer_att.equals("EB_CN")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setPart1_cn_pts(v);
				// } else if (thedealer_att.equals("MO_CN")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				// bpil_opa_sch_tbl.setPart2_cn_pts(v);
				// } else if (thedealer_att.equals("TOTAL_CN")) {
				// Float f = Float.parseFloat(dealer_value);
				//
				// int v = Math.round(f);
				//
				// bpil_opa_sch_tbl.setSch_tot_cn_pts(v);
				// }

				// read an xml node using xpath
				// Node node2 = (Node)
				// xPath.compile(expression).evaluate(xmlDocument,
				// XPathConstants.NODE);
				//
				// if (null != node2) {
				// NodeList nodeListn2 = node2.getChildNodes();
				// for (int j = 0; null != nodeListn2 && j <
				// nodeListn2.getLength(); j++) {
				// Node nod2 = nodeListn2.item(j);
				// if (nod2.getNodeType() == Node.ELEMENT_NODE)
				// System.out.println(
				// nodeListn2.item(j).getNodeName() + " : " +
				// nod2.getFirstChild().getNodeValue());
				// }
				// }

				// }
				// hibernateTemplate.saveOrUpdate(bpil_opa_sch_tbl);

				String rwxmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"
						+ dealer_instance + "']/entity";
				String rwexpression = rwxmlpath + "[@id='REWARD']";
				// System.out.println(rwexpression);

				String reward_value = xPath.compile(rwexpression).evaluate(xmlDocument);
				// reward_outcome_value.add(reward_value);

				// System.out.println("REWARD" + " = " + reward_value);

				// read an xml node using xpath
				Node rwnode = (Node) xPath.compile(rwexpression).evaluate(xmlDocument, XPathConstants.NODE);

				if (null != rwnode) {
					NodeList rwnodeList = rwnode.getChildNodes();
					for (int j = 0; null != rwnodeList && j < rwnodeList.getLength(); j++) {
						Node rwinstnode = rwnodeList.item(j);
						NamedNodeMap rwinstattr = rwinstnode.getAttributes();
						Node rwinstattrid = rwinstattr.getNamedItem("id");
						// System.out.println(rwinstattrid.getNodeValue());
						reward_outcome_instance_id.add(rwinstattrid.getNodeValue());
						// if (nod2.getNodeType() == Node.ELEMENT_NODE)
						// System.out.println(
						// nodeListn2.item(j).getNodeName() + " : " +
						// nod2.getFirstChild().getNodeValue());
					}
				}

				int i = 0;

				for (String rw_id : reward_outcome_instance_id) {
					i++;
					// reward_outcome_value.clear();

					Bpil_opa_scheme_analysis bpil_opa_sch_anlys = new Bpil_opa_scheme_analysis();

					int infonum2 = bpil_opa_sch_anlys.getOpa_analysis_id();

					bpil_opa_sch_anlys.setOpa_analysis_id(infonum2);
					bpil_opa_sch_anlys.setScheme_id(Integer.parseInt(scheme_id));

					String xmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"
							+ dealer_instance + "']/entity/instance[@id='" + rw_id + "']/attribute";

					for (String rw_att : reward_outcome) {

						String expression = xmlpath + "[@id='" + rw_att + "']";
						// System.out.println(expression);

						String rw_value = xPath.compile(expression).evaluate(xmlDocument);
						// reward_outcome_value.add(rw_value);

						// System.out.println(i + " " +rw_id + " - " + rw_att +"
						// = " + rw_value);

						// if (rw_att.equals("RW_ID")) {
						// Float f = Float.parseFloat(rw_value);
						//
						// int v = Math.round(f);
						//
						// bpil_opa_sch_anlys.setOpa_analysis_id(v);
						//
						//
						// } else
						if (rw_att.equals("RW_REGN")) {
							bpil_opa_sch_anlys.setRegn(rw_value);
						} else if (rw_att.equals("RW_DEPOT")) {
							bpil_opa_sch_anlys.setDepot(rw_value);
						} else if (rw_att.equals("RW_TERR")) {
							bpil_opa_sch_anlys.setTerr_code(rw_value);
						} else if (rw_att.equals("RW_DLR_BILL_TO")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setDlr_bill_to(v);

						} else if (rw_att.equals("RW_DLR_CODE")) {
							bpil_opa_sch_anlys.setDlr_ac_no(rw_value);
						} else if (rw_att.equals("RW_DLR_NAME")) {
							bpil_opa_sch_anlys.setDlr_name(rw_value);
						} else if (rw_att.equals("RW_DLR_CAT")) {
							bpil_opa_sch_anlys.setDlr_cat(rw_value);
						} else if (rw_att.equals("RW_DLR_TYPE")) {
							bpil_opa_sch_anlys.setDlr_type(rw_value);
						} else if (rw_att.equals("RW_SEC")) {
							bpil_opa_sch_anlys.setReward_section(rw_value);
						} else if (rw_att.equals("RW_TYPE")) {
							bpil_opa_sch_anlys.setReward_type(rw_value);
						} else if (rw_att.equals("RW_PRD")) {
							bpil_opa_sch_anlys.setProduct(rw_value);
						} else if (rw_att.equals("RW_UNIT")) {
							bpil_opa_sch_anlys.setUnit(rw_value);
						} else if (rw_att.equals("RW_DT")) {
							DateFormat datformat = new SimpleDateFormat("dd-MM-yyyy");
							Date dateStr = datformat.parse(rw_value);

							bpil_opa_sch_anlys.setReward_date(dateStr);
						} else if (rw_att.equals("RW_LY")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setReward_ly(v);

						} else if (rw_att.equals("RW_PEND_TGT")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setNext_tgt_pending(v);

						} else if (rw_att.equals("RW_TGT")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setReward_target(v);

						} else if (rw_att.equals("RW_TY")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setReward_ty(v);

						} else if (rw_att.equals("RW_ADDITIONAL")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setAdditional(v);

						} else if (rw_att.equals("RW_BASE_TOTAL")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setBase_total(v);

						} else if (rw_att.equals("RW_Q_STATUS")) {
							bpil_opa_sch_anlys.setReward_status(rw_value);
						} else if (rw_att.equals("RW_TOTAL")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setReward_total(v);

						} else if (rw_att.equals("RW_GFT_TO_CN")) {
							bpil_opa_sch_anlys.setGift_to_cn_flag(rw_value);
						} else if (rw_att.equals("RW_CNVRTD_CN")) {
							Float f = Float.parseFloat(rw_value);

							int v = Math.round(f);
							bpil_opa_sch_anlys.setConverted_cn_value(v);

						} else if (rw_att.equals("RW_I_STATUS")) {
							bpil_opa_sch_anlys.setInterface_status(rw_value);
						}

						// read an xml node using xpath
						// Node node3 = (Node)
						// xPath.compile(expression2).evaluate(xmlDocument,
						// XPathConstants.NODE);
						//
						// if (null != node3) {
						// NodeList nodeListn3 = node3.getChildNodes();
						// for (int j = 0; null != nodeListn3 && j <
						// nodeListn3.getLength(); j++) {
						// Node nod3 = nodeListn3.item(j);
						// if (nod3.getNodeType() == Node.ELEMENT_NODE)
						// System.out.println(
						// nodeListn3.item(j).getNodeName() + " : " +
						// nod3.getFirstChild().getNodeValue());
						// }
						// }

					}

					hibernateTemplate.saveOrUpdate(bpil_opa_sch_anlys);

				}

			}

		}

		return Scheme_budget;

	}
	
	@RequestMapping("/callSchOpaWebservloadoutputdata")
	public ModelAndView callSchOpaWebservloadoutputdata(@RequestParam(value = "scheme_id") String scheme_id,
			@RequestParam(value = "depot") String depot,
			ModelMap map, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		
		Date St = new Date();
		System.out.println("Start call to webservice" + St);

		
				
		int Scheme_budget = 0;

		System.out.println("scheme_id = " + scheme_id + " depot_code = " + depot);
		
		ArrayList<New_Scheme_mstr> dml = (ArrayList<New_Scheme_mstr>) hibernateTemplate.find("from New_Scheme_mstr where scheme_id = '"+scheme_id+"'");
		 
		String schopawebserviceUrl = "";
			if(dml != null && dml.size() > 0) {
				schopawebserviceUrl = dml.get(0).getSch_opa_url();
			}
			
			if(!depot.equals("")) {
				
				List<Bpil_RewardOPAOutput> RewardSchOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();
				
//				String sql = "SELECT   BDM.OPA_SCH_AN_DEALER_ID        OPA_RW_AN_DEALER_ID "
// 						+"        ,BDM.DLR_BILL_TO      DLR_BILL_TO  "
// 						+"        ,BDM.DEPOT_CODE "
// 						+"        ,BDM.DLR_AC_NO        DLR_AC_NO "
// 						+"        ,BDM.DLR_AC_NAME      DLR_AC_NAME "
//						+" FROM   BPIL_DEALER_MASTER_NEW BDM "
//						+" 		 ,BPIL_DEPOT_MASTER DPT "
//						+"       ,BPIL_SCHEME_DEPOT_DETAILS BSDD "
//						+"       ,BPIL_SCHEME_MASTER BSM "
//						+" WHERE   BDM.DEPOT_CODE = DPT.DEPOT_CODE "
//						+" AND     DPT.DEPOT_CODE = BSDD.SCH_DEPOT_CODE "
//						+" AND     BDM.DEPOT_CODE = BSDD.SCH_DEPOT_CODE "
//						+" AND     BSDD.SCHEME_ID = BSM.SCHEME_ID "
//						+" AND     BDM.CUST_TYPE IN (SELECT CUST_TYPE FROM BPIL_SCHEME_CUST_TYPES WHERE SCHEME_ID = '"+scheme_id+"') "
//						+" AND     BSM.SCHEME_ID  = '"+scheme_id+"' "
//						+" AND     BDM.DEPOT_CODE = '"+depot+"' "
//						+" AND     BDM.PRIMARY_FLAG = 'Y' "
//						+" ORDER BY  DLR_AC_NAME ";
// 					
// 			
// 			 
// 			 List<Bpil_Opa_Rw_Analysis_Rw> depotdillers = jdbcTemplate.query(sql, new RowMapper<Bpil_Opa_Rw_Analysis_Rw>() {
//
// 					@Override
// 					public Bpil_Opa_Rw_Analysis_Rw mapRow(ResultSet rs, int rowNum) throws SQLException {
// 						Bpil_Opa_Rw_Analysis_Rw aContact = new Bpil_Opa_Rw_Analysis_Rw();
// 			
// 						aContact.setOpa_rw_an_dealer_id(rs.getString("OPA_RW_AN_DEALER_ID"));
// 						aContact.setDlr_ac_no(rs.getString("DLR_AC_NO"));
// 						aContact.setDlr_name(rs.getString("DLR_AC_NAME"));
// 						aContact.setDlr_bill_to(rs.getInt("DLR_BILL_TO"));
// 						
// 						return aContact;
// 					}
// 					
// 				});			
 			 
 			List<Bpil_Opa_Rw_Analysis_Rw> depotdillers = new ArrayList<Bpil_Opa_Rw_Analysis_Rw>();
	          CallableStatement cStmts;
				try {
				cStmts = hibernateconfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_OPA_SCH_DLR(?,?,?)}");
				cStmts.setInt(1, Integer.parseInt(scheme_id));
				cStmts.setString(2, depot);
				cStmts.registerOutParameter(3, OracleTypes.CURSOR);
				ResultSet result = cStmts.executeQuery();
				ResultSet rs1 = (ResultSet) cStmts.getObject(3);
				while (rs1.next()) {
					Bpil_Opa_Rw_Analysis_Rw aContact = new Bpil_Opa_Rw_Analysis_Rw();
					
					aContact.setOpa_rw_an_dealer_id(rs1.getString("OPA_RW_AN_DEALER_ID"));
					aContact.setDlr_ac_no(rs1.getString("DLR_AC_NO"));
					aContact.setDlr_name(rs1.getString("DLR_AC_NAME"));
					aContact.setDlr_bill_to(rs1.getInt("DLR_BILL_TO"));

					
					
					depotdillers.add(aContact);
				}
				} catch (SQLException e) {
				e.printStackTrace();
				}
				catch (Exception e) {
				System.out.println(e.getMessage());
				}

 			 
 			 for (Bpil_Opa_Rw_Analysis_Rw bpil_Opa_Rw_Analysis_Rw : depotdillers) {
 				 
 				List<Bpil_DealerOPAInput> DealerOPAInput = new ArrayList<Bpil_DealerOPAInput>();
 				List<Bpil_ProductOPAInput> ProductOPAInput = new ArrayList<Bpil_ProductOPAInput>();
 				List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();
 				
 				CallableStatement cStmt;
 				try {
 					cStmt = hibernateconfiguration.dataSource().getConnection()
 							.prepareCall("{call BPIL_GET_OPA_DLR_INPUT(?,?,?,?,?)}");
 					cStmt.setInt(1, Integer.parseInt(scheme_id));
 					cStmt.setString(2, depot);
 					cStmt.setInt(3, bpil_Opa_Rw_Analysis_Rw.getDlr_bill_to());
 					
 					cStmt.registerOutParameter(4, OracleTypes.CURSOR);
 					cStmt.registerOutParameter(5, OracleTypes.CURSOR);
 					
 					ResultSet result = cStmt.executeQuery();
 					ResultSet rsdealers = (ResultSet) cStmt.getObject(4);
 					ResultSet rsproducts = (ResultSet) cStmt.getObject(5);

 					while (rsdealers.next()) {
 						Bpil_DealerOPAInput bpil_DealerOPAInput = new Bpil_DealerOPAInput();
 						
 						bpil_DealerOPAInput.setDLR_SCH_ID(rsdealers.getInt("SCHEME_ID"));
 						bpil_DealerOPAInput.setDLR_FIN_AN_FLAG(rsdealers.getString("FIN_AN_FLAG"));
 						bpil_DealerOPAInput.setDLR_REGN(rsdealers.getString("DLR_REGN"));
 						bpil_DealerOPAInput.setDLR_DEPOT(rsdealers.getString("DLR_DEPOT"));
 						bpil_DealerOPAInput.setDLR_STATE(rsdealers.getString("DLR_STATE"));
 						bpil_DealerOPAInput.setDLR_TERR_CODE(rsdealers.getString("DLR_TERR_CODE"));
 						bpil_DealerOPAInput.setDLR_TERR_NAME(rsdealers.getString("DLR_TERR_NAME"));
 						bpil_DealerOPAInput.setDLR_BILL_TO(rsdealers.getInt("DLR_BILL_TO"));
 						bpil_DealerOPAInput.setDLR_AC_NO(rsdealers.getString("DLR_AC_NO"));
 						bpil_DealerOPAInput.setDLR_AC_NAME(rsdealers.getString("DLR_AC_NAME"));
 						bpil_DealerOPAInput.setDLR_CAT(rsdealers.getString("DLR_CAT"));
 						bpil_DealerOPAInput.setDLR_TYPE(rsdealers.getString("DLR_TYPE"));
 						bpil_DealerOPAInput.setDLR_RET(rsdealers.getString("DLR_RET"));
 						bpil_DealerOPAInput.setDLR_SDLR_COUNT(rsdealers.getInt("DLR_SDLR_COUNT"));
 						
 						DealerOPAInput.add(bpil_DealerOPAInput);
 					}

 					while (rsproducts.next()) {
 						Bpil_ProductOPAInput bpil_ProductOPAInput = new Bpil_ProductOPAInput();
 						
 						bpil_ProductOPAInput.setPRD_SCH_ID(rsproducts.getInt("PRD_SCH_ID"));
 						bpil_ProductOPAInput.setPRD_BILL_TO(rsproducts.getInt("PRD_BILL_TO"));
 						bpil_ProductOPAInput.setPRD_DLR_AC_NO(rsproducts.getString("PRD_DLR_AC_NO"));
 						bpil_ProductOPAInput.setPRD_DLR_TYPE(rsproducts.getString("PRD_DLR_TYPE"));
 						bpil_ProductOPAInput.setPRD_NAME(rsproducts.getString("PRD_NAME"));
 						bpil_ProductOPAInput.setPRD_CAT(rsproducts.getString("PRD_CAT"));
 						bpil_ProductOPAInput.setPRD_CAT_DESC(rsproducts.getString("PRD_CAT_DESC"));
 						bpil_ProductOPAInput.setPRD_GRP(rsproducts.getString("PRD_GRP"));
 						bpil_ProductOPAInput.setPRD_CODE(rsproducts.getString("PRD_CODE"));
 						bpil_ProductOPAInput.setPRD_SHD_CODE(rsproducts.getString("PRD_SHD_CODE"));
 						bpil_ProductOPAInput.setPRD_INV_DT(rsproducts.getDate("PRD_INV_DT"));
 						bpil_ProductOPAInput.setPRD_UOM(rsproducts.getString("PRD_UOM"));
 						bpil_ProductOPAInput.setPRD_PCK_SIZE(rsproducts.getBigDecimal("PRD_PCK_SIZE"));
 						bpil_ProductOPAInput.setPRD_VOL(rsproducts.getBigDecimal("PRD_VOL"));
 						bpil_ProductOPAInput.setPRD_FNL_VOL(rsproducts.getBigDecimal("PRD_FNL_VOL"));
 						bpil_ProductOPAInput.setPRD_VAL(rsproducts.getBigDecimal("PRD_VAL"));
 						bpil_ProductOPAInput.setPRD_VOL_RW(rsproducts.getBigDecimal("PRD_VOL_RW"));
 						bpil_ProductOPAInput.setPRD_FNL_VOL_RW(rsproducts.getBigDecimal("PRD_FNL_VOL_RW"));
 						bpil_ProductOPAInput.setPRD_VAL_RW(rsproducts.getBigDecimal("PRD_VAL_RW"));

 						ProductOPAInput.add(bpil_ProductOPAInput);
 					}


 					System.out.println("Dealers size = " + DealerOPAInput.size() + " Products = " + ProductOPAInput.size());

 				} catch (SQLException e) {
 					e.printStackTrace();
 				} catch (Exception e) {
 					System.out.println(e.getMessage());
 				}
 				
 				Date Sd = new Date();
 				System.out.println("Start call to webservice" + Sd);

 				RewardOPAOutput = callschopasoap_webservice(DealerOPAInput, ProductOPAInput, scheme_id, depot, Integer.toString(bpil_Opa_Rw_Analysis_Rw.getDlr_bill_to()), schopawebserviceUrl, request);

 				Date Ed = new Date();
 				System.out.println("End call to webservice" + Ed);

 				System.out.println("Total time : Sw " + Sd + " Ew " + Ed);

 				System.out.println("Scheme_budget = " + Scheme_budget);
 				
 				RewardSchOPAOutput.addAll(RewardOPAOutput);			
 				
				
 			 }
 			 
 			
				
				List<Bpil_Opa_Sch_Analysis_Rw> sch_Analysis_Rws = new ArrayList<Bpil_Opa_Sch_Analysis_Rw>();
				
				for (Bpil_RewardOPAOutput bpil_RewardOPAOutput : RewardSchOPAOutput) {
					
					Bpil_Opa_Sch_Analysis_Rw aContact = new Bpil_Opa_Sch_Analysis_Rw();
					
					aContact.setScheme_id(bpil_RewardOPAOutput.getRW_SCH_ID());
					aContact.setRegn(bpil_RewardOPAOutput.getRW_DLR_REGN());
					aContact.setState(bpil_RewardOPAOutput.getRW_DLR_STATE());
					aContact.setDepot(bpil_RewardOPAOutput.getRW_DLR_DEPOT());
					aContact.setTerr_code(bpil_RewardOPAOutput.getRW_DLR_TERR_CODE());
					aContact.setTerr_name(bpil_RewardOPAOutput.getRW_DLR_TERR_NAME());
					aContact.setDlr_ac_no(bpil_RewardOPAOutput.getRW_DLR_CODE());			
					aContact.setDlr_cat(bpil_RewardOPAOutput.getRW_DLR_CAT());
					aContact.setDlr_bill_to(bpil_RewardOPAOutput.getRW_DLR_BILL_TO());	
					aContact.setDlr_type(bpil_RewardOPAOutput.getRW_DLR_TYPE());
					aContact.setDlr_name(bpil_RewardOPAOutput.getRW_DLR_NAME());	
					aContact.setReward_section(bpil_RewardOPAOutput.getRW_SEC());
					aContact.setReward_type(bpil_RewardOPAOutput.getRW_TYPE());
					aContact.setProduct(bpil_RewardOPAOutput.getRW_PRD());
					aContact.setUnit(bpil_RewardOPAOutput.getRW_UNIT());
					aContact.setReward_date(bpil_RewardOPAOutput.getRW_DATE());
					
					if(bpil_RewardOPAOutput.getRW_DATE()!=null)
					{
						DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy");
						String dateStr1 = ser1.format(bpil_RewardOPAOutput.getRW_DATE());
						aContact.setReward_date1(dateStr1);	
//						try {
//							System.out.println(ser1.parse(rs.getString("REWARD_DATE")));
//						} catch (ParseException e) {
//								e.printStackTrace();
//						}
					}
					
					
					aContact.setReward_ly(bpil_RewardOPAOutput.getRW_LY().intValue());
					aContact.setReward_target(bpil_RewardOPAOutput.getRW_TGT().intValue());				
					aContact.setReward_ty(bpil_RewardOPAOutput.getRW_TY().intValue());				
					aContact.setAdditional(bpil_RewardOPAOutput.getRW_ADDITIONAL().intValue());
					aContact.setBase_total(bpil_RewardOPAOutput.getRW_BASE_TOTAL().intValue());
					aContact.setReward_status(bpil_RewardOPAOutput.getRW_Q_STAT());
					aContact.setReward_description(bpil_RewardOPAOutput.getRW_DESC());
					aContact.setReward_total(bpil_RewardOPAOutput.getRW_TOTAL().intValue());
					aContact.setNext_tgt_pending(bpil_RewardOPAOutput.getRW_NXT_TGT().intValue());
					aContact.setGift_to_cn_flag(bpil_RewardOPAOutput.getRW_GFT_TO_CN());
					aContact.setConverted_cn_value(bpil_RewardOPAOutput.getRW_CONV_CN().intValue());
					aContact.setInterface_status(bpil_RewardOPAOutput.getRW_I_STAT());
					
					aContact.setReward_last_update(bpil_RewardOPAOutput.getRW_LAST_UPDATE());
					
					if(bpil_RewardOPAOutput.getRW_LAST_UPDATE()!=null)
					{
						DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");
						String dateStr1 = ser1.format(bpil_RewardOPAOutput.getRW_LAST_UPDATE());
						aContact.setReward_last_update1(dateStr1);	
//						try {
////							System.out.println(ser1.parse(rs.getString("REWARD_LAST_UPDATE")));
//						} catch (ParseException e) {
//								e.printStackTrace();
//						}
					}
					

					
					sch_Analysis_Rws.add(aContact);
					
				}
				
				String LastRefresh = "";
				
				if(sch_Analysis_Rws.size() > 0) {
					
					if(sch_Analysis_Rws.get(0).getReward_last_update()!=null)
					{
						DateFormat ser1 = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");
						String dateStr1 = ser1.format(sch_Analysis_Rws.get(0).getReward_last_update());
//						try {
////							System.out.println(ser1.parse(rs.getString("REWARD_LAST_UPDATE")));
//						} catch (ParseException e) {
//								e.printStackTrace();
//						}
						
						LastRefresh = dateStr1;
					}
				
					

				}
				
				ArrayList<Bpil_Scheme_Doc> doc_line = schememasterdao.docautofill(Integer.parseInt(scheme_id));
				 System.out.println("doc_line " + doc_line.size());
				 
				 model.addAttribute("doc_list",doc_line);
				
				model.addAttribute("Info_grid",sch_Analysis_Rws);
				
				model.addAttribute("LastRefresh",LastRefresh);
				
			}
			
			model.addAttribute("deptnm",depot);
			model.addAttribute("scheme_id",scheme_id);
			
			Date Et = new Date();
			System.out.println("End call to webservice" + Et);

			System.out.println("Total time : Sw " + St + " Ew " + Et);


		
			return new ModelAndView("SchemeAnalysis");
		
	}

	
	@RequestMapping("/callSchOpaWebserviceloadoutputdata")
	public ModelAndView callSchOpaWebserviceloadoutputdata(@RequestParam(value = "scheme_id") String scheme_id,
			@RequestParam(value = "depot") String depot,
			@RequestParam(value = "bill_to_id") String bill_to_id, ModelMap map, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		
		Date St = new Date();
		System.out.println("Start call to webservice" + St);

		
				
		int Scheme_budget = 0;

		System.out.println("scheme_id = " + scheme_id + " depot_code = " + depot + " bill_to_id = " + bill_to_id);
		
		ArrayList<New_Scheme_mstr> dml = (ArrayList<New_Scheme_mstr>) hibernateTemplate.find("from New_Scheme_mstr where scheme_id = '"+scheme_id+"'");
		 
		String schopawebserviceUrl = "";
			if(dml != null && dml.size() > 0) {
				schopawebserviceUrl = dml.get(0).getSch_opa_url();
			}
			
			if(!bill_to_id.equals("")) {
			
			List<Bpil_DealerOPAInput> DealerOPAInput = new ArrayList<Bpil_DealerOPAInput>();
			List<Bpil_ProductOPAInput> ProductOPAInput = new ArrayList<Bpil_ProductOPAInput>();
			List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();
			
			CallableStatement cStmt;
			try {
				cStmt = hibernateconfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_OPA_DLR_INPUT(?,?,?,?,?)}");
				cStmt.setInt(1, Integer.parseInt(scheme_id));
				cStmt.setString(2, depot);
				cStmt.setInt(3, Integer.parseInt(bill_to_id));
				
				cStmt.registerOutParameter(4, OracleTypes.CURSOR);
				cStmt.registerOutParameter(5, OracleTypes.CURSOR);
				
				ResultSet result = cStmt.executeQuery();
				ResultSet rsdealers = (ResultSet) cStmt.getObject(4);
				ResultSet rsproducts = (ResultSet) cStmt.getObject(5);

				while (rsdealers.next()) {
					Bpil_DealerOPAInput bpil_DealerOPAInput = new Bpil_DealerOPAInput();
					
					bpil_DealerOPAInput.setDLR_SCH_ID(rsdealers.getInt("SCHEME_ID"));
					bpil_DealerOPAInput.setDLR_FIN_AN_FLAG(rsdealers.getString("FIN_AN_FLAG"));
					bpil_DealerOPAInput.setDLR_REGN(rsdealers.getString("DLR_REGN"));
					bpil_DealerOPAInput.setDLR_DEPOT(rsdealers.getString("DLR_DEPOT"));
					bpil_DealerOPAInput.setDLR_STATE(rsdealers.getString("DLR_STATE"));
					bpil_DealerOPAInput.setDLR_TERR_CODE(rsdealers.getString("DLR_TERR_CODE"));
					bpil_DealerOPAInput.setDLR_TERR_NAME(rsdealers.getString("DLR_TERR_NAME"));
					bpil_DealerOPAInput.setDLR_BILL_TO(rsdealers.getInt("DLR_BILL_TO"));
					bpil_DealerOPAInput.setDLR_AC_NO(rsdealers.getString("DLR_AC_NO"));
					bpil_DealerOPAInput.setDLR_AC_NAME(rsdealers.getString("DLR_AC_NAME"));
					bpil_DealerOPAInput.setDLR_CAT(rsdealers.getString("DLR_CAT"));
					bpil_DealerOPAInput.setDLR_TYPE(rsdealers.getString("DLR_TYPE"));
					bpil_DealerOPAInput.setDLR_RET(rsdealers.getString("DLR_RET"));
					bpil_DealerOPAInput.setDLR_SDLR_COUNT(rsdealers.getInt("DLR_SDLR_COUNT"));
					
					DealerOPAInput.add(bpil_DealerOPAInput);
				}

				while (rsproducts.next()) {
					Bpil_ProductOPAInput bpil_ProductOPAInput = new Bpil_ProductOPAInput();
					
					bpil_ProductOPAInput.setPRD_SCH_ID(rsproducts.getInt("PRD_SCH_ID"));
					bpil_ProductOPAInput.setPRD_BILL_TO(rsproducts.getInt("PRD_BILL_TO"));
					bpil_ProductOPAInput.setPRD_DLR_AC_NO(rsproducts.getString("PRD_DLR_AC_NO"));
					bpil_ProductOPAInput.setPRD_DLR_TYPE(rsproducts.getString("PRD_DLR_TYPE"));
					bpil_ProductOPAInput.setPRD_NAME(rsproducts.getString("PRD_NAME"));
					bpil_ProductOPAInput.setPRD_CAT(rsproducts.getString("PRD_CAT"));
					bpil_ProductOPAInput.setPRD_CAT_DESC(rsproducts.getString("PRD_CAT_DESC"));
					bpil_ProductOPAInput.setPRD_GRP(rsproducts.getString("PRD_GRP"));
					bpil_ProductOPAInput.setPRD_CODE(rsproducts.getString("PRD_CODE"));
					bpil_ProductOPAInput.setPRD_SHD_CODE(rsproducts.getString("PRD_SHD_CODE"));
					bpil_ProductOPAInput.setPRD_INV_DT(rsproducts.getDate("PRD_INV_DT"));
					bpil_ProductOPAInput.setPRD_UOM(rsproducts.getString("PRD_UOM"));
					bpil_ProductOPAInput.setPRD_PCK_SIZE(rsproducts.getBigDecimal("PRD_PCK_SIZE"));
					bpil_ProductOPAInput.setPRD_VOL(rsproducts.getBigDecimal("PRD_VOL"));
					bpil_ProductOPAInput.setPRD_FNL_VOL(rsproducts.getBigDecimal("PRD_FNL_VOL"));
					bpil_ProductOPAInput.setPRD_VAL(rsproducts.getBigDecimal("PRD_VAL"));
					bpil_ProductOPAInput.setPRD_VOL_RW(rsproducts.getBigDecimal("PRD_VOL_RW"));
					bpil_ProductOPAInput.setPRD_FNL_VOL_RW(rsproducts.getBigDecimal("PRD_FNL_VOL_RW"));
					bpil_ProductOPAInput.setPRD_VAL_RW(rsproducts.getBigDecimal("PRD_VAL_RW"));

					ProductOPAInput.add(bpil_ProductOPAInput);
				}


				System.out.println("Dealers size = " + DealerOPAInput.size() + " Products = " + ProductOPAInput.size());

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			Date Sd = new Date();
			System.out.println("Start call to webservice" + Sd);

			RewardOPAOutput = callschopasoap_webservice(DealerOPAInput, ProductOPAInput, scheme_id, depot, bill_to_id, schopawebserviceUrl, request);

			Date Ed = new Date();
			System.out.println("End call to webservice" + Ed);

			System.out.println("Total time : Sw " + Sd + " Ew " + Ed);

			System.out.println("Scheme_budget = " + Scheme_budget);
			
						
			String LastRefresh = "";
			
			if(RewardOPAOutput.size() > 0) {
			
				LastRefresh = RewardOPAOutput.get(0).getRW_LAST_UPDATE().toString();

			}
			
			model.addAttribute("Info_grid",RewardOPAOutput);
			
			model.addAttribute("LastRefresh",LastRefresh);
			} else if(!depot.equals("")) {
				
				List<Bpil_RewardOPAOutput> RewardSchOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();
				
//				String sql = "SELECT   BDM.OPA_SCH_AN_DEALER_ID        OPA_RW_AN_DEALER_ID "
// 						+"        ,BDM.DLR_BILL_TO      DLR_BILL_TO "
// 						+"        ,BDM.DEPOT_CODE "
// 						+"        ,BDM.DLR_AC_NO        DLR_AC_NO "
// 						+"        ,BDM.DLR_AC_NAME      DLR_AC_NAME "
//						+" FROM   BPIL_DEALER_MASTER_NEW BDM "
//						+" 		 ,BPIL_DEPOT_MASTER DPT "
//						+"       ,BPIL_SCHEME_DEPOT_DETAILS BSDD "
//						+"       ,BPIL_SCHEME_MASTER BSM "
//						+" WHERE   BDM.DEPOT_CODE = DPT.DEPOT_CODE "
//						+" AND     DPT.DEPOT_CODE = BSDD.SCH_DEPOT_CODE "
//						+" AND     BDM.DEPOT_CODE = BSDD.SCH_DEPOT_CODE "
//						+" AND     BSDD.SCHEME_ID = BSM.SCHEME_ID "
//						+" AND     BDM.CUST_TYPE IN (SELECT CUST_TYPE FROM BPIL_SCHEME_CUST_TYPES WHERE SCHEME_ID = '"+scheme_id+"') "
//						+" AND     BSM.SCHEME_ID  = '"+scheme_id+"' "
//						+" AND     BDM.DEPOT_CODE = '"+depot+"' "
//						+" AND     BDM.PRIMARY_FLAG = 'Y' "
//						+" ORDER BY  DLR_AC_NAME ";
// 					
// 			
// 			 
// 			 List<Bpil_Opa_Rw_Analysis_Rw> depotdillers = jdbcTemplate.query(sql, new RowMapper<Bpil_Opa_Rw_Analysis_Rw>() {
//
// 					@Override
// 					public Bpil_Opa_Rw_Analysis_Rw mapRow(ResultSet rs, int rowNum) throws SQLException {
// 						Bpil_Opa_Rw_Analysis_Rw aContact = new Bpil_Opa_Rw_Analysis_Rw();
// 			
// 						aContact.setOpa_rw_an_dealer_id(rs.getString("OPA_RW_AN_DEALER_ID"));
// 						aContact.setDlr_ac_no(rs.getString("DLR_AC_NO"));
// 						aContact.setDlr_name(rs.getString("DLR_AC_NAME"));
// 						aContact.setDlr_bill_to(rs.getInt("DLR_BILL_TO"));
// 						
// 						return aContact;
// 					}
// 					
// 				});	
 			 
 			List<Bpil_Opa_Rw_Analysis_Rw> depotdillers = new ArrayList<Bpil_Opa_Rw_Analysis_Rw>();
	          CallableStatement cStmts;
				try {
				cStmts = hibernateconfiguration.dataSource().getConnection()
						.prepareCall("{call BPIL_GET_OPA_SCH_DLR(?,?,?)}");
				cStmts.setInt(1, Integer.parseInt(scheme_id));
				cStmts.setString(2, depot);
				cStmts.registerOutParameter(3, OracleTypes.CURSOR);
				ResultSet result = cStmts.executeQuery();
				ResultSet rs1 = (ResultSet) cStmts.getObject(3);
				while (rs1.next()) {
					Bpil_Opa_Rw_Analysis_Rw aContact = new Bpil_Opa_Rw_Analysis_Rw();
					
					aContact.setOpa_rw_an_dealer_id(rs1.getString("OPA_RW_AN_DEALER_ID"));
					aContact.setDlr_ac_no(rs1.getString("DLR_AC_NO"));
					aContact.setDlr_name(rs1.getString("DLR_AC_NAME"));
					aContact.setDlr_bill_to(rs1.getInt("DLR_BILL_TO"));

					
					
					depotdillers.add(aContact);
				}
				} catch (SQLException e) {
				e.printStackTrace();
				}
				catch (Exception e) {
				System.out.println(e.getMessage());
				}

 			 
 			 for (Bpil_Opa_Rw_Analysis_Rw bpil_Opa_Rw_Analysis_Rw : depotdillers) {
 				 
 				List<Bpil_DealerOPAInput> DealerOPAInput = new ArrayList<Bpil_DealerOPAInput>();
 				List<Bpil_ProductOPAInput> ProductOPAInput = new ArrayList<Bpil_ProductOPAInput>();
 				List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();
 				
 				bill_to_id = Integer.toString(bpil_Opa_Rw_Analysis_Rw.getDlr_bill_to());
 				
 				CallableStatement cStmt;
 				try {
 					cStmt = hibernateconfiguration.dataSource().getConnection()
 							.prepareCall("{call BPIL_GET_OPA_DLR_INPUT(?,?,?,?,?)}");
 					cStmt.setInt(1, Integer.parseInt(scheme_id));
 					cStmt.setString(2, depot);
 					cStmt.setInt(3, Integer.parseInt(bill_to_id));
 					
 					cStmt.registerOutParameter(4, OracleTypes.CURSOR);
 					cStmt.registerOutParameter(5, OracleTypes.CURSOR);
 					
 					ResultSet result = cStmt.executeQuery();
 					ResultSet rsdealers = (ResultSet) cStmt.getObject(4);
 					ResultSet rsproducts = (ResultSet) cStmt.getObject(5);

 					while (rsdealers.next()) {
 						Bpil_DealerOPAInput bpil_DealerOPAInput = new Bpil_DealerOPAInput();
 						
 						bpil_DealerOPAInput.setDLR_SCH_ID(rsdealers.getInt("SCHEME_ID"));
 						bpil_DealerOPAInput.setDLR_FIN_AN_FLAG(rsdealers.getString("FIN_AN_FLAG"));
 						bpil_DealerOPAInput.setDLR_REGN(rsdealers.getString("DLR_REGN"));
 						bpil_DealerOPAInput.setDLR_DEPOT(rsdealers.getString("DLR_DEPOT"));
 						bpil_DealerOPAInput.setDLR_STATE(rsdealers.getString("DLR_STATE"));
 						bpil_DealerOPAInput.setDLR_TERR_CODE(rsdealers.getString("DLR_TERR_CODE"));
 						bpil_DealerOPAInput.setDLR_TERR_NAME(rsdealers.getString("DLR_TERR_NAME"));
 						bpil_DealerOPAInput.setDLR_BILL_TO(rsdealers.getInt("DLR_BILL_TO"));
 						bpil_DealerOPAInput.setDLR_AC_NO(rsdealers.getString("DLR_AC_NO"));
 						bpil_DealerOPAInput.setDLR_AC_NAME(rsdealers.getString("DLR_AC_NAME"));
 						bpil_DealerOPAInput.setDLR_CAT(rsdealers.getString("DLR_CAT"));
 						bpil_DealerOPAInput.setDLR_TYPE(rsdealers.getString("DLR_TYPE"));
 						bpil_DealerOPAInput.setDLR_RET(rsdealers.getString("DLR_RET"));
 						bpil_DealerOPAInput.setDLR_SDLR_COUNT(rsdealers.getInt("DLR_SDLR_COUNT"));
 						
 						DealerOPAInput.add(bpil_DealerOPAInput);
 					}

 					while (rsproducts.next()) {
 						Bpil_ProductOPAInput bpil_ProductOPAInput = new Bpil_ProductOPAInput();
 						
 						bpil_ProductOPAInput.setPRD_SCH_ID(rsproducts.getInt("PRD_SCH_ID"));
 						bpil_ProductOPAInput.setPRD_BILL_TO(rsproducts.getInt("PRD_BILL_TO"));
 						bpil_ProductOPAInput.setPRD_DLR_AC_NO(rsproducts.getString("PRD_DLR_AC_NO"));
 						bpil_ProductOPAInput.setPRD_DLR_TYPE(rsproducts.getString("PRD_DLR_TYPE"));
 						bpil_ProductOPAInput.setPRD_NAME(rsproducts.getString("PRD_NAME"));
 						bpil_ProductOPAInput.setPRD_CAT(rsproducts.getString("PRD_CAT"));
 						bpil_ProductOPAInput.setPRD_CAT_DESC(rsproducts.getString("PRD_CAT_DESC"));
 						bpil_ProductOPAInput.setPRD_GRP(rsproducts.getString("PRD_GRP"));
 						bpil_ProductOPAInput.setPRD_CODE(rsproducts.getString("PRD_CODE"));
 						bpil_ProductOPAInput.setPRD_SHD_CODE(rsproducts.getString("PRD_SHD_CODE"));
 						bpil_ProductOPAInput.setPRD_INV_DT(rsproducts.getDate("PRD_INV_DT"));
 						bpil_ProductOPAInput.setPRD_UOM(rsproducts.getString("PRD_UOM"));
 						bpil_ProductOPAInput.setPRD_PCK_SIZE(rsproducts.getBigDecimal("PRD_PCK_SIZE"));
 						bpil_ProductOPAInput.setPRD_VOL(rsproducts.getBigDecimal("PRD_VOL"));
 						bpil_ProductOPAInput.setPRD_FNL_VOL(rsproducts.getBigDecimal("PRD_FNL_VOL"));
 						bpil_ProductOPAInput.setPRD_VAL(rsproducts.getBigDecimal("PRD_VAL"));
 						bpil_ProductOPAInput.setPRD_VOL_RW(rsproducts.getBigDecimal("PRD_VOL_RW"));
 						bpil_ProductOPAInput.setPRD_FNL_VOL_RW(rsproducts.getBigDecimal("PRD_FNL_VOL_RW"));
 						bpil_ProductOPAInput.setPRD_VAL_RW(rsproducts.getBigDecimal("PRD_VAL_RW"));

 						ProductOPAInput.add(bpil_ProductOPAInput);
 					}


 					System.out.println("Dealers size = " + DealerOPAInput.size() + " Products = " + ProductOPAInput.size());

 				} catch (SQLException e) {
 					e.printStackTrace();
 				} catch (Exception e) {
 					System.out.println(e.getMessage());
 				}
 				
 				Date Sd = new Date();
 				System.out.println("Start call to webservice" + Sd);

 				RewardOPAOutput = callschopasoap_webservice(DealerOPAInput, ProductOPAInput, scheme_id, depot, bill_to_id, schopawebserviceUrl, request);

 				Date Ed = new Date();
 				System.out.println("End call to webservice" + Ed);

 				System.out.println("Total time : Sw " + Sd + " Ew " + Ed);

 				System.out.println("Scheme_budget = " + Scheme_budget);
 				
 				RewardSchOPAOutput.addAll(RewardOPAOutput);			
 				
				
 			 }
 			 
 			String LastRefresh = "";
				
				if(RewardSchOPAOutput.size() > 0) {
				
					LastRefresh = RewardSchOPAOutput.get(0).getRW_LAST_UPDATE().toString();

				}
				
				model.addAttribute("Info_grid",RewardSchOPAOutput);
				
				model.addAttribute("LastRefresh",LastRefresh);
				
				bill_to_id = "";
				
			}
			
			model.addAttribute("dealer_code",bill_to_id);
			model.addAttribute("depo_code",depot);
			model.addAttribute("scheme_id",scheme_id);
			
			Date Et = new Date();
			System.out.println("End call to webservice" + Et);

			System.out.println("Total time : Sw " + St + " Ew " + Et);


		
			return new ModelAndView("DealerWhatIf");
		
	}

	public List<Bpil_RewardOPAOutput> callschopasoap_webservice(List<Bpil_DealerOPAInput> dealerOPAInput,
			List<Bpil_ProductOPAInput> productOPAInput, String scheme_id, String depot, String bill_to_id,
			String schopawebserviceUrl, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		// Create SOAP Connection
		
				List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();

				int Scheme_budget = 0;
				try {
					SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();

					SOAPConnection soapConnection = soapConnectionFactory.createConnection();

					// Send SOAP Message to SOAP Server
					// final String url =
					// "https://omfys-opa.custhelp.com/determinations-server/assess/soap/generic/12.2.1/BPIL__Seal__O__Prime__November__Dhamaka__Offer?wsdl";
					final String url = schopawebserviceUrl;
					SOAPMessage soapRequest = createDlrSchSOAPRequest(dealerOPAInput, productOPAInput, scheme_id, depot, bill_to_id);

					TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
					Transformer transformerReq = transformerFactoryReq.newTransformer();
					Source sourceContentReq = soapRequest.getSOAPPart().getContent();

					 String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

					 System.out.println("xmlpath = " + reqxmlpath);

					 StreamResult resultReq = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soaprequest.xml")));
					 transformerReq.transform(sourceContentReq, resultReq);

					SOAPMessage soapResponse = soapConnection.call(soapRequest, url);
					
					TransformerFactory transformerFactoryResp = TransformerFactory.newInstance();
					Transformer transformerResp = transformerFactoryResp.newTransformer();
					Source sourceContentResp = soapResponse.getSOAPPart().getContent();

					 StreamResult resultResp = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soapresponse.xml")));
					 transformerResp.transform(sourceContentResp, resultResp);

					// Process the SOAP Response
					RewardOPAOutput = printDlrSchSOAPResponse(soapRequest, soapResponse, dealerOPAInput, productOPAInput, scheme_id, depot, bill_to_id, request);

					soapConnection.close();

				} catch (UnsupportedOperationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SOAPException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (TransformerException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParserConfigurationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SAXException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (XPathExpressionException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		return RewardOPAOutput;
	}

	private SOAPMessage createDlrSchSOAPRequest(List<Bpil_DealerOPAInput> dealerOPAInput,
			List<Bpil_ProductOPAInput> productOPAInput, String scheme_id, String depot, String bill_to_id)
					throws SOAPException, IOException {
		// TODO Auto-generated method stub
		
		MessageFactory messageFactory = MessageFactory.newInstance();
		SOAPMessage soapMessage = messageFactory.createMessage();
		SOAPPart soapPart = soapMessage.getSOAPPart();

		final String serverURI = "http://oracle.com/determinations/server/12.2.1/rulebase/assess/types";

		// SOAP Envelope
		SOAPEnvelope envelope = soapPart.getEnvelope();
		envelope.addNamespaceDeclaration("typ", serverURI);

		SOAPFactory soapFactory = SOAPFactory.newInstance();

		System.out.println("SOAP Envelope");

		// SOAP Header
		SOAPHeader soapHeader = envelope.getHeader();

		final String seqHeader = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";
		Name headerName = soapFactory.createName("Security", "o", seqHeader);

		SOAPHeaderElement headerElement = soapHeader.addHeaderElement(headerName);
		headerElement.setMustUnderstand(true);

		final String Username = "omfys";
		final String Password = "omfysTest1@123";

		SOAPElement soapUserToken = headerElement.addChildElement("UsernameToken", "o");
		SOAPElement sopaUser = soapUserToken.addChildElement("Username", "o");
		sopaUser.addTextNode(Username);
		SOAPElement sopaPass = soapUserToken.addChildElement("Password", "o");
		sopaPass.addTextNode(Password);

		SOAPHeader header = soapMessage.getSOAPHeader();
		SOAPBody body = soapMessage.getSOAPBody();

		System.out.println("SOAP Header");

		// SOAP Body
		SOAPBody soapBody = envelope.getBody();

		SOAPElement soapBodyElem = soapBody.addChildElement("assess-request", "typ");

		System.out.println("SOAP Body");

		SOAPElement config = soapBodyElem.addChildElement("config", "typ");

		SOAPElement outcome = config.addChildElement("outcome", "typ");

		ArrayList<String> outcome_entity_type = new ArrayList<String>();

		outcome_entity_type.add("global");
		outcome_entity_type.add("PRODUCT");
		outcome_entity_type.add("REWARD");

		ArrayList<String> global_thedealer_outcome = new ArrayList<String>();
		ArrayList<String> theproduct_outcome = new ArrayList<String>();
		ArrayList<String> thereward_outcome = new ArrayList<String>();

		for (String outcome_entity : outcome_entity_type) {

			if (outcome_entity.equals("global")) {
				global_thedealer_outcome.add("DLR_TOT_CN");
				global_thedealer_outcome.add("DLR_TOT_BDGT");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String global_att : global_thedealer_outcome) {
					System.out.println("global outcome att = " + global_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), global_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("PRODUCT")) {

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String theproduct_att : theproduct_outcome) {
					System.out.println("theproduct outcome att = " + theproduct_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), theproduct_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("REWARD")) {

				thereward_outcome.add("RW_SCH_ID");
				thereward_outcome.add("RW_CODE");
				thereward_outcome.add("RW_DLR_REGN");
				thereward_outcome.add("RW_DLR_DEPOT");
				thereward_outcome.add("RW_DLR_STATE");
				thereward_outcome.add("RW_DLR_TERR_CODE");
				thereward_outcome.add("RW_DLR_TERR_NAME");
				thereward_outcome.add("RW_DLR_CODE");
				thereward_outcome.add("RW_DLR_CAT");
				thereward_outcome.add("RW_DLR_BILL_TO");
				thereward_outcome.add("RW_DLR_TYPE");
				thereward_outcome.add("RW_DLR_NAME");
				thereward_outcome.add("RW_SEC");
				thereward_outcome.add("RW_TYPE");
				thereward_outcome.add("RW_PRD");
				thereward_outcome.add("RW_UNIT");
				thereward_outcome.add("RW_DATE");
				thereward_outcome.add("RW_LY");
				thereward_outcome.add("RW_TGT");
				thereward_outcome.add("RW_TY");
				thereward_outcome.add("RW_ADDITIONAL");
				thereward_outcome.add("RW_BASE_TOTAL");
				thereward_outcome.add("RW_Q_STAT");
				thereward_outcome.add("RW_DESC");
				thereward_outcome.add("RW_TOTAL");
				thereward_outcome.add("RW_NXT_TGT");
				thereward_outcome.add("RW_GFT_TO_CN");
				thereward_outcome.add("RW_GFT_ID");
				thereward_outcome.add("RW_CONV_CN");
				thereward_outcome.add("RW_I_STAT");
				thereward_outcome.add("RW_LAST_UPDATE");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String reward_att : thereward_outcome) {
					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), reward_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}
			}
		}

		ArrayList<String> thedealer_attributes = new ArrayList<String>();
		ArrayList<String> thedealer_attributes_type = new ArrayList<String>();
		ArrayList<String> thedealer_attributes_value = new ArrayList<String>();

		thedealer_attributes.add("DLR_SCH_ID");
		thedealer_attributes.add("DLR_FIN_AN_FLAG");
		thedealer_attributes.add("DLR_REGN");
		thedealer_attributes.add("DLR_DEPOT");
		thedealer_attributes.add("DLR_STATE");
		thedealer_attributes.add("DLR_TERR_CODE");
		thedealer_attributes.add("DLR_TERR_NAME");
		thedealer_attributes.add("DLR_BILL_TO");
		thedealer_attributes.add("DLR_AC_NO");
		thedealer_attributes.add("DLR_AC_NAME");
		thedealer_attributes.add("DLR_CAT");
		thedealer_attributes.add("DLR_TYPE");
		thedealer_attributes.add("DLR_RET");
		thedealer_attributes.add("DLR_SDLR_COUNT");
		
		thedealer_attributes_type.add("number-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("number-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("number-val");

		int productid = 0;

		ArrayList<String> procuct_instances = new ArrayList<String>();

		for (Bpil_ProductOPAInput product : productOPAInput) {
			productid++;
			procuct_instances.add(Integer.toString(productid));

		}

		ArrayList<String> theproduct_attributes = new ArrayList<String>();
		ArrayList<String> theproduct_attributes_type = new ArrayList<String>();
		ArrayList<String> theproduct_attributes_value = new ArrayList<String>();

		theproduct_attributes.add("PRD");
		theproduct_attributes.add("PRD_SCH_ID");
		theproduct_attributes.add("PRD_BILL_TO");
		theproduct_attributes.add("PRD_DLR_AC_NO");
		theproduct_attributes.add("PRD_DLR_TYPE");
		theproduct_attributes.add("PRD_NAME");
		theproduct_attributes.add("PRD_CAT");
		theproduct_attributes.add("PRD_CAT_DESC");
		theproduct_attributes.add("PRD_GRP");
		theproduct_attributes.add("PRD_CODE");
		theproduct_attributes.add("PRD_SHD_CODE");
		theproduct_attributes.add("PRD_INV_DT");
		theproduct_attributes.add("PRD_UOM");
		theproduct_attributes.add("PRD_PCK_SIZE");
		theproduct_attributes.add("PRD_VOL");
		theproduct_attributes.add("PRD_FNL_VOL");
		theproduct_attributes.add("PRD_VAL");
		theproduct_attributes.add("PRD_VOL_RW");
		theproduct_attributes.add("PRD_FNL_VOL_RW");
		theproduct_attributes.add("PRD_VAL_RW");
		
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("date-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		
		SOAPElement globalinstance = soapBodyElem.addChildElement("global-instance", "typ");
		
		// System.out.println("dealer_entity");

//		for (Bpil_DealerOPAInput dealer : dealerOPAInput) {
		
		if(dealerOPAInput != null && dealerOPAInput.size() > 0) {
			
//			thedealer_attributes_value.clear();
			
			thedealer_attributes_value.add(Integer.toString(dealerOPAInput.get(0).getDLR_SCH_ID()));
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_FIN_AN_FLAG());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_REGN());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_DEPOT());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_STATE());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_TERR_CODE());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_TERR_NAME());
			thedealer_attributes_value.add(Integer.toString(dealerOPAInput.get(0).getDLR_BILL_TO()));
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_AC_NO());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_AC_NAME());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_CAT());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_TYPE());
			thedealer_attributes_value.add(dealerOPAInput.get(0).getDLR_RET());
			thedealer_attributes_value.add(Integer.toString(dealerOPAInput.get(0).getDLR_SDLR_COUNT()));
			
			for (int i = 0; i < thedealer_attributes.size(); i++) {

				SOAPElement attribute = globalinstance.addChildElement("attribute", "typ");
				attribute.addAttribute(soapFactory.createName("id"), thedealer_attributes.get(i));
				SOAPElement attributeDataType = attribute.addChildElement(thedealer_attributes_type.get(i), "typ");
				if(thedealer_attributes_value.get(i) != null) {
					attributeDataType.addTextNode(thedealer_attributes_value.get(i));
				}
				System.out.println("thedealer_attributes = " +  thedealer_attributes.get(i));

			}
			
			
		}
		

		SOAPElement theproduct_entity = globalinstance.addChildElement("entity", "typ");
		theproduct_entity.addAttribute(soapFactory.createName("id"), "PRODUCT");

		 System.out.println("product_entity");


		for (int k = 0; k < procuct_instances.size(); k++) {

			SOAPElement procuct_entity_instance = theproduct_entity.addChildElement("instance", "typ");
			procuct_entity_instance.addAttribute(soapFactory.createName("id"), procuct_instances.get(k));

			 System.out.println("procuct_instances = " + procuct_instances.get(k));

			theproduct_attributes_value.clear();

			Bpil_ProductOPAInput product = productOPAInput.get(k);

			theproduct_attributes_value.add(procuct_instances.get(k));
			theproduct_attributes_value.add(Integer.toString(product.getPRD_SCH_ID()));
			theproduct_attributes_value.add(Integer.toString(product.getPRD_BILL_TO()));
			theproduct_attributes_value.add(product.getPRD_DLR_AC_NO());
			theproduct_attributes_value.add(product.getPRD_DLR_TYPE());
			theproduct_attributes_value.add(product.getPRD_NAME());
			theproduct_attributes_value.add(product.getPRD_CAT());
			theproduct_attributes_value.add(product.getPRD_CAT_DESC());
			theproduct_attributes_value.add(product.getPRD_GRP());
			theproduct_attributes_value.add(product.getPRD_CODE());
			theproduct_attributes_value.add(product.getPRD_SHD_CODE());
			
			DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd");
			String dateStr = datformat.format(product.getPRD_INV_DT());
			theproduct_attributes_value.add(dateStr);

			theproduct_attributes_value.add(product.getPRD_UOM());
			theproduct_attributes_value.add(product.getPRD_PCK_SIZE().toString());
			theproduct_attributes_value.add(product.getPRD_VOL().toString());
			theproduct_attributes_value.add(product.getPRD_FNL_VOL().toString());
			theproduct_attributes_value.add(product.getPRD_VAL().toString());
			theproduct_attributes_value.add(product.getPRD_VOL_RW().toString());
			theproduct_attributes_value.add(product.getPRD_FNL_VOL_RW().toString());
			theproduct_attributes_value.add(product.getPRD_VAL_RW().toString());
			
			
			for (int i = 0; i < theproduct_attributes.size(); i++) {

				SOAPElement attribute = procuct_entity_instance.addChildElement("attribute", "typ");
				attribute.addAttribute(soapFactory.createName("id"), theproduct_attributes.get(i));
				SOAPElement attributeDataType = attribute.addChildElement(theproduct_attributes_type.get(i), "typ");
				attributeDataType.addTextNode(theproduct_attributes_value.get(i));

				 System.out.println("theproduct_attributes = " + theproduct_attributes.get(i));

			}
		}

		final String SOAPAction = "http://oracle.com/determinations/server/12.2.1/rulebase/types/Assess";

		MimeHeaders headers = soapMessage.getMimeHeaders();
		headers.addHeader("SOAPAction", SOAPAction);

		soapMessage.saveChanges();

		/* Print the request message */
		 System.out.print("Request SOAP Message = ");
		 soapMessage.writeTo(System.out);
		 System.out.println();

		return soapMessage;

	}

	private List<Bpil_RewardOPAOutput> printDlrSchSOAPResponse(SOAPMessage soapRequest, SOAPMessage soapResponse,
			List<Bpil_DealerOPAInput> dealerOPAInput, List<Bpil_ProductOPAInput> productOPAInput, String scheme_id,
			String depot, String bill_to_id, HttpServletRequest request)
					throws SOAPException, TransformerException, ParserConfigurationException, SAXException, IOException,
					XPathExpressionException, ParseException {
		// TODO Auto-generated method stub
		
		TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
		Transformer transformerReq = transformerFactoryReq.newTransformer();
		Source sourceContentReq = soapRequest.getSOAPPart().getContent();

		 System.out.print("\nRequest SOAP Message = ");
		 StreamResult resultReq = new StreamResult(System.out);
		 transformerReq.transform(sourceContentReq, resultReq);

		 String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

		 System.out.println("\nxmlpath = " + reqxmlpath);

		 StreamResult resultReq3 = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soaprequest.xml")));
		 transformerReq.transform(sourceContentReq, resultReq3);

		ByteArrayOutputStream osReq = new ByteArrayOutputStream();

		StreamResult resultReq2 = new StreamResult(osReq);
		transformerReq.transform(sourceContentReq, resultReq2);

		String xmlReq = new String(osReq.toByteArray(), "UTF-8");

		 System.out.println("\n");
		 System.out.println(xmlReq);

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		Source sourceContent = soapResponse.getSOAPPart().getContent();

		 System.out.print("\nResponse SOAP Message = ");
		 StreamResult result = new StreamResult(System.out);
		 transformer.transform(sourceContent, result);

		 StreamResult result3 = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soapresponse.xml")));
		 transformer.transform(sourceContent, result3);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		StreamResult result2 = new StreamResult(os);
		transformer.transform(sourceContent, result2);

		String xml = new String(os.toByteArray(), "UTF-8");

		 System.out.println("\n");
		 System.out.println(xml);

		int Scheme_budget = 0;
		
		List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();

		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = builderFactory.newDocumentBuilder();

		Document xmlDocument = builder.parse(new ByteArrayInputStream(xml.getBytes()));

		XPath xPath = XPathFactory.newInstance().newXPath();

		ArrayList<String> global_thedealer_outcome = new ArrayList<String>();
		 ArrayList<String> global_thedealer_outcome_value = new ArrayList<String>();

		 global_thedealer_outcome.add("DLR_TOT_CN");
		 global_thedealer_outcome.add("DLR_TOT_BDGT");

		ArrayList<String> thereward_outcome = new ArrayList<String>();
		ArrayList<String> thereward_outcome_instance_id = new ArrayList<String>();
		 ArrayList<String> thereward_outcome_value = new ArrayList<String>();

		 thereward_outcome.add("RW_SCH_ID");
			thereward_outcome.add("RW_CODE");
			thereward_outcome.add("RW_DLR_REGN");
			thereward_outcome.add("RW_DLR_DEPOT");
			thereward_outcome.add("RW_DLR_STATE");
			thereward_outcome.add("RW_DLR_TERR_CODE");
			thereward_outcome.add("RW_DLR_TERR_NAME");
			thereward_outcome.add("RW_DLR_CODE");
			thereward_outcome.add("RW_DLR_CAT");
			thereward_outcome.add("RW_DLR_BILL_TO");
			thereward_outcome.add("RW_DLR_TYPE");
			thereward_outcome.add("RW_DLR_NAME");
			thereward_outcome.add("RW_SEC");
			thereward_outcome.add("RW_TYPE");
			thereward_outcome.add("RW_PRD");
			thereward_outcome.add("RW_UNIT");
			thereward_outcome.add("RW_DATE");
			thereward_outcome.add("RW_LY");
			thereward_outcome.add("RW_TGT");
			thereward_outcome.add("RW_TY");
			thereward_outcome.add("RW_ADDITIONAL");
			thereward_outcome.add("RW_BASE_TOTAL");
			thereward_outcome.add("RW_Q_STAT");
			thereward_outcome.add("RW_DESC");
			thereward_outcome.add("RW_TOTAL");
			thereward_outcome.add("RW_NXT_TGT");
			thereward_outcome.add("RW_GFT_TO_CN");
			thereward_outcome.add("RW_GFT_ID");
			thereward_outcome.add("RW_CONV_CN");
			thereward_outcome.add("RW_I_STAT");
			thereward_outcome.add("RW_LAST_UPDATE");
			
			
//			for (Bpil_DealerOPAInput dealer : dealerOPAInput) {
			
			if(dealerOPAInput != null && dealerOPAInput.size() > 0) {

		for (String global_thedealer_att : global_thedealer_outcome) {

			String xmlpath = "/Envelope/Body/assess-response/global-instance/attribute";
			String expression = xmlpath + "[@id='" + global_thedealer_att + "']";
			 System.out.println(expression);

			String global_thedealer_value = xPath.compile(expression).evaluate(xmlDocument);
			global_thedealer_outcome_value.add(global_thedealer_value);

			 System.out.println(global_thedealer_att + " = " + global_thedealer_value);

			if (global_thedealer_att.equals("DLR_TOT_CN")) {
				BigDecimal bd = new BigDecimal(global_thedealer_value);
				dealerOPAInput.get(0).setDLR_TOT_CN(bd);

			} else if (global_thedealer_att.equals("DLR_TOT_BDGT")) {
				BigDecimal bd = new BigDecimal(global_thedealer_value);
				dealerOPAInput.get(0).setDLR_TOT_BDGT(bd);

			} 

			// read an xml node using xpath
			 Node node2 = (Node) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODE);
			
			 if (null != node2) {
				 NodeList nodeListn2 = node2.getChildNodes();
				 for (int j = 0; null != nodeListn2 && j < nodeListn2.getLength(); j++) {
					 Node nod2 = nodeListn2.item(j);
					 if (nod2.getNodeType() == Node.ELEMENT_NODE) {
						 System.out.println(nodeListn2.item(j).getNodeName() + " : " + 
								 nod2.getFirstChild().getNodeValue());
					 }
				 }
			 }

		}
		
	}

	



//				 thereward_outcome_value.clear();
//				thereward_outcome_instance_id.clear();

				 
				String rwxmlpath = "/Envelope/Body/assess-response/global-instance/entity";
				String rwexpression = rwxmlpath + "[@id='REWARD']";
				 System.out.println(rwexpression);

				String reward_value = xPath.compile(rwexpression).evaluate(xmlDocument);
				 thereward_outcome_value.add(reward_value);

				 System.out.println("REWARD" + " = " + reward_value);

				// read an xml node using xpath
				Node rwnode = (Node) xPath.compile(rwexpression).evaluate(xmlDocument, XPathConstants.NODE);

				if (null != rwnode) {
					NodeList rwnodeList = rwnode.getChildNodes();
					for (int j = 0; null != rwnodeList && j < rwnodeList.getLength(); j++) {
						Node rwinstnode = rwnodeList.item(j);
						NamedNodeMap rwinstattr = rwinstnode.getAttributes();
						Node rwinstattrid = rwinstattr.getNamedItem("id");
						 System.out.println(rwinstattrid.getNodeValue());
						thereward_outcome_instance_id.add(rwinstattrid.getNodeValue());
						 if (rwnode.getNodeType() == Node.ELEMENT_NODE)
							 System.out.println(rwnodeList.item(j).getNodeName() + " : " +
									 rwnode.getFirstChild().getNodeValue());
					}
				}

				int i = 0;

				for (String rw_id : thereward_outcome_instance_id) {
					i++;
//					 thereward_outcome_value.clear();

					Bpil_RewardOPAOutput bpil_RewardOPAOutput = new Bpil_RewardOPAOutput();

					String xmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='" + rw_id + "']/attribute";

					for (String rw_att : thereward_outcome) {

						String expression = xmlpath + "[@id='" + rw_att + "']";
						 System.out.println(expression);

						String rw_value = xPath.compile(expression).evaluate(xmlDocument);
						 thereward_outcome_value.add(rw_value);

						 System.out.println(i + " " +rw_id + " - " + rw_att +" = " + rw_value);

						 if (rw_att.equals("RW_SCH_ID")) {
							 BigDecimal bd = new BigDecimal(rw_value);
								
							 bpil_RewardOPAOutput.setRW_SCH_ID(bd.intValue());

							} else
						 if (rw_att.equals("RW_CODE")) {
							 bpil_RewardOPAOutput.setRW_CODE(rw_value);
						  } else
						if (rw_att.equals("RW_DLR_REGN")) {
							bpil_RewardOPAOutput.setRW_DLR_REGN(rw_value);
						} else if (rw_att.equals("RW_DLR_DEPOT")) {
							bpil_RewardOPAOutput.setRW_DLR_DEPOT(rw_value);
						} else if (rw_att.equals("RW_DLR_STATE")) {
							bpil_RewardOPAOutput.setRW_DLR_STATE(rw_value);
						}
						else if (rw_att.equals("RW_DLR_TERR_CODE")) {
							bpil_RewardOPAOutput.setRW_DLR_TERR_CODE(rw_value);
						}
						else if (rw_att.equals("RW_DLR_TERR_NAME")) {
							bpil_RewardOPAOutput.setRW_DLR_TERR_NAME(rw_value);
						} else if (rw_att.equals("RW_DLR_CODE")) {
							bpil_RewardOPAOutput.setRW_DLR_CODE(rw_value);
						} else if (rw_att.equals("RW_DLR_CAT")) {
							bpil_RewardOPAOutput.setRW_DLR_CAT(rw_value);
						} else if (rw_att.equals("RW_DLR_BILL_TO")) {
							 BigDecimal bd = new BigDecimal(rw_value);
								
							 bpil_RewardOPAOutput.setRW_DLR_BILL_TO(bd.intValue());

						} else if (rw_att.equals("RW_DLR_TYPE")) {
							bpil_RewardOPAOutput.setRW_DLR_TYPE(rw_value);
						} else if (rw_att.equals("RW_DLR_NAME")) {
							bpil_RewardOPAOutput.setRW_DLR_NAME(rw_value);
						}  else if (rw_att.equals("RW_SEC")) {
							bpil_RewardOPAOutput.setRW_SEC(rw_value);
						} else if (rw_att.equals("RW_TYPE")) {
							bpil_RewardOPAOutput.setRW_TYPE(rw_value);
						} else if (rw_att.equals("RW_PRD")) {
							bpil_RewardOPAOutput.setRW_PRD(rw_value);
						} else if (rw_att.equals("RW_UNIT")) {
							bpil_RewardOPAOutput.setRW_UNIT(rw_value);
						} else if (rw_att.equals("RW_DATE")) {
							DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd");
							Date dateStr = datformat.parse(rw_value);

							bpil_RewardOPAOutput.setRW_DATE(dateStr);
						} else if (rw_att.equals("RW_LY")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_LY(bd);
							
						} else if (rw_att.equals("RW_TGT")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_TGT(bd);
							
						}  else if (rw_att.equals("RW_TY")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_TY(bd);
							
							
						} else if (rw_att.equals("RW_ADDITIONAL")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_ADDITIONAL(bd);
							
							
						} else if (rw_att.equals("RW_BASE_TOTAL")) {
							if(rw_value != null && !rw_value.equals("")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_BASE_TOTAL(bd);
							}
							
						} else if (rw_att.equals("RW_Q_STAT")) {
							bpil_RewardOPAOutput.setRW_Q_STAT(rw_value);
						} else if (rw_att.equals("RW_DESC")) {
							bpil_RewardOPAOutput.setRW_DESC(rw_value);
						} else if (rw_att.equals("RW_TOTAL")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_TOTAL(bd);
							
						} else if (rw_att.equals("RW_NXT_TGT")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_NXT_TGT(bd);
							
						} else if (rw_att.equals("RW_GFT_TO_CN")) {
							bpil_RewardOPAOutput.setRW_GFT_TO_CN(rw_value);
						} else if (rw_att.equals("RW_GFT_ID")) {
							bpil_RewardOPAOutput.setRW_GFT_ID(rw_value);
						} else if (rw_att.equals("RW_CONV_CN")) {
							BigDecimal bd = new BigDecimal(rw_value);
							
							 bpil_RewardOPAOutput.setRW_CONV_CN(bd);
							
						} else if (rw_att.equals("RW_I_STAT")) {
							bpil_RewardOPAOutput.setRW_I_STAT(rw_value);
						} else if (rw_att.equals("RW_LAST_UPDATE")) {
							DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
							Date dateStr = datformat.parse(rw_value);

							bpil_RewardOPAOutput.setRW_LAST_UPDATE(dateStr);
						}

						// read an xml node using xpath
//						 Node node3 = (Node) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODE);
//						
//						 if (null != node3) {
//							 NodeList nodeListn3 = node3.getChildNodes();
//							 for (int j = 0; null != nodeListn3 && j < nodeListn3.getLength(); j++) {
//								 Node nod3 = nodeListn3.item(j);
//								 if (nod3.getNodeType() == Node.ELEMENT_NODE)
//									 System.out.println(nodeListn3.item(j).getNodeName() + " : " +
//											 nod3.getFirstChild().getNodeValue());
//							 }
//						 }

					}
					
					RewardOPAOutput.add(bpil_RewardOPAOutput);

					
				}

			

		

		return RewardOPAOutput;
	}

	public List<Bpil_RewardOPAOutput> callschdepoopasoap_webservice(List<Bpil_DealerOPAInput> dealerOPAInput,
			String scheme_id, String depot, List<String> dealer_name, String schopawebserviceUrl,
			HttpServletRequest request) {
		// Create SOAP Connection
		
		List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();

		int Scheme_budget = 0;
		try {
			SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();

			SOAPConnection soapConnection = soapConnectionFactory.createConnection();

			// Send SOAP Message to SOAP Server
			// final String url =
			// "https://omfys-opa.custhelp.com/determinations-server/assess/soap/generic/12.2.1/BPIL__Seal__O__Prime__November__Dhamaka__Offer?wsdl";
			final String url = schopawebserviceUrl;
			SOAPMessage soapRequest = createDlrSchDepoSOAPRequest(dealerOPAInput, scheme_id, depot, dealer_name);

			TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
			Transformer transformerReq = transformerFactoryReq.newTransformer();
			Source sourceContentReq = soapRequest.getSOAPPart().getContent();

			 String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

			 System.out.println("xmlpath = " + reqxmlpath);

			 StreamResult resultReq = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soaprequest.xml")));
			 transformerReq.transform(sourceContentReq, resultReq);

			SOAPMessage soapResponse = soapConnection.call(soapRequest, url);
			
			TransformerFactory transformerFactoryResp = TransformerFactory.newInstance();
			Transformer transformerResp = transformerFactoryResp.newTransformer();
			Source sourceContentResp = soapResponse.getSOAPPart().getContent();

			 StreamResult resultResp = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soapresponse.xml")));
			 transformerResp.transform(sourceContentResp, resultResp);

			// Process the SOAP Response
			RewardOPAOutput = printDlrSchDepoSOAPResponse(soapRequest, soapResponse, dealerOPAInput, scheme_id, depot, dealer_name, request);

			soapConnection.close();

		} catch (UnsupportedOperationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SOAPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return RewardOPAOutput;

	}
	

	private SOAPMessage createDlrSchDepoSOAPRequest(List<Bpil_DealerOPAInput> dealerOPAInput, String scheme_id,
			String depot, List<String> dealer_name) throws SOAPException, IOException {
		// TODO Auto-generated method stub
		
		MessageFactory messageFactory = MessageFactory.newInstance();
		SOAPMessage soapMessage = messageFactory.createMessage();
		SOAPPart soapPart = soapMessage.getSOAPPart();

		final String serverURI = "http://oracle.com/determinations/server/12.2.1/rulebase/assess/types";

		// SOAP Envelope
		SOAPEnvelope envelope = soapPart.getEnvelope();
		envelope.addNamespaceDeclaration("typ", serverURI);

		SOAPFactory soapFactory = SOAPFactory.newInstance();

		System.out.println("SOAP Envelope");

		// SOAP Header
		SOAPHeader soapHeader = envelope.getHeader();

		final String seqHeader = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";
		Name headerName = soapFactory.createName("Security", "o", seqHeader);

		SOAPHeaderElement headerElement = soapHeader.addHeaderElement(headerName);
		headerElement.setMustUnderstand(true);

		final String Username = "omfys";
		final String Password = "omfysTest1@123";

		SOAPElement soapUserToken = headerElement.addChildElement("UsernameToken", "o");
		SOAPElement sopaUser = soapUserToken.addChildElement("Username", "o");
		sopaUser.addTextNode(Username);
		SOAPElement sopaPass = soapUserToken.addChildElement("Password", "o");
		sopaPass.addTextNode(Password);

		SOAPHeader header = soapMessage.getSOAPHeader();
		SOAPBody body = soapMessage.getSOAPBody();

		System.out.println("SOAP Header");

		// SOAP Body
		SOAPBody soapBody = envelope.getBody();

		SOAPElement soapBodyElem = soapBody.addChildElement("assess-request", "typ");

		System.out.println("SOAP Body");

		SOAPElement config = soapBodyElem.addChildElement("config", "typ");

		SOAPElement outcome = config.addChildElement("outcome", "typ");

		ArrayList<String> outcome_entity_type = new ArrayList<String>();

		outcome_entity_type.add("DEALER");
		outcome_entity_type.add("PRODUCT");
		outcome_entity_type.add("REWARD");

		ArrayList<String> thedealer_outcome = new ArrayList<String>();
		ArrayList<String> theproduct_outcome = new ArrayList<String>();
		ArrayList<String> thereward_outcome = new ArrayList<String>();

		for (String outcome_entity : outcome_entity_type) {

			if (outcome_entity.equals("DEALER")) {
				thedealer_outcome.add("DLR_TOT_CN");
				thedealer_outcome.add("DLR_TOT_BDGT");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String dealer_att : thedealer_outcome) {
//					System.out.println("deaer outcome att = " + dealer_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), dealer_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("PRODUCT")) {

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String theproduct_att : theproduct_outcome) {
//					System.out.println("theproduct outcome att = " + theproduct_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), theproduct_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("REWARD")) {

				thereward_outcome.add("RW_SCH_ID");
				thereward_outcome.add("RW_CODE");
				thereward_outcome.add("RW_DLR_REGN");
				thereward_outcome.add("RW_DLR_DEPOT");
				thereward_outcome.add("RW_DLR_STATE");
				thereward_outcome.add("RW_DLR_TERR_CODE");
				thereward_outcome.add("RW_DLR_TERR_NAME");
				thereward_outcome.add("RW_DLR_CODE");
				thereward_outcome.add("RW_DLR_CAT");
				thereward_outcome.add("RW_DLR_BILL_TO");
				thereward_outcome.add("RW_DLR_TYPE");
				thereward_outcome.add("RW_DLR_NAME");
				thereward_outcome.add("RW_SEC");
				thereward_outcome.add("RW_TYPE");
				thereward_outcome.add("RW_PRD");
				thereward_outcome.add("RW_UNIT");
				thereward_outcome.add("RW_DATE");
				thereward_outcome.add("RW_LY");
				thereward_outcome.add("RW_TGT");
				thereward_outcome.add("RW_TY");
				thereward_outcome.add("RW_ADDITIONAL");
				thereward_outcome.add("RW_BASE_TOTAL");
				thereward_outcome.add("RW_Q_STAT");
				thereward_outcome.add("RW_DESC");
				thereward_outcome.add("RW_TOTAL");
				thereward_outcome.add("RW_NXT_TGT");
				thereward_outcome.add("RW_GFT_TO_CN");
				thereward_outcome.add("RW_GFT_ID");
				thereward_outcome.add("RW_CONV_CN");
				thereward_outcome.add("RW_I_STAT");
				thereward_outcome.add("RW_LAST_UPDATE");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String reward_att : thereward_outcome) {
					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), reward_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}
			}
		}
		
		ArrayList<String> dealer_instances = new ArrayList<String>();

		for (Bpil_DealerOPAInput dealer : dealerOPAInput) {
			dealer_instances.add(Integer.toString(dealer.getDLR_BILL_TO()));

		}

		ArrayList<String> thedealer_attributes = new ArrayList<String>();
		ArrayList<String> thedealer_attributes_type = new ArrayList<String>();
		ArrayList<String> thedealer_attributes_value = new ArrayList<String>();

		thedealer_attributes.add("DLR_SCH_ID");
		thedealer_attributes.add("DLR_FIN_AN_FLAG");
		thedealer_attributes.add("DLR_REGN");
		thedealer_attributes.add("DLR_DEPOT");
		thedealer_attributes.add("DLR_STATE");
		thedealer_attributes.add("DLR_TERR_CODE");
		thedealer_attributes.add("DLR_TERR_NAME");
		thedealer_attributes.add("DLR_BILL_TO");
		thedealer_attributes.add("DLR_AC_NO");
		thedealer_attributes.add("DLR_AC_NAME");
		thedealer_attributes.add("DLR_CAT");
		thedealer_attributes.add("DLR_TYPE");
		thedealer_attributes.add("DLR_RET");
		thedealer_attributes.add("DLR_SDLR_COUNT");
		
		thedealer_attributes_type.add("number-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("number-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("text-val");
		thedealer_attributes_type.add("number-val");

		int productid = 0;

		ArrayList<String> procuct_instances = new ArrayList<String>();

		
		ArrayList<String> theproduct_attributes = new ArrayList<String>();
		ArrayList<String> theproduct_attributes_type = new ArrayList<String>();
		ArrayList<String> theproduct_attributes_value = new ArrayList<String>();

		theproduct_attributes.add("PRD");
		theproduct_attributes.add("PRD_SCH_ID");
		theproduct_attributes.add("PRD_BILL_TO");
		theproduct_attributes.add("PRD_DLR_AC_NO");
		theproduct_attributes.add("PRD_DLR_TYPE");
		theproduct_attributes.add("PRD_NAME");
		theproduct_attributes.add("PRD_CAT");
		theproduct_attributes.add("PRD_CAT_DESC");
		theproduct_attributes.add("PRD_GRP");
		theproduct_attributes.add("PRD_CODE");
		theproduct_attributes.add("PRD_SHD_CODE");
		theproduct_attributes.add("PRD_INV_DT");
		theproduct_attributes.add("PRD_UOM");
		theproduct_attributes.add("PRD_PCK_SIZE");
		theproduct_attributes.add("PRD_VOL");
		theproduct_attributes.add("PRD_FNL_VOL");
		theproduct_attributes.add("PRD_VAL");
		theproduct_attributes.add("PRD_VOL_RW");
		theproduct_attributes.add("PRD_FNL_VOL_RW");
		theproduct_attributes.add("PRD_VAL_RW");
		
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("date-val");
		theproduct_attributes_type.add("text-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		theproduct_attributes_type.add("number-val");
		
		SOAPElement globalinstance = soapBodyElem.addChildElement("global-instance", "typ");
		
		SOAPElement thedealer_entity = globalinstance.addChildElement("entity", "typ");
		thedealer_entity.addAttribute(soapFactory.createName("id"), "DEALER");
		
		 System.out.println("dealer_entity");

//		for (Bpil_DealerOPAInput dealer : dealerOPAInput) {
		for (int j = 0; j < dealer_instances.size(); j++) {
			SOAPElement dealer_entity_instance = thedealer_entity.addChildElement("instance", "typ");
			dealer_entity_instance.addAttribute(soapFactory.createName("id"), dealer_instances.get(j));

			System.out.println("dealer_instances = " + dealer_instances.get(j));

//		if(dealerOPAInput != null && dealerOPAInput.size() > 0) {
			
			thedealer_attributes_value.clear();
			
			Bpil_DealerOPAInput dealer = dealerOPAInput.get(j);
			
			thedealer_attributes_value.add(Integer.toString(dealer.getDLR_SCH_ID()));
			thedealer_attributes_value.add(dealer.getDLR_FIN_AN_FLAG());
			thedealer_attributes_value.add(dealer.getDLR_REGN());
			thedealer_attributes_value.add(dealer.getDLR_DEPOT());
			thedealer_attributes_value.add(dealer.getDLR_STATE());
			thedealer_attributes_value.add(dealer.getDLR_TERR_CODE());
			thedealer_attributes_value.add(dealer.getDLR_TERR_NAME());
			thedealer_attributes_value.add(Integer.toString(dealer.getDLR_BILL_TO()));
			thedealer_attributes_value.add(dealer.getDLR_AC_NO());
			thedealer_attributes_value.add(dealer.getDLR_AC_NAME());
			thedealer_attributes_value.add(dealer.getDLR_CAT());
			thedealer_attributes_value.add(dealer.getDLR_TYPE());
			thedealer_attributes_value.add(dealer.getDLR_RET());
			thedealer_attributes_value.add(Integer.toString(dealer.getDLR_SDLR_COUNT()));
			
			for (int i = 0; i < thedealer_attributes.size(); i++) {

				SOAPElement attribute = dealer_entity_instance.addChildElement("attribute", "typ");
				attribute.addAttribute(soapFactory.createName("id"), thedealer_attributes.get(i));
				SOAPElement attributeDataType = attribute.addChildElement(thedealer_attributes_type.get(i), "typ");
				if(thedealer_attributes_value.get(i) != null) {
					attributeDataType.addTextNode(thedealer_attributes_value.get(i));
				}
//				System.out.println("thedealer_attributes = " +  thedealer_attributes.get(i));

			}
			
			SOAPElement theproduct_entity = dealer_entity_instance.addChildElement("entity", "typ");
			theproduct_entity.addAttribute(soapFactory.createName("id"), "PRODUCT");

			 System.out.println("product_entity");
			
			procuct_instances.clear();
			
			for (Bpil_ProductOPAInput product : dealer.getProductOPAInput()) {
				productid++;
				procuct_instances.add(Integer.toString(productid));

			}
			
			for (int k = 0; k < procuct_instances.size(); k++) {

				SOAPElement procuct_entity_instance = theproduct_entity.addChildElement("instance", "typ");
				procuct_entity_instance.addAttribute(soapFactory.createName("id"), procuct_instances.get(k));

				 System.out.println("procuct_instances = " + procuct_instances.get(k));

				theproduct_attributes_value.clear();

				Bpil_ProductOPAInput product = dealer.getProductOPAInput().get(k);

				theproduct_attributes_value.add(procuct_instances.get(k));
				theproduct_attributes_value.add(Integer.toString(product.getPRD_SCH_ID()));
				theproduct_attributes_value.add(Integer.toString(product.getPRD_BILL_TO()));
				theproduct_attributes_value.add(product.getPRD_DLR_AC_NO());
				theproduct_attributes_value.add(product.getPRD_DLR_TYPE());
				theproduct_attributes_value.add(product.getPRD_NAME());
				theproduct_attributes_value.add(product.getPRD_CAT());
				theproduct_attributes_value.add(product.getPRD_CAT_DESC());
				theproduct_attributes_value.add(product.getPRD_GRP());
				theproduct_attributes_value.add(product.getPRD_CODE());
				theproduct_attributes_value.add(product.getPRD_SHD_CODE());
				
				DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd");
				String dateStr = datformat.format(product.getPRD_INV_DT());
				theproduct_attributes_value.add(dateStr);

				theproduct_attributes_value.add(product.getPRD_UOM());
				theproduct_attributes_value.add(product.getPRD_PCK_SIZE().toString());
				theproduct_attributes_value.add(product.getPRD_VOL().toString());
				theproduct_attributes_value.add(product.getPRD_FNL_VOL().toString());
				theproduct_attributes_value.add(product.getPRD_VAL().toString());
				theproduct_attributes_value.add(product.getPRD_VOL_RW().toString());
				theproduct_attributes_value.add(product.getPRD_FNL_VOL_RW().toString());
				theproduct_attributes_value.add(product.getPRD_VAL_RW().toString());
				
				
				for (int i = 0; i < theproduct_attributes.size(); i++) {

					SOAPElement attribute = procuct_entity_instance.addChildElement("attribute", "typ");
					attribute.addAttribute(soapFactory.createName("id"), theproduct_attributes.get(i));
					SOAPElement attributeDataType = attribute.addChildElement(theproduct_attributes_type.get(i), "typ");
					attributeDataType.addTextNode(theproduct_attributes_value.get(i));

					 System.out.println("theproduct_attributes = " + theproduct_attributes.get(i));

				}
			}


			
			
		}
		

		


		
		final String SOAPAction = "http://oracle.com/determinations/server/12.2.1/rulebase/types/Assess";

		MimeHeaders headers = soapMessage.getMimeHeaders();
		headers.addHeader("SOAPAction", SOAPAction);

		soapMessage.saveChanges();

		/* Print the request message */
		 System.out.print("Request SOAP Message = ");
		 soapMessage.writeTo(System.out);
		 System.out.println();

		return soapMessage;

	}



	private List<Bpil_RewardOPAOutput> printDlrSchDepoSOAPResponse(SOAPMessage soapRequest, SOAPMessage soapResponse,
			List<Bpil_DealerOPAInput> dealerOPAInput, String scheme_id, String depot, List<String> dealer_name,
			HttpServletRequest request) throws SOAPException, TransformerException, ParserConfigurationException, SAXException, IOException, XPathExpressionException, ParseException {
		// TODO Auto-generated method stub
		
		TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
		Transformer transformerReq = transformerFactoryReq.newTransformer();
		Source sourceContentReq = soapRequest.getSOAPPart().getContent();

		 System.out.print("\nRequest SOAP Message = ");
		 StreamResult resultReq = new StreamResult(System.out);
		 transformerReq.transform(sourceContentReq, resultReq);

		 String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

		 System.out.println("\nxmlpath = " + reqxmlpath);

		 StreamResult resultReq3 = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soaprequest.xml")));
		 transformerReq.transform(sourceContentReq, resultReq3);

		ByteArrayOutputStream osReq = new ByteArrayOutputStream();

		StreamResult resultReq2 = new StreamResult(osReq);
		transformerReq.transform(sourceContentReq, resultReq2);

		String xmlReq = new String(osReq.toByteArray(), "UTF-8");

		 System.out.println("\n");
		 System.out.println(xmlReq);

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		Source sourceContent = soapResponse.getSOAPPart().getContent();

		 System.out.print("\nResponse SOAP Message = ");
		 StreamResult result = new StreamResult(System.out);
		 transformer.transform(sourceContent, result);

		 StreamResult result3 = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soapresponse.xml")));
		 transformer.transform(sourceContent, result3);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		StreamResult result2 = new StreamResult(os);
		transformer.transform(sourceContent, result2);

		String xml = new String(os.toByteArray(), "UTF-8");

		 System.out.println("\n");
		 System.out.println(xml);

		int Scheme_budget = 0;
		
		List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();

		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = builderFactory.newDocumentBuilder();

		Document xmlDocument = builder.parse(new ByteArrayInputStream(xml.getBytes()));

		XPath xPath = XPathFactory.newInstance().newXPath();

		ArrayList<String> thedealer_outcome = new ArrayList<String>();
		 ArrayList<String> thedealer_outcome_value = new ArrayList<String>();

		 thedealer_outcome.add("DLR_TOT_CN");
		 thedealer_outcome.add("DLR_TOT_BDGT");

		ArrayList<String> thereward_outcome = new ArrayList<String>();
		ArrayList<String> thereward_outcome_instance_id = new ArrayList<String>();
		 ArrayList<String> thereward_outcome_value = new ArrayList<String>();

		 thereward_outcome.add("RW_SCH_ID");
			thereward_outcome.add("RW_CODE");
			thereward_outcome.add("RW_DLR_REGN");
			thereward_outcome.add("RW_DLR_DEPOT");
			thereward_outcome.add("RW_DLR_STATE");
			thereward_outcome.add("RW_DLR_TERR_CODE");
			thereward_outcome.add("RW_DLR_TERR_NAME");
			thereward_outcome.add("RW_DLR_CODE");
			thereward_outcome.add("RW_DLR_CAT");
			thereward_outcome.add("RW_DLR_BILL_TO");
			thereward_outcome.add("RW_DLR_TYPE");
			thereward_outcome.add("RW_DLR_NAME");
			thereward_outcome.add("RW_SEC");
			thereward_outcome.add("RW_TYPE");
			thereward_outcome.add("RW_PRD");
			thereward_outcome.add("RW_UNIT");
			thereward_outcome.add("RW_DATE");
			thereward_outcome.add("RW_LY");
			thereward_outcome.add("RW_TGT");
			thereward_outcome.add("RW_TY");
			thereward_outcome.add("RW_ADDITIONAL");
			thereward_outcome.add("RW_BASE_TOTAL");
			thereward_outcome.add("RW_Q_STAT");
			thereward_outcome.add("RW_DESC");
			thereward_outcome.add("RW_TOTAL");
			thereward_outcome.add("RW_NXT_TGT");
			thereward_outcome.add("RW_GFT_TO_CN");
			thereward_outcome.add("RW_GFT_ID");
			thereward_outcome.add("RW_CONV_CN");
			thereward_outcome.add("RW_I_STAT");
			thereward_outcome.add("RW_LAST_UPDATE");
			
			ArrayList<String> dealer_instances = new ArrayList<String>();

			for (Bpil_DealerOPAInput dealer : dealerOPAInput) {
				dealer_instances.add(Integer.toString(dealer.getDLR_BILL_TO()));
			}
			
			for (int i = 0; i < dealer_instances.size(); i++) {
				
				thedealer_outcome_value.clear();
			
//			for (Bpil_DealerOPAInput dealer : dealerOPAInput) {
			
//			if(dealerOPAInput != null && dealerOPAInput.size() > 0) {

		for (String thedealer_att : thedealer_outcome) {

			String xmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"+ dealer_instances.get(i) + "']/attribute";
			String expression = xmlpath + "[@id='" + thedealer_att + "']";
			 System.out.println(expression);

			String thedealer_value = xPath.compile(expression).evaluate(xmlDocument);
			thedealer_outcome_value.add(thedealer_value);

			 System.out.println(thedealer_att + " = " + thedealer_value);

			if (thedealer_att.equals("DLR_TOT_CN")) {
				BigDecimal bd = new BigDecimal(thedealer_value);
				dealerOPAInput.get(i).setDLR_TOT_CN(bd);

			} else if (thedealer_att.equals("DLR_TOT_BDGT")) {
				BigDecimal bd = new BigDecimal(thedealer_value);
				dealerOPAInput.get(i).setDLR_TOT_BDGT(bd);

			} 

			// read an xml node using xpath
			 Node node2 = (Node) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODE);
			
			 if (null != node2) {
				 NodeList nodeListn2 = node2.getChildNodes();
				 for (int j = 0; null != nodeListn2 && j < nodeListn2.getLength(); j++) {
					 Node nod2 = nodeListn2.item(j);
					 if (nod2.getNodeType() == Node.ELEMENT_NODE) {
						 System.out.println(nodeListn2.item(j).getNodeName() + " : " + 
								 nod2.getFirstChild().getNodeValue());
					 }
				 }
			 }

		}
		
		 thereward_outcome_value.clear();
			thereward_outcome_instance_id.clear();

			 
			String rwxmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"+ dealer_instances.get(i) + "']/entity";
			String rwexpression = rwxmlpath + "[@id='REWARD']";
			 System.out.println(rwexpression);

			String reward_value = xPath.compile(rwexpression).evaluate(xmlDocument);
			 thereward_outcome_value.add(reward_value);

			 System.out.println("REWARD" + " = " + reward_value);

			// read an xml node using xpath
			Node rwnode = (Node) xPath.compile(rwexpression).evaluate(xmlDocument, XPathConstants.NODE);

			if (null != rwnode) {
				NodeList rwnodeList = rwnode.getChildNodes();
				for (int j = 0; null != rwnodeList && j < rwnodeList.getLength(); j++) {
					Node rwinstnode = rwnodeList.item(j);
					NamedNodeMap rwinstattr = rwinstnode.getAttributes();
					Node rwinstattrid = rwinstattr.getNamedItem("id");
					 System.out.println(rwinstattrid.getNodeValue());
					thereward_outcome_instance_id.add(rwinstattrid.getNodeValue());
					 if (rwnode.getNodeType() == Node.ELEMENT_NODE)
						 System.out.println(rwnodeList.item(j).getNodeName() + " : " +
								 rwnode.getFirstChild().getNodeValue());
				}
			}

			int k = 0;

			for (String rw_id : thereward_outcome_instance_id) {
				k++;
//				 thereward_outcome_value.clear();

				Bpil_RewardOPAOutput bpil_RewardOPAOutput = new Bpil_RewardOPAOutput();

				String xmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"+ dealer_instances.get(i) + "']/entity/instance[@id='" + rw_id + "']/attribute";

				for (String rw_att : thereward_outcome) {

					String expression = xmlpath + "[@id='" + rw_att + "']";
					 System.out.println(expression);

					String rw_value = xPath.compile(expression).evaluate(xmlDocument);
					 thereward_outcome_value.add(rw_value);

					 System.out.println(k + " " +rw_id + " - " + rw_att +" = " + rw_value);

					 if (rw_att.equals("RW_SCH_ID")) {
						 BigDecimal bd = new BigDecimal(rw_value);
							
						 bpil_RewardOPAOutput.setRW_SCH_ID(bd.intValue());

						} else
					 if (rw_att.equals("RW_CODE")) {
						 bpil_RewardOPAOutput.setRW_CODE(rw_value);
					  } else
					if (rw_att.equals("RW_DLR_REGN")) {
						bpil_RewardOPAOutput.setRW_DLR_REGN(rw_value);
					} else if (rw_att.equals("RW_DLR_DEPOT")) {
						bpil_RewardOPAOutput.setRW_DLR_DEPOT(rw_value);
					} else if (rw_att.equals("RW_DLR_STATE")) {
						bpil_RewardOPAOutput.setRW_DLR_STATE(rw_value);
					}
					else if (rw_att.equals("RW_DLR_TERR_CODE")) {
						bpil_RewardOPAOutput.setRW_DLR_TERR_CODE(rw_value);
					}
					else if (rw_att.equals("RW_DLR_TERR_NAME")) {
						bpil_RewardOPAOutput.setRW_DLR_TERR_NAME(rw_value);
					} else if (rw_att.equals("RW_DLR_CODE")) {
						bpil_RewardOPAOutput.setRW_DLR_CODE(rw_value);
					} else if (rw_att.equals("RW_DLR_CAT")) {
						bpil_RewardOPAOutput.setRW_DLR_CAT(rw_value);
					} else if (rw_att.equals("RW_DLR_BILL_TO")) {
						 BigDecimal bd = new BigDecimal(rw_value);
							
						 bpil_RewardOPAOutput.setRW_DLR_BILL_TO(bd.intValue());

					} else if (rw_att.equals("RW_DLR_TYPE")) {
						bpil_RewardOPAOutput.setRW_DLR_TYPE(rw_value);
					} else if (rw_att.equals("RW_DLR_NAME")) {
						bpil_RewardOPAOutput.setRW_DLR_NAME(rw_value);
					}  else if (rw_att.equals("RW_SEC")) {
						bpil_RewardOPAOutput.setRW_SEC(rw_value);
					} else if (rw_att.equals("RW_TYPE")) {
						bpil_RewardOPAOutput.setRW_TYPE(rw_value);
					} else if (rw_att.equals("RW_PRD")) {
						bpil_RewardOPAOutput.setRW_PRD(rw_value);
					} else if (rw_att.equals("RW_UNIT")) {
						bpil_RewardOPAOutput.setRW_UNIT(rw_value);
					} else if (rw_att.equals("RW_DATE")) {
						DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd");
						Date dateStr = datformat.parse(rw_value);

						bpil_RewardOPAOutput.setRW_DATE(dateStr);
					} else if (rw_att.equals("RW_LY")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_LY(bd);
						
					} else if (rw_att.equals("RW_TGT")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_TGT(bd);
						
					}  else if (rw_att.equals("RW_TY")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_TY(bd);
						
						
					} else if (rw_att.equals("RW_ADDITIONAL")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_ADDITIONAL(bd);
						
						
					} else if (rw_att.equals("RW_BASE_TOTAL")) {
						if(rw_value != null && !rw_value.equals("")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_BASE_TOTAL(bd);
						}
						
					} else if (rw_att.equals("RW_Q_STAT")) {
						bpil_RewardOPAOutput.setRW_Q_STAT(rw_value);
					} else if (rw_att.equals("RW_DESC")) {
						bpil_RewardOPAOutput.setRW_DESC(rw_value);
					} else if (rw_att.equals("RW_TOTAL")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_TOTAL(bd);
						
					} else if (rw_att.equals("RW_NXT_TGT")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_NXT_TGT(bd);
						
					} else if (rw_att.equals("RW_GFT_TO_CN")) {
						bpil_RewardOPAOutput.setRW_GFT_TO_CN(rw_value);
					} else if (rw_att.equals("RW_GFT_ID")) {
						bpil_RewardOPAOutput.setRW_GFT_ID(rw_value);
					} else if (rw_att.equals("RW_CONV_CN")) {
						BigDecimal bd = new BigDecimal(rw_value);
						
						 bpil_RewardOPAOutput.setRW_CONV_CN(bd);
						
					} else if (rw_att.equals("RW_I_STAT")) {
						bpil_RewardOPAOutput.setRW_I_STAT(rw_value);
					} else if (rw_att.equals("RW_LAST_UPDATE")) {
						DateFormat datformat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
						Date dateStr = datformat.parse(rw_value);

						bpil_RewardOPAOutput.setRW_LAST_UPDATE(dateStr);
					}

					// read an xml node using xpath
//					 Node node3 = (Node) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODE);
//					
//					 if (null != node3) {
//						 NodeList nodeListn3 = node3.getChildNodes();
//						 for (int j = 0; null != nodeListn3 && j < nodeListn3.getLength(); j++) {
//							 Node nod3 = nodeListn3.item(j);
//							 if (nod3.getNodeType() == Node.ELEMENT_NODE)
//								 System.out.println(nodeListn3.item(j).getNodeName() + " : " +
//										 nod3.getFirstChild().getNodeValue());
//						 }
//					 }

				}
				
				RewardOPAOutput.add(bpil_RewardOPAOutput);

				
			}

		
	}

	



			

			

		

		return RewardOPAOutput;

	}
	
	public List<Bpil_RewardOPAOutput> callschdepooparest_webservice(List<Bpil_DealerOPAInput> dealerOPAInput,
			String schnm, String depot, List<String> dealer_name, String schopawebserviceUrl, String oAuth2_token,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		// Create Rest Connection
		
				List<Bpil_RewardOPAOutput> RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();
				
				try {
					URL url = new URL(schopawebserviceUrl);
					
					HttpURLConnection conn = (HttpURLConnection) url.openConnection();
					
					conn.setDoOutput(true);
					conn.setRequestMethod("POST");
					conn.setRequestProperty("Content-Type", "application/json");
					conn.setRequestProperty("Authorization", oAuth2_token);
					
					String JSON_REQ = createDlrSchDepoRestRequestJSONWriter(dealerOPAInput, schnm, depot, dealer_name, request);

					OutputStream os = conn.getOutputStream();
					os.write(JSON_REQ.getBytes());
					os.flush();
					
					if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
						throw new RuntimeException("Failed : HTTP error code : "
							+ conn.getResponseCode());
					}

					BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

					String JSON_RESP;
					System.out.println("Output from Server .... \n");
					while ((JSON_RESP = br.readLine()) != null) {
						System.out.println(JSON_RESP);
						
						RewardOPAOutput = printDlrSchDepoRestResponseJSONReader(JSON_REQ, JSON_RESP,dealerOPAInput, schnm, depot, dealer_name, request);
					}

					conn.disconnect();

					
				} catch (MalformedURLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return RewardOPAOutput;
	}
	
	private String createDlrSchDepoRestRequestJSONWriter(List<Bpil_DealerOPAInput> dealerOPAInput, String schnm,
			String depot, List<String> dealer_name, HttpServletRequest request) throws IOException {
		// TODO Auto-generated method stub
		JsonObjectBuilder JsonReqBuilder = Json.createObjectBuilder();
		JsonArrayBuilder outcomesBuilder = Json.createArrayBuilder();
		JsonArrayBuilder casesBuilder = Json.createArrayBuilder();
		
		List<String> outcomes = new ArrayList<String>();
		
		String[] Stroutcome = new String[] {
				"DLR_TOT_CN","DLR_TOT_BDGT","RW_SCH_ID",
				"RW_CODE","RW_DLR_REGN","RW_DLR_DEPOT",
				"RW_DLR_STATE","RW_DLR_TERR_CODE","RW_DLR_TERR_NAME",
				"RW_DLR_CODE","RW_DLR_CAT","RW_DLR_BILL_TO",
				"RW_DLR_TYPE","RW_DLR_NAME","RW_SEC",
				"RW_TYPE","RW_PRD","RW_UNIT",
				"RW_DATE","RW_LY","RW_TGT",
				"RW_TY","RW_ADDITIONAL","RW_BASE_TOTAL",
				"RW_Q_STAT","RW_DESC","RW_TOTAL",
				"RW_NXT_TGT","RW_GFT_TO_CN","RW_GFT_ID",
				"RW_CONV_CN","RW_I_STAT","RW_LAST_UPDATE"
		}; 
		
		outcomes = Arrays.asList(Stroutcome);
		
		for(String outcome : outcomes) {
			outcomesBuilder.add(outcome);
		}
		
		JsonReqBuilder.add("outcomes", outcomesBuilder);
		
		int caseid = 1;
		
		JsonObjectBuilder caseBuilder = Json.createObjectBuilder();
		JsonArrayBuilder dealersBuilder = Json.createArrayBuilder();
		
		caseBuilder.add("@id", caseid);
		
		int dealercaseid = 1;
		int productid = 1;
		for (Bpil_DealerOPAInput dealer : dealerOPAInput) {
			JsonObjectBuilder dealerBuilder = Json.createObjectBuilder();
			JsonArrayBuilder productsBuilder = Json.createArrayBuilder();
			
			dealerBuilder.add("@id", dealercaseid);
			if(dealer.getDLR_SCH_ID() != null) {
				dealerBuilder.add("DLR_SCH_ID", dealer.getDLR_SCH_ID());
			} else {
				dealerBuilder.add("DLR_SCH_ID", "");
			}
			if(dealer.getDLR_FIN_AN_FLAG() != null) {
				dealerBuilder.add("DLR_FIN_AN_FLAG", dealer.getDLR_FIN_AN_FLAG());
			} else {
				dealerBuilder.add("DLR_FIN_AN_FLAG", "");
			}
			if(dealer.getDLR_REGN() != null) {
				dealerBuilder.add("DLR_REGN", dealer.getDLR_REGN());
			} else {
				dealerBuilder.add("DLR_REGN", "");
			}
			if(dealer.getDLR_DEPOT() != null) {
				dealerBuilder.add("DLR_DEPOT", dealer.getDLR_DEPOT());
			} else {
				dealerBuilder.add("DLR_DEPOT", "");
			}
			if(dealer.getDLR_STATE() != null) {
				dealerBuilder.add("DLR_STATE", dealer.getDLR_STATE());
			} else {
				dealerBuilder.add("DLR_STATE", "");
			}
			if(dealer.getDLR_TERR_CODE() != null) {
				dealerBuilder.add("DLR_TERR_CODE", dealer.getDLR_TERR_CODE());
			} else {
				dealerBuilder.add("DLR_TERR_CODE", "");
			}
			if(dealer.getDLR_TERR_NAME() != null) {
				dealerBuilder.add("DLR_TERR_NAME", dealer.getDLR_TERR_NAME());
			} else {
				dealerBuilder.add("DLR_TERR_NAME", "");
			}
			if(dealer.getDLR_BILL_TO() != null) {
				dealerBuilder.add("DLR_BILL_TO", dealer.getDLR_BILL_TO());
			} else {
				dealerBuilder.add("DLR_BILL_TO", "");
			}
			if(dealer.getDLR_AC_NO() != null) {
				dealerBuilder.add("DLR_AC_NO", dealer.getDLR_AC_NO());
			} else {
				dealerBuilder.add("DLR_AC_NO", "");
			}
			if(dealer.getDLR_AC_NAME() != null) {
				dealerBuilder.add("DLR_AC_NAME", dealer.getDLR_AC_NAME());
			} else {
				dealerBuilder.add("DLR_AC_NAME", "");
			}
			if(dealer.getDLR_CAT() != null) {
				dealerBuilder.add("DLR_CAT", dealer.getDLR_CAT());
			} else {
				dealerBuilder.add("DLR_CAT", "");
			}
			if(dealer.getDLR_TYPE() != null) {
				dealerBuilder.add("DLR_TYPE", dealer.getDLR_TYPE());
			} else {
				dealerBuilder.add("DLR_TYPE", "");
			}
			if(dealer.getDLR_RET() != null) {
				dealerBuilder.add("DLR_RET", dealer.getDLR_RET());
			} else {
				dealerBuilder.add("DLR_RET", "");
			}
			if(dealer.getDLR_SDLR_COUNT() != null) {
				dealerBuilder.add("DLR_SDLR_COUNT", dealer.getDLR_SDLR_COUNT());
			} else {
				dealerBuilder.add("DLR_SDLR_COUNT", "");
			}
			
			
			for (Bpil_ProductOPAInput product : dealer.getProductOPAInput()) {
				JsonObjectBuilder productBuilder = Json.createObjectBuilder();
				
				productBuilder.add("@id", productid);
				productBuilder.add("PRD", Integer.toString(productid));
				productBuilder.add("PRD_SCH_ID", product.getPRD_SCH_ID());
				productBuilder.add("PRD_BILL_TO", product.getPRD_BILL_TO());
				productBuilder.add("PRD_DLR_AC_NO", product.getPRD_DLR_AC_NO());
				productBuilder.add("PRD_DLR_TYPE", product.getPRD_DLR_TYPE());
				productBuilder.add("PRD_NAME", product.getPRD_NAME());
				productBuilder.add("PRD_CAT", product.getPRD_CAT());
				productBuilder.add("PRD_CAT_DESC", product.getPRD_CAT_DESC());
				productBuilder.add("PRD_GRP", product.getPRD_GRP());
				productBuilder.add("PRD_CODE", product.getPRD_CODE());
				productBuilder.add("PRD_SHD_CODE", product.getPRD_SHD_CODE());
				productBuilder.add("PRD_INV_DT", new SimpleDateFormat("yyyy-MM-dd").format(product.getPRD_INV_DT()));
				productBuilder.add("PRD_UOM", product.getPRD_UOM());
				productBuilder.add("PRD_PCK_SIZE", product.getPRD_PCK_SIZE());
				productBuilder.add("PRD_VOL", product.getPRD_VOL());
				productBuilder.add("PRD_FNL_VOL", product.getPRD_FNL_VOL());
				productBuilder.add("PRD_VAL", product.getPRD_VAL());
				productBuilder.add("PRD_VOL_RW", product.getPRD_VOL_RW());
				productBuilder.add("PRD_FNL_VOL_RW", product.getPRD_FNL_VOL_RW());
				productBuilder.add("PRD_VAL_RW", product.getPRD_VAL_RW());
				
				
				productsBuilder.add(productBuilder);
				
				productid++;
				
			}
			
			
			dealerBuilder.add("products", productsBuilder);
			
			dealersBuilder.add(dealerBuilder);
			
			dealercaseid++;
		}
		
		caseBuilder.add("dealers", dealersBuilder);
		
		casesBuilder.add(caseBuilder);
		
		JsonReqBuilder.add("cases", casesBuilder);
		
		JsonObject JsonREQObject = JsonReqBuilder.build();
		
		System.out.println("JsonREQObject JSON String\n"+JsonREQObject);
		
		StringWriter strWtr = new StringWriter();
        JsonWriter jsonWtr = Json.createWriter(strWtr);
        jsonWtr.writeObject(JsonREQObject);
        String JSON_REQ = strWtr.toString();
        jsonWtr.close();
        strWtr.close();
        
        String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

		 System.out.println("xmlpath = " + reqxmlpath);
		 
		//write to file
			OutputStream os = new FileOutputStream(reqxmlpath+"/jsonrequest.json");
			JsonWriter jsonWriter = Json.createWriter(os);
			jsonWriter.writeObject(JsonREQObject);
			jsonWriter.close();
			os.close();
         
        System.out.println(JSON_REQ);
		return JSON_REQ;

	}

	private List<Bpil_RewardOPAOutput> printDlrSchDepoRestResponseJSONReader(String JSON_REQ, String JSON_RESP,
			List<Bpil_DealerOPAInput> dealerOPAInput, String schnm, String depot, List<String> dealer_name,
			HttpServletRequest request) throws IOException, ParseException {
		// TODO Auto-generated method stub
		List<Bpil_RewardOPAOutput> RewardSchOPAOutput = new ArrayList<Bpil_RewardOPAOutput>();
		
		StringReader strReqRdr = new StringReader(JSON_REQ);
		
		//create JsonReader object
		JsonReader jsonReqReader = Json.createReader(strReqRdr);
		
		//get JsonObject from JsonReader
		JsonObject JsonREQObject = jsonReqReader.readObject();
		
		//we can close IO resource and JsonReader now
		jsonReqReader.close();
		strReqRdr.close();
		
		System.out.println("JsonREQObject JSON String\n"+JsonREQObject);
        
        String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

		 System.out.println("xmlpath = " + reqxmlpath);
		 
		//write to file
			OutputStream reqos = new FileOutputStream(reqxmlpath+"/jsonrequest.json");
			JsonWriter jsonReqWriter = Json.createWriter(reqos);
			jsonReqWriter.writeObject(JsonREQObject);
			jsonReqWriter.close();
			reqos.close();
         
        System.out.println(JSON_REQ);
		
		StringReader strRespRdr = new StringReader(JSON_RESP);
		
		//create JsonReader object
		JsonReader jsonRespReader = Json.createReader(strRespRdr);
		
		//get JsonObject from JsonReader
		JsonObject JsonRESPObject = jsonRespReader.readObject();
		
		//we can close IO resource and JsonReader now
		jsonRespReader.close();
		strRespRdr.close();
		
		System.out.println("JsonRESPObject JSON String\n"+JsonRESPObject);
     
		//write to file
			OutputStream respos = new FileOutputStream(reqxmlpath+"/jsonresponse.json");
			JsonWriter jsonRespWriter = Json.createWriter(respos);
			jsonRespWriter.writeObject(JsonRESPObject);
			jsonRespWriter.close();
			respos.close();
         
        System.out.println(JSON_RESP);
        
        JsonArray cases = JsonRESPObject.getJsonArray("cases");
        List<Bpil_DealerOPAInput> DealerOPAInput = new ArrayList<Bpil_DealerOPAInput>();
        for(JsonValue case_value : cases){
        	System.out.println(case_value.toString());
			JsonObject case_object = (JsonObject) case_value;
			
			System.out.println(case_object.getInt("@id"));
			
			JsonArray dealers = case_object.getJsonArray("dealers");
			for(JsonValue dlr_value : dealers){
        	
				Bpil_DealerOPAInput dealer = new Bpil_DealerOPAInput();
				DealerOPAInput.add(dealer);
				
				System.out.println(dlr_value.toString());
				JsonObject DLR_object = (JsonObject) dlr_value;
				
				dealer.setID(DLR_object.getInt("@id"));
				System.out.println(DLR_object.getInt("@id"));
				dealer.setDLR_TOT_CN(DLR_object.getJsonNumber("DLR_TOT_CN").bigDecimalValue());
				System.out.println(DLR_object.getJsonNumber("DLR_TOT_CN"));
				dealer.setDLR_TOT_BDGT(DLR_object.getJsonNumber("DLR_TOT_BDGT").bigDecimalValue());
				System.out.println(DLR_object.getJsonNumber("DLR_TOT_BDGT"));
				
				JsonArray rewards = DLR_object.getJsonArray("rewards");
				List<Bpil_RewardOPAOutput>RewardOPAOutput = new ArrayList<Bpil_RewardOPAOutput>(rewards.size());
				for(JsonValue rw_value : rewards){
					Bpil_RewardOPAOutput bsat_RW = new Bpil_RewardOPAOutput();
					RewardOPAOutput.add(bsat_RW);
					
					System.out.println(rw_value.toString());
					JsonObject RW_object = (JsonObject) rw_value;
					
					bsat_RW.setID(RW_object.getInt("@id"));
					System.out.println(RW_object.getInt("@id"));
					bsat_RW.setRW_SCH_ID(RW_object.getInt("RW_SCH_ID"));
					System.out.println(RW_object.getInt("RW_SCH_ID"));
					bsat_RW.setRW_CODE(RW_object.getString("RW_CODE"));
					System.out.println(RW_object.getString("RW_CODE"));
					bsat_RW.setRW_DLR_REGN(RW_object.getString("RW_DLR_REGN"));
					System.out.println(RW_object.getString("RW_DLR_REGN"));
					bsat_RW.setRW_DLR_DEPOT(RW_object.getString("RW_DLR_DEPOT"));
					System.out.println(RW_object.getString("RW_DLR_DEPOT"));
					bsat_RW.setRW_DLR_STATE(RW_object.getString("RW_DLR_STATE"));
					System.out.println(RW_object.getString("RW_DLR_STATE"));
					bsat_RW.setRW_DLR_TERR_CODE(RW_object.getString("RW_DLR_TERR_CODE"));
					System.out.println(RW_object.getString("RW_DLR_TERR_CODE"));
					bsat_RW.setRW_DLR_TERR_NAME(RW_object.getString("RW_DLR_TERR_NAME"));
					System.out.println(RW_object.getString("RW_DLR_TERR_NAME"));
					bsat_RW.setRW_DLR_CODE(RW_object.getString("RW_DLR_CODE"));
					System.out.println(RW_object.getString("RW_DLR_CODE"));
					bsat_RW.setRW_DLR_CAT(RW_object.getString("RW_DLR_CAT"));
					System.out.println(RW_object.getString("RW_DLR_CAT"));
					bsat_RW.setRW_DLR_BILL_TO(RW_object.getInt("RW_DLR_BILL_TO"));
					System.out.println(RW_object.getInt("RW_DLR_BILL_TO"));
					bsat_RW.setRW_DLR_TYPE(RW_object.getString("RW_DLR_TYPE"));
					System.out.println(RW_object.getString("RW_DLR_TYPE"));
					bsat_RW.setRW_DLR_NAME(RW_object.getString("RW_DLR_NAME"));
					System.out.println(RW_object.getString("RW_DLR_NAME"));
					bsat_RW.setRW_SEC(RW_object.getString("RW_SEC"));
					System.out.println(RW_object.getString("RW_SEC"));
					bsat_RW.setRW_TYPE(RW_object.getString("RW_TYPE"));
					System.out.println(RW_object.getString("RW_TYPE"));
					bsat_RW.setRW_PRD(RW_object.getString("RW_PRD"));
					System.out.println(RW_object.getString("RW_PRD"));
					bsat_RW.setRW_UNIT(RW_object.getString("RW_UNIT"));
					System.out.println(RW_object.getString("RW_UNIT"));
					bsat_RW.setRW_DATE(new SimpleDateFormat("yyyy-MM-dd").parse(RW_object.getString("RW_DATE")));
					System.out.println(RW_object.getString("RW_DATE"));
					bsat_RW.setRW_LY(RW_object.getJsonNumber("RW_LY").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_LY"));
					bsat_RW.setRW_TGT(RW_object.getJsonNumber("RW_TGT").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_TGT"));
					bsat_RW.setRW_TY(RW_object.getJsonNumber("RW_TY").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_TY"));
					bsat_RW.setRW_ADDITIONAL(RW_object.getJsonNumber("RW_ADDITIONAL").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_ADDITIONAL"));
					bsat_RW.setRW_BASE_TOTAL(RW_object.getJsonNumber("RW_BASE_TOTAL").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_BASE_TOTAL"));
					bsat_RW.setRW_Q_STAT(RW_object.getString("RW_Q_STAT"));
					System.out.println(RW_object.getString("RW_Q_STAT"));
					bsat_RW.setRW_DESC(RW_object.getString("RW_DESC"));
					System.out.println(RW_object.getString("RW_DESC"));
					bsat_RW.setRW_TOTAL(RW_object.getJsonNumber("RW_TOTAL").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_TOTAL"));
					bsat_RW.setRW_NXT_TGT(RW_object.getJsonNumber("RW_NXT_TGT").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_NXT_TGT"));
					bsat_RW.setRW_GFT_TO_CN(RW_object.getString("RW_GFT_TO_CN"));
					System.out.println(RW_object.getString("RW_GFT_TO_CN"));
					bsat_RW.setRW_GFT_ID(RW_object.getString("RW_GFT_ID"));
					System.out.println(RW_object.getString("RW_GFT_ID"));
					bsat_RW.setRW_CONV_CN(RW_object.getJsonNumber("RW_CONV_CN").bigDecimalValue());
					System.out.println(RW_object.getJsonNumber("RW_CONV_CN"));
					bsat_RW.setRW_I_STAT(RW_object.getString("RW_I_STAT"));
					System.out.println(RW_object.getString("RW_I_STAT"));
					bsat_RW.setRW_LAST_UPDATE(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(RW_object.getString("RW_LAST_UPDATE")));
					System.out.println(RW_object.getString("RW_LAST_UPDATE"));
					
				}
				RewardSchOPAOutput.addAll(RewardOPAOutput);
			}
			
		}
		
		
		
		return RewardSchOPAOutput;
	}
	
//	public List<Maxlife_Adm> 
	public void call_maxlife_gpa_schopasoap_webservice(List<Maxlife_Adm> maxlife_Adms,
			String schopawebserviceUrl, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		// Create SOAP Connection
		
	
		try {
			SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();

			SOAPConnection soapConnection = soapConnectionFactory.createConnection();

			// Send SOAP Message to SOAP Server
			// final String url =
			// "https://omfys-opa.custhelp.com/determinations-server/assess/soap/generic/12.2.1/BPIL__Seal__O__Prime__November__Dhamaka__Offer?wsdl";
			final String url = schopawebserviceUrl;
			SOAPMessage soapRequest = createmaxlife_gpa_schSOAPRequest(maxlife_Adms);

			TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
			Transformer transformerReq = transformerFactoryReq.newTransformer();
			Source sourceContentReq = soapRequest.getSOAPPart().getContent();

			 String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

			 System.out.println("xmlpath = " + reqxmlpath);

			 StreamResult resultReq = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soaprequest.xml")));
			 transformerReq.transform(sourceContentReq, resultReq);

			SOAPMessage soapResponse = soapConnection.call(soapRequest, url);
			
			TransformerFactory transformerFactoryResp = TransformerFactory.newInstance();
			Transformer transformerResp = transformerFactoryResp.newTransformer();
			Source sourceContentResp = soapResponse.getSOAPPart().getContent();

			 StreamResult resultResp = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soapresponse.xml")));
			 transformerResp.transform(sourceContentResp, resultResp);

			// Process the SOAP Response
//			 maxlife_Adms = 
					 printmaxlife_gpa_schSOAPResponse(soapRequest, soapResponse, maxlife_Adms, request);

			soapConnection.close();

		} catch (UnsupportedOperationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SOAPException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TransformerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (XPathExpressionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		return maxlife_Adms;

	}
	
	private SOAPMessage createmaxlife_gpa_schSOAPRequest(List<Maxlife_Adm> maxlife_Adms) throws SOAPException, IOException {
		// TODO Auto-generated method stub
		
		MessageFactory messageFactory = MessageFactory.newInstance();
		SOAPMessage soapMessage = messageFactory.createMessage();
		SOAPPart soapPart = soapMessage.getSOAPPart();

		final String serverURI = "http://oracle.com/determinations/server/12.2.1/rulebase/assess/types";

		// SOAP Envelope
		SOAPEnvelope envelope = soapPart.getEnvelope();
		envelope.addNamespaceDeclaration("typ", serverURI);

		SOAPFactory soapFactory = SOAPFactory.newInstance();

		System.out.println("SOAP Envelope");

		// SOAP Header
		SOAPHeader soapHeader = envelope.getHeader();

		final String seqHeader = "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd";
		Name headerName = soapFactory.createName("Security", "o", seqHeader);

		SOAPHeaderElement headerElement = soapHeader.addHeaderElement(headerName);
		headerElement.setMustUnderstand(true);

		final String Username = "apiuser";
		final String Password = "ApiUser@123";

		SOAPElement soapUserToken = headerElement.addChildElement("UsernameToken", "o");
		SOAPElement sopaUser = soapUserToken.addChildElement("Username", "o");
		sopaUser.addTextNode(Username);
		SOAPElement sopaPass = soapUserToken.addChildElement("Password", "o");
		sopaPass.addTextNode(Password);

		SOAPHeader header = soapMessage.getSOAPHeader();
		SOAPBody body = soapMessage.getSOAPBody();

		System.out.println("SOAP Header");

		// SOAP Body
		SOAPBody soapBody = envelope.getBody();

		SOAPElement soapBodyElem = soapBody.addChildElement("assess-request", "typ");

		System.out.println("SOAP Body");

		SOAPElement config = soapBodyElem.addChildElement("config", "typ");

		SOAPElement outcome = config.addChildElement("outcome", "typ");

		ArrayList<String> outcome_entity_type = new ArrayList<String>();

		outcome_entity_type.add("ADM");
		outcome_entity_type.add("Agent");
		outcome_entity_type.add("Transaction");

		ArrayList<String> ADM_outcome = new ArrayList<String>();
		ArrayList<String> Agent_outcome = new ArrayList<String>();
		ArrayList<String> Transaction_outcome = new ArrayList<String>();

		for (String outcome_entity : outcome_entity_type) {

			if (outcome_entity.equals("ADM")) {
				ADM_outcome.add("ADM_QR_GPA");
				ADM_outcome.add("ADM_NOP_PERCENTAGE");
				ADM_outcome.add("ADM_WFYP_PERCENTAGE");
				ADM_outcome.add("ADM_QR_PERCENTAGE");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_WFYP");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_NOP");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_MTD_ACTIVE_MM");
				ADM_outcome.add("ADM_ALLOWED_PERIOD");
//				ADM_outcome.add("ADM_WEIGHTED_PERCENTAGE");
				ADM_outcome.add("ADM_NOP_GPA");
				ADM_outcome.add("ADM_WFYP_GPA");
				ADM_outcome.add("ADM_MTD_ACTIVE_MM_GPA");
				ADM_outcome.add("ADM_MTD_ACTIVE_MM_PERCENTAGE");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_QR");
				ADM_outcome.add("ADM_EXPECTED_MTD_ACTIVE_MM");
				ADM_outcome.add("ADM_EXPECTED_QR");
				ADM_outcome.add("ADM_EXPECTED_WFYP");
				ADM_outcome.add("ADM_EXPECTED_NOP");
				ADM_outcome.add("ADM_VINTAGE_PERIOD");
				ADM_outcome.add("ADM_ACTUAL_MTD_ACTIVE_MM");
				ADM_outcome.add("ADM_ACTUAL_WFYP");
				ADM_outcome.add("ADM_ACTUAL_QR");
				ADM_outcome.add("ADM_ACTUAL_NOP");
				ADM_outcome.add("ADM_total_GPA_score");

				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String adm_att : ADM_outcome) {
					System.out.println("adm outcome att = " + adm_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), adm_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("Agent")) {
				Agent_outcome.add("AGENT_QR");
				Agent_outcome.add("AGENT_WFYP");
				Agent_outcome.add("AGENT_NOP");
//				Agent_outcome.add("AGENT_MTD");
				Agent_outcome.add("AGENT_VINTAGE_PERIOD");
				
				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String agent_att : Agent_outcome) {
					System.out.println("agent_att outcome att = " + agent_att);

					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), agent_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}

			} else if (outcome_entity.equals("Transaction")) {

//				Transaction_outcome.add("TRANSACTION_QR");
				
				SOAPElement entity = outcome.addChildElement("entity", "typ");
				entity.addAttribute(soapFactory.createName("id"), outcome_entity);

				for (String transaction_att : Transaction_outcome) {
					SOAPElement entityoutcome = entity.addChildElement("attribute-outcome", "typ");
					entityoutcome.addAttribute(soapFactory.createName("id"), transaction_att);
					entityoutcome.addAttribute(soapFactory.createName("known-outcome-style"), "value-only");
					entityoutcome.addAttribute(soapFactory.createName("unknown-outcome-style"), "value-only");
				}
			}
		}
		
		ArrayList<String> adm_instances = new ArrayList<String>();

		for (Maxlife_Adm maxlife_Adm : maxlife_Adms) {
			adm_instances.add(Integer.toString(maxlife_Adm.getID()));

		}

		ArrayList<String> adm_attributes = new ArrayList<String>();
		ArrayList<String> adm_attributes_type = new ArrayList<String>();
		ArrayList<String> adm_attributes_value = new ArrayList<String>();

		adm_attributes.add("ADM_NAME");
		adm_attributes.add("ADM_ROLE");
		adm_attributes.add("ADM_LOCATION");
		adm_attributes.add("ADM_TERMINATED_COUNT");
		adm_attributes.add("ADM_ID");
		adm_attributes.add("ADM_PROMOTION_DATE");
		adm_attributes.add("ADM_JOINING_DATE");
			
		adm_attributes_type.add("text-val");
		adm_attributes_type.add("text-val");
		adm_attributes_type.add("text-val");
		adm_attributes_type.add("number-val");
		adm_attributes_type.add("number-val");
		adm_attributes_type.add("date-val");
		adm_attributes_type.add("date-val");
		
		ArrayList<String> agent_instances = new ArrayList<String>();

		ArrayList<String> agent_attributes = new ArrayList<String>();
		ArrayList<String> agent_attributes_type = new ArrayList<String>();
		ArrayList<String> agent_attributes_value = new ArrayList<String>();

		agent_attributes.add("AGENT_ID");
		agent_attributes.add("AGENT_DOJ");
		agent_attributes.add("AGENT_STATUS");
		
		agent_attributes_type.add("number-val");
		agent_attributes_type.add("date-val");
		agent_attributes_type.add("text-val");
		
		ArrayList<String> transaction_instances = new ArrayList<String>();
		
		ArrayList<String> transaction_attributes = new ArrayList<String>();
		ArrayList<String> transaction_attributes_type = new ArrayList<String>();
		ArrayList<String> transaction_attributes_value = new ArrayList<String>();

		transaction_attributes.add("transaction_ID");
		transaction_attributes.add("TRANSACTION_WFYP");
		transaction_attributes.add("TRANSACTION_WFYC");
//		transaction_attributes.add("TRANSACTION_NOP");
		transaction_attributes.add("TRANSACTION_PAID_CASES");
		transaction_attributes.add("TRANSACTION_DATE");
//		transaction_attributes.add("TRANSACTION_M0_FYC");
//		transaction_attributes.add("TRANSACTION_M1_FYC");
		
		transaction_attributes_type.add("text-val");
		transaction_attributes_type.add("number-val");
		transaction_attributes_type.add("number-val");
//		transaction_attributes_type.add("number-val");
		transaction_attributes_type.add("number-val");
		transaction_attributes_type.add("date-val");
//		transaction_attributes_type.add("number-val");
//		transaction_attributes_type.add("number-val");
		
		int agentid = 0;
		
		SOAPElement globalinstance = soapBodyElem.addChildElement("global-instance", "typ");
		
		SOAPElement globalattribute = globalinstance.addChildElement("attribute", "typ");
		globalattribute.addAttribute(soapFactory.createName("id"), "MONTH");
		SOAPElement globalattributeattributeDataType = globalattribute.addChildElement("text-val", "typ");
		globalattributeattributeDataType.addTextNode("January");
		
		System.out.println("global_attributes = " +  "MONTH");
		
		SOAPElement adm_entity = globalinstance.addChildElement("entity", "typ");
		adm_entity.addAttribute(soapFactory.createName("id"), "ADM");
		
		 System.out.println("ADM_entity");

		for (int j = 0; j < adm_instances.size(); j++) {
			SOAPElement adm_entity_instance = adm_entity.addChildElement("instance", "typ");
			adm_entity_instance.addAttribute(soapFactory.createName("id"), adm_instances.get(j));

			System.out.println("adm_instances = " + adm_instances.get(j));

			
			adm_attributes_value.clear();
			
			Maxlife_Adm maxlife_Adm = maxlife_Adms.get(j);
			
			adm_attributes_value.add(maxlife_Adm.getADM_NAME());
			adm_attributes_value.add(maxlife_Adm.getADM_ROLE());
			adm_attributes_value.add(maxlife_Adm.getADM_LOCATION());
			adm_attributes_value.add(Integer.toString(maxlife_Adm.getADM_TERMINATED_COUNT()));
			adm_attributes_value.add(Integer.toString(maxlife_Adm.getADM_ID()));
			if(maxlife_Adm.getADM_PROMOTION_DATE() != null){
				adm_attributes_value.add(new SimpleDateFormat("yyyy-MM-dd").format(maxlife_Adm.getADM_PROMOTION_DATE()));
			}
			else {
				adm_attributes_value.add("");
			}
			adm_attributes_value.add(new SimpleDateFormat("yyyy-MM-dd").format(maxlife_Adm.getADM_JOINING_DATE()));
			
			for (int i = 0; i < adm_attributes.size(); i++) {
				
				if(adm_attributes_value.get(i) != "") {	
					SOAPElement attribute = adm_entity_instance.addChildElement("attribute", "typ");
					attribute.addAttribute(soapFactory.createName("id"), adm_attributes.get(i));
				
					SOAPElement attributeDataType = attribute.addChildElement(adm_attributes_type.get(i), "typ");
				
//					if(adm_attributes_value.get(i) != null) {
						attributeDataType.addTextNode(adm_attributes_value.get(i));
//					}
				}
				System.out.println("adm_attributes = " +  adm_attributes.get(i));

			}
			
			SOAPElement agent_entity = adm_entity_instance.addChildElement("entity", "typ");
			agent_entity.addAttribute(soapFactory.createName("id"), "Agent");

			 System.out.println("Agent_entity");
			
			 agent_instances.clear();
			
			for (Maxlife_Agent maxlife_Agent : maxlife_Adm.getAdm_Agent()) {
				agentid++;
				maxlife_Agent.setID(agentid);
				agent_instances.add(Integer.toString(maxlife_Agent.getID()));

			}
			
			for (int k = 0; k < agent_instances.size(); k++) {

				SOAPElement agent_entity_instance = agent_entity.addChildElement("instance", "typ");
				agent_entity_instance.addAttribute(soapFactory.createName("id"), agent_instances.get(k));

				 System.out.println("agent_instances = " + agent_instances.get(k));

				 agent_attributes_value.clear();

				Maxlife_Agent maxlife_Agent = maxlife_Adm.getAdm_Agent().get(k);

				agent_attributes_value.add(Integer.toString(maxlife_Agent.getAGENT_ID()));
				agent_attributes_value.add(new SimpleDateFormat("yyyy-MM-dd").format(maxlife_Agent.getAGENT_DOJ()));
				agent_attributes_value.add(maxlife_Agent.getAGENT_STATUS());
				
				for (int i = 0; i < agent_attributes.size(); i++) {

					SOAPElement attribute = agent_entity_instance.addChildElement("attribute", "typ");
					attribute.addAttribute(soapFactory.createName("id"), agent_attributes.get(i));
					SOAPElement attributeDataType = attribute.addChildElement(agent_attributes_type.get(i), "typ");
					attributeDataType.addTextNode(agent_attributes_value.get(i));

					 System.out.println("agent_attributes = " + agent_attributes.get(i));

				}
				
				SOAPElement transacton_entity = agent_entity_instance.addChildElement("entity", "typ");
				transacton_entity.addAttribute(soapFactory.createName("id"), "Transaction");

				 System.out.println("Transaction_entity");
				
				 transaction_instances.clear();
				
				for (Maxlife_Transaction maxlife_Transaction : maxlife_Agent.getAgent_Transaction()) {
					transaction_instances.add(Integer.toString(maxlife_Transaction.getID()));

				}
				
				for (int l = 0; l < transaction_instances.size(); l++) {

					SOAPElement transaction_entity_instance = transacton_entity.addChildElement("instance", "typ");
					transaction_entity_instance.addAttribute(soapFactory.createName("id"), transaction_instances.get(l));

					 System.out.println("transaction_instances = " + transaction_instances.get(l));

					 transaction_attributes_value.clear();

					Maxlife_Transaction maxlife_Transaction = maxlife_Agent.getAgent_Transaction().get(l);

					transaction_attributes_value.add(Integer.toString(maxlife_Transaction.getID()));
					transaction_attributes_value.add(Float.toString(maxlife_Transaction.getTRANSACTION_WFYP()));
					transaction_attributes_value.add(Float.toString(maxlife_Transaction.getTRANSACTION_FYC()));
//					transaction_attributes_value.add(Integer.toString(maxlife_Transaction.getTRANSACTION_NOP()));
					transaction_attributes_value.add(Integer.toString(maxlife_Transaction.getTRANSACTION_PAID_CASES()));
					transaction_attributes_value.add(new SimpleDateFormat("yyyy-MM-dd").format(maxlife_Transaction.getTRANSACTION_DATE()));
//					transaction_attributes_value.add(Float.toString(maxlife_Transaction.getTRANSACTION_M0_FYC()));
//					transaction_attributes_value.add(Float.toString(maxlife_Transaction.getTRANSACTION_M1_FYC()));
					
					for (int i = 0; i < transaction_attributes.size(); i++) {

						SOAPElement attribute = transaction_entity_instance.addChildElement("attribute", "typ");
						attribute.addAttribute(soapFactory.createName("id"), transaction_attributes.get(i));
						SOAPElement attributeDataType = attribute.addChildElement(transaction_attributes_type.get(i), "typ");
						attributeDataType.addTextNode(transaction_attributes_value.get(i));

						 System.out.println("transaction_attributes = " + transaction_attributes.get(i));

					}
				}

			}
			
		}
		
		final String SOAPAction = "http://oracle.com/determinations/server/12.2.1/rulebase/types/Assess";

		MimeHeaders headers = soapMessage.getMimeHeaders();
		headers.addHeader("SOAPAction", SOAPAction);

		soapMessage.saveChanges();

		/* Print the request message */
		 System.out.print("Request SOAP Message = ");
		 soapMessage.writeTo(System.out);
		 System.out.println();

		return soapMessage;

	}
	
//	private List<Maxlife_Adm> 
	private void printmaxlife_gpa_schSOAPResponse(SOAPMessage soapRequest, SOAPMessage soapResponse,
			List<Maxlife_Adm> maxlife_Adms,
			HttpServletRequest request) throws SOAPException, TransformerException, ParserConfigurationException, SAXException, IOException, XPathExpressionException, ParseException {
		// TODO Auto-generated method stub
		
		TransformerFactory transformerFactoryReq = TransformerFactory.newInstance();
		Transformer transformerReq = transformerFactoryReq.newTransformer();
		Source sourceContentReq = soapRequest.getSOAPPart().getContent();

		 System.out.print("\nRequest SOAP Message = ");
		 StreamResult resultReq = new StreamResult(System.out);
		 transformerReq.transform(sourceContentReq, resultReq);

		 String reqxmlpath = request.getServletContext().getRealPath("/WEB-INF/classes/com/report");

		 System.out.println("\nxmlpath = " + reqxmlpath);

		 StreamResult resultReq3 = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soaprequest.xml")));
		 transformerReq.transform(sourceContentReq, resultReq3);

		ByteArrayOutputStream osReq = new ByteArrayOutputStream();

		StreamResult resultReq2 = new StreamResult(osReq);
		transformerReq.transform(sourceContentReq, resultReq2);

		String xmlReq = new String(osReq.toByteArray(), "UTF-8");

		 System.out.println("\n");
		 System.out.println(xmlReq);

		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		Source sourceContent = soapResponse.getSOAPPart().getContent();

		 System.out.print("\nResponse SOAP Message = ");
		 StreamResult result = new StreamResult(System.out);
		 transformer.transform(sourceContent, result);

		 StreamResult result3 = new StreamResult(new FileOutputStream(new File(reqxmlpath+"\\soapresponse.xml")));
		 transformer.transform(sourceContent, result3);

		ByteArrayOutputStream os = new ByteArrayOutputStream();

		StreamResult result2 = new StreamResult(os);
		transformer.transform(sourceContent, result2);

		String xml = new String(os.toByteArray(), "UTF-8");

		 System.out.println("\n");
		 System.out.println(xml);

		
		
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = builderFactory.newDocumentBuilder();

		Document xmlDocument = builder.parse(new ByteArrayInputStream(xml.getBytes()));

		XPath xPath = XPathFactory.newInstance().newXPath();
		
		ArrayList<String> outcome_entity_type = new ArrayList<String>();

		outcome_entity_type.add("ADM");
		outcome_entity_type.add("Agent");
		outcome_entity_type.add("Transaction");

		ArrayList<String> ADM_outcome = new ArrayList<String>();
		ArrayList<String> ADM_outcome_value = new ArrayList<String>();
		ArrayList<String> Agent_outcome = new ArrayList<String>();
		ArrayList<String> Agent_outcome_value = new ArrayList<String>();
		ArrayList<String> Transaction_outcome = new ArrayList<String>();
		ArrayList<String> Transaction_outcome_value = new ArrayList<String>();

		for (String outcome_entity : outcome_entity_type) {

			if (outcome_entity.equals("ADM")) {
				ADM_outcome.add("ADM_QR_GPA");
				ADM_outcome.add("ADM_NOP_PERCENTAGE");
				ADM_outcome.add("ADM_WFYP_PERCENTAGE");
				ADM_outcome.add("ADM_QR_PERCENTAGE");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_WFYP");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_NOP");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_MTD_ACTIVE_MM");
				ADM_outcome.add("ADM_ALLOWED_PERIOD");
//				ADM_outcome.add("ADM_WEIGHTED_PERCENTAGE");
				ADM_outcome.add("ADM_NOP_GPA");
				ADM_outcome.add("ADM_WFYP_GPA");
				ADM_outcome.add("ADM_MTD_ACTIVE_MM_GPA");
				ADM_outcome.add("ADM_MTD_ACTIVE_MM_PERCENTAGE");
				ADM_outcome.add("ADM_WEIGHTED_VALUE_QR");
				ADM_outcome.add("ADM_EXPECTED_MTD_ACTIVE_MM");
				ADM_outcome.add("ADM_EXPECTED_QR");
				ADM_outcome.add("ADM_EXPECTED_WFYP");
				ADM_outcome.add("ADM_EXPECTED_NOP");
				ADM_outcome.add("ADM_VINTAGE_PERIOD");
				ADM_outcome.add("ADM_ACTUAL_MTD_ACTIVE_MM");
				ADM_outcome.add("ADM_ACTUAL_WFYP");
				ADM_outcome.add("ADM_ACTUAL_QR");
				ADM_outcome.add("ADM_ACTUAL_NOP");
				ADM_outcome.add("ADM_total_GPA_score");

			
			} else if (outcome_entity.equals("Agent")) {
//				Agent_outcome.add("AGENT_QR");
				Agent_outcome.add("AGENT_WFYP");
				Agent_outcome.add("AGENT_NOP");
//				Agent_outcome.add("AGENT_MTD");
				Agent_outcome.add("AGENT_VINTAGE_PERIOD");
				
			
			} else if (outcome_entity.equals("Transaction")) {

//				Transaction_outcome.add("TRANSACTION_QR");
				
			}
		}
		
		ArrayList<String> adm_instances = new ArrayList<String>();

		for (Maxlife_Adm maxlife_Adm : maxlife_Adms) {
			adm_instances.add(Integer.toString(maxlife_Adm.getID()));

		}
				
		ArrayList<String> agent_instances = new ArrayList<String>();
		ArrayList<String> transaction_instances = new ArrayList<String>();
		
		for (int i = 0; i < adm_instances.size(); i++) {
			
			ADM_outcome_value.clear();
			
			Maxlife_Adm maxlife_Adm = maxlife_Adms.get(i);
			
			for (String adm_att : ADM_outcome) {
				String xmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"+ adm_instances.get(i) + "']/attribute";
				String expression = xmlpath + "[@id='" + adm_att + "']";
				System.out.println(expression);
				
				String adm_value = xPath.compile(expression).evaluate(xmlDocument);
				ADM_outcome_value.add(adm_value);
				
				System.out.println(adm_att + " = " + adm_value);
				
				if (adm_att.equals("ADM_QR_GPA")) {
					maxlife_Adm.setADM_QR_GPA(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_NOP_PERCENTAGE")) {
					maxlife_Adm.setADM_NOP_PERCENTAGE(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_WFYP_PERCENTAGE")) {
					maxlife_Adm.setADM_WFYP_PERCENTAGE(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_QR_PERCENTAGE")) {
					maxlife_Adm.setADM_QR_PERCENTAGE(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_WEIGHTED_VALUE_WFYP")) {
					maxlife_Adm.setADM_WEIGHTED_VALUE_WFYP(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_WEIGHTED_VALUE_NOP")) {
					maxlife_Adm.setADM_WEIGHTED_VALUE_NOP(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_WEIGHTED_VALUE_MTD_ACTIVE_MM")) {
					maxlife_Adm.setADM_WTD_VALUE_MTD_ACTIVE_MM(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_WEIGHTED_PERCENTAGE")) {
					maxlife_Adm.setADM_WEIGHTED_PERCENTAGE(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_NOP_GPA")) {
					maxlife_Adm.setADM_NOP_GPA(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_WFYP_GPA")) {
					maxlife_Adm.setADM_WFYP_GPA(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_MTD_ACTIVE_MM_GPA")) {
					maxlife_Adm.setADM_MTD_ACTIVE_MM_GPA(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_MTD_ACTIVE_MM_PERCENTAGE")) {
					maxlife_Adm.setADM_MTD_ACTIVE_MM_PERCENTAGE(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_WEIGHTED_VALUE_QR")) {
					maxlife_Adm.setADM_WEIGHTED_VALUE_QR(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_EXPECTED_MTD_ACTIVE_MM")) {
					maxlife_Adm.setADM_EXPECTED_MTD_ACTIVE_MM(new BigDecimal(adm_value).intValue());

				} else if (adm_att.equals("ADM_EXPECTED_QR")) {
					maxlife_Adm.setADM_EXPECTED_QR(new BigDecimal(adm_value).intValue());

				} else if (adm_att.equals("ADM_EXPECTED_WFYP")) {
					maxlife_Adm.setADM_EXPECTED_WFYP(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_EXPECTED_NOP")) {
					maxlife_Adm.setADM_EXPECTED_NOP(new BigDecimal(adm_value).intValue());

				} else if (adm_att.equals("ADM_VINTAGE_PERIOD")) {
					maxlife_Adm.setADM_VINTAGE_PERIOD(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_ACTUAL_MTD_ACTIVE_MM")) {
					maxlife_Adm.setADM_ACTUAL_MTD_ACTIVE_MM(new BigDecimal(adm_value).intValue());

				} else if (adm_att.equals("ADM_ACTUAL_WFYP")) {
					maxlife_Adm.setADM_ACTUAL_WFYP(new BigDecimal(adm_value).floatValue());

				} else if (adm_att.equals("ADM_ACTUAL_QR")) {
					maxlife_Adm.setADM_ACTUAL_QR(new BigDecimal(adm_value).intValue());

				} else if (adm_att.equals("ADM_ACTUAL_NOP")) {
					maxlife_Adm.setADM_ACTUAL_NOP(new BigDecimal(adm_value).intValue());

				}  else if (adm_att.equals("ADM_total_GPA_score")) {
					maxlife_Adm.setADM_TOTAL_GPA_SCORE(new BigDecimal(adm_value).floatValue());

				} 
				
				
			}
			
			agent_instances.clear();
			
			for (Maxlife_Agent maxlife_Agent : maxlife_Adm.getAdm_Agent()) {
				agent_instances.add(Integer.toString(maxlife_Agent.getID()));

			}
			
			for (int j = 0; j < agent_instances.size(); j++) {
				
				Agent_outcome_value.clear();
				
				Maxlife_Agent maxlife_Agent = maxlife_Adm.getAdm_Agent().get(j);
				
				for (String agent_att : Agent_outcome) {
					String xmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"+ adm_instances.get(i) + "']/entity/instance[@id='"+ agent_instances.get(j) + "']/attribute";
					String expression = xmlpath + "[@id='" + agent_att + "']";
					System.out.println(expression);
					
					String agent_value = xPath.compile(expression).evaluate(xmlDocument);
					Agent_outcome_value.add(agent_value);
					
					System.out.println(agent_att + " = " + agent_value);
					
					if (agent_att.equals("AGENT_QR")) {
						maxlife_Agent.setAGENT_QR(new BigDecimal(agent_value).floatValue());

					} else if (agent_att.equals("AGENT_WFYP")) {
						maxlife_Agent.setAGENT_WFYP(new BigDecimal(agent_value).floatValue());

					} else if (agent_att.equals("AGENT_NOP")) {
						maxlife_Agent.setAGENT_NOP(new BigDecimal(agent_value).intValue());

					} else if (agent_att.equals("AGENT_MTD")) {
						maxlife_Agent.setAGENT_MTD(new BigDecimal(agent_value).intValue());

					} else if (agent_att.equals("AGENT_VINTAGE_PERIOD")) {
						maxlife_Agent.setAGENT_VINTAGE_PERIOD(new BigDecimal(agent_value).intValue());

					} 					
					
				}
				
				transaction_instances.clear();
				
				for (Maxlife_Transaction maxlife_Transaction : maxlife_Agent.getAgent_Transaction()) {
					transaction_instances.add(Integer.toString(maxlife_Transaction.getID()));

				}
				
				for (int k = 0; k < transaction_instances.size(); k++) {
					
					Transaction_outcome_value.clear();
					
					Maxlife_Transaction maxlife_Transaction = maxlife_Agent.getAgent_Transaction().get(k);
					
					for (String transaction_att : Transaction_outcome) {
						String xmlpath = "/Envelope/Body/assess-response/global-instance/entity/instance[@id='"+ adm_instances.get(i) + "']/entity/instance[@id='"+ agent_instances.get(j) + "']/entity/instance[@id='"+ transaction_instances.get(k) + "']/attribute";
						String expression = xmlpath + "[@id='" + transaction_att + "']";
						System.out.println(expression);
						
						String transaction_value = xPath.compile(expression).evaluate(xmlDocument);
						Transaction_outcome_value.add(transaction_att);
						
						System.out.println(transaction_att + " = " + transaction_value);
						
						if (transaction_att.equals("TRANSACTION_QR")) {
							maxlife_Transaction.setTRANSACTION_QR(new BigDecimal(transaction_value).floatValue());

						} 						
					}
					
				}
				
			}
			
		}
		
//		return maxlife_Adms;

	}

	
	
}
