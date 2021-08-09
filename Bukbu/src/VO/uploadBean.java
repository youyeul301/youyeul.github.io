package VO;

public class uploadBean {

	private int num;
	private String writer;
	private String subject;
	private String contents;
	private String date;
	private String pw;
	private int hit;
	private String filename;
	private String origfname;
	private int filesize;
	private int downcount;
	private int ref;
	
	public int getNum() {
		System.out.println("uploadBean num : "+num);
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getOrigfname() {
		return origfname;
	}
	public void setOrigfname(String origfname) {
		this.origfname = origfname;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}

}
