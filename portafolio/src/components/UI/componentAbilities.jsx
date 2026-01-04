function ComponentAbilities({ title, children }) {
  return (
    <div className="skill-card">
      <div className="skill-card-title">{title}</div>

      <div className="skill-card-content">
        {children}
      </div>
    </div>
  );
}

export default ComponentAbilities;
