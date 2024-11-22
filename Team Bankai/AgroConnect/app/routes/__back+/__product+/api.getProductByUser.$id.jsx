import getProductByUserId from "../../../controller/product/getProductByUserId";

export async function loader({ request, params }) {
  const userId = params.id;
  const _getProductByUserId = await getProductByUserId(userId);
  const _getProductByUserRes = await _getProductByUserId.json(); //
  if (_getProductByUserRes) {
    return Response.json({
      status: 200,
      isSuccess: _getProductByUserRes.isSuccess,
      message: _getProductByUserRes.message,
      data: _getProductByUserRes.data,
    });
  }
}
