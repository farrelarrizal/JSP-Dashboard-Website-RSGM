package rsgm_unair.pasien_management;

import lombok.AccessLevel;
import lombok.Setter;
import lombok.Data;
import lombok.ToString;

@Data public class PagingPasien{

	private int perPage = 10;
	private int offset = 0;
	private String searchPasien;

}