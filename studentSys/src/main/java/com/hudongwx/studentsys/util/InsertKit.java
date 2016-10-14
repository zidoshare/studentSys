package com.hudongwx.studentsys.util;

import freemarker.core.Environment;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.DeepUnwrap;

import java.util.List;

/**
 * Created by wuhongxu on 2016/10/14 0014.
 */
public class InsertKit implements TemplateMethodModelEx {
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
        if (arguments.size() <= 1)
            throw new TemplateModelException("参数个数必须大于1");
        String parent = arguments.get(0).toString();
        StringBuilder sb = new StringBuilder("");
        arguments.remove(0);
        String[] split = parent.split("\\?");
        for (int i = 0; i < split.length; i++) {
            sb.append(split[i]);
            if (arguments.size() > i)
                sb.append(arguments.get(i));
        }
        return sb.toString();
    }
}
