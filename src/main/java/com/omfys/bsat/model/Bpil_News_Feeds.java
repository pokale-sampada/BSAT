package com.omfys.bsat.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "BPIL_NEWS_FEEDS")
public class Bpil_News_Feeds {
	
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="course_seq")
	@SequenceGenerator(name="course_seq", sequenceName="BPIL_NEWS_FEEDS_SEQ", allocationSize=1)
	
	@Column(name = "NEWS_FEED_ID")
	private int news_feed_id;
	
	@Column(name = "NEWS_TITLE")
	private String news_title;
	
	@Column(name = "NEWS_URL")
	private String news_url;	
	
	@Column(name = "CREATED_BY")
	private int created_by;
	
	@Column(name = "LAST_UPDATED_BY")
	private int last_updated_by;
	
	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "CREATION_DATE" , updatable = false)
	private Date creation_date = new java.sql.Date(new java.util.Date().getTime());
		
	@Column(name = "LAST_UPDATE_DATE" , updatable = true)
	private Date last_update_date = new java.sql.Date(new java.util.Date().getTime());

}
