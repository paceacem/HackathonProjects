import { authenticateRequest } from "../../../Utils/authenticateRequest.server";
import upsertProduct from "../../../controller/product/upsertProduct";

export async function action({ request }) {
  const auth = await authenticateRequest(request);
  if (!auth.isAuthenticated) {
    return Response.json({
      status: 401,
      isSuccess: false,
      message: "Unauthorized access",
    });
  }

  const formData = await request.formData();
  const data = Object.fromEntries(formData.entries());

  if (auth.user.id != data.userId) {
    return Response.json({
      status: 401,
      isSuccess: false,
      message: "Unauthorized access",
    });
  }
  const _upsertProduct = upsertProduct(data);
  if (_upsertProduct) {
    return Response.json({
      status: 200,
      isSuccess: _upsertProduct.isSuccess,
      message: _upsertProduct.message,
    });
  }
}
