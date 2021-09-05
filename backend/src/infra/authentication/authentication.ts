import { sign, verify } from 'jsonwebtoken'
import ENV from '../../config/env'

export const generateToken = (userName: string): string => {
  const accessToken = sign({userName}, ENV.JWT_SECRET);
  return accessToken;
}

export const verifyToken = (token: string) => {
  return verify(token, ENV.JWT_SECRET);
} 