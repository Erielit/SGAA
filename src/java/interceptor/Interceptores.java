package mx.edu.utez.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import java.util.Map;

public class Interceptores extends AbstractInterceptor {

    @Override
    public void destroy() {
        System.out.println("Destruye lo creado");
    }

    @Override
    public void init() {
        System.out.println("Se crean datos para interceptor");
    }

    @Override
    public String intercept(ActionInvocation ai) throws Exception {
        Map session = ActionContext.getContext().getSession();
        System.out.println(session.get("persona"));
        if (session.get("persona") != null) {
            return ai.invoke();
        }
        return "NOLOGIN";
    }
}
