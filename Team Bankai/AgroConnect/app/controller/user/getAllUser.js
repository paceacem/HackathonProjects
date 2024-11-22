import db from "../../db.server";

export default async function getAllUsers() {
  try {
    const users = await db.user.findMany({
      select: {
        name: true,
        phone: true,
        email: true,
        location: {
            select:{
                longitude: true,
                latitude: true
            }
        },
      },
    });

    return new Response(
      JSON.stringify({
        success: true,
        message: "Users fetched successfully.",
        data: users,
      }),
      { status: 200 }
    );
  } catch (error) {
    return new Response(
      JSON.stringify({
        success: false,
        message: "Server error. Try again later.",
        error: error.message,
      }),
      { status: 500 }
    );
  }
}
