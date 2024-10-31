package space.common;

import space.jdbc.JdbcAttractionDao;
import space.jdbc.JdbcFree_BoardDao;
import space.jdbc.JdbcMemberDao;
import space.jdbc.JdbcNotice_BoardDao;
import space.jdbc.JdbcRecruit_BoardDao;
import space.jdbc.JdbcTrainerDao;

public class DAOManager {
	
	private static DAOManager instance = null;
	private DAOManager() {
		init();
	}
	
	public static DAOManager getInstance() {
		if (instance == null) {
			instance = new DAOManager();
		}
		
		return instance;
	}
	
	private JdbcFree_BoardDao fbDao;
	private JdbcMemberDao mDao;
	private JdbcRecruit_BoardDao rbDao;
	private JdbcNotice_BoardDao nbDao;
	private JdbcAttractionDao aDao;
	private JdbcTrainerDao tDao;
	
	private void init() {
		fbDao = new JdbcFree_BoardDao();
		rbDao = new JdbcRecruit_BoardDao();		
		nbDao = new JdbcNotice_BoardDao();
		aDao = new JdbcAttractionDao();
		tDao = new JdbcTrainerDao();
	}

	public JdbcFree_BoardDao getFbDao() {
		return fbDao;
	}

	public void setFbDao(JdbcFree_BoardDao fbDao) {
		this.fbDao = fbDao;
	}

	public JdbcMemberDao getmDao() {
		return mDao;
	}

	public void setmDao(JdbcMemberDao mDao) {
		this.mDao = mDao;
	}

	public JdbcRecruit_BoardDao getRbDao() {
		return rbDao;
	}

	public void setRbDao(JdbcRecruit_BoardDao rbDao) {
		this.rbDao = rbDao;
	}

	public JdbcNotice_BoardDao getNbDao() {
		return nbDao;
	}

	public void setNbDao(JdbcNotice_BoardDao nbDao) {
		this.nbDao = nbDao;
	}

	public JdbcAttractionDao getaDao() {
		return aDao;
	}

	public void setaDao(JdbcAttractionDao aDao) {
		this.aDao = aDao;
	}

	public JdbcTrainerDao gettDao() {
		return tDao;
	}

	public void settDao(JdbcTrainerDao tDao) {
		this.tDao = tDao;
	}	
	
	
	
}
