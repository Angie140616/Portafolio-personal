
import { Fragment } from 'react';
import animeYo from '../../components/img/AnimeYo.png';
import tecnologias from '../../components/img/tecnologias.png'
import yoImg from '../../components/img/yp.jpg'

export const BodyHome = () => {
  return (
    <Fragment>
        <section className='body-home'>
          <div className="body-home__container1">
            <h1>Desarrolladora Full Stack</h1>
            <p>Soy desarrolladora full stack con afinidad por el frontend y la 
            experiencia de usuario.<br></br> Disfruto crear interfaces bien pensadas, 
            cuidar los detalles visuales y comprender el propósito 
            detrás de cada proyecto<br></br> para construir soluciones funcionalesy claras.
            </p>
            <div className="git">
               <button className="btn btn-primary">GIT</button><br />
              <button className="btn btn-primary">Ver proyectos</button><br />
            </div>
            
           </div>
         
          <div className="about-me1">
            <div className="imgYo">
            <img src={yoImg} alt="" />
          </div>
        </div>
  
        </section>
      
    

    <div className="wave-separator">
  <svg viewBox="0 0 500 150" preserveAspectRatio="none">
    <path
      d="M0.00,49.98 
         C247.45,179.92 267.21,-37.17 500.00,49.98 
         L500.00,0.00 L0.00,0.00 Z" />
  </svg>
</div>
    
    </Fragment>
  );
};
