import db from "../../db.server";

export default async function deleteLocation(input) {
  try {
    const location = await db.location.delete({
      where: {
        id: input.id,
        userId: input.userId,
      },
    });
    return Response.json({
      isSuccess: true,
      message: "Location deleted Sucessfully.",
      data: location,
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
