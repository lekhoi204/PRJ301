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
public class ProductDTO {
    private int product_id;
    private int category_id;
    private String name;
    private double price;
    private String description;
    private String image_url;
    private int quantity;

    public ProductDTO() {
    }

    public ProductDTO(int product_id, int category_id, String name, double price, String description, String image_url, int quantity) {
        this.product_id = product_id;
        this.category_id = category_id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image_url = image_url;
        this.quantity = quantity;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "ProductDTO{" + "product_id=" + product_id + ", category_id=" + category_id + ", name=" + name + ", price=" + price + ", description=" + description + ", image_url=" + image_url + ", quantity=" + quantity + '}';
    }

 
}
