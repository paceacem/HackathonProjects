import getAllUsers from "../../../controller/user/getAllUser";
import { authenticateRequest } from "../../../Utils/authenticateRequest.server";

export async function loader({ request }) {
  const auth = await authenticateRequest(request);
  if (!auth.isAuthenticated || !auth.user.admin) {
    return Response.json({
      status: 401,
      isSuccess: false,
      message: "Unauthorized access",
    });
  }

  const _getAllUsers = await getAllUsers();
  const _getAllUsersRes = await _getAllUsers.json();

  if (_getAllUsersRes) {
    return Response.json({
      status: 200,
      isSuccess: _getAllUsersRes.success,
      message: _getAllUsersRes.message,
      data: _getAllUsersRes.data,
    });
  } else {
    return Response.json({
      status: 400,
      isSuccess: false,
      message: "Server error. Please try again.",
    });
  }
}
