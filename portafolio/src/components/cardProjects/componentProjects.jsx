const ComponentProjects = ({
  title,
  image,
  description,
  tags = [],
  features = [],
  status,
  github
}) => {
  return (
    <article className="project-card">

      <div className="card-header">
        {title}
      </div>

      <div className="card-image">
        <img
          src={image}
          alt={title}
          className="imgProjects"
        />
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
          <strong>
            Funcionalidades principales:
          </strong>
        </li>

        {features.map((feature, index) => (
          <li key={index}>
            {feature}
          </li>
        ))}

      </ul>

      <span className={`status ${status?.toLowerCase()}`}>
        {status}
      </span>

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

    </article>
  );
};

export default ComponentProjects;