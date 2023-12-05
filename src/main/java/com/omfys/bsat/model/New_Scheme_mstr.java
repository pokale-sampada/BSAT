package com.omfys.bsat.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "BPIL_SCHEME_MASTER")
public class New_Scheme_mstr {
	@Id
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "course_seq")
//	@SequenceGenerator(name = "course_seq", sequenceName = "BPIL_SCHEME_MASTER_S", allocationSize = 1)

	@Column(name = "SCHEME_ID")
	private int scheme_id;
	
	/*@Column(name = "SCHEME_COMPANY")
	private String scheme_company;*/
	
	@Column(name = "SCHEM_FIN_YEAR")
	private int scheme_fin_yr;
	
	@Column(name = "SCHEME_FIN_MONTH")
	private String scheme_fin_month;
	
	@Column(name = "SCHEME_BUSINESS_LINE")
	private String scheme_business_line;
	
	@Column(name = "SCHEME_SRL_NO")
	private String scheme_srl_no;
	
	@Column(name = "SCHEME_CODE")
	private String scheme_code;
	
	@Column(name = "SCHEME_NAME")
	private String scheme_name;
	
	@Column(name = "SCHEME_SHRT_NAME")
	private String scheme_shrt_name;
	
	@Column(name = "SCHEME_TYPE")
	private String scheme_type;
	
	@Column(name = "SCH_REWARD_TYPE")
	private String sch_reward_type;
	
	@Column(name = "SCH_REWARD_ITEM")
	private String sch_reward_item;
	
	@Column(name = "SCH_REWARD_EFF_PRICE")
	private int sch_reward_eff_price;
	
	@Column(name = "START_DATE")
	private Date start_date;
	
	@Column(name = "END_DATE")
	private Date end_date;
	
	@Column(name = "REDEMPTION_DATE")
	private Date redemption_date;
	
	@Column(name = "SUBMISSION_DATE")
	private Date submission_date;
	
	@Column(name = "MAIL_FLAG")
	private String mail_flag;
	
	@Column(name = "APPL_REGN_CODE")
	private String appl_regn_code;
	
	@Column(name = "APPL_DEPOT_CODE")
	private String appl_depot_code;
	
	@Column(name = "APPL_PRODUCT_CODES")
	private String sch_product_codes;

	@Column(name = "CANCELLED_BY")
	private int cancelled_by;

	@Column(name = "CANCEL_REASON")
	private String cancel_reason;

	@Column(name = "CANCEL_DATE")
	private Date cancel_date;	

	@Column(name = "SCH_VOLUME_GROWTH")
	private float volume_growth;	
	
	@Column(name = "SCH_VALUE_GROWTH")
	private float value_growth;	
	
	@Column(name = "SCH_SPREAD")
	private float spraid;
		
	@Column(name = "SCH_OBJECTIVE")
	private String objective;
	
	@Column(name = "BUDGET_AVAILABLE")
	private String budget_available;
	
	@Column(name = "PROVISION_ID")
	private int provision_id;
	
	@Column(name = "PROVISION_COMMENTS")
	private String provision_comments;
	
	@Column(name = "REVISION")
	private int revision;
	
	@Column(name = "ACTIVE_FLAG")
	private String active_flag;
	
	@Column(name = "FIN_ANALYSIS_FLAG")
	private String fin_analysis_flag;

	@Column(name = "SCHEME_BUDGET")
	private float scheme_budget;

	@Column(name = "SCHEME_CRITERIA")
	private String scheme_criteria;
	
	@Column(name = "APPROVED_FLAG")
	private String approved_flag;
	
	@Column(name = "APPROVED_DATE")
	private Date approval_date;
	
	@Column(name = "PARENT_SCHEME_CODE")
	private String parent_scheme_code;
		
	@Column(name = "PARENT_SCHEME_NAME")
	private String parent_scheme_name;
	
	@Column(name = "SCH_OPA_URL")
	private String sch_opa_url;
	
	@Column(name = "OPA_WHATIF_URL")
	private String opa_whatif_url;
	
	@Column(name = "OPA_SCH_AN_NAME")
	private String opa_sch_an_name;
	
	@Column(name = "SCH_DIR_NAME")
	private String sch_dir_name;
	
	@Column(name = "FIN_AN_BATCH_FILE")
	private String fin_an_batch_file;
	
	@Column(name = "SCH_AN_BATCH_FILE")
	private String sch_an_batch_file;
	
	@Column(name = "PRC_RW_BATCH_FILE")
	private String prc_rw_batch_file;
	
	@Column(name = "CUST_CLUB_CLASS")
	private String cust_club_class;

	@Column(name = "SCHEME_LEVEL")
	private String scheme_level;
	
