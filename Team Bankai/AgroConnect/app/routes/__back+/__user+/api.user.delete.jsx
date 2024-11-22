import deleteUser from "../../../controller/user/deleteUser";
import { authenticateRequest } from "../../../Utils/authenticateRequest.server";

export async function action({ request }) {
  const auth = await authenticateRequest(request);
  if (!auth.isAuthenticated || !auth.user.admin) {
    return Response.json({
      status: 401,
      isSuccess: false,
      message: "Unauthorized access",
    });
  }

  const formData = await request.formData();
  const data = Object.fromEntries(formData.entries());

  if (auth.user.id !== data.userId) {
    return Response.json({
      status: 401,
      isSuccess: false,
      message: "Unauthorized access",
    });
  }

  const _deleteUser = await deleteUser(data);
  const _deleteUserRes = await _deleteUser.json();

  if (_deleteUserRes) {
    return Response.json({
      status: 200,
      isSuccess: _deleteUserRes.isSuccess,
      message: _deleteUserRes.message,
    });
  }
}
