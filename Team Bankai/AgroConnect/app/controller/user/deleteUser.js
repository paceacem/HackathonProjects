import db from "../../db.server";

export default async function deleteUser(input) {
  try {
    const user = await db.user.delete({
      where: {
        id: input.id,
        userId: input.userId,
      },
    });
    return Response.json({
      isSuccess: true,
      message: "User deleted Sucessfully.",
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
