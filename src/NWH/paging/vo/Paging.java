package NWH.paging.vo;

public class Paging {
	private int page = 1; // 현재 페이지(get)
	private int totalCount; // row 전체의 수(get)
	private int beginPage; // 출력 시작
	private int endPage; // 출력 끝
	private int displayRow = 10; // 한 페이지에 몇 개의 로우(선택 set)
	private int displayPage = 10; // 한 페이지에 몇 개의 페이지(선택 set)
	boolean prev; // prev 버튼이 보일건지 안보일건지
	boolean next; // next 버튼이 보일건지 안보일건지
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void paging() {
		endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage; // 5개 페이지가 있으면 0.5 -> 올림해서 1 -> 10
		System.out.println("endPage: " + endPage); 
		
		beginPage = endPage - (displayPage - 1); // 10 - (10 - 1) = 1, 20 - ( 10 - 1) = 11
		System.out.println("beginPage: " + beginPage);
		
		int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
		
		if(totalPage<endPage) {
			endPage = totalPage;
			next = false;
		} else {
			next = true;
		}
		prev = (beginPage==1)?false:true;
		System.out.println("endPage: " + endPage);
		System.out.println("totalPage: " + totalPage);
	}
	
}
