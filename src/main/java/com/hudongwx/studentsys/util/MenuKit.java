package com.hudongwx.studentsys.util;

import freemarker.core.Environment;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.DeepUnwrap;

import java.util.List;

/**
 * Created by wuhongxu on 2016/11/27 0027.
 */
public class MenuKit implements TemplateMethodModelEx{
    /**
     * Executes the method call.
     *
     * @param arguments a {@link List} of {@link TemplateModel}-s,
     *                  containing the arguments passed to the method. If the implementation absolutely wants
     *                  to operate on POJOs, it can use the static utility methods in the {@link DeepUnwrap}
     *                  class to easily obtain them. However, unwrapping is not always possible (or not perfectly), and isn't always
     *                  efficient, so it's recommended to use the original {@link TemplateModel} value as much as possible.
     * @return the return value of the method, or {@code null}. If the returned value
     * does not implement {@link TemplateModel}, it will be automatically
     * wrapped using the {@link Environment#getObjectWrapper() environment's
     * object wrapper}.
     */
    @Override
    public Object exec(List arguments) throws TemplateModelException {
        return null;
    }
}
