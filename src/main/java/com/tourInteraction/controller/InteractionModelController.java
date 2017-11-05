package com.tourInteraction.controller;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.entity.InteractionModel;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IInteractionModelService;
import com.tourInteraction.utils.JSONUtil;
import com.tourInteraction.utils.UUIDUitl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/interactionModel")
public class InteractionModelController {
	
	@Resource(name="interactionModelServiceImpl")
	private IInteractionModelService interactionModelService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping("/getModel.do")
	public @ResponseBody String getModel(String limit,String offset){
		logger.info("interactionModel/getModel.do被调用");
		List<InteractionModel> list = new ArrayList<InteractionModel>();
		list = interactionModelService.getModel(limit,offset);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", 10);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("getModuleById.do")
	public @ResponseBody String getModuleById( @RequestParam("id") int id){
		InteractionModel interactionModel = new InteractionModel();
		logger.info("interactionModel/getModuleById.do被调用");
		interactionModel = interactionModelService.getModuleById(id);
	
		String result = JSONUtil.object2json(interactionModel);
		return result;
	}
	
	@RequestMapping("delModuleById.do")
	public @ResponseBody String delModuleById( @RequestParam("id") int id){
		logger.info("interactionModel/delModuleById.do被调用");
		
		int num = interactionModelService.delModuleById(id);
		String result = "删除失败!";
		if(num > 0){
			result = "删除成功!";
		}
		return result;
	}
	
	@RequestMapping("/updateModule.do")
	public @ResponseBody String updateModule(HttpServletRequest req, 
			@RequestParam("id") int id,
			@RequestParam("moduleName") String moduleName, 
			@RequestParam("moduleDiscription") String moduleDiscription,
			@RequestParam("moduleLabel") String moduleLabel,
			@RequestParam("moduleIcon") String moduleIcon){
		logger.info("interactionModel/updateModule.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("id", id);
		mapParam.put("moduleName", moduleName);
		mapParam.put("moduleDiscription", moduleDiscription);
		mapParam.put("moduleLabel", moduleLabel);
		mapParam.put("moduleIcon", moduleIcon);
		mapParam.put("updateTime", new Date());
		mapParam.put("updateUser", user.getId());
		mapParam.put("status", GlobalConstantKey.STATUS_OPEN);

		int num = interactionModelService.updateModule(mapParam);
		String result = "修改失败";
		if(num>0){
			result = "修改成功";
			return result;
		}
		return result;
	}
	
	@RequestMapping("/addModule.do")
	public @ResponseBody String addModule(HttpServletRequest req, 
			@RequestParam("moduleName") String moduleName, 
			@RequestParam("moduleDiscription") String moduleDiscription,
			@RequestParam("moduleLabel") String moduleLabel,
			@RequestParam("moduleIcon") String moduleIcon){
		logger.info("interactionModel/addModule.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("moduleName", moduleName);
		mapParam.put("moduleDiscription", moduleDiscription);
		mapParam.put("moduleLabel", moduleLabel);
		mapParam.put("moduleIcon", moduleIcon);
	
		mapParam.put("createTime", new Date());
		mapParam.put("createUser", user.getId());
		mapParam.put("status", GlobalConstantKey.STATUS_OPEN);
		
		int num = interactionModelService.addModule(mapParam);
		String result = "增加失败";
		if(num>0){
			result = "增加成功";
			return result;
		}
		return result;
	}
	
	 /**
     * 上传
     * @param 
     * @return
     */
    @RequestMapping(value = "/uploadFile.do")
    public @ResponseBody String uploadFile(HttpServletRequest request,HttpServletResponse response) throws Exception{
        response.setHeader("X-Frame-Options","SAMEORIGIN");
        logger.info("invoke----------/interactionModel/uploadFile.do");
        List<String> result = new ArrayList<String>();
        List<Long> rs=new ArrayList<Long>();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");
        /**构建文件保存的目录**/
        String logoPathDir = "/files";
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
        MultipartFile multipartFile = multiRequest.getFile("file");
        if (multiRequest.getMultiFileMap().size() == 0) {
            return "未选择文件或未指定文件参数名";
        }
        String retPath = "";
        String retrunPath="";
        if (multipartFile != null) {
            /**获取文件的后缀**/
            String suffix = multipartFile.getOriginalFilename().substring
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
                result.add(fileName);
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        // }
        System.out.println(retrunPath);
        return retrunPath;
    }

}
