import createUser from "../../../controller/user/createUser";

export async function action({ request }) {
  const formData = await request.formData();
  const data = Object.fromEntries(formData.entries());
  const _createUser = await createUser(data);
  const _createUserRes = await _createUser.json();

  if (_createUserRes) {
    return Response.json({
      status: 200,
      isSuccess: _createUserRes.isSuccess,
      message: _createUserRes.message,
    });
  }
}
