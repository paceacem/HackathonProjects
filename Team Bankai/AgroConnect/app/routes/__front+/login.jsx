import { Button, Form, Input, Typography } from "antd";
import { Link, redirect, useSubmit } from "@remix-run/react";

import {LoginUser} from "../../controller/user/authController"
import { commitSession } from "../../session.server";

export async function action({ request }) {
  const antdFormData = await request.formData();
  const jsonString = Array.from(antdFormData.entries())[0][0];
  const parsedData = JSON.parse(jsonString);
  const sessionResponse = await LoginUser(parsedData);
  console.log("SessionResponse", sessionResponse);

  if (sessionResponse) {
    return redirect("/", {
      headers: {
        "set-Cookie": await commitSession(sessionResponse),
      },
    });
  }
}

export default function Login() {
  const submit = useSubmit();

  const onFinish = (val) => {
    console.log(val);
    submit(JSON.stringify(val), { method: "POST" });
  };

  // box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;

  return (
    <div style={{ maxWidth: "500px", margin: "3rem auto" }}>
      <Form
        onFinish={onFinish}
        layout="vertical"
        style={{
          boxShadow: "rgba(149, 157, 165, 0.2) 0px 8px 24px",
          padding: "2rem 2rem",
        }}
      >
        <Form.Item
          label="Phone"
          name="phone"
          rules={[{ required: true, message: "Please enter your Phone" }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label="Password"
          name="password"
          rules={[{ required: true, message: "Please enter your password" }]}
        >
          <Input.Password />
        </Form.Item>

        <Form.Item>
          <Button type="primary" htmlType="submit">
            Login
          </Button>
        </Form.Item>

        <hr style={{ margin: "2rem 0" }}></hr>

        <Typography.Text style={{ textAlign: "center" }}>
          Does not have an Account? <Link to={"/register"}>Register</Link>
        </Typography.Text>
      </Form>
    </div>
  );
}
