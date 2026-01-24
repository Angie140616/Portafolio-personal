import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BodyHome } from './components/home/homebody'
import './styles/home.scss'
import './styles/abilities.scss'
import './styles/projects.scss'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BodyHome />
  </StrictMode>,
)
