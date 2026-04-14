const API = {
  async getTorneos() {
    const res = await fetch('/api/torneos');
    return res.json();
  },

  async getTorneoDetalle(id) {
    const res = await fetch(`/api/torneos/${id}`);
    return res.json();
  },

  async getRanking(torneoId) {
    const res = await fetch(`/api/estadisticas/ranking?torneo_id=${encodeURIComponent(torneoId)}`);
    return res.json();
  },

  async getEquipoFases(torneoId, equipo) {
    const res = await fetch(`/api/estadisticas/equipo?torneo_id=${encodeURIComponent(torneoId)}&equipo=${encodeURIComponent(equipo)}`);
    return res.json();
  },

  async buscar(q) {
    const res = await fetch(`/api/busqueda?q=${encodeURIComponent(q)}`);
    return res.json();
  },

  async getSponsors(videojuego) {
    const res = await fetch(`/api/sponsors?videojuego=${encodeURIComponent(videojuego)}`);
    return res.json();
  },

  async inscribir(nombre_equipo, id_torneo) {
    const res = await fetch('/api/inscripcion', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ nombre_equipo, id_torneo })
    });
    return res.json();
  },

  async getVideojuegos() {
    const res = await fetch('/api/videojuegos');
    return res.json();
  },

  async getEquipos() {
    const res = await fetch('/api/equipos');
    return res.json();
  }
};
