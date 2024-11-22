import getProductByQuery from "../../../controller/product/getProductByQuery";

export async function action({ request }) {
  const url = new URL(request.url);
  const searchQuery = url.searchParams.get("query") || "";
  const categoryId = url.searchParams.get("categoryId") || null;
  const longitude = url.searchParams.get("longitude") || null;
  const latitude = url.searchParams.get("latitude") || null;
  const maxDistance = url.searchParams.get("maxDistance") || 5;

  const string = {
    query: searchQuery,
    categoryId: categoryId ? parseInt(categoryId) : null,
    longitude: longitude ? parseFloat(longitude) : null,
    latitude: latitude ? parseFloat(latitude) : null,
    maxDistance: parseInt(maxDistance),
  };

  const _getProductByQuery = getProductByQuery(string);
  const _getProductByQueryRes = (await _getProductByQuery).json();
  if (_getProductByQueryRes) {
    return Response.json({
      status: 200,
      isSuccess: _getProductByQueryRes.isSuccess,
      data: _getProductByQueryRes.data,
    });
  }
}
