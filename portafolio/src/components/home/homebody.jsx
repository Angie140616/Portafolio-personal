import { Fragment, useEffect, useState } from 'react';

import ComponentAbilities from '../cardAbilities/componentAbilities';
import ComponentSeparator from '../separator/componentSeparator';
import ComponentProjects from '../cardProjects/componentProjects';

export const BodyHome = () => {
  const texts = [
    'Desarrolladora Full Stack',
    'Angie Andrea Buitrago Patiño'
  ];

  const [index, setIndex] = useState(0);

  useEffect(() => {
    const interval = setInterval(() => {
      setIndex((prev) => (prev + 1) % texts.length);
    }, 2500);

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
            <button className="btn btn-primary" onClick={() => window.open("https://github.com/Angie140616/Portafolio-personal", "_blank")}>
              Ver GitHub
            </button>
            <button className="btn btn-primary" onClick={() => {
              document.querySelector(".projects").scrollIntoView({ behavior: "smooth" });
            }}>
            Ver proyectos
            </button>
          
          </div>
        </div>

        <div className="about-me1">
          <div className="imgYo">
            <img src="/img/yp.jpg" alt="Foto Angie" />
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
              { img: "/img/tecnologias/javascript.png", alt: "Javascript" },
              { img: "/img/tecnologias/css.png", alt: "Css" },
              { img: "/img/tecnologias/Boostrap.png", alt: "Boostrap" },
              { img: "/img/tecnologias/sass.png", alt: "sass" },
              { img: "/img/tecnologias/react.png", alt: "react" }
            ]}
          />

          <ComponentAbilities
            title="Back-end"
            abilities={[
              { img: "/img/tecnologias/PHP-logo.svg.png", alt: "Php" },
              { img: "/img/tecnologias/mysql.png", alt: "mysql" },
              { img: "/img/tecnologias/node.webp", alt: "node" }
            ]}
          />

        </div>

        <br />
        <h3>Herramientas y metodologías</h3>

        <div className="abilities">

          <ComponentAbilities
            title="Herramientas"
            abilities={[
              { img: "/img/tecnologias/git.webp", alt: "git" },
              { img: "/img/tecnologias/Npm.png", alt: "npm" },
              { img: "/img/tecnologias/trello.svg", alt: "trello" },
              { img: "/img/tecnologias/miro.svg", alt: "miro" },
              { img: "/img/tecnologias/Lucidchard.png", alt: "lucidchart" }
            ]}
          />

          <ComponentAbilities
            title="Metodologías"
            abilities={[
              { img: "/img/tecnologias/scrum.png", alt: "scrum" },
              { img: "/img/tecnologias/mvc.png", alt: "mvc" }
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
            title="Saboria tu recetario"
            image="/img/proyectos/recetario online.png"
            description="sistema para gestionar recetas, búsqueda y organización de platos con CRUD completo y autenticación."
            tags={["PHP", "MySQL", "Javascript", "MVC"]}
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
            title="GestionINVZ"
            video="/img/videosMuestra/GESTIONINVZDEMO.mp4"
            description="Sistema web desarrollado para la gestión de inventario y administración de proveedores."
            tags={["PHP", "MVC", "Bootstrap", "MySQL", "Javascript"]}
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
            image="/img/proyectos/Picando y tomando.png"
            description="Sistema de escritorio orientado al control de consumo, administración de mesas e inventario para un establecimiento."
            tags={["Node.js", "React", "Sass", "MySQL", "Javascript"]}
            features={[
              "Control de consumo por mesa",
              "Registro y gestión de pedidos",
              "Estado de pago de clientes",
              "Administración de inventario",
              "CRUD de productos",
              "Interfaz orientada a escritorio"
            ]}
            status="En desarrollo"
            github="https://github.com/Angie140616/Picando-y-tomando-apk"
          />

        </div>

      </section>

    </Fragment>
  );
};