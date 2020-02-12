package KSJ.files.dao;

import DB.DBConnection;

public class FilesDao {
	
	//Singleton
	private static FilesDao dao = null;
	
	private FilesDao() {
		DBConnection.initConnection();
	}
	
	public static FilesDao getInstance() {
		if(dao == null) dao = new FilesDao();
		return dao;
	}
	
	
}
