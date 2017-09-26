package com.tourInteraction.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tourInteraction.entity.InteractionComment;
import com.tourInteraction.entity.InteractionReply;
import com.tourInteraction.entity.User;
import com.tourInteraction.service.IInteractionCommentService;
import com.tourInteraction.utils.JSONUtil;

@Controller
@RequestMapping("/interactionComment")
public class InteractionCommentController {
	
	@Resource(name="interactionCommentServiceImpl")
	private IInteractionCommentService interactionCommentService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/getCommentByNewsId.do")
	public @ResponseBody String getCommentByNewsId(@RequestParam("newsId") int newsId){
		
		logger.debug("getCommentByNewsId.do被调用");
		List<InteractionComment> list = new ArrayList<InteractionComment>();
		Map<String, Object> mapParam = new HashMap<String, Object>();
		
		mapParam.put("newsId", newsId);
		int count = interactionCommentService.getCommentCount(mapParam);
		list = interactionCommentService.getComment(mapParam);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", count);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	@RequestMapping("/getReplyByCommentId.do")
	public @ResponseBody String getReplyByCommentId(@RequestParam("commentId") int commentId){
		
		logger.debug("getReplyByCommentId.do被调用");
		List<InteractionReply> list = new ArrayList<InteractionReply>();
		Map<String, Object> mapParam = new HashMap<String, Object>();
		
		mapParam.put("commentId", commentId);
		int count = interactionCommentService.getReplyCountByCommentId(mapParam);
		list = interactionCommentService.getReplyByCommentId(mapParam);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", count);
		String result = JSONUtil.map2json(map);
		return result;
	}
	
	
	@RequestMapping("/addCommentAndReply.do")
	public @ResponseBody String addCommentAndReply(HttpServletRequest req, 
			@RequestParam(value="newsId",defaultValue="0") int newsId, 
			@RequestParam(value="commentId",defaultValue="0") int commentId, 
			@RequestParam(value="targetUser",defaultValue="0") int targetUser,
			@RequestParam("commentContent") String commentContent){
		
		logger.debug("addCommentAndReply.do被调用");
		int num = 0;
		User user = SignInAndUpController.getSignInUser(req);
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("targetUser", targetUser);
		mapParam.put("commentOrReplyContent", commentContent);
		mapParam.put("createTime", new Date());
		mapParam.put("createUser", user.getId());
		mapParam.put("status", "1");
		
		if(newsId != 0){
			mapParam.put("newsId", newsId);
			num = interactionCommentService.addComment(mapParam);

		}else{
			mapParam.put("commentId", commentId);
			num = interactionCommentService.addReply(mapParam);

		}

		String result = "回复失败";
		if(num>0){
			result = "回复成功";
			return result;
		}
		return result;
	}
}
