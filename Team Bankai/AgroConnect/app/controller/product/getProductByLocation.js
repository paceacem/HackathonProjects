import db from "../../db.server";
import { calculateDistance } from "../../Utils/functions";

export default async function getProductsByLocation(
  latitude,
  longitude,
  maxDistance = 5
) {
  try {
    const products = await db.product.findMany({
      include: {
        location: true,
        user: {
          include: {
            location: true,
          },
        },
        category: true,
      },
    });

    const productsWithDistance = products
      .map((product) => {
        const productLocation = product.location || product.user.location;
        if (!productLocation) return null;
        const distance = calculateDistance(
          { latitude, longitude },
          {
            latitude: productLocation.latitude,
            longitude: productLocation.longitude,
          }
        );

        return {
          ...product,
          distance: Math.round(distance * 10) / 10,
        };
      })
      .filter((product) => product !== null && product.distance <= maxDistance)
      .sort((a, b) => (a?.distance || 0) - (b?.distance || 0));

    return Response.json({
      isSuccess: true,
      data: productsWithDistance,
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
