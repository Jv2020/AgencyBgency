package CYH;

import java.util.List;

public class MainClass {
	public static void main(String[] args) {
		ReviewDao dao = ReviewDao.getInstance();
		
		List<ReviewDto> list = dao.getReviewList();
		
		System.out.println(list.size());
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
			ReviewDto dto = list.get(i);
			String id = dto.getId();
			System.out.println(id);
			dto.getTitle();
			dto.getRegdate();
		}
	}
}
