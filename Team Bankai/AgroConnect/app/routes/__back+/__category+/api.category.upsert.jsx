import upsertCategory from "../../../controller/category/upsertCategory";
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
  const _upsertCategory = await upsertCategory(data);
  const _upsertCategoryRes = await _upsertCategory.json();

  if (_upsertCategoryRes) {
    return Response.json({
      status: 200,
      isSuccess: _upsertCategoryRes.isSuccess,
      message: _upsertCategoryRes.message,
    });
  }
}
