import upsertProduct from "../../../database/product/upsertProduct";

export async function action({ request }) {
  const formData = await request.formData();
  const data = Object.fromEntries(formData.entries());
  const _upsertProduct = upsertProduct(data);
  if (_upsertProduct) {
    return Response.json({
      status: 200,
      isSuccess: _upsertProduct.isSuccess,
      message: _upsertProduct.message,
    });
  }
}
