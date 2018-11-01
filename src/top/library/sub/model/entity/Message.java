package top.library.sub.model.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="oaec.T_MESSAGE")
public class Message implements Serializable {
	private static final long serialVersionUID = -1269966784513974129L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	@Column
	private String name;
	@Column
	private String dates;
	@Column
	private String msg;
	public Message() {}
	public Message(Long id, String name, String dates, String msg) {
		super();
		this.id = id;
		this.name = name;
		this.dates = dates;
		this.msg = msg;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", name=" + name + ", dates=" + dates + ", msg=" + msg + "]";
	};
	
}
