import { sign, verify } from 'jsonwebtoken'

export const generateToken = (userName: string): string => {
  const accessToken = sign({userName}, '784573hhfyrd');
  return accessToken;
}