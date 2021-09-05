import express from 'express'
import routes from './routes'
import cors from 'cors'
import ENV from './config/env'

const app = express()

app.use(cors())
app.use(express.json())
app.use(routes)
app.listen(ENV.PORT, () => console.log(`Server running at http://localhost:${ENV.PORT}`))