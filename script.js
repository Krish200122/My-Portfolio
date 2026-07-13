/* Portfolio — splash, scroll reveal, contact */

(function () {
  'use strict';

  const reduced = matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ===== custom cursor ===== */
  const cursor = document.getElementById('cursor');
  const ring = document.getElementById('cursorRing');
  let mx = 0, my = 0, rx = 0, ry = 0;

  if (cursor && ring && !matchMedia('(hover: none)').matches) {
    window.addEventListener('mousemove', (e) => {
      mx = e.clientX;
      my = e.clientY;
      cursor.style.left = mx + 'px';
      cursor.style.top = my + 'px';
    });
    (function ringLoop() {
      rx += (mx - rx) * 0.15;
      ry += (my - ry) * 0.15;
      ring.style.left = rx + 'px';
      ring.style.top = ry + 'px';
      requestAnimationFrame(ringLoop);
    })();
    document.querySelectorAll('[data-hover], a, button').forEach((el) => {
      el.addEventListener('mouseenter', () => {
        cursor.classList.add('grow');
        ring.classList.add('grow');
      });
      el.addEventListener('mouseleave', () => {
        cursor.classList.remove('grow');
        ring.classList.remove('grow');
      });
    });
  }

  /* ===== Earth video splash (step 1) ===== */
  const splash = document.getElementById('splash');

  function revealHero() {
    document.getElementById('heroEyebrow')?.classList.add('show');
    document.getElementById('heroName')?.classList.add('show');
    document.getElementById('headline')?.classList.add('show');
    document.getElementById('heroSub')?.classList.add('show');
    document.getElementById('terminal')?.classList.add('show');
    document.getElementById('getTouch')?.classList.add('show');
    document.getElementById('heroPhoto')?.classList.add('show');
    typeTerminal();
    initScrollAnim();
    revealInView();
  }

  function openHeroSection() {
    document.body.classList.remove('splash-active');
    splash?.classList.add('done');
    window.scrollTo(0, 0);
    setTimeout(revealHero, 250);
  }

  if (window.VideoSplash) {
    VideoSplash.start(openHeroSection);
  } else {
    openHeroSection();
  }

  window.addEventListener('load', () => {
    setTimeout(() => {
      if (splash && !splash.classList.contains('done')) {
        splash.classList.add('done');
        openHeroSection();
      }
      revealInView();
    }, 30000);
  });

  /* ===== hero terminal ===== */
  const termLines = [
    { p: '$ ', t: 'az pipelines run --name saas-onboarding' },
    { p: '', t: '✓ Tenant infra provisioned · Logic Apps deployed' },
    { p: '$ ', t: 'kubectl get pods -n production' },
    { p: '', t: '5/5 running · 99.9% uptime · 0 downtime' }
  ];

  function typeTerminal() {
    const body = document.getElementById('termBody');
    if (!body) return;
    body.innerHTML = '';
    let li = 0;

    function nextLine() {
      if (li >= termLines.length) {
        const c = document.createElement('span');
        c.className = 'term-cursor';
        body.appendChild(c);
        return;
      }
      const row = document.createElement('div');
      row.innerHTML = termLines[li].p ? `<span class="prompt">${termLines[li].p}</span>` : '';
      body.appendChild(row);
      const textNode = document.createElement('span');
      row.appendChild(textNode);
      let ci = 0;
      const full = termLines[li].t;

      function typeChar() {
        if (ci <= full.length) {
          textNode.textContent = full.slice(0, ci);
          ci++;
          setTimeout(typeChar, reduced ? 0 : 22);
        } else {
          li++;
          setTimeout(nextLine, reduced ? 0 : 260);
        }
      }
      typeChar();
    }
    nextLine();
  }

  /* ===== scroll reveal (CSS only — no GSAP opacity traps) ===== */
  function revealInView() {
    document.querySelectorAll('.reveal, .reveal-line').forEach((el) => {
      const rect = el.getBoundingClientRect();
      if (rect.top < window.innerHeight * 0.92) el.classList.add('in');
    });
  }

  const io = new IntersectionObserver((entries) => {
    entries.forEach((en) => {
      if (en.isIntersecting) en.target.classList.add('in');
    });
  }, { threshold: 0.08, rootMargin: '0px 0px -40px 0px' });
  document.querySelectorAll('.reveal, .reveal-line').forEach((el) => io.observe(el));

  window.addEventListener('scroll', revealInView, { passive: true });

  /* ===== subtle scroll fade (no 3D) ===== */
  function initScrollAnim() {
    if (typeof gsap === 'undefined' || typeof ScrollTrigger === 'undefined') return;
    gsap.registerPlugin(ScrollTrigger);

    document.querySelectorAll('[data-case]').forEach((caseEl) => {
      const body = caseEl.querySelector('.case-body');
      if (!body) return;
      gsap.from(body, {
        scrollTrigger: { trigger: caseEl, start: 'top 82%', once: true },
        opacity: 0, y: 30, duration: 0.7, ease: 'power2.out',
        clearProps: 'opacity,transform'
      });
    });
  }

  /* ===== counters ===== */
  const counters = document.querySelectorAll('.num[data-count]');
  const cIo = new IntersectionObserver((entries) => {
    entries.forEach((en) => {
      if (!en.isIntersecting) return;
      const el = en.target;
      const target = parseFloat(el.dataset.count);
      const prefix = el.dataset.prefix || '';
      const suffix = el.dataset.suffix || '';
      const isFloat = target % 1 !== 0;
      const dur = reduced ? 0 : 1400;
      const start = performance.now();

      function step(now) {
        const p = dur === 0 ? 1 : Math.min(1, (now - start) / dur);
        const eased = 1 - Math.pow(1 - p, 3);
        const cur = target * eased;
        el.textContent = prefix + (isFloat ? cur.toFixed(1) : Math.floor(cur)) + suffix;
        if (p < 1) requestAnimationFrame(step);
      }
      requestAnimationFrame(step);
      cIo.unobserve(el);
    });
  }, { threshold: 0.5 });
  counters.forEach((el) => cIo.observe(el));

  /* ===== EmailJS ===== */
  if (typeof emailjs !== 'undefined') {
    emailjs.init('LCX5Odd5orbnK5GaQ');
  }

  const form = document.getElementById('contactForm');
  const sendBtn = document.getElementById('sendBtn');
  const formOk = document.getElementById('formOk');
  const formErr = document.getElementById('formErr');

  if (form) {
    form.addEventListener('submit', async (e) => {
      e.preventDefault();
      formOk?.classList.remove('show');
      formErr?.classList.remove('show');

      const first = document.getElementById('fFirst').value.trim();
      const last = document.getElementById('fLast').value.trim();
      const email = document.getElementById('fEmail').value.trim();
      const msg = document.getElementById('fMsg').value.trim();

      if (!first || !last || !email || !msg) {
        formErr.textContent = 'Please fill in all fields.';
        formErr.classList.add('show');
        return;
      }

      sendBtn.disabled = true;
      sendBtn.textContent = 'Sending…';

      try {
        await emailjs.send('service_co42jyb', 'template_09j0nrw', {
          from_name: first + ' ' + last,
          from_email: email,
          message: msg
        });
        formOk?.classList.add('show');
        form.reset();
      } catch (err) {
        formErr.textContent = 'Failed to send. Email krishtarun2001@gmail.com directly.';
        formErr.classList.add('show');
      } finally {
        sendBtn.disabled = false;
        sendBtn.textContent = 'Send message →';
      }
    });
  }
})();
