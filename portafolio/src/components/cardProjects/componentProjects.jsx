const ComponentProjects = ({
  title,
  image,
  video,
  description,
  tags = [],
  features = [],
  status,
  github,
  download
}) => {
  return (
    <article className="project-card">

      <div className="card-header">
        {title}
      </div>

      <div className="card-image">
        {video ? (
          <video
            src={video}
            className="imgProjects"
            controls
            preload="auto"
            playsInline
            muted={false}
          />
        ) : (
          <img
            src={image}
            alt={title}
            className="imgProjects"
          />
        )}
      </div>

      <p className="description">
        {description}
      </p>

      <div className="tags">
        {tags.map((tag, index) => (
          <span key={index}>
            {tag}
          </span>
        ))}
      </div>

      <ul className="features">
        <li>
          <strong>Funcionalidades principales:</strong>
        </li>

        {features.map((feature, index) => (
          <li key={index}>{feature}</li>
        ))}
      </ul>

      <span className={`status ${status?.toLowerCase()}`}>
        {status}
      </span>

      <div className="project-buttons">

        {github && (
          <a
            href={github}
            target="_blank"
            rel="noopener noreferrer"
            className="git-btn"
          >
            GitHub
          </a>
        )}

        {download && (
          <a
            href={download}
            download
            className="git-btn"
          >
            Descargar
          </a>
        )}

      </div>

    </article>
  );
};

export default ComponentProjects;