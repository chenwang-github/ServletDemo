/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.pa1;

public class Item implements java.io.Serializable
{
    public String images;
    public String name;
    public int price;
    public int quantity;

    public Item()
    {
    }

    public Item(String aimages, String aname,
        int aPrice, int aQuantity)
    {
        images = aimages;
        name = aname;
        price = aPrice;
        quantity = aQuantity;
    }

}