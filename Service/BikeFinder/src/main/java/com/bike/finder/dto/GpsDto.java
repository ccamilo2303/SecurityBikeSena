package com.bike.finder.dto;
/**
 * @author Cristian Camilo Beltrán <ccamilo2303@gmail.com>
 * @since  8 oct. 2020
 */
public class GpsDto {
	
	private int idGps;

	public int getIdGps() {
		return idGps;
	}

	public void setIdGps(int idGps) {
		this.idGps = idGps;
	}

	@Override
	public String toString() {
		return "GpsDto [idGps=" + idGps + "]";
	}

	
}
