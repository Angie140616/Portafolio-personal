
import { Fragment } from 'react';
import animeYo from '../../components/img/AnimeYo.png';
import tecnologias from '../../components/img/tecnologias.png'
import yoImg from '../../components/img/yp.jpg'

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
    <section className='body-home2'>
      <div className="about-me1">
        <div className="imgYo">
          <img src={yoImg} alt="" />
        </div>
      </div>
        <div className="about-me2">
            <p>Soy desarrolladora full stack con afinidad por el frontend y la experiencia de  usuario. Disfruto construir interfaces bien pensadas, cuidar los detalles visuales y entender el proposito detras de cada proyecto. Me motiva aprender constantemente, mejorar mis habilidades y enfrentar nuevos desafíos como una oportunidad de crecimiento personal y profesional, soy una persona autodidacta que quiere aprender cada dia más y más cosas </p>
        </div>
    </section>
    </Fragment>
  );
};
