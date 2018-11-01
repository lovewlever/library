package top.library.sub.model.entity;

import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "oaec.T_FILE")
public class UserFile {

	private Long id;
	private String filename;
	private String filepath;
	private String filesize;
	private String fileshare;
	private String uploadtime;
	private User user;

	public UserFile() {
	}

	public UserFile(Long id, String filename, String filepath, String filesize, String fileshare, String uploadtime,
			User user) {
		super();
		this.id = id;
		this.filename = filename;
		this.filepath = filepath;
		this.filesize = filesize;
		this.fileshare = fileshare;
		this.uploadtime = uploadtime;
		this.user = user;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String getFileshare() {
		return fileshare;
	}

	public void setFileshare(String fileshare) {
		this.fileshare = fileshare;
	}

	public String getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(String uploadtime) {
		this.uploadtime = uploadtime;
	}

	@ManyToOne
	@JoinColumn(name = "user_id")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "File [id=" + id + ", filepath=" + filepath + ", filesize=" + filesize + ", fileshare=" + fileshare
				+ ", uploadtime=" + uploadtime + ", user=" + "]";
	}

}
