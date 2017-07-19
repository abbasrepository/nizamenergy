package schedule;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import messageAPI.MoblinkMessageService;

import org.apache.log4j.Logger;

import bal.TriggersBal;

public class PendingMessagesThread extends Thread {

	private final static Logger logger = Logger
			.getLogger(PendingMessagesThread.class);

	@Override
	public void run() {
		try {
			while (true) {
				DateFormat df = new SimpleDateFormat("HH:mm");
				Date dateobj = new Date();
				if (df.format(dateobj).equals("07:40")) {
					logger.info("PendingMessages");
					sendPendingMessages();
				} else if (df.format(dateobj).equals("10:01")) {
					logger.info("PendingMessages");
					sendPendingMessages();
				} else if (df.format(dateobj).equals("21:01")) {
					logger.info("PendingMessages");
					sendPendingMessages();
				}
				Thread.sleep(60000);
			}
		} catch (Exception e) {
			logger.error("", e);
		}
	}

	public static void sendPendingMessages() {
		ArrayList<HashMap<String, String>> list = TriggersBal
				.getPendingMessages();
		for (int i = 0; i < list.size(); i++) {
			try {
				MoblinkMessageService.SendMessage(
						list.get(i).get("customerPhone"),
						list.get(i).get("message"));
			} catch (Exception e) {
				logger.error(e);
			}
			TriggersBal.updatePendingMsgStatus(Integer.valueOf(list.get(i).get(
					"message_id")));
		}
	}

}
