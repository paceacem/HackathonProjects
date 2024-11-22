import db from "../../db.server";

export default async function upsertProduct(input) {
  try {
    const product = await db.product.upsert({
      where: { id: input.id },
      create: {
        name: input.name,
        description: input.description,
        price: input.price,
        categoryId: input.categoryId,
        imageUrl: input.image,
        stock: input.stock,
        userId: input.userId,
      },
      update: {
        name: input.name,
        description: input.description,
        price: input.price,
        categoryId: input.categoryId,
        imageUrl: input.image,
        stock: input.stock,
        userId: input.userId,
      },
    });
    return Response.json({
      isSuccess: true,
      message: `Product ${
        category.createdAt === category.updatedAt ? "created" : "updated"
      } successfully.`,
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
