
import { Fragment } from 'react';
import animeYo from '../../components/img/AnimeYo.png';
import tecnologias from '../../components/img/tecnologias.png'

export const BodyHome = () => {
  return (
    <Fragment>
    <section className="body-home" id="inicio">
      <div className="body-home__container1">
        <div className="body-home_subcontainer1">
          <h1>Desarrolladora Full Stack</h1>
          <h2>Con preferencia en desarrollo Frontend</h2>
         <button className="btn btn-primary">Ver proyectos</button><br />
         <img src={tecnologias} alt="tecnologias usadas" />
        </div>
        <div className="body-home_subcontainer2">
          <img src={animeYo} alt="Ilustración de personaje programando" />
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
