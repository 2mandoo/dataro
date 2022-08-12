package project.data.ro.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Mapper
public interface FileMapper {
	int fileupload(FileVO fvo);
	
}
