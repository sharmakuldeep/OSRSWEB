package com.osrs

/**
 * Created by IntelliJ IDEA.
 * User: aman
 * Date: 9/17/12
 * Time: 12:08 PM
 * To change this template use File | Settings | File Templates.
 */
public enum HospitalType {

    govHospitals('Gov. Hospitals'), govDispensaries('Gov. Dispensaries'),
    primHealthCenter('Primary Health Centers'),subCenter('Sub-Centers'),
    commHealthCenter('Primary Health Centers'),familyWelCenter('Sub-Centers'),
    ayurCenter('Primary Health Centers'),homeoCells('Homeopathic Centers'),otherCenters('Sub-Centers')

    HospitalType(String value) { this.value = value }
    private final String value
    public String value() { return value }
}