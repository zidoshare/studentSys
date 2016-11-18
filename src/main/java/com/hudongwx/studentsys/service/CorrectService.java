package com.hudongwx.studentsys.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.TestQuestion;
import com.hudongwx.studentsys.model.TestQuestionnaire;
import com.hudongwx.studentsys.model.TestQuestionnaireQuestion;
import com.hudongwx.studentsys.model.TestReply;
import com.hudongwx.studentsys.util.ObjectKit;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by wuhongxu on 2016/10/20 0020.
 */
public class CorrectService extends Service {
    private TestQuestionnaireService testQuestionnaireService;
    private TestQuestionService testQuestionService;
    private TestQuestionnaireQuestionService testQuestionnaireQuestionService;
    private TestQuestionnaireClassService testQuestionnaireClassService;

    public void correct(TestReply testReply) {
        new Thread(new AddToCorrect(testReply)).start();
    }

    private class AddToCorrect implements Runnable {
        private TestReply testReply;
        private TestQuestionnaire testQuestionnaire;

        private AddToCorrect(TestReply testReply) {
            this.testReply = testReply;
            testQuestionnaire = testQuestionnaireService.getQuestionnaireById
                    (testQuestionnaireClassService.getById
                            (testReply.getTestQuestionnaireClassId()).getTestQuestionnaireId()
                    );
        }

        private int correcting(String reply, String answer,int max) {
            if (reply.equals(answer)){
                return max;
            }
            return 0;
        }

        /**
         * When an object implementing interface <code>Runnable</code> is used
         * to create a thread, starting the thread causes the object's
         * <code>run</code> method to be called in that separately executing
         * thread.
         * <p>
         * The general contract of the method <code>run</code> is that it may
         * take any action whatsoever.
         *
         * @see Thread#run()
         */
        @Override
        public void run() {
            JSONObject reply = JSON.parseObject(testReply.getAnswers());
            Set<Map.Entry<String, Object>> entries = reply.entrySet();
            int count = 0;
            JSONObject scoreSituation = (JSONObject) reply.clone();
            for (Map.Entry<String, Object> entry : entries) {
                String key = entry.getKey();
                String[] ses = key.split("S");
                Integer id = Integer.valueOf(ses[1]);
                TestQuestion q = testQuestionService.getQuestionById(id);
                TestQuestionnaireQuestion tqq = testQuestionnaireQuestionService.getByQuestionIdAndQuestionnaireId(q.getId(), testQuestionnaire.getId());
                String answer = q.getTestQuestionShortAnswer();
                Object value = entry.getValue();
                int x = correcting(value.toString(), answer,tqq.getTestQuestionScore());
                scoreSituation.put(key,x);
                count += x;
            }
            testReply.setScore(count);
            testReply.setScoreSituation(JSON.toJSONString(scoreSituation));
            testReply.update();
            /*for (TestQuestion tq : testQuestions) {
                if (tq.getTestQuestionTypeId() > 2)
                    continue;
                JSONArray answers = JSONArray.parseArray(tq.getTestQuestionShortAnswer());
                for (int i = 0; i < answers.size(); i++) {
                    String ans = answers.getString(i);
                    //TODO 未完成
                }


            }*/
        }
    }
}
