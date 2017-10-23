package com.tourInteraction.serviceImpl;

import java.awt.Font;
import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tourInteraction.dao.FileManageDao;
import com.tourInteraction.dao.LoginDao;
import com.tourInteraction.entity.Files;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.ILoginService;
import com.tourInteraction.utils.FontImageUtil;
import com.tourInteraction.utils.StringUtil;
import com.tourInteraction.utils.UUIDUitl;

@Service("loginServiceImpl")
public class LoginServiceImpl implements ILoginService {
	
	private String suffix=".png";
	private String fileUse="user_icon";

	@Resource
	private LoginDao loginDao;
	@Autowired
	private FileManageDao fileManageDao;
	@Autowired
	private HttpServletRequest request;
	@Override
	public User getUser(User user) throws Exception {
		User userOut = loginDao.getUserDao(user);
		return userOut;
	}

	@Override
	@Transactional
	public boolean setUser(User user) {
		if(user.getUserName() != null && user.getUserName() != "" 
				&& user.getPassWord() != null && user.getPassWord() != ""
				&& user.getPhoneNumber() != null && user.getPhoneNumber() != ""
				&& user.getEmail() != null && user.getEmail() != ""){
			
			List<User> list= loginDao.checkAccount(user);
			if(list == null || list.size()==0){
				
				String iconText = StringUtil.getCharString(user.getUserName());
				   /**构建文件保存的目录**/
//		        String logoPathDir = "/files";
		        String logoPathDir = "/files/"+fileUse;
		        /**得到文件保存目录的真实路径**/
		        String logoRealPathDir = request.getServletContext().getRealPath(logoPathDir);
		        //生成文件名
		        String logImageName = UUIDUitl.generateLowerString(32)+suffix;
		        /**拼成完整的文件保存路径加文件，存到数据库**/
	            String fileName = logoPathDir + "/" + logImageName;
	            
	            /**拼成完整的文件真实保存路径加文件，存文件到服务器**/
	            String RealPath = logoRealPathDir + File.separator + logImageName;
	            try {
					FontImageUtil.createImage(iconText, new Font("宋体", Font.BOLD, 50), new File(RealPath));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Files file = new Files();
				file.setFilePath(fileName);
				file.setFileType(suffix);
				file.setFileUse(fileUse);
				file.setCreateTime(new Date());
				file.setStatus("1");
				fileManageDao.addFile(file);
				user.setUserIconId(file.getId());
				//注册用户
				int result = loginDao.setUserDao(user);

				if(result > 0){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}

		}else{
			return false;
		}
	}

	@Override
	public User getUserByUserNameDao(String username) {
		// TODO Auto-generated method stub
		return loginDao.getUserByUserNameDao(username);
	}



}
