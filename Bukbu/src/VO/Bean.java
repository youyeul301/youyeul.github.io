package VO;

public class Bean {
	private String userPw;
	private String userName;
	private String userId;
	private String email;
	private String emailInput;
	private String userCellNo1;
	private int userCellNo2;
	private int userCellNo3;
	
	
	public String getUserCellNo1() {
		return userCellNo1;
	}
	public void setUserCellNo1(String userCellNo1) {
		this.userCellNo1 = userCellNo1;
	}
	public int getUserCellNo2() {
		return userCellNo2;
	}
	public void setUserCellNo2(int userCellNo2) {
		this.userCellNo2 = userCellNo2;
	}
	public int getUserCellNo3() {
		return userCellNo3;
	}
	public void setUserCellNo3(int userCellNo3) {
		this.userCellNo3 = userCellNo3;
	}
	
	public String getEmailInput() {
		return emailInput;
	}
	public void setEmailInput(String emailInput) {
		this.emailInput = emailInput;
	}
	public String getuserPw() {
		return userPw;
	}
	public void setuserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
