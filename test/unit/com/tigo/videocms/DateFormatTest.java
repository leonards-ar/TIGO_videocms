package com.tigo.videocms;

import static org.junit.Assert.*;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.junit.Test;


public class DateFormatTest {

	@Test
	public void testTigoFormat(){
		String tigoFormat = "2 de septiembre de 2010";
		Calendar testDate = Calendar.getInstance();
		testDate.set(2010, 8, 2);
		DateFormat df = DateFormat.getDateInstance(DateFormat.LONG, new Locale("es"));
		String now = df.format(testDate.getTime());
		assertEquals(tigoFormat, now);
	}
}
