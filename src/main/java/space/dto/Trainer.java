package space.dto;

public class Trainer {
	private int trainer_idx;
	private int member_idx;
	private String login_id;
	private String name;
	
	public Trainer() {}
	
	public Trainer(int trainer_idx, int member_idx) {
		super();
		this.trainer_idx = trainer_idx;
		this.member_idx = member_idx;
	}
	public int getTrainer_idx() {
		return trainer_idx;
	}
	public void setTrainer_idx(int trainer_idx) {
		this.trainer_idx = trainer_idx;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Trainer [trainer_idx=" + trainer_idx + ", member_idx=" + member_idx + "]";
	}
}
