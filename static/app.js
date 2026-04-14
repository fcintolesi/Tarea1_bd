function setActivePanel(panelId) {
  document.querySelectorAll('nav button').forEach(b => b.classList.toggle('active', b.dataset.panel === panelId));
  document.querySelectorAll('.panel').forEach(p => p.classList.toggle('active', p.id === panelId));
}

function tableFromObjects(items) {
  if (!items || items.length === 0) return '<p>No hay datos.</p>';
  const headers = Object.keys(items[0]);
  const thead = `<tr>${headers.map(h => `<th>${h}</th>`).join('')}</tr>`;
  const rows = items.map(item => `<tr>${headers.map(h => `<td>${item[h] ?? ''}</td>`).join('')}</tr>`).join('');
  return `<table><thead>${thead}</thead><tbody>${rows}</tbody></table>`;
}

function fillSelect(select, items, getValue, getLabel) {
  select.innerHTML = '';
  items.forEach(item => {
    const option = document.createElement('option');
    option.value = getValue(item);
    option.textContent = getLabel(item);
    select.appendChild(option);
  });
}

async function loadInitialData() {
  const torneos = await API.getTorneos();
  const equipos = await API.getEquipos();
  const videojuegos = await API.getVideojuegos();

  const torneoSelect = document.getElementById('torneoSelect');
  const statsTorneoSelect = document.getElementById('statsTorneoSelect');
  const inscripcionTorneoSelect = document.getElementById('inscripcionTorneoSelect');
  const statsEquipoSelect = document.getElementById('statsEquipoSelect');
  const inscripcionEquipoSelect = document.getElementById('inscripcionEquipoSelect');
  const videojuegoSelect = document.getElementById('videojuegoSelect');

  fillSelect(torneoSelect, torneos, t => t.id_torneo, t => `${t.id_torneo} - ${t.nombre}`);
  fillSelect(statsTorneoSelect, torneos, t => t.id_torneo, t => `${t.id_torneo} - ${t.nombre}`);
  fillSelect(inscripcionTorneoSelect, torneos, t => t.id_torneo, t => `${t.id_torneo} - ${t.nombre}`);
  fillSelect(statsEquipoSelect, equipos, e => e, e => e);
  fillSelect(inscripcionEquipoSelect, equipos, e => e, e => e);
  fillSelect(videojuegoSelect, videojuegos, v => v, v => v);

  document.getElementById('listaTorneos').innerHTML = tableFromObjects(torneos);
  if (torneos.length > 0) {
    await cargarDetalleTorneo();
  }
}

async function cargarDetalleTorneo() {
  const id = document.getElementById('torneoSelect').value;
  const data = await API.getTorneoDetalle(id);
  if (data.error) {
    document.getElementById('detalleTorneo').innerHTML = `<p>${data.error}</p>`;
    return;
  }

  const html = `
    <div class="card">
      <h3>${data.torneo.nombre}</h3>
      <p><strong>Videojuego:</strong> ${data.torneo.videojuego}</p>
      <p><strong>Fechas:</strong> ${data.torneo.fecha_inicio} a ${data.torneo.fecha_fin}</p>
      <p><strong>Prize pool:</strong> ${data.torneo.prize_pool}</p>
      <p><strong>Máx. equipos:</strong> ${data.torneo.max_equipos}</p>
    </div>
    <div class="card"><h3>Tabla de posiciones</h3>${tableFromObjects(data.posiciones)}</div>
    <div class="card"><h3>Partidas</h3>${tableFromObjects(data.partidas)}</div>
    <div class="card"><h3>Equipos inscritos</h3>${tableFromObjects(data.equipos)}</div>
    <div class="card"><h3>Sponsors</h3>${tableFromObjects(data.sponsors)}</div>
  `;
  document.getElementById('detalleTorneo').innerHTML = html;
}

async function cargarEstadisticas() {
  const torneoId = document.getElementById('statsTorneoSelect').value;
  const equipo = document.getElementById('statsEquipoSelect').value;
  const ranking = await API.getRanking(torneoId);
  const fases = await API.getEquipoFases(torneoId, equipo);
  document.getElementById('rankingStats').innerHTML = tableFromObjects(ranking);
  document.getElementById('equipoStats').innerHTML = tableFromObjects(fases);
}

async function ejecutarBusqueda() {
  const q = document.getElementById('busquedaInput').value.trim();
  const data = await API.buscar(q);
  document.getElementById('resultadoJugadores').innerHTML = tableFromObjects(data.jugadores);
  document.getElementById('resultadoEquipos').innerHTML = tableFromObjects(data.equipos);
}

async function cargarSponsors() {
  const videojuego = document.getElementById('videojuegoSelect').value;
  const data = await API.getSponsors(videojuego);
  document.getElementById('resultadoSponsors').innerHTML = tableFromObjects(data);
}

async function inscribirEquipo() {
  const id_torneo = parseInt(document.getElementById('inscripcionTorneoSelect').value, 10);
  const nombre_equipo = document.getElementById('inscripcionEquipoSelect').value;
  const msg = document.getElementById('mensajeInscripcion');
  const data = await API.inscribir(nombre_equipo, id_torneo);
  if (data.error) {
    msg.textContent = data.error;
    msg.className = 'msg error';
  } else {
    msg.textContent = data.message;
    msg.className = 'msg success';
  }
}

document.addEventListener('DOMContentLoaded', async () => {
  document.querySelectorAll('nav button').forEach(btn => {
    btn.addEventListener('click', () => setActivePanel(btn.dataset.panel));
  });

  document.getElementById('btnCargarTorneo').addEventListener('click', cargarDetalleTorneo);
  document.getElementById('btnCargarStats').addEventListener('click', cargarEstadisticas);
  document.getElementById('btnBuscar').addEventListener('click', ejecutarBusqueda);
  document.getElementById('btnSponsors').addEventListener('click', cargarSponsors);
  document.getElementById('btnInscribir').addEventListener('click', inscribirEquipo);

  await loadInitialData();
});
