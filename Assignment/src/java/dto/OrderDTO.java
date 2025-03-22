/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author ADMIND
 */
public class OrderDTO {

    private int order_id;
    private int user_id;
    private String order_date;
    private double total_amount;
    private String status;
    private String address;
    private String phone;
    private String note;

    public OrderDTO() {
    }

    public OrderDTO(int order_id, int user_id, String order_date, double total_amount, String status, String address, String phone, String note) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.total_amount = total_amount;
        this.status = status;
        this.address = address;
        this.phone = phone;
        this.note = note;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "OrderDTO{" + "order_id=" + order_id + ", user_id=" + user_id + ", order_date=" + order_date + ", total_amount=" + total_amount + ", status=" + status + ", address=" + address + ", phone=" + phone + ", note=" + note + '}';
    }

}
