import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BodyHome } from './components/home/homebody'
import './styles/home.scss'



createRoot(document.getElementById('root')).render(
  <StrictMode>
    <BodyHome />
  </StrictMode>,
)
