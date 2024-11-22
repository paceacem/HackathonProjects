import deleteCategory from "../../../controller/category/deleteCategory";

export async function action({ request }) {
  const formData = await request.formData();
  const data = Object.fromEntries(formData.entries());
  console.log("data", data);

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
