package com.osrs

/**
 * Created by IntelliJ IDEA.
 * User: aman
 * Date: 9/17/12
 * Time: 10:55 AM
 * To change this template use File | Settings | File Templates.
 */
public enum Categories {
  INFRASTRUCTURE('Infrastructure'), EDUCATION('Education') ,HEALTH('HealthAndFamilyWelfare')

    Categories(String value) { this.value = value }
    private final String value
    public String value() { return value }
}