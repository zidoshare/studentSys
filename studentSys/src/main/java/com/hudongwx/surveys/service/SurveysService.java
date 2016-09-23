package com.hudongwx.surveys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.exceptions.ServiceException;
import com.hudongwx.studentsys.util.ArrayKit;
import com.hudongwx.studentsys.util.StrPlusKit;
import com.hudongwx.surveys.model.*;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuhongxu on 2016/9/6 0006.
 */
public class SurveysService extends Service {
    private Thread runSuevey = null;
    private List<Node> onlineUsers = new ArrayList<>();

    public List<QuestionBigType> getBigTypes() {
        return QuestionBigType.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "bigTypes", "select * from surveys_t_question_big_type");
    }

    public boolean saveBigType(QuestionBigType qbt) {
        List<QuestionBigType> bigTypes = QuestionBigType.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "bigTypes", "select * from surveys_t_question_big_type");
        if (qbt.save()) {
            bigTypes.add(qbt);
            CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "bigTypes", bigTypes);
            return true;
        }
        return false;
    }

    public Page<Questions> getAllQuestions(int currentPage) {
        return Questions.dao.paginate(currentPage, Common.MAX_PAGE_SIZE, "select *", "from surveys_t_questions");
    }

    public Page<Questions> getQuestionsByBigType(int currentPageNum, int typeId) {
        Page<Questions> questions = null;
        if (CacheKit.get(Common.CACHE_LONG_TIME_LABEL, "questions" + typeId + currentPageNum) == null) {
            questions = Questions.dao.paginate(currentPageNum, Integer.MAX_VALUE, "select *", "from surveys_t_questions where big_type_id = ?", typeId);/* ORDER BY (surveys_t_questions.big_type_id in (select id from surveys_t_question_big_type))*/
            questions.getList().forEach(Questions::generateSelects);
            CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "questions" + typeId + currentPageNum, questions);
        } else
            questions = CacheKit.get(Common.CACHE_LONG_TIME_LABEL, "questions" + typeId + currentPageNum);
        return questions;
    }

    public Page<Questions> getQuestionsByBigType(int currentPageNum, String typeName) {
        List<QuestionBigType> questionBigTypes = QuestionBigType.dao.find("select * from surveys_t_question_big_type where typeName = ?", typeName);
        int typeId = -1;
        if (!questionBigTypes.isEmpty())
            typeId = questionBigTypes.get(0).getId();
        return Questions.dao.paginateByCache(Common.CACHE_LONG_TIME_LABEL, "questions" + typeId + currentPageNum, currentPageNum, Common.MAX_PAGE_SIZE, "select *", "from surveys_t_questions where big_type_id = ?", typeId);
    }

    public List<QuestionBigType> getAllBigType() {
        return QuestionBigType.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "bigTypes", "select * from surveys_t_question_big_type order by sort_flag ASC");
    }

    public List<Questions> getQuestionsByQuestionnaire(int questionnaireId) {
        List<QuestionsQuestionnaire> questionsQuestionnaires = QuestionsQuestionnaire.dao.find("select * from surveys_t_questions_questionnaire where id_questionnaire = ?", questionnaireId);
        if (questionsQuestionnaires.isEmpty())
            return new ArrayList<>();
        String ids = "(";
        for (QuestionsQuestionnaire q : questionsQuestionnaires) {
            ids += q.getIdQuestions() + ",";
        }
        ids = ids.substring(0, ids.length() - 1);
        ids += ")";
        return Questions.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, questionnaireId, "select * from surveys_t_questions where id IN " + ids);
    }

    public Page<Questionnaire> getQuestionnaires(int currentPage) {
        return getQuestionnaires(currentPage, Common.MAX_PAGE_SIZE);
    }

    public Page<Questionnaire> getQuestionnaires(int currentPage, int pageSize) {
        return Questionnaire.dao.paginateByCache(Common.CACHE_60TIME_LABEL, "questionnaires" + currentPage, currentPage, pageSize, "select *", "from surveys_t_questionnaire");
    }

    public boolean _saveQuestionnaire(Questionnaire questionnaire) {
        try {
            if (StrPlusKit.isEmpty(questionnaire.getClassName()))
                throw new ServiceException("className cannot be null or \"\"");
            if (StrPlusKit.isEmpty(questionnaire.getDate()))
                throw new ServiceException("date cannot be null or \"\"");
            if (StrPlusKit.isEmpty(questionnaire.getToUser()))
                throw new ServiceException("toUser cannot be null or \"\"");
        } catch (ServiceException e) {
            log.error(e.getMessage());
            return false;
        }
        questionnaire.save();
        return true;
    }

    //关联问题和调查表
    public void _saveQuestionQuestionnaires(int questionnaireId, int questionId) {
        QuestionsQuestionnaire questionsQuestionnaire = new QuestionsQuestionnaire();
        questionsQuestionnaire.setIdQuestionnaire(questionnaireId);
        questionsQuestionnaire.setId(questionId);
        questionsQuestionnaire.save();
    }

    public boolean isContainUser(Node user) {
        return onlineUsers.contains(user);
    }

    public boolean registerName(Node user) {
        user.code = String.valueOf((int) (Math.random() * 200000) + 100000);
        if(!onlineUsers.contains(user))
            onlineUsers.add(user);
        else{
            int i = onlineUsers.indexOf(user);
            onlineUsers.get(i).code = user.code;
        }
        return true;
    }

    public Node getUserByCode(String code) {
        for (Node node : onlineUsers)
            if (node.code.equals(code))
                return node;
        return null;
    }
    public Node getUserByIp(String ip){
        for (Node node : onlineUsers)
            if (node.ip.equals(ip))
                return node;
        return new Node("匿名","无ip","无班级");
    }

    public int getRegisterSize() {
        return onlineUsers.size();
    }

    public void runSurveys() {
        runSuevey = new Thread(() -> {
            while (true) {

            }
        });

    }

    public List<Questions> getAllQuestions() {
        List<Questions> questions = null;
        if (CacheKit.get(Common.CACHE_LONG_TIME_LABEL, "questions") == null) {
            questions = Questions.dao.find("select * from surveys_t_questions");/* ORDER BY (surveys_t_questions.big_type_id in (select id from surveys_t_question_big_type))*/
            questions.forEach(Questions::generateSelects);
            CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "questions", questions);
        } else
            questions = CacheKit.get(Common.CACHE_LONG_TIME_LABEL, "questions");
        return questions;
    }

    public int getQuestionnaireMaxId() {
        List<Record> records = Db.use("surveys").find("select max(id) as id from surveys_t_questionnaire");
        if (!records.isEmpty())
            return records.get(0).get("id");
        return 0;
    }

    public List<Questionnaire> getQuestionnairesByClassName(String className) {
        return Questionnaire.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "classNameQuestionnaires", "select * from surveys_t_questionnaire where class_name = ?", className);
    }

    public List<Questionnaire> getQuestionnaireByClassNameAndDate(String className) {
        long nowTime = System.currentTimeMillis();
        List<Questionnaire> questionnaireList = CacheKit.get(Common.CACHE_60TIME_LABEL, "questionnaire" + className);
        if (null == questionnaireList || questionnaireList.size() < 2)
            questionnaireList = Questionnaire.dao.find("select * from surveys_t_questionnaire where date < ? and end_time > ? and class_name = ?", nowTime, nowTime, className);
        if (questionnaireList.size() > 1)
            CacheKit.put(Common.CACHE_60TIME_LABEL, "questionnaire" + className, questionnaireList);
        else
            return new ArrayList<>();
        return questionnaireList;
    }

    public Questionnaire getQuestionnaireById(Integer questionnaireId) {
        List<Questionnaire> byCache = Questionnaire.dao.findByCache(Common.CACHE_LONG_TIME_LABEL, "questionnaire" + questionnaireId, "select * from surveys_t_questionnaire where id = ?", questionnaireId);
        if (!byCache.isEmpty())
            return byCache.get(0);
        return null;
    }

    public void generatorQuestionnaire(Questionnaire questionnaire) {
        List<QuestionBigType> bigTypes = getAllBigType();

        List<Questions> allQuestions = getQuestionsByQuestionnaire(questionnaire.getId());
        List<QuestionnaireNode> list = new ArrayList<>();
        for (QuestionBigType bigType : bigTypes) {
            QuestionnaireNode questionnaireNode = CacheKit.get(Common.CACHE_LONG_TIME_LABEL, "questionnaire" + questionnaire.getId() + "bigType" + bigType.getId());
            if (questionnaireNode == null) {
                questionnaireNode = new QuestionnaireNode();
                questionnaireNode.setQuestionBigType(bigType);
                List<Questions> bigTypeToQuestionsList = new ArrayList<>();
                int size = allQuestions.size();
                for (int i = 0; i < size; i++) {
                    Questions q = allQuestions.get(0);
                    if (q.getBigTypeId().equals(bigType.getId())) {
                        q.generateSelects();
                        bigTypeToQuestionsList.add(q);
                        allQuestions.remove(q);
                    }
                }
                questionnaireNode.setQuestionsList(bigTypeToQuestionsList);
                CacheKit.put(Common.CACHE_LONG_TIME_LABEL, "questionnaire" + questionnaire.getId() + "bigType" + bigType.getId(), questionnaireNode);
            }
            if (questionnaireNode.getSize() > 0)
                list.add(questionnaireNode);
        }
        questionnaire.setQuestionnaireNodeList(list);
    }

    public List<QuestionnaireResult> getQuestionnaireResultByUserName(String name) {
        return QuestionnaireResult.dao.find("select * from surveys_t_questionnaire_result where id_user = ?", name);
    }
    public List<QuestionnaireResult> getQuestionnaireResultByQuestionnaireId(String id){
        return QuestionnaireResult.dao.find("select * from surveys_t_questionnaire_result where id_questionnaire = ?", id);
    }

    /*private List<String> testFlags;
    public void addTestFlag(String flag){
        if(testFlags == null)
            testFlags = new ArrayList<>();
        testFlags.add(flag);
    }
    public boolean removeTestFlag(String flag){
        if(testFlags.remove(flag))
            return true;
        for(String s : testFlags)
            if (s.equals(flag)) {
                testFlags.remove(s);
                return true;
            }
        return false;
    }
    public String generatorTestFlag(){
        Double v = Math.random() * 100000 + 10000;
        return ""+v;
    }*/

}
