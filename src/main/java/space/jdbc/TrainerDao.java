package space.jdbc;

import java.util.List;

import space.dto.Trainer;

public interface TrainerDao {
	public int isTrainer(int member_idx);
	public List<Trainer> trainerList();
}
