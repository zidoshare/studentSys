package com.hudongwx.studentsys.service;

import com.hudongwx.studentsys.common.Service;
import com.hudongwx.studentsys.model.Certificate;
import com.hudongwx.studentsys.util.Common;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created by wuhongxu on 2016/11/1 0001.
 */
public class CertificateService extends Service {

    public Page<Certificate> getAllCertificates(Integer p) {
        return Certificate.dao.paginate(p, Common.MAX_PAGE_SIZE,Common.COMMON_SELECT,Certificate.SQL_FROM+Common.ORDER_BY_ID_DESC);
    }
}
