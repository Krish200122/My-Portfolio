/* Step 1: Earth video splash at 2× speed (cloud + about section comes next) */
window.VideoSplash = (function () {
  'use strict';

  const EARTH_SRC = 'Assets/video/earth.mp4';
  const PLAYBACK_RATE = 2;
  const CLOUD_FLASH_MS = 240;

  function start(onComplete) {
    const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;
    const splash = document.getElementById('splash');
    const video = document.getElementById('splashVideo');
    const countEl = document.getElementById('splashCount');
    const captionEl = document.getElementById('splashCaption');
    const whiteoutEl = document.getElementById('splashWhiteout');

    if (reduced || !splash || !video) {
      if (countEl) countEl.textContent = '100%';
      onComplete?.();
      return;
    }

    document.body.classList.add('splash-active');
    if (captionEl) captionEl.textContent = 'Approaching Earth · Azure DevOps';

    let finished = false;
    let safetyTimer = null;

    function enterCloud() {
      if (finished) return;
      finished = true;
      if (safetyTimer) clearTimeout(safetyTimer);
      video.removeEventListener('timeupdate', updateProgress);
      video.pause();
      if (countEl) countEl.textContent = '100%';
      if (captionEl) captionEl.textContent = 'Entering cloud layer…';

      splash.classList.add('cloud-flash');
      if (whiteoutEl) whiteoutEl.classList.add('active');

      setTimeout(() => onComplete?.(), CLOUD_FLASH_MS);
    }

    function updateProgress() {
      if (!video.duration || !isFinite(video.duration)) return;
      const p = Math.min(100, Math.round((video.currentTime / video.duration) * 100));
      if (countEl) countEl.textContent = p + '%';
      if (p >= 92 && captionEl) captionEl.textContent = 'Penetrating clouds…';
    }

    video.playbackRate = PLAYBACK_RATE;
    video.muted = true;
    video.playsInline = true;
    video.setAttribute('playsinline', '');
    video.setAttribute('webkit-playsinline', '');

    video.addEventListener('timeupdate', updateProgress);
    video.addEventListener('ended', enterCloud);
    video.addEventListener('error', () => onComplete?.());

    const playPromise = video.play();
    if (playPromise && playPromise.catch) {
      playPromise.catch(() => onComplete?.());
    }

    video.addEventListener('loadedmetadata', () => {
      const ms = (video.duration / PLAYBACK_RATE) * 1000 + 3000;
      safetyTimer = setTimeout(enterCloud, ms);
    }, { once: true });
  }

  return { start };
})();
