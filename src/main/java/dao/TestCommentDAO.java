package dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import controller.CommentServlet;
import model.Comment;

public class TestCommentDAO {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		CommentDAO commentDAO = new CommentDAO();
		Comment comment = new Comment();
//		String imginputPath = "C:\\iSpan\\Code\\TravelWeb\\ref\\fall-min.jpg";
//		String imgOutputPath = "C:\\iSpan\\Code\\TravelWeb\\ref\\friends-min3.jpg";
//		
//		comment.setItemTb("hotel");
//		comment.setItemId(3);
//		comment.setUserId(1);
//		comment.setRate(5);
//		comment.setContent("Wonderful!");

//		try {
//			FileInputStream fileInputStream = new FileInputStream(imginputPath);
//			byte[] data = CommentDAO.readAllBytes(fileInputStream);
//			comment.setImages(data);
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
//	    boolean result = commentDAO.insert(comment);
//		
//		System.out.println(comment.getComId());
//		//		
//		comment = commentDAO.selectOne(6);

		System.out.println(comment.getComId());
		System.out.println(comment.getItemId());
		System.out.println(comment.getItemId());
		System.out.println(comment.getUserId());
		System.out.println(comment.getComDate());
		System.out.println(comment.getRate());
		System.out.println(comment.getContent());
		
//		List<Comment> comments = commentDAO.selectAll();
//		for (Comment comment2 : comments) {
//			System.out.println(comment2.getComId());
//			System.out.println(comment2.getItemId());
//			System.out.println(comment2.getItemId());
//			System.out.println(comment2.getUserId());
//			System.out.println(comment2.getComDate());
//			System.out.println(comment2.getRate());
//			System.out.println(comment2.getContent());
//		}

//		System.out.println(commentDAO.delete(19));
		
//		try {
//			FileOutputStream fileOutputStream = new FileOutputStream(imgOutputPath);
//			fileOutputStream.write(comment.getImages());
//			fileOutputStream.close();
//			System.out.println("File output is successful!");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

	}

}
