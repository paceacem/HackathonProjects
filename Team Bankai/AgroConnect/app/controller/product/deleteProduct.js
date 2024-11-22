import db from "../../db.server";

export default async function deleteProduct(input) {
  try {
    const product = await db.product.delete({
      where: {
        id: input.id,
        userId: input.userId,
      },
    });
    return Response.json({
      isSuccess: true,
      message: "Product deleted Sucessfully.",
      data: product,
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
