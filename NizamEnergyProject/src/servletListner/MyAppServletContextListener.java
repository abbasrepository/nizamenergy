package servletListner;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import schedule.PendingMessagesThread;
import schedule.TriggersThread;

@WebListener
public class MyAppServletContextListener implements ServletContextListener {

	TriggersThread triggerModule;
	PendingMessagesThread thread;
	public MyAppServletContextListener() {
		triggerModule = new TriggersThread();
		thread = new PendingMessagesThread();
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("MyAppServletContextListener.contextInitialized()");
//		thread.start();
//		triggerModule.start();
	}

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		triggerModule.stop();
	}

}
