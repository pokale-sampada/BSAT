package com.omfys.bsat.repository;

import org.springframework.transaction.annotation.Transactional;

import com.omfys.bsat.model.Bpil_Opa_Rw_Analysis_Rw;
import com.omfys.bsat.model.Bpil_Scheme_Doc;
import com.omfys.bsat.model.Crm_Bpil_Scheme_Doc;
import com.omfys.bsat.model.New_Scheme_mstr;
import com.omfys.bsat.model.New_Scheme_mstr_for_Crm;
@Transactional(readOnly = false)
public interface SchemeRequestDao {

	public int saveheader(New_Scheme_mstr new_scheme);
	public int crmsaveheader(New_Scheme_mstr_for_Crm new_scheme);
	public int savedocs(Bpil_Scheme_Doc docs);
	public int crmsavedocs(Crm_Bpil_Scheme_Doc docs);
	public int saverwdocs(Bpil_Opa_Rw_Analysis_Rw rw1);
	public int savegift(int user_id,int new_scheme_id,int len, String[] sche_code,String[] gift_id,String[] gift_group,
			String[] gift_name,String[] effective_price);
	public int copysavegift(int user_id,int new_scheme_id,int len, String[] sche_code,String[] gift_id,String[] gift_group,
			String[] gift_name,String[] effective_price);
	public int saveproduct(int len1,int new_scheme_id,String[] sch_prd_unique_id,String[] sch_prd_line_type,String[] sch_product_id,
			String[] sch_prd_exceptions,String[] vol_grwth_pct,String[] val_grwth_pct,String[] spread_pct,String[] spend_per_ltr);
	public int saveitproduct(int len1, int new_scheme_id, String[] sch_it_prd_dtls_id, String[] sch_prd_code,
			String[] sch_prd_grp, String[] sch_prd_cat, String[] sch_prd_cat_desc);
	public int savecust_type(int custlen, String[] cust_type, int new_scheme_id);
	public int saveproductoutflow(int len1, int new_scheme_id, String[] sch_prd_outflow_unique_id,
			String[] sch_prd_outflow_line_type, String[] sch_product_outflow_id, 
			String[] sch_prd_lly_vol, String[] sch_prd_lly_val, String[] sch_prd_ly_vol, String[] sch_prd_ly_val, 
			String[] sch_prd_spread_tgt_vol, String[] sch_prd_spread_tgt_val, 
			String[] sch_prd_spread_mtd_ly_vol, String[] sch_prd_spread_mtd_ly_val,
			String[] proj_grwth_vol_pct, String[] proj_grwth_val_pct, String[] proj_grwth_spd_pct, 
			String[] sch_prd_ty_vol, String[] sch_prd_ty_val, 
			String[] sch_prd_spread_mtd_ty_tgt_vol, String[] sch_prd_spread_mtd_ty_tgt_val,
			String[] sch_prd_wt_avg, String[] sch_prd_total_prd_bdgt);
	public int copysaveproductoutflow(int len1, int new_scheme_id, String[] sch_prd_outflow_unique_id,
			String[] sch_prd_outflow_line_type, String[] sch_product_outflow_id, 
			String[] sch_prd_lly_vol, String[] sch_prd_lly_val, String[] sch_prd_ly_vol, String[] sch_prd_ly_val, 
			String[] sch_prd_spread_tgt_vol, String[] sch_prd_spread_tgt_val, 
			String[] sch_prd_spread_mtd_ly_vol, String[] sch_prd_spread_mtd_ly_val,
			String[] proj_grwth_vol_pct, String[] proj_grwth_val_pct, String[] proj_grwth_spd_pct,
			String[] sch_prd_ty_vol, String[] sch_prd_ty_val, 
			String[] sch_prd_spread_mtd_ty_tgt_vol, String[] sch_prd_spread_mtd_ty_tgt_val,
			String[] sch_prd_wt_avg, String[] sch_prd_total_prd_bdgt);
}
