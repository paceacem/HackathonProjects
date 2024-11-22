import { redirect } from "@remix-run/node";
import { getSession } from "../session.server";
import jwt from "jsonwebtoken";

export async function requireAuth(request) {
  const session = await getSession(request.headers.get("Cookie"));
  const token = session.get("jwt");
  const userId = session.get("userId");

  if (!token || !userId) {
    throw redirect("/login");
  }

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const parsedUser = JSON.parse(userId);

    if (decoded.id !== parsedUser.id) {
      throw redirect("/login");
    }

    request.user = parsedUser;

    return parsedUser;
  } catch (error) {
    throw redirect("/login");
  }
}

export async function authenticateRequest(request) {
  try {
    const user = await requireAuth(request);
    return {
      isAuthenticated: true,
      user,
    };
  } catch (error) {
    return {
      isAuthenticated: false,
      user: null,
    };
  }
}
