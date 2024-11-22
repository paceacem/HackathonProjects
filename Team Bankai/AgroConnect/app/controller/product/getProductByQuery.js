import db from "../../db.server";
import { calculateDistance } from "../../Utils/functions";
export default async function getProductByQuery({
  query = "",
  categoryId,
  latitude,
  longitude,
  maxDistance = 5,
  page = 1,
  limit = 10,
}) {
  try {
    const whereClause = {
      OR: [
        {
          name: {
            contains: query,
           
          },
        },
        {
          description: {
            contains: query,
           
          },
        },
      ],
    };

    if (categoryId) {
      whereClause.categoryId = categoryId;
    }

    const products = await db.product.findMany({
      where: whereClause,
      include: {
        location: true,
        user: {
          include: {
            location: true,
          },
        },
        category: true,
      },
      skip: (page - 1) * limit,
      take: limit,
    });

    const totalProducts = await db.product.count({
      where: whereClause,
    });

    if (latitude && longitude) {
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
        .filter(
          (product) => product !== null && product.distance <= maxDistance
        )
        .sort((a, b) => (a?.distance || 0) - (b?.distance || 0));

      return Response.json({
        isSuccess: true,
        data: productsWithDistance,
        pagination: {
          page,
          limit,
          total: totalProducts,
          totalPages: Math.ceil(totalProducts / limit),
        },
      });
    }

    return Response.json({
      isSuccess: true,
      data: products,
      pagination: {
        page,
        limit,
        total: totalProducts,
        totalPages: Math.ceil(totalProducts / limit),
      },
    });
  } catch (error) {
    console.error("Search products error:", error);
    return Response.json({
      isSuccess: false,
      message: "Server Error. Try again later.",
      data: error.message,
    });
  }
}
