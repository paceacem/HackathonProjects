import deleteCategory from "../../../controller/category/deleteCategory";
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

  const _deleteCategory = await deleteCategory(data);
  const _deleteCategoryRes = await _deleteCategory.json();

  if (_deleteCategoryRes) {
    return Response.json({
      status: 200,
      isSuccess: _deleteCategory.isSuccess,
      message: _deleteCategoryRes.message,
    });
  }
}
