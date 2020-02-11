package CYH;

import java.io.Serializable;

public class PagingDto implements Serializable{
	private int page = 1;			// 현재 페이지(get)
	private int totalCount;			// row 전체의 수(get)
	private int beginPage;			// 출력 시작
	private int endPage;			// 출력 끝
	private int displayRow = 5;	// 한 페이지에 몇 개의 글이 들어갈건가
	private int displayPage = 5;	// 한 블럭 당 몇 개의 페이지가 들어갈건가
	
	boolean prev;					// prev 버튼을 보여줄건가 아닌가
	boolean next;					// next 버튼을 보여줄건가 아닌가
	
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
		// setTotalCount()를 꼭 호출해야 paging이 되기 때문에
		// paging() 함수를 setTotalCount()를 호출했을 때 자동으로 호출되게 한다.
		this.totalCount = totalCount;
		paging();
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
	
	public boolean isNext() {
		return next;
	}
	
	private void paging() {
		// prev, next, beginPage, endPage를 계산해서 만든다.
		// 2+9=11, 11/10=1, 1*10=10
		// 10+9=19, 19/10=1, 1*10=10
		// 11+9=20, 20/10=2, 2*10=20
		// 20+9=29, 29/10=2, 2*10=20
		// 111+9=120, 120/10=12, 12*10=120
		
		// (2+9)/10*10 (1번방법)
		// endPage = ((page+(displayPage-1))/displayPage)*displayPage;
		
		// 1/10 0.1(올림) 1 (2번방법)
		endPage = ((int)Math.ceil(page/(double)displayPage)) * displayPage;		// 4번페이지와, 13번페이지를 본다고 생각하자
		System.out.println("endPage는 " + endPage);
		
		beginPage = endPage - (displayPage - 1);
		System.out.println("beginPage는 " + beginPage);
		
		int totalPage = (int)Math.ceil(totalCount/(double)displayRow);		// 전체 글수가 24개라 가정하면, 전체페이지수는 5개
		
		if(totalPage < endPage) {
			endPage = totalPage;
			next = false;
		}else {
			next = true;
		}
		
		prev = (beginPage == 1) ? false : true;		// page가 11 이상에만 나온다.
		
		System.out.println("endPage는 " + endPage);
		System.out.println("totalPage는 " + totalPage);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
