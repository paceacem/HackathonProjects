import db from "../db.server";

export default async function createUser(input) {
  console.log("input", input);

  try {
    const existingUser = await db.user.findUnique({
      where: { phone: input.phone },
    });
    if (existingUser) {
      return Response.json({
        isSuccess: false,
        message: "User already exists.",
      });
    }

    const user = await db.user.create({
      data: {
        name: input.name,
        email: input.email,
        phone: input.phone,
        password: input.password,
      },
    });

    return Response.json({
      isSuccess: true,
      message: `User ${
        user.createdAt === user.updatedAt ? "created" : "updated"
      } successfully.`,
      data: user,
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
