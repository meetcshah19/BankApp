package com.controller;

import java.util.ArrayList;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class Online
 *
 */
@WebListener
public class Online implements HttpSessionAttributeListener {
	static int counter = 0; 
	static ArrayList<Integer> al;
	static ArrayList<String> sid;
	static{
	al=new ArrayList<Integer>();
	}
	public static int getCounter() {
	return counter;
	}
    /**
     * Default constructor. 
     */
    public Online() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent arg0)  { 
        HttpSession session = arg0.getSession();
        if(arg0.getName().equalsIgnoreCase("cid")){
        if(!al.contains(session.getAttribute("cid")))
        al.add((Integer) session.getAttribute("cid"));
        System.out.println("ins");
        counter++;
        sid.add(session.getId());
        }
        System.out.println("counter ="+counter+session);
        }

	public static ArrayList<Integer> getAl() {
		return al;
	}
	public static void setAl(ArrayList<Integer> al) {
		Online.al = al;
	}
	public static void setCounter(int counter) {
		Online.counter = counter;
	}
	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent arg0)  { 
    	HttpSession session = arg0.getSession();
        if(arg0.getName().equals("cid")){
        	try{
        	System.out.println(session.getAttribute("t"));
        	}catch(Exception e){
        		System.out.println(e);
        	}
        if(al.contains(session.getAttribute("t"))){
        al.remove(new Integer(session.getAttribute("t").toString()));}
        System.out.println("rem");
        counter--;System.out.println("counter--");
        System.out.println(al+"in remove");
        }
        System.out.println("counter ="+counter+session);
        }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent arg0)  { 
         // TODO Auto-generated method stub
    }
	
}
