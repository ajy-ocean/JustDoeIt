package com.justdoeit.entities;

import java.util.Date;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "justdoeit_notes")
public class JustDoeIt {

	@Id
	private int id;
	private String title;
	
	@Column(length = 1500)
	private String content;
	
	private Date dateAdded;

	// Contructors
	public JustDoeIt() {
		super();
	}

	public JustDoeIt(String title, String content, Date dateAdded) {
		super();
		this.id = new Random().nextInt(100000);
		this.title = title;
		this.content = content;
		this.dateAdded = dateAdded;
	}

	// Getterh & Setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}
}