//	@Column(name = "ENTRY_LEVEL")
//	private String entry_level;
//	
//	@Column(name = "MAIN_QUALIFIER")
//	private String main_qualifier;
//	
//	@Column(name = "POINT_REWARDED")
//	private String point_rewarded;
//	
//	@Column(name = "CONFIDENCE_D")
//	private String confidence_d;
//	
//	@Column(name = "CONFIDENCE_B")
//	private String confidence_b;
//	
//	@Column(name = "CONFIDENCE_Y")
//	private String confidence_y;

	@Column(name = "TOTAL_SCH_VOL")
	private String total_sch_vol;
	
	@Column(name = "TOTAL_SCH_VAL")
	private String total_sch_val;
	
	@Column(name = "TOTAL_SCH_QLFD_DLRS")
	private String total_sch_qlfd_dlrs;
	
	@Column(name = "SCH_ACTUAL_BUDGET")
	private String sch_actual_budget;
	
	@Column(name = "REFERENCE_SCH_ID")
	private String reference_sch_id;
	
	@Column(name = "CONFIDENCE_PCT")
	private String confidence_pct;
	
	@Column(name = "OUTFLOW")
	private String outflow;
	
	@Column(name = "SCH_AUDIT_TRAIL")
	private String sch_audit_trail;
	
	@Transient
	private String start_date1;
	
	@Transient
	private String end_date1;
	
	@Transient
	private String creation_date1;
		
	@Transient
	private String gift_name;
	
	@Transient
	private String redemp_date1; 
	
	@Transient
	private String submission_date1; 
	
	@Transient
	private Bpil_Scheme_Doc scheme_doc;
	
	@Column(name = "CREATED_BY", updatable = false)
	private int created_by;

	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "CREATION_DATE" , updatable = false)
	private Date creation_date= new java.sql.Date(new java.util.Date().getTime());

	@Column(name = "LAST_UPDATED_BY", updatable = true)
	private int last_updated_by;

	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "LAST_UPDATE_DATE" , updatable = true)
	private Date last_update_date= new java.sql.Date(new java.util.Date().getTime());
	
	@Column(name = "WF_INSTANCE_ID")
	private int wf_instance_id;
	
	@Column(name = "ATTRIBUTE1")
	private String attribute1;
	
	@Column(name = "ATTRIBUTE2")
	private String attribute2;
	
	@Column(name = "ATTRIBUTE3")
	private String attribute3;
	
	@Column(name = "ATTRIBUTE4")
	private String attribute4;

	@Column(name = "ATTRIBUTE5")
	private String attribute5;
	
	@Column(name = "ATTRIBUTE6")
	private String attribute6;
	
	@Column(name = "ATTRIBUTE7")
	private String attribute7;
	
	@Column(name = "ATTRIBUTE8")
	private String attribute8;
	
	@Column(name = "ATTRIBUTE9")
	private String attribute9;

//	public String getEntry_level() {
//		return entry_level;
//	}
//
//	public void setEntry_level(String entry_level) {
//		this.entry_level = entry_level;
//	}
//
//	public String getMain_qualifier() {
//		return main_qualifier;
//	}
//
//	public void setMain_qualifier(String main_qualifier) {
//		this.main_qualifier = main_qualifier;
//	}
//
//	public String getPoint_rewarded() {
//		return point_rewarded;
//	}
//
//	public void setPoint_rewarded(String point_rewarded) {
//		this.point_rewarded = point_rewarded;
//	}
//
//	
//
//	public String getConfidence_b() {
//		return confidence_b;
//	}
//
//	public void setConfidence_b(String confidence_b) {
//		this.confidence_b = confidence_b;
//	}
//
//	
//
//	public String getConfidence_d() {
//		return confidence_d;
//	}
//
//	public void setConfidence_d(String confidence_d) {
//		this.confidence_d = confidence_d;
//	}
//
//	public String getConfidence_y() {
//		return confidence_y;
//	}
//
//	public void setConfidence_y(String confidence_y) {
//		this.confidence_y = confidence_y;
//	}


}
