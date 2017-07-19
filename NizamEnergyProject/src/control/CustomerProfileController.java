package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;

import bal.CustomerRetrieveDataBAL;
import bean.UserBean;

@WebServlet("/CustomerProfileController")
public class CustomerProfileController extends HttpServlet {
	final static Logger logger = Logger
			.getLogger(CustomerProfileController.class);
	private static final long serialVersionUID = 1L;

	public CustomerProfileController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try (PrintWriter out = response.getWriter()) {
			HttpSession session = request.getSession();
			UserBean bean = (UserBean) session.getAttribute("email");
			String action = request.getParameter("action");

			if (action.equals("insertCallingCCVerificationInfo")) {
				String eligId = request.getParameter("eligId");
				String callingNumber = request.getParameter("callingNumber");
				String ccComment = request.getParameter("ccComment");
				int status = Integer.parseInt(request.getParameter("status"));

				if (callingNumber != null) {
					callingNumber = "92"
							+ request.getParameter("callingNumber");
				}

				if (eligId != null && !callingNumber.equals("")
						&& callingNumber != null && !ccComment.equals("")
						&& ccComment != null) {
					int eligibilityId = Integer.parseInt(eligId);
					HashMap<String, String> map = new HashMap<>();

					map.put("eligibilityId", "" + eligibilityId);
					map.put("callingNumber", callingNumber);
					map.put("ccComment", ccComment);
					map.put("status", "" + status);

					CustomerRetrieveDataBAL
							.insertCCVerificationCallingData(map);

				}
			}

			if (action.equals("getCCVerificationCallingInfo")) {
				JSONObject json = new JSONObject();
				String eligId = request.getParameter("eligibilityId");
				String status = request.getParameter("status");
				if (eligId != null) {
					int eligibilityId = Integer.parseInt(eligId);
					int verifiedStatus = Integer.parseInt(status);
					try {
						json.put("data", CustomerRetrieveDataBAL
								.getCallingHistoryOfCCVerificationForm(
										eligibilityId, verifiedStatus));
					} catch (Exception e) {
						logger.error("", e);
						json.put("message", e.getStackTrace());
						e.printStackTrace();
					}
					out.print(json);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
