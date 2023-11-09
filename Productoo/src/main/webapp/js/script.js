const body = document.querySelector('body');
const sidebar = body.querySelector('nav');
const toggle = body.querySelector('.toggle');
const searchBtn = body.querySelector('.search-box');
const modeSwitch = body.querySelector('.toggle-switch');
const modeText = body.querySelector('.mode-text');

// Obtener el modo actual del almacenamiento local
const currentMode = localStorage.getItem('mode');

// Verificar y establecer el modo actual del cuerpo (dark/light)
if (currentMode === 'dark') {
    body.classList.add('dark');
    modeText.innerText = 'Light mode';
} else {
    body.classList.remove('dark');
    modeText.innerText = 'Dark mode';
}

sidebar.classList.remove('close');

toggle.addEventListener('click', () => {
    sidebar.classList.toggle('close');
});

searchBtn.addEventListener('click', () => {
    sidebar.classList.remove('close');
});

modeSwitch.addEventListener('click', () => {
    // Alternar el modo de color en el cuerpo
    body.classList.toggle('dark');

    // Obtener el modo actual después del cambio
    const updatedMode = body.classList.contains('dark') ? 'dark' : 'light';

    // Actualizar el modo en el almacenamiento local
    localStorage.setItem('mode', updatedMode);

    // Actualizar el texto del modo de color
    if (updatedMode === 'dark') {
        modeText.innerText = 'Light mode';
    } else {
        modeText.innerText = 'Dark mode';
    }
    
    
});


