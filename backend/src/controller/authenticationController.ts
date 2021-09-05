import { generateToken } from "../infra/authentication/authentication";

interface Authentication {
  user: string;
  password: string;
}

export const verifyAuthentication = (authentication: Authentication): string => {
  if(authentication.user === 'userTeste' && authentication.password === '123456'){
    const token = generateToken(authentication.user);
    return token;
  }

  throw new Error("Autenticação inválida");
}