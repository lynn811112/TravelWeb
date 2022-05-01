package dao;

import model.Comment;

public class TestCommentDAO {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		CommentDAO commentDAO = new CommentDAO();
				
		Comment comment = new Comment();
		
		
//		commentDAO.insert(comment);
		comment = commentDAO.getOne(1);
		System.out.println(comment.getContent());
		

	}

}
