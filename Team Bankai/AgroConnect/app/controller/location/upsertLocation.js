import db from "../../db.server";

export default async function upsertLocation(input) {
  try {
    const location = await db.location.upsert({
      where: {
        userId: Number(input?.userId),
      },
      update: {
        latitude: input.latitude,
        longitude: input.longitude,
        address: input.address,
      },
      create: {
        latitude: input.latitude,
        longitude: input.longitude,
        address: input.address,
        userId: input.userId,
      },
    });

    return Response.json({
      isSuccess: true,
      message: `Location ${
        location.createdAt === location.updatedAt ? "created" : "updated"
      } successfully.`,
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
