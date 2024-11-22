import getProductByUserId from "../../../database/product/getProductByUserId";

export async function loader({ request, params }) {
  const userId = params.id;
  const _getProductByUserId = getProductByUserId(userId);
  if (_getProductByUserId) {
    return Response.json({
      status: 200,
      isSuccess: _getProductByUserId.isSuccess,
      message: _getProductByUserId.message,
      data: _getProductByUserId.data,
    });
  }
}
