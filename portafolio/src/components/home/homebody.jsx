import { Fragment } from 'react';
import ComponentAbilities from '../UI/componentAbilities';
// imágenes
import javascript from '../../components/img/tecnologias/javascript.png';
import css from '../../components/img/tecnologias/css.png';
import boostrap from '../../components/img/tecnologias/Boostrap.png';
import sass from '../../components/img/tecnologias/sass.png';
import react from '../../components/img/tecnologias/react.png';
import php from '../../components/img/tecnologias/PHP-logo.svg.png';
import mysql from '../../components/img/tecnologias/mysql.png';
import mvc from '../../components/img/tecnologias/mvc.png';

import yoImg from '../../components/img/yp.jpg';

export const BodyHome = () => {
  return (
    <Fragment>
      <section className='body-home'>
        <div className="body-home__container1">
          <h1>Desarrolladora Full Stack</h1>
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

        <div className="abilities-container">
          <ComponentAbilities title="Front-end">
            <img src={javascript} alt="JavaScript" />
            <img src={css} alt="Css" />
            <img src={boostrap} alt="Bootstrap" />
            <img src={sass} alt="Sass" />
            <img src={react} alt="React" />
          </ComponentAbilities>

          <ComponentAbilities title="Back-end">
            <img src={php} alt="PHP" />
            <img src={mysql} alt="MySQL" />
            <img src={mvc} alt="MVC" />
          </ComponentAbilities>
      </div>
        <h4>Herramientas y metodologías</h4>
        <div className="abilities-container2">
          <ComponentAbilities title="Metodologías">

          </ComponentAbilities>

          <ComponentAbilities title="Herramientas" />
        </div>
      </section>
    </Fragment>
  );
};
