package com.tourInteraction.controller.article;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.controller.SignInAndUpController;
import com.tourInteraction.entity.User;
import com.tourInteraction.entity.article.ArticleSubject;
import com.tourInteraction.service.article.IArticleSubjectService;
import com.tourInteraction.utils.JSONUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/articleSubject")
public class ArticleSubjectController {
	
	@Resource(name="articleSubjectServiceImpl")
	private IArticleSubjectService	articleSubjectService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/getSubject.do")
	public @ResponseBody String getSubject(String limit,String offset){
		logger.info("articleSubject/getSubject.do被调用");

		List<ArticleSubject> list = new ArrayList<ArticleSubject>();
		list = articleSubjectService.getSubject(limit,offset);
		int count = articleSubjectService.getSubjectCount();
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", count);
		String result = JSONUtil.map2json(map);
		return result;
	}

	@RequestMapping("/getSubjectB.do")
	public @ResponseBody String getSubjectB(String limit,String offset){
		logger.info("articleSubject/getSubjectB.do被调用");

		List<ArticleSubject> list = new ArrayList<ArticleSubject>();
		list = articleSubjectService.getSubjectB(limit,offset);
		int count = articleSubjectService.getSubjectCountB();
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", count);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/getSubjectsByUserId.do")
	public @ResponseBody String getSubjectsByUserId(HttpServletRequest req,@RequestParam(value="userId")int userId){
		logger.info("articleSubject/getSubjectByUserId.do被调用");
		if(userId == 0){
			userId = (int)SignInAndUpController.getSignInUser(req).getId();
		}
		List<ArticleSubject> list = new ArrayList<ArticleSubject>();
		list = articleSubjectService.getSubjectsByUserId(userId);
		String result = JSONUtil.list2json(list);
		return result;
	}
	
	@RequestMapping("getSubjectById.do")
	public @ResponseBody String getSubjectById( @RequestParam("id") int id){
		ArticleSubject articleSubject = new ArticleSubject();
		logger.info("articleSubject/getSubjectById.do被调用");
		articleSubject = articleSubjectService.getSubjectById(id);
	
		String result = JSONUtil.object2json(articleSubject);
		return result;
	}

	@RequestMapping("getSubjectByIdB.do")
	public @ResponseBody String getSubjectByIdB( @RequestParam("id") int id){
		ArticleSubject articleSubject = new ArticleSubject();
		logger.info("articleSubject/getSubjectByIdB.do被调用");
		articleSubject = articleSubjectService.getSubjectByIdB(id);

		String result = JSONUtil.object2json(articleSubject);
		return result;
	}
	
	@RequestMapping("lockSubjectById.do")
	public @ResponseBody String lockSubjectById(HttpServletRequest req, @RequestParam("id") int id,@RequestParam("status") int status){
		logger.info("articleSubject/lockSubjectById.do被调用");
		User user = SignInAndUpController.getSignInUser(req);

		Map<String,Object> mapParam = new HashMap<String,Object>();
		mapParam.put("id",id);
		mapParam.put("status",status);
		mapParam.put("updateTime", new Date());
		mapParam.put("updateUser", user.getId());
		int num = articleSubjectService.updateSubject(mapParam);
		String result = "操作失败!";
		if(num > 0){
			result = "操作成功!";
		}
		return result;
	}

	@RequestMapping("delSubjectById.do")
	public @ResponseBody String delSubjectById( @RequestParam("id") int id){
		logger.info("articleSubject/delSubjectById.do被调用");

		int num = articleSubjectService.delSubjectById(id);
		String result = "删除失败!";
		if(num > 0){
			result = "删除成功!";
		}
		return result;
	}
	
	@RequestMapping("/updateSubject.do")
	public @ResponseBody String updateSubject(HttpServletRequest req, 
			@RequestParam("id") int id,
			@RequestParam("subjectTitle") String subjectTitle,
			@RequestParam("subjectDescription") String subjectDescription,
			@RequestParam("subjectIconId") String subjectIconId){
		logger.info("articleSubject/updateSubject.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("id", id);
		mapParam.put("subjectTitle", subjectTitle);
		mapParam.put("subjectDescription", subjectDescription);
		mapParam.put("subjectIconId", subjectIconId);
		mapParam.put("updateTime", new Date());
		mapParam.put("updateUser", user.getId());
		mapParam.put("status", GlobalConstantKey.STATUS_OPEN);

		int num = articleSubjectService.updateSubject(mapParam);
		String result = "修改失败";
		if(num>0){
			result = "修改成功";
			return result;
		}
		return result;
	}
	
	@RequestMapping("/addSubject.do")
	public @ResponseBody String addSubject(HttpServletRequest req, 
			@RequestParam("subjectTitle") String subjectTitle, 
			@RequestParam("subjectDescription") String subjectDescription,
			@RequestParam("subjectIconId") String subjectIconId,
			@RequestParam("subjectType") String subjectType){
		logger.info("articleSubject/addSubject.do被调用");
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("subjectTitle", subjectTitle);
		mapParam.put("subjectDescription", subjectDescription);
		mapParam.put("subjectType", subjectType);
		mapParam.put("subjectIconId", subjectIconId);
	
		mapParam.put("createTime", new Date());
		mapParam.put("createUser", user.getId());
		mapParam.put("status", GlobalConstantKey.STATUS_OPEN);
		
		int num = articleSubjectService.addSubject(mapParam);
		String result = "创建栏目失败";
		if(num>0){
			result = "创建栏目成功";
		}
		return result;
	}
	
	@RequestMapping("/requestSubmitArticle.do")
	public @ResponseBody String requestSubmitArticle(HttpServletRequest request,
			@RequestParam("subjectId") int subjectId,
			@RequestParam("subjectCreateUserId") int subjectCreateUserId,
			@RequestParam(value = "submitArticleIds[]",required=false) int[] submitArticleIds){
			User user = SignInAndUpController.getSignInUser(request);
			int num = articleSubjectService.requestSubmitArticle(user.getId(),subjectId,subjectCreateUserId,submitArticleIds);
			if(num>0){
				return "投稿成功等待审核通过";
			}
		return "投稿失败！";
	}

}
