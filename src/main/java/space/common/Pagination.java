package space.common;

public class Pagination {
	private int currentPage = 1;
	private int pageSize;
	private int blockSize;
	private int startRow;
	private int endRow;
	private int totCnt;
	private int pageCnt;
	private int startPage;
	private int endPage; 
	private int orderNum;
	private int inverseNum;
	
	public Pagination(int currentPage, int pageSize, int blockSize, int startRow, int endRow, int totCnt, int pageCnt,
			int startPage, int endPage, int orderNum, int inverseNum) {
		super();
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		this.startRow = startRow;
		this.endRow = endRow;
		this.totCnt = totCnt;
		this.pageCnt = pageCnt;
		this.startPage = startPage;
		this.endPage = endPage;
		this.orderNum = orderNum;
		this.inverseNum = inverseNum;
	}
	
	public Pagination(int totCnt, String pageNum, int pageSize, int blockSize) {
		this.totCnt = totCnt;
		if (pageNum != null && !pageNum.equals("")) {
			currentPage = Integer.parseInt(pageNum);
		}
		
		
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotCnt() {
		return totCnt;
	}

	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getInverseNum() {
		return inverseNum;
	}

	public void setInverseNum(int inverseNum) {
		this.inverseNum = inverseNum;
	}
	
	
	
}
