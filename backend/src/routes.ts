import { Router, Request, Response } from 'express'
import { eventsExample } from './infra/database/eventsExample'
import { generateToken } from './infra/authentication/authentication'
import { newsExample } from './infra/database/newsExample'
import { verify } from 'jsonwebtoken'

const routes = Router()

const Authentication = (req: Request, res: Response, next) => {
  const token: any = req.headers['x-access-token'];
    if (!token) return res.status(401).json({ message: 'No token provided.' });
    
    verify(token, '784573hhfyrd', function(err, decoded) {
      if (err) return res.status(500).json({ message: 'Failed to authenticate token.' });
      next();
    });
}

routes.get('/news', (req: Request, res: Response) => {
  return res.json(newsExample)
})

routes.get('/event', Authentication,(req: Request, res: Response) => {
  return res.json(eventsExample)
})

routes.post('/login', (req: Request, res: Response) => {
  const { userName } = req.body;
  
  if(req.body.user === 'userTeste' && req.body.password === '123456'){
    const token = generateToken(userName)
    return res.json({ accessToken: token });
  }
  
  res.status(500).json({message: 'Login inválido!'});
});

routes.post('/logout', (req: Request, res: Response) => {
  return res.json({ accessToken: null })
})

export default routes