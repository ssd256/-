package com.kh.green.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;


public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File originFile) {
		
		long currentTime = System.currentTimeMillis();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		int ranNum = (int)(Math.random()*100000);
		
		String name = originFile.getName();
		String ext = null;
		int dot = name.lastIndexOf(".");
		if(dot != -1) { //.포함하고있다.
			ext = name.substring(dot);
		} else { //확장자가 없다는 애기
			ext = "";
		}
		
		String fileName = sdf.format(new Date(currentTime)) + ranNum + ext; //util.date
		File newFile = new File(originFile.getParent(), fileName);
		
		
		
		return newFile;
	}
	
}
