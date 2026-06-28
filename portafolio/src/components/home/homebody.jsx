import { Fragment, useEffect, useState } from 'react';

import ComponentAbilities from '../cardAbilities/componentAbilities';
import ComponentSeparator from '../separator/componentSeparator';
import ComponentProjects from '../cardProjects/componentProjects';

export const BodyHome = () => {
  const texts = [
    'Desarrolladora Full Stack',
    'Analista de datos junior',
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
           Soy desarrolladora full stack con interés en el desarrollo de software, 
           el análisis de datos y la mejora continua de procesos. <br></br>
           Disfruto comprender las necesidades de cada proyecto, transformar información en soluciones útiles y crear aplicaciones funcionales, intuitivas y bien estructuradas.
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
              { img: "/img/tecnologias/Lucidchard.png", alt: "lucidchart" },
              { img: "img/tecnologias/excel.png", alt: "excel"}
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
          Aplicaciones reales y en desarrollo<br></br>
          Desarrollo full-stack
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
          <br></br>
          <p className="subtitle">
              Analisis de datos
            </p>
            <br></br>
            <ComponentProjects
              title="Dashboard de Gestión de Nómina"
              image="/img/proyectos/DashboardA.png"
              description="Desarrollo de un dashboard interactivo en Excel para el análisis y seguimiento de la nómina de una empresa. Incluye indicadores clave como total de salarios, horas extras, deducciones, bonificaciones, costo de nómina por área y cargo, además de filtros dinámicos y visualizaciones para facilitar la toma de decisiones y el control de la información."
              tags={["Excel", "Buscar v/Buscar x", "Tablas dinamicas", "Kpis", "Segmentadores", "Dashboard"]}
              features={[
              "Análisis y limpieza de datos.",
              "Relación de información mediante BUSCARX.",
              "Cálculo de KPIs (Ingresos, Costos, Ganancias y Margen)",
              "Creación de tablas dinámicas.",
              "Implementación de segmentadores interactivos.",
              "Diseño de dashboard ejecutivo en Excel."
              ]}
              status="Terminado"
              download="/img/proyectos/bd/DASBOARD2.xlsx"
            />
            <ComponentProjects
              title="Sistema de Gestión para Panadería"
              image="/img/proyectos/DiagramaUML.png"
              description="Diseño y construcción de una base de datos relacional para la gestión de inventario y producción. Incluye modelado UML, creación de tablas, definición de llaves primarias y foráneas, relaciones entre entidades e implementación de procedimientos almacenados para la administración de la información."
              tags={["MySQL", "SQL", "UML", "Procedimientos almacenados", "Diseño de base de datos"]}
              features={[
              "Diseño del diagrama UML.",
              "Creación de tablas relacionales.",
              "Implementación de llaves primarias y foráneas.",
              "Definición de relaciones entre entidades.",
              "Desarrollo de procedimientos almacenados.",
              "Gestión de integridad y consistencia de datos."
              ]}
              status="Terminado"
              download="/img/proyectos/bd/panem.sql"
            />
        </div>
            
        
      </section>

    </Fragment>
  );
};