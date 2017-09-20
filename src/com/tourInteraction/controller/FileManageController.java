package com.tourInteraction.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tourInteraction.entity.Files;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IFileManageService;
import com.tourInteraction.utils.UUIDUitl;

@Controller
@RequestMapping("/fileManage")
public class FileManageController {
	
	@Autowired
	private IFileManageService fileManageService;
	
	 /**
     * 上传
     * @param 
     * @return
     */
    @RequestMapping(value = "/uploadFile.do")
    public @ResponseBody String uploadFile(MultipartHttpServletRequest request,
    		HttpServletResponse response,
    		@RequestParam("fileUse") String fileUse,
    		@RequestParam("inputFile") String inputFile
    		) throws Exception{
        response.setHeader("X-Frame-Options","SAMEORIGIN");
        
        System.out.println("invoke----------/fileManage/uploadFile.do");
        /**构建文件保存的目录**/
//        String logoPathDir = "/files";
        String logoPathDir = "/files/"+fileUse;
        /**得到文件保存目录的真实路径**/
        String logoRealPathDir = request.getServletContext().getRealPath(logoPathDir);
            try{
                /**根据真实路径创建目录**/
                File logoSaveFile = new File(logoRealPathDir);
                if (!logoSaveFile.exists())
                    logoSaveFile.mkdirs();
            }catch (Exception e){
                e.printStackTrace();
            }
    
        /**页面控件的文件流**/
        MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multiRequest.getFile(inputFile);
        if (multiRequest.getMultiFileMap().size() == 0) {
            return "未选择文件或未指定文件参数名";
        }
        String retPath = "";
        String retrunPath="";
        String suffix = "";
        String orginName = "";
        if (multipartFile != null) {
        	/**
        	 * 文件原始名字
        	 */
        	orginName = multipartFile.getOriginalFilename();
            /**获取文件的后缀**/
            suffix = multipartFile.getOriginalFilename().substring
                    (multipartFile.getOriginalFilename().lastIndexOf("."));
            /**使用UUID生成文件名称**/
            String logImageName = UUIDUitl.generateLowerString(32) + suffix;//构建文件名称
            /**拼成完整的文件保存路径加文件**/
            String fileName = logoPathDir + File.separator + logImageName;
            //返回给客户端的路径
            retPath = logoRealPathDir + File.separator + logImageName;
            File file = new File(retPath);
            try {
                multipartFile.transferTo(file);
                fileName= fileName.replaceAll("\\\\", "/");
                retrunPath=fileName;
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        }
        User user = SignInAndUpController.getSignInUser(request);
		Files file = new Files();
		file.setFileName(orginName);
		file.setFilePath(retrunPath);
		file.setFileType(suffix);
		file.setFileUse(fileUse);
		file.setCreateTime(new Date());
		file.setCreateUser(user.getId());
		file.setStatus("1");
		int fileId = fileManageService.addFile(file);
		if(fileId>0){
			return fileId+"";
		}
        System.out.println(fileId);
        return "上传失败";
    }

}
