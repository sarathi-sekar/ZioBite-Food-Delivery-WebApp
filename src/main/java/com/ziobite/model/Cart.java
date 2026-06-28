package com.ziobite.model;

import java.util.Collection;
import java.util.HashMap;

public class Cart {

    private HashMap<Integer, CartItem> items = new HashMap<>();

    public void addItem(CartItem item) {

        int menuId = item.getMenuId();

        if(items.containsKey(menuId)) {

            CartItem existingItem = items.get(menuId);

            existingItem.setQuantity(existingItem.getQuantity() + 1);

        } else {

            items.put(menuId, item);
        }
    }

    public void increaseItem(int menuId) {

        if(items.containsKey(menuId)) {

            CartItem item = items.get(menuId);

            item.setQuantity( item.getQuantity() + 1);
        }
    }

    public void decreaseItem(int menuId) {

        if(items.containsKey(menuId)) {

            CartItem item = items.get(menuId);

            if(item.getQuantity() > 1) {

                item.setQuantity( item.getQuantity() - 1);

            } else {

                items.remove(menuId);
            }
        }
    }

    public void updateItem(int menuId, int quantity) {

        if(items.containsKey(menuId)) {

            items.get(menuId) .setQuantity(quantity);
        }
    }

    public void removeItem(int menuId) {

        items.remove(menuId);
    }

    public Collection<CartItem> getItems() {

        return items.values();
    }

    public double getTotalPrice() {

        double total = 0;

        for(CartItem item : items.values()) {

            total += item.getTotalPrice();
        }

        return total;
    }

    public boolean isEmpty() {

        return items.isEmpty();
    }
    
    public void clearCart() {

        items.clear();
    }
}