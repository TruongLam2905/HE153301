/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Transaction {

    private int trans_id;
    private String trans_name;
    private Customer customer;
    private Employee employee;
    private Date trans_date;
    private float amount;
    private ArrayList<Booking> Bookings = new ArrayList<>();

    public ArrayList<Booking> getBookings() {
        return Bookings;
    }

    public void setBookings(ArrayList<Booking> Bookings) {
        this.Bookings = Bookings;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public int getTrans_id() {
        return trans_id;
    }

    public void setTrans_id(int trans_id) {
        this.trans_id = trans_id;
    }

    public String getTrans_name() {
        return trans_name;
    }

    public void setTrans_name(String trans_name) {
        this.trans_name = trans_name;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Date getTrans_date() {
        return trans_date;
    }

    public void setTrans_date(Date trans_date) {
        this.trans_date = trans_date;
    }

}
