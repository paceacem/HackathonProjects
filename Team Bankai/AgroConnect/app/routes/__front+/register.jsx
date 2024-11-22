import { Button, Form, Input, Select, Typography } from "antd";
import { Link, redirect, useSubmit } from "@remix-run/react";
import { RegisterUser } from "../../controller/user/authController";

export async function loader() {
  console.log("loading ............");
  return "ok";
}

export async function action({ request }) {
  const antdFormData = await request.formData();
  const jsonString = Array.from(antdFormData.entries())[0][0];
  const parsedData = JSON.parse(jsonString);
  const registerUserResponse = await RegisterUser(parsedData);

  if (registerUserResponse) {
    return redirect("/login");
  }

  return "ok";
}

export default function userCreate() {
  const submit = useSubmit();

  const onFinish = (val) => {
    console.log(val);
    submit(JSON.stringify(val), { method: "POST" });
  };

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
          label="Name"
          name="name"
          rules={[{ required: true, message: "Please enter your name" }]}
        >
          <Input />
        </Form.Item>

        <Form.Item
          label="Email"
          name="email"
          rules={[
            { required: true, message: "Please enter your email address" },
          ]}
        >
          <Input />
        </Form.Item>
        <Form.Item
          label="Phone"
          name="phone"
          rules={[
            {
              required: true,
              message: "Please enter your phone number",
              type: "number",
            },
          ]}
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

        <Button type="primary" htmlType="submit">
          Register
        </Button>

        <hr style={{ margin: "2rem 0" }}></hr>

        <Typography.Text style={{ textAlign: "center" }}>
          Already have an Account? <Link to={"/login"}>Login</Link>
        </Typography.Text>
      </Form>
    </div>
  );
}
