package com.hudongwx.studentsys.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.Common;
import com.hudongwx.studentsys.util.ObjectKit;
import com.hudongwx.studentsys.util.RenderKit;
import com.hudongwx.studentsys.service.TestQuestionnaireQuestionService;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

import java.util.*;

/**
 * Created by wuhongxu on 2016/10/8 0008.
 */
public class TestController extends BaseController{
    public TestTypeService testTypeService;
    public TestTagService testTagService;
    public TestQuestionService testQuestionService;
    public TestTagQuestionService testTagQuestionService;
    public RoleService roleService;
    public UserService userService;
    public MappingService mappingService;
    public TestQuestionnaireService testQuestionnaireService;
    public TestDomainService testDomainService;
    public TestQuestionnaireQuestionService testQuestionnaireQuestionService;
    /**
     * @return 返回mapping的title属性
     */
    @Override
    public String init() {
        return "我的考试";
    }
    public void history(){
        setMapping(mappingService.getMappingByTitle("考试历史"));
        super.index();
        User user = getCurrentUser(this);
        List<TestQuestionnaire> questionnaires = testQuestionnaireService.getQuestionnaireByUser(user);
        setAttr("testing",questionnaires);
        setAttr("nowTime",System.currentTimeMillis());
    }
    public void testList(){
        setMapping(mappingService.getMappingByUrl("/test/testList"));
        super.index();
        List<TestQuestionnaire> allTestQuestionnaire = testQuestionnaireService.getAllTestQuestionnaire();
        setAttr("questionnaires",allTestQuestionnaire);
        Map<String,User> userMap = new HashMap<>();
        for(TestQuestionnaire tq : allTestQuestionnaire){
            userMap.put(tq.getId()+"",userService.getUserById(tq.getTestQuestionnaireOperaterId()));
        }
        setAttr("operaterMap",userMap);
        /*Map<String,String> msgMap = new HashMap<>();
        for(TestQuestionnaire tq : allTestQuestionnaire){
            testQuestionnaireService.getMsgMapByQuestionnaire(tq);
        }*/
    }
    public void to(){
        setMapping(mappingService.getMappingByTitle("参加考试"));
        super.index();
        User user = getCurrentUser(this);
        List<Map<String,Object>> questionnaires = testQuestionnaireService.getNowQuestionnaireByUser(user);

        setAttr("testing",questionnaires);
        setAttr("nowTime",System.currentTimeMillis());
    }
    public void questions(){
        setMapping(mappingService.getMappingByTitle("题库"));
        super.index();
        List<TestType> testTypes = testTypeService.getAllVisibleTypes();
        setAttr("types",testTypes);
        Map<String,TestType> testTypeMap = new HashMap<>();
        for(TestType t : testTypes){
            testTypeMap.put(t.getId()+"",t);
        }
        setAttr("testTypeMap",testTypeMap);
        List<TestTag> tags = testTagService.getAllTestTag();
        setAttr("tags",tags);

        List<TestQuestion> allQuestions = testQuestionService.getAllQuestions();
        setAttr("questions",allQuestions);
        Map<String,List<TestTag>> testQuestionTagsMap = new HashMap<>();
        for(TestQuestion tq : allQuestions){
            testQuestionTagsMap.put(tq.getId()+"",testTagService.getTagsByQuestion(tq));
        }
        setAttr("testQuestionTags",testQuestionTagsMap);
        //能够进行添加题目的角色
        Mapping mapping = mappingService.getMappingByUrl("addTestQuestion");
        List<Role> roles = roleService.getRoleByMapping(mapping);
        Map<String,User> userMap = new HashMap<>();
        List<User> users = new ArrayList<>();
        for(Role role : roles){
            users.addAll(userService.getUsersByRole(role));
        }
        for(User user : users){
            userMap.put(user.getId()+"",user);
        }
        setAttr("userMap",userMap);
    }
    public void selectQuestions(){
        List<TestType> allTestTypes = testTypeService.getAllVisibleTypes();
        setAttr("types",allTestTypes);
        List<Domain> allDomains = testDomainService.getAllDomains();
        setAttr("domains",allDomains);

        //取得第一个domain下面的tag
        List<TestTag> tags = testTagService.getTagsByDomain(allDomains.get(0));
        setAttr("tags",tags);
        //questions();
        render("/test/selectQuestion.ftl");
    }
    public void preview(){
        fillHeaderAndFooter();
        String qn = getPara("questions");
        JSONArray qnArray = JSONArray.parseArray(qn);
        JSONArray typeArray = qnArray.getJSONArray(0);
        JSONArray questionsArray = qnArray.getJSONArray(1);
        Iterator<Object> typeIds = typeArray.iterator();
        String typeStr = ObjectKit.getStrByJSONArray(typeArray);
        List<TestType> types = testTypeService.getTypesByJSONArray(typeArray);
        Map<String,List<TestQuestion>> map = new HashMap<>();
        for(int i = 0; i < types.size(); i++){
            JSONArray qs = questionsArray.getJSONArray(i);
            List<TestQuestion> testQuestions = testQuestionService.getQuestionsByJSONArray(qs);
            map.put(types.get(i).getId()+"",testQuestions);
        }
        setAttr("types",types);
        setAttr("questionMap",map);
        render("/test/preview.ftl");
    }
    @Before(POST.class)
    public void getTags(){
        Integer domainId = getParaToInt("domain");
        if(domainId == null){
            RenderKit.renderError(this,"参数不对");
            return ;
        }
        Domain domain = testDomainService.getDomainById(domainId);
        if(domain == null){
            RenderKit.renderError(this,"没有该分类");
            return ;
        }
        List<TestTag> tags = testTagService.getTagsByDomain(domain);
        JSONArray array = new JSONArray();
        for(TestTag tag : tags){
            JSONObject json = new JSONObject();
            json.put("id",tag.getId());
            json.put("tagName",tag.getTagName());
            array.add(json);
        }
        renderJson(array);
    }
    @Before(POST.class)
    public void getQuestions(){
        Integer tagId = getParaToInt("tag");
        Integer typeId = getParaToInt("type");
        List<TestQuestion> questions = testQuestionService.getQuestionsByTypeIdAndTagId(tagId, typeId);
        JSONArray array = new JSONArray();
        for(TestQuestion q : questions){
            JSONObject json = new JSONObject();
            json.put("id", q.getId());
            json.put("title",q.getTestQuestionTitle());
            json.put("type",q.getTestQuestionTypeId());
            array.add(json);
        }
        RenderKit.renderSuccess(this,array);
    }
    @Before(POST.class)
    public void addTestQuestionnaire(){
        TestQuestionnaire model = getModel(TestQuestionnaire.class);
        if(!model.save()){
            RenderKit.renderError(this,"保存试卷失败");
            return;
        }
        Enumeration<String> names = getParaNames();
        while(names.hasMoreElements()){
            log.info("-------------"+names.nextElement());
        }
        String para = getPara("questionnaireQuestions");
        log.info(""+model.getId());
        JSONArray array = JSONArray.parseArray(para);
        for(int i = 0 ; i < array.size(); i++){
            JSONObject obj = array.getJSONObject(i);
            Integer questionId = obj.getInteger("testQuestionId");
            Integer testQuestionScore = obj.getInteger("testQuestionScore");
            TestQuestionnaireQuestion tqq = new TestQuestionnaireQuestion();
            tqq.setTestQuestionnaireId(model.getId());
            tqq.setTestQuestionId(questionId);
            tqq.setTestQuestionScore(testQuestionScore);
            tqq.setTestQuestionIsVisible(Common.VALUE_VISIBLE);
            if(!testQuestionnaireQuestionService._saveTestQuestionnaireQuestion(tqq)){
                RenderKit.renderError(this,"关联试题失败！");
                return ;
            }
        }
        RenderKit.renderSuccess(this,"添加成功");
    }
    @Before(POST.class)
    public void addTestQuestion(){
        TestQuestion model = getModel(TestQuestion.class);
        boolean b ;
        if(null==model.getId())
            b = testQuestionService._saveTestQuestion(model);
        else
            b=testQuestionService._updateTestQuestion(model);
        String tagsPara = getPara("tags");
        String[] tags = tagsPara.split(",");
        List<TestTag> allTestTag = testTagService.getAllTestTag();
        for (String tag : tags) {
            TestTag now = null;
            for (TestTag t : allTestTag) {
                if (t.getTagName().equals(tag)) {
                    now = t;
                }
            }
            if (now == null) {
                now = new TestTag();
                now.setTagName(tag);
                now.setQuestionCnt(0);
                testTagService._saveTestTag(now);
            }
            now.setQuestionCnt(now.getQuestionCnt() + 1);
            testTagService._updateTestTag(now);
            testTagQuestionService._saveTagQuestion(now,model);
        }
        if(b){
            RenderKit.renderSuccess(this,"保存成功");
            return ;
        }
        RenderKit.renderError(this,"保存失败");
    }
    @Before(POST.class)
    public void deleteTestQuestion(){

    }
}
