package space.common;

import space.jdbc.JdbcFree_BoardDao;
import space.jdbc.JdbcMemberDao;
import space.jdbc.JdbcNotice_BoardDao;
import space.jdbc.JdbcRecruit_BoardDao;

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
	
	private void init() {
		fbDao = new JdbcFree_BoardDao();		
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
	
	
	
	
	
}
