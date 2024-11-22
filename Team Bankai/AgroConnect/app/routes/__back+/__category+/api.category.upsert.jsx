import upsertCategory from "../../../database/category/upsertCategory";

export async function action({ request }) {
  const formData = await request.formData();
  const data = Object.fromEntries(formData.entries());
  const _upsertCategory = await upsertCategory(data);
  const _upsertCategoryRes = await _upsertCategory.json();

  if (_upsertCategoryRes) {
    return Response.json({
      status: 200,
      isSuccess: _upsertCategoryRes.isSuccess,
      message: _upsertCategoryRes.message,
      // data: _upsertCategoryRes.data,
    });
  }
}
