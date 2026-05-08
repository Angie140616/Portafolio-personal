import { Fragment, useEffect, useState } from 'react';

import ComponentAbilities from '../cardAbilities/componentAbilities';
import ComponentSeparator from '../separator/componentSeparator';
import ComponentProjects from '../cardProjects/ComponentProjects';
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

      <ComponentSeparator />
      <section className="abilities-section">

  <h3>Habilidades técnicas</h3>

  <div className="abilities">

    <ComponentAbilities
      title="Front-end"
      abilities={[
        { img: javascript, alt: "Javascript" },
        { img: css, alt: "Css" },
        { img: boostrap, alt: "Boostrap" },
        { img: sass, alt: "sass" },
        { img: react, alt: "react" }
      ]}
    />

    <ComponentAbilities
      title="Back-end"
      abilities={[
        { img: php, alt: "Php" },
        { img: mysql, alt: "mysql" },
        { img: node, alt: "node" }
      ]}
    />

  </div>

  <br />
  <h3>Herramientas y metodologías</h3>
 
  <div className="abilities">

    <ComponentAbilities
      title="Herramientas"
      abilities={[
        { img: git, alt: "git" },
        { img: npm, alt: "npm" },
        { img: trello, alt: "trello" },
        { img: miro, alt: "miro" },
        { img: lucidchard, alt: "lucidchart" }
      ]}
    />

    <ComponentAbilities
      title="Metodologías"
      abilities={[
        { img: scrum, alt: "scrum" },
        { img: mvc, alt: "mvc" }
      ]}
    />

  </div>

</section>
<ComponentSeparator />
<section className="projects">

  <h3>Mis Proyectos</h3>
  <p className="subtitle">
    Aplicaciones reales y en desarrollo
  </p>

  <div className="projects-grid">

    <ComponentProjects
      title="Recetario Online"
      image={recetarioProject}
      description="Aplicación web para gestionar y consultar recetas de cocina."

      tags={[
        "PHP",
        "MySQL",
        "Javascript",
        "MVC"
      ]}

      features={[
        "Registro e inicio de sesión",
        "CRUD de recetas",
        "Buscador de recetas",
        "Diseño responsive"
      ]}

      status="Finalizado"

      github="https://github.com/Angie140616/Panem"
    />

    <ComponentProjects
      title="Proyecto de Grado"
      image={projectGrd}
      description="Sistema web desarrollado para la gestión de inventario y administración de proveedores."

      tags={[
        "PHP",
        "MVC",
        "Bootstrap",
        "MySQL",
        "Javascript"
      ]}

      features={[
        "Gestión de usuarios",
        "Panel administrativo",
        "Reportes dinámicos",
        "Control de acceso"
      ]}

      status="Finalizado"

      github="https://github.com/Angie140616/GINVZ"
    />

    <ComponentProjects
      title="Sistema de Gestión para Local"
      image={yoImg}
      description=" Sistema de escritorio orientado al control de consumo, administración de mesas e inventario para un establecimiento."

      tags={[
        "Node.js",
        "React",
        "Sass",
        "MySQL",
        "Javascript",
      ]}

      features={[
        "Control de consumo por mesa",
        "Registro y gestión de pedidos",
        "Estado de pago de clientes",
        "Administración de inventario",
        "CRUD de productos",
        "Interfaz orientada a escritorio"
      ]}

      status="En desarrollo"

      github="https://github.com/Angie140616/Portafolio-personal"
    />

  </div>

</section>



    </Fragment>
  );
};


