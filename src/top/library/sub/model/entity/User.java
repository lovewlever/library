package top.library.sub.model.entity;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "oaec.T_USER")
public class User implements Serializable {
	private static final long serialVersionUID = -1832472929497463965L;
	private Long id;
	private String uemail;
	private String uname;
	private String upass;
	private String registration;
	private String uadmin;
	private Set<UserFile> files = new HashSet<UserFile>();

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	public Set<UserFile> getFiles() {
		return files;
	}

	public void setFiles(Set<UserFile> file) {
		this.files = file;
	}

	public User() {
	};

	public User(Long id, String uemail, String uname, String upass, String registration, String uadmin,
			Set<UserFile> files) {
		super();
		this.id = id;
		this.uemail = uemail;
		this.uname = uname;
		this.upass = upass;
		this.registration = registration;
		this.uadmin = uadmin;
		this.files = files;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUemail() {
		return uemail;
	}

	public void setUemail(String uemail) {
		this.uemail = uemail;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getUadmin() {
		return uadmin;
	}

	public void setUadmin(String uadmin) {
		this.uadmin = uadmin;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", uemail=" + uemail + ", uname=" + uname + ", upass=" + upass + ", registration="
				+ registration + ", uadmin=" + uadmin + "]";
	}

}
