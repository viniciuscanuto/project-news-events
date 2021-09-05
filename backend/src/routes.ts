import { Router, Request, Response } from 'express'
import { eventsExample } from './infra/database/eventsExample'
import { verifyToken } from './infra/authentication/authentication'
import { newsExample } from './infra/database/newsExample'
import { verifyAuthentication } from './controller/authenticationController'

const routes = Router()

const Authentication = (req: Request, res: Response, next) => {
  try {
    const token: any = req.headers['x-access-token'];
    if (!token) return res.status(401).json({ message: 'Token não pode ser nulo' });
    
    verifyToken(token);

    next();
  } catch (error) {
    return res.status(500).json({ message: 'accessToken inválido' })
  }
}

routes.get('/news', (req: Request, res: Response) => {
  return res.json(newsExample)
})

routes.get('/event', Authentication,(req: Request, res: Response) => {
  return res.json(eventsExample)
})

routes.post('/login', (req: Request, res: Response) => {
  try {
    const { user, password } = req.body;
  
    const token = verifyAuthentication({user, password});

    res.json({accessToken: token});

  } catch(error) {
    res.status(500).json(error.message);
  }
});

routes.post('/logout', (req: Request, res: Response) => {
  return res.json({ accessToken: null })
})

export default routes