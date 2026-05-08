function ComponentAbilities({ title, abilities }) {
  return (
    <div className="skill-card">
      <div className="skill-card-title">
        {title}
      </div>

      <div className="skill-card-content">
        {abilities.map((ability, index) => (
          <img
            key={index}
            src={ability.img}
            alt={ability.alt}
          />
        ))}
      </div>
    </div>
  );
}

export default ComponentAbilities;