import db from "../../db.server";
import bcryptjs from "bcryptjs";
import { CreateJsonToken } from "../../Utils/createJsonToken";
import { Prisma } from "@prisma/client";
import { getSession, commitSession } from "../../session.server";

export const RegisterUser = async (data) => {
  console.log("data getting in controller: ", data);
  const { name, email, phone, username, password } = data;

  if (!name || !email || !username || !password || !phone) {
    return "Please enter all the credentials";
  }

  function validateEmail(email) {
    const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

    return !emailPattern.test(email) ? false : true;
  }
  const emailValidation = validateEmail(email);

  if (!emailValidation) return "Please use authentic email";

  const bcryptPassword = await bcryptjs.hash(password, 10);

  const registerUser = await db.user.create({
    data: {
      name: name,
      email: email,
      phone: phone,
      password: bcryptPassword,
    },
  });

  if (registerUser) return registerUser;
  else {
    if (e instanceof Prisma.PrismaClientKnownRequestError) {
      // The .code property can be accessed in a type-safe manner
      if (e.code === "P2002") {
        return "Either username or email is been already taken";
      }
    }
    throw e;
  }
};

export const LoginUser = async (data) => {
  const { email, password } = data;

  if (!email || !password) {
    return "Please enter all the credentials";
  }

  const checkUserEmail = await db.user.findUnique({
    where: {
      email,
    },
  });

  if (
    !checkUserEmail ||
    !(await bcryptjs.compare(password, checkUserEmail.password))
  ) {
    console.log("User login failed");
    return "Login failed";
  } else {
    checkUserEmail.password = undefined;
    checkUserEmail.createdAt = undefined;
    checkUserEmail.updatedAt = undefined;
    console.log("Successfull login");
    const getToken = CreateJsonToken(checkUserEmail.id);

    const session = await getSession();
    session.set("jwt", getToken);
    session.set("userId", JSON.stringify(checkUserEmail));

    console.log("remix session: ", session);

    return session;
  }
};
