package com.hudongwx.studentsys.controller;

import com.hudongwx.studentsys.common.BaseController;
import com.hudongwx.studentsys.model.*;
import com.hudongwx.studentsys.service.*;
import com.hudongwx.studentsys.util.RenderKit;
import com.jfinal.aop.Before;
import com.jfinal.ext.interceptor.POST;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
        List<TestType> testTypes = testTypeService.getAllTestTypes();
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
    public void getQuestionsJSON(){
        List<TestType> testTypes = testTypeService.getAllTestTypes();
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
