import { Fragment, useEffect, useState } from 'react';

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
             <img src={node} alt="Node" />
          </ComponentAbilities>
      </div>
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

    <article className="project-card">
      <div className="card-header">
        🍽️ Aplicación Web de Recetario
      </div>

      <div className="card-image">
        <img
          src={recetarioProject}
          alt="Proyecto Recetario"
          className="imgProjects"
        />
      </div>

      <p className="description">
        Aplicación web enfocada en el recetario de una panadería, con gestión visual de recetas mediante imágenes y pasos detallados.
        Permite crear y modificar recetas y se complementa con un inventario básico de panes e insumos, con control de sesiones y operaciones como entradas, salidas y traslados.
      </p>

      <div className="tags">
        <span>PHP</span>
        <span>JavaScript</span>
        <span>HTML</span>
        <span>CSS</span>
        <span>SQL</span>
        <span>MVC</span>
        <span>GIT</span>
      </div>

      <ul className="features">
        <li>Funcionalidades principales:</li>
        <li>CRUD de recetas con imágenes</li>
        <li>Inventario básico</li>
        <li>Control de sesiones</li>
      </ul>

      <span className="status finished">Finalizado</span>

      <a
        href="https://github.com/tu-usuario/tu-repo"
        target="_blank"
        rel="noopener noreferrer"
        className="git-btn"
      >
        Git
      </a>
    </article>

    <article className="project-card">
      <div className="card-header">
        Sistema Web de Inventarios con Gestión de Proveedores y Reportes PDF
      </div>

      <div className="card-image">
        <img
          src={projectGrd}
          alt="Proyecto Inventarios"
          className="imgProjects"
        />
      </div>

      <p className="description">
        Sistema web de inventarios desarrollado como proyecto de grado, con gestión de productos y proveedores, control de sesiones y generación de informes en PDF por tipo de movimiento o rangos mensuales.
      </p>

      <div className="tags">
        <span>PHP</span>
        <span>JavaScript</span>
        <span>HTML</span>
        <span>CSS</span>
        <span>SQL</span>
        <span>MVC</span>
        <span>GIT</span>
      </div>

      <ul className="features">
        <li>Funcionalidades principales:</li>
        <li>Gestión de usuarios y sesiones por roles</li>
        <li>Administración de inventario</li>
        <li>Control de proveedores</li>
        <li>Reportes PDF</li>
        <li>Historial de movimientos</li>
      </ul>

      <span className="status finished">Finalizado</span>

      <a
        href="https://github.com/tu-usuario/tu-repo"
        target="_blank"
        rel="noopener noreferrer"
        className="git-btn"
      >
        Git
      </a>
    </article>

    <article className="project-card">
      <div className="card-header">
        Sistema de Ventas con Control por Mesas (En desarrollo)
      </div>

      <div className="card-image">
        <img
          src={projectGrd}
          alt="Proyecto Ventas"
          className="imgProjects"
        />
      </div>

      <p className="description">
        Aplicación para la gestión de ventas en local que permite registrar productos mediante escaneo de códigos de barras, controlar el consumo por mesa y cliente, y generar un resumen de ventas. Actualmente en desarrollo y migración a Electron.
      </p>

      <div className="tags">
        <span>Node.js</span>
        <span>JavaScript</span>
        <span>HTML</span>
        <span>CSS</span>
        <span>SQL</span>
        <span>Electron</span>
        <span>GIT</span>
      </div>

      <ul className="features">
        <li>Funcionalidades principales:</li>
        <li>Registro de productos con escaneo de código de barras</li>
        <li>CRUD de productos</li>
        <li>Control de consumo por mesa y cliente</li>
        <li>Cierre de cuenta y acumulación automática de ventas</li>
        <li>Resumen de ventas</li>
        <li>Migración a escritorio con Electron (en progreso)</li>
      </ul>

      <span className="status">En desarrollo</span>

      <a
        href="https://github.com/tu-usuario/tu-repo"
        target="_blank"
        rel="noopener noreferrer"
        className="git-btn"
      >
        Git
      </a>
    </article>

  </div>
</section>



    </Fragment>
  );
};


