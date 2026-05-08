import { Fragment, useEffect, useState } from 'react';

import ComponentAbilities from '../cardAbilities/componentAbilities';


// imágenes
import javascript from '../../components/img/tecnologias/javascript.png';
import css from '../../components/img/tecnologias/css.png';
import boostrap from '../../components/img/tecnologias/Boostrap.png';
import sass from '../../components/img/tecnologias/sass.png';
import react from '../../components/img/tecnologias/react.png';
import php from '../../components/img/tecnologias/PHP-logo.svg.png';
import mysql from '../../components/img/tecnologias/mysql.png';
import mvc from '../../components/img/tecnologias/mvc.png';
import scrum from '../../components/img/tecnologias/scrum.png';
import git from '../../components/img/tecnologias/git.webp';
import lucidchard from '../../components/img/tecnologias/Lucidchard.png';
import miro from '../../components/img/tecnologias/miro.svg';
import trello from '../../components/img/tecnologias/trello.svg';
import npm from '../../components/img/tecnologias/Npm.png';
import node from '../../components/img/tecnologias/node.webp';
import recetarioProject from '../../components/img/proyectos/recetario online.png';
import projectGrd from '../../components/img/proyectos/proyectoGrado.png';

import yoImg from '../../components/img/yp.jpg';

export const BodyHome = () => {
  const texts = [
  'Desarrolladora Full Stack',
  'Angie Andrea Buitrago Patiño'
];

const [index, setIndex] = useState(0);

useEffect(() => {
  const interval = setInterval(() => {
    setIndex((prev) => (prev + 1) % texts.length);
  }, 2500); // tiempo entre cambios

  return () => clearInterval(interval);
}, []);

  return (
    <Fragment>
      <section className='body-home'>
        <div className="body-home__container1">
          <h1>{texts[index]}</h1>
          <p>
            Soy desarrolladora full stack con afinidad por el frontend y la 
            experiencia de usuario.<br />
            Disfruto crear interfaces bien pensadas, 
            cuidar los detalles visuales y comprender el propósito 
            detrás de cada proyecto para construir soluciones funcionales y claras.
          </p>

          <div className="git">
            <button className="btn btn-primary">GIT</button>
            <button className="btn btn-primary">Ver proyectos</button>
          </div>
        </div>

        <div className="about-me1">
          <div className="imgYo">
            <img src={yoImg} alt="Foto Angie" />
          </div>
        </div>
      </section>

      <div className="wave-separator">
        <svg viewBox="0 0 500 150" preserveAspectRatio="none">
          <path
            d="M0.00,49.98 
              C247.45,179.92 267.21,-37.17 500.00,49.98 
              L500.00,0.00 L0.00,0.00 Z"
          />
        </svg>
      </div>

      <section className='abilities'>
        <h4>Habilidades técnicas</h4>
      
       
        <h4>Herramientas y metodologías</h4>
        <div className="abilities-container2">
          <ComponentAbilities title="Metodologías">
            <img src={scrum} alt="Scrum" />
          </ComponentAbilities>
          <ComponentAbilities title="Herramientas">
            <img src={git} alt="git" />
            <img src={lucidchard} alt="lucidchard" />
            <img src={miro} alt="" />
            <img src={trello} alt="" />
            <img src={npm} alt="" />
          </ComponentAbilities>
          <br />
        </div>
      </section>
      
      <div className="wave-separator">
        <svg viewBox="0 0 500 150" preserveAspectRatio="none">
          <path
            d="M0.00,49.98 
              C247.45,179.92 267.21,-37.17 500.00,49.98 
              L500.00,0.00 L0.00,0.00 Z"
          />
        </svg>
      </div>
      <br />
    <section className="projects">
    <h2>Mis Proyectos</h2>
    <p className="subtitle">Aplicaciones reales y en desarrollo</p>

  <div className="projects-grid">

     <ComponentAbilities title="Herramientas"></ComponentAbilities>


  </div>
</section>



    </Fragment>
  );
};


