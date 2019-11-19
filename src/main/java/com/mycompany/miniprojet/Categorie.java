/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.miniprojet;

/**
 *
 * @author pedago
 */
public class Categorie {
    
    private int code;
    private String libelle;
    private String description;
    
    public Categorie(int code, String libelle,String description){
    this.code=code;
    this.libelle= libelle;
    this.description = description;
    }
    
    public int getCode(){
        return this.code;
    }
    
    public String getLibelle(){
        return this.libelle;
    }
    
    public String getDescription(){
        return this.description;
    } 
}
