package mx.edu.utez.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sgaa.persona.bean.BeanPersona;

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
        BeanPersona persona = (BeanPersona) session.get("persona");
        if (persona == null) {
            return "NOLOGIN";
        } else {
            return ai.invoke();
        }
    }
}
