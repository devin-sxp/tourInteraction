package com.tourInteraction.serviceImpl.article;

import java.util.*;

import javax.annotation.Resource;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.controller.SignInAndUpController;
import com.tourInteraction.dao.MessageRemindDao;
import com.tourInteraction.utils.JSONUtil;
import com.tourInteraction.websocket.NotifyWebSocket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tourInteraction.dao.article.ArticleDao;
import com.tourInteraction.entity.article.Article;
import com.tourInteraction.entity.article.ArticleRequestSubmit;
import com.tourInteraction.service.article.IArticleService;

@Service("articleServiceImpl")
public class ArticleServiceImpl implements IArticleService {

	@Resource
	private ArticleDao articleDao;

	@Autowired
	private MessageRemindDao messageRemindDao;

	@Override
	public List<Article> getNowUserArticle(int userId, String limit, String offset) {
		// TODO Auto-generated method stub
		return articleDao.getNowUserArticle(userId, limit, offset);
	}

	@Override
	public Article getArticleById(int id) {
		// TODO Auto-generated method stub
		return articleDao.getArticleById(id);
	}

	@Override
	public int writeArticle(Article article) {
		// TODO Auto-generated method stub
		return articleDao.writeArticle(article);
	}

	@Override
	public int getNowUserArticleCount(int userId) {
		// TODO Auto-generated method stub
		return articleDao.getNowUserArticleCount(userId);
	}

	@Override
	public List<Article> getArticles(String limit, String offset) {
		// TODO Auto-generated method stub
		return articleDao.getArticles(limit,offset);
	}

	@Override
	public int getArticleCount() {
		return articleDao.getArticleCount();
	}

	@Override
	@Transactional(readOnly=true)
	public Map<String, Object> getArticlesBySubjectId(int subjectId,int limit,int offset) {
		ArrayList<Article> list = new ArrayList<Article>(articleDao.getArticlesBySubjectId(subjectId,limit,offset));
		int count = articleDao.getArticleCountBySubjectId(subjectId);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("count", count);
		map.put("list", list);
		return map;
	}

	@Override
	@Transactional
	public Map<String, Object> getArticleAuthorBySubjectId(int subjectId, int limit, int offset) {
		ArrayList<Article> list = new ArrayList<Article>(articleDao.getArticleAuthorBySubjectId(subjectId,limit,offset));
		int count = articleDao.getArticleAuthorCountBySubjectId(subjectId);
		Map<String,Object> map = new HashMap<String , Object>();
		map.put("count", count);
		map.put("list", list);
		return map;
	}

	@Override
	public List<ArticleRequestSubmit> getArticleRequestSubmitNews(int userId) {
		
		return articleDao.getArticleRequestSubmitNews(userId);
	}

	@Override
	@Transactional
	public int dealArticleRequestSubmitNews(Map<String, Object> map) {
		int num = articleDao.updateArticleRequestSubmit(map);
		Integer isPass = (Integer) map.get("isPass");
		if(isPass == 1){
			num = articleDao.passSubmitArticle(map); //设置文章的专栏
		}
		return num;
	}

	@Override
	@Transactional
	public int updateArticle(Map<String, Object> map) {
		return articleDao.updateArticle(map);
	}

	/**
	 * 已经喜欢了就取消喜欢，没有喜欢就喜欢
	 * @param map
	 * @return
	 */
	@Override
	@Transactional
	public String loveArticle(Map<String, Object> map) {
		int num = articleDao.isLoveThisArticle(map);
		String result="";
		Map<String,Object> retMap = new HashMap<String,Object>();

		if(num>0){
			retMap.put("type","cancer_love");
			int num1 = articleDao.loveArticleToDel(map);
			map.put("loveCountAddValue", GlobalConstantKey.LOVE_COUNT_SUB_VALUE);
			int num2 = articleDao.updateArticle(map);
			if(num1>0 && num2>0){
				retMap.put("result","取消喜欢成功!");
				retMap.put("status","success");
			}else{
				retMap.put("result","取消喜欢失败!");
				retMap.put("status","failed");
			}
		}else{
			retMap.put("type","add_love");
			int num1 = articleDao.loveArticleToAdd(map);
			map.put("loveCountAddValue", GlobalConstantKey.LOVE_COUNT_ADD_VALUE);
			int num2 = articleDao.updateArticle(map);
			if(num1>0 && num2>0){
				retMap.put("result","喜欢收藏成功!");
				retMap.put("status","success");
			}else{
				retMap.put("result","喜欢收藏失败!");
				retMap.put("status","failed");
			}
		}
		return JSONUtil.map2json(retMap);
	}

	@Override
	public Boolean isLoveThisArticle(Map<String, Object> map) {
		int num = articleDao.isLoveThisArticle(map);
		if(num>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Article> getLovedArticles(Map<String, Object> mapParam) {
		return articleDao.getLovedArticles(mapParam);
	}

	@Override
	public List<ArticleRequestSubmit> getArticleRequestSubmitNewsByType(String type) {
		return articleDao.getArticleRequestSubmitNewsByType(type);
	}

	@Override
	@Transactional
	public Boolean delArticleById(int articleId, int level, String opIdentity, String articleName, int targetUserId,int createUser) {
		int num = 0;
		String opString = "";
		if(level == GlobalConstantKey.DELETE_LEVEL_ONE){
			num = articleDao.updateArticleStatus("0",articleId);
			opString = "被管理员删除";
		}else if (level == GlobalConstantKey.DELETE_LEVEL_TWO) {
			num = articleDao.delArticleById(articleId);
			opString = "被管理员彻底删除";
		}else {
			return false;
		}
		if(opIdentity.equals(GlobalConstantKey.OP_USER_IDENTITY_ADMIN)){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("targetUserId", targetUserId);
			map.put("createUser",createUser);
			map.put("createTime", new Date());
			map.put("status", "1");
			map.put("type","notify");
			map.put("msgRemindId",0);
			num = messageRemindDao.insertMessageRemind(map);//msgRemindId被设置为新id
			map.put("notifyTitle","<font style='color:red'>《"+articleName+"》</font>"+opString);
			map.put("notifyDescription","<font style='color:red'>《"+articleName+"》</font>"+opString);
			num = messageRemindDao.insertMessageRemindDetail(map);
			if(num>0){
				NotifyWebSocket.sendUser(articleName,targetUserId+"");
				return true;
			}
		}
		if(num>0){
			return true;
		}else {
			return false;
		}
	}

}
