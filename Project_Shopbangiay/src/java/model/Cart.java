/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public Item getItembyID(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityByID(int id) {
        return getItembyID(id).getQuantity();
    }

    public void addItem(Item m) {
        if (getItembyID(m.getProduct().getId()) != null) {
            Item i = getItembyID(m.getProduct().getId());
            i.setQuantity(i.getQuantity() + m.getQuantity());
        } else {
            items.add(m);
        }
    }

    public void removeItem(int id) {
        if (getItembyID(id) != null) {
            items.remove(getItembyID(id));
        }
    }

    public double getTotalMoney() {
        double money = 0;
        for (Item item : items) {
            money += (item.getQuantity() * item.getPrice());
        }
        return money;
    }

    public Product getProductByID(int id, List<Product> list) {
        for (Product p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }
    
    public Cart(String txt,List<Product> list){
        items = new ArrayList<>();
        if(txt != null || txt.length()!=0){
            String[] s = txt.split("or");
            for (String str : s) {
                String[] i = str.split("and");
                int id = Integer.parseInt(i[0]);
                int quantity = Integer.parseInt(i[1]);
                Product p = getProductByID(id, list);
                Item t = new Item(p, p.getPrice(), quantity);
                addItem(t);
            }
        }
    }
}
