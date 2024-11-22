import db from "../../db.server";

export default async function deleteCategory(input) {
  try {
    const category = await db.category.delete({
      where: {
        id: input.id,
      },
    });
    return Response.json({
      isSuccess: true,
      message: "Category deleted Sucessfully.",
      data: category,
    });
  } catch (error) {
    console.error(error);
    return Response.json({
      isSuccess: false,
      message: "Server Error. Try again later.",
      data: error.message,
    });
  }
}
