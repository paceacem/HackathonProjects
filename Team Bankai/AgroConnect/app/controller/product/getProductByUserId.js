import db from "../../db.server";

export default async function getProductByUserId(userId) {
  try {
    const product = await db.product.findMany({
      where: {
        userId,
      },
    });
    return Response.json({
      isSuccess: true,
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
