package KSJ.files.dao;

public class FilesDao {
	
	//Singleton
	private static FilesDao dao = null;
	
	private FilesDao() {
		
	}
	
	public static FilesDao getInstance() {
		if(dao == null) dao = new FilesDao();
		return dao;
	}
	
	
}
