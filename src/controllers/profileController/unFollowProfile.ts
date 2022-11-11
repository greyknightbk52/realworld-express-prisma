import { NextFunction, Response } from "express";
import { Request } from "express-jwt";
import userGetPrisma from "../../utils/db/userGetPrisma";
import userUnFollowProfilePrisma from "../../utils/db/userUnFollowProfilePrisma";
import profileViewer from "../../view/profileViewer";

/**
 * Middleware that removes the username in the parameters to the current user followers list.
 * @param req Request
 * @param res Response
 * @param next NextFunction
 * @returns
 */
export default async function unFollowProfile(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const username = req.params.username;
  const currentUsername = req.auth?.user.username;

  let currentUser;
  try {
    currentUser = await userGetPrisma(currentUsername);
  } catch (error) {
    return next(error);
  }
  if (!currentUser) return res.sendStatus(401);

  let profile;
  try {
    profile = await userUnFollowProfilePrisma(currentUser, username);
  } catch (error) {
    return next(error);
  }

  const profileView = profileViewer(profile, currentUser);
  return res.json(profileView);
}