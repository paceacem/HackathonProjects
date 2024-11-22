import { createCookieSessionStorage } from "@remix-run/node";

export const handleSessionDetails = createCookieSessionStorage({
  cookie: {
    name: '__session',
    secrets: ['its-very-confidential'],
    path: '/',
    maxAge: 60*60*24,
    httpOnly: true,
    sameSite: 'lax'
  }
})

export const {getSession, commitSession, destroySession} = handleSessionDetails;