package com.osrs

/**
 * Created by IntelliJ IDEA.
 * User: Aman
 * Date: 5/18/12
 * Time: 6:06 PM
 * To change this template use File | Settings | File Templates.
 */
public enum DataStatus {
 INPROGRESS('IP'), COMPLETED('CP')

    DataStatus(String value) { this.value = value }
    private final String value
    public String value() { return value }

}