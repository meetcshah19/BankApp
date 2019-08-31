package com.controller;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.swing.text.html.HTML.Tag;

public class Mytag extends SimpleTagSupport{
	String name; 
@Override
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		out.println("Welcome "+name);
	}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}	
	
	
}
  