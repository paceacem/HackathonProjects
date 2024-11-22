import db from "../../db.server";

export default async function upsertCategory(input) {
  console.log("input", input);

  try {
    const category = await db.category.upsert({
      where: {
        id: Number(input?.id) || 999999999999,
      },
      update: {
        name: input.name,
      },
      create: {
        name: input.name,
      },
    });

    return Response.json({
      isSuccess: true,
      message: `Category ${
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
