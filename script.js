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

  /* ===== sticky header ===== */
  const siteHeader = document.querySelector('header');
  function updateHeader() {
    if (!siteHeader) return;
    siteHeader.classList.toggle('is-scrolled', window.scrollY > 40);
  }
  updateHeader();
  window.addEventListener('scroll', updateHeader, { passive: true });

  /* ===== Earth video splash ===== */
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
    initHeadlineTypewriter();
    initScrollAnim();
  }

  /* ===== hero headline typewriter ===== */
  function initHeadlineTypewriter() {
    const lines = [
      { el: document.getElementById('typeBuild'), words: ['Build.', 'Deploy.', 'Ship.'] },
      { el: document.getElementById('typeAutomate'), words: ['Automate.', 'Orchestrate.', 'Scale.'] }
    ].filter((line) => line.el);

    if (!lines.length) return;

    if (reduced) {
      lines.forEach((line) => { line.el.textContent = line.words[0]; });
      lines.forEach((line) => line.el.closest('.type-line')?.querySelector('.type-cursor')?.remove());
      return;
    }

    const TYPE_MS = 110;
    const DELETE_MS = 65;
    const PAUSE_MS = 2200;

    lines.forEach((line, index) => {
      let wordIndex = 0;
      let charIndex = 0;
      let deleting = false;

      function tick() {
        const word = line.words[wordIndex];

        if (!deleting) {
          charIndex += 1;
          line.el.textContent = word.slice(0, charIndex);

          if (charIndex === word.length) {
            deleting = true;
            setTimeout(tick, PAUSE_MS);
            return;
          }

          setTimeout(tick, TYPE_MS);
          return;
        }

        charIndex -= 1;
        line.el.textContent = word.slice(0, charIndex);

        if (charIndex === 0) {
          deleting = false;
          wordIndex = (wordIndex + 1) % line.words.length;
          setTimeout(tick, TYPE_MS);
          return;
        }

        setTimeout(tick, DELETE_MS);
      }

      setTimeout(tick, 400 + index * 500);
    });
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

  /* ===== scroll reveal ===== */
  function splitWords(el) {
    if (el.dataset.wordsSplit) return [...el.querySelectorAll('.w')];

    const target = el.querySelector(':scope > span') || el;
    const text = target.textContent.trim();
    if (!text) return [];

    target.textContent = '';
    target.classList.add('word-line');

    const words = text.split(/\s+/).map((part, i, arr) => {
      const w = document.createElement('span');
      w.className = 'w';
      w.textContent = part + (i < arr.length - 1 ? '\u00a0' : '');
      target.appendChild(w);
      return w;
    });

    el.dataset.wordsSplit = '1';
    return words;
  }

  function wordBurst(trigger, target, variant) {
    const elements = typeof target === 'string'
      ? [...document.querySelectorAll(target)]
      : target ? [target] : [];

    elements.forEach((el) => {
      const words = splitWords(el);
      if (!words.length) return;

      const presets = {
        blur: { autoAlpha: 0, y: 22, filter: 'blur(8px)' },
        snap: { autoAlpha: 0, scale: 0.9, y: 14 },
        slide: { autoAlpha: 0, x: -22, y: 6 }
      };

      gsap.fromTo(words, presets[variant] || presets.blur, {
        scrollTrigger: {
          trigger,
          start: 'top 78%',
          toggleActions: 'play none none none',
          once: true
        },
        autoAlpha: 1,
        y: 0,
        x: 0,
        scale: 1,
        filter: 'blur(0px)',
        duration: 0.55,
        stagger: 0.05,
        ease: 'power3.out',
        clearProps: 'filter'
      });
    });
  }

  function revealOnScroll(targets, opts) {
    const els = gsap.utils.toArray(targets).filter(Boolean);
    if (!els.length) return;

    gsap.fromTo(
      els,
      opts.from || { autoAlpha: 0, y: 28 },
      {
        scrollTrigger: {
          trigger: opts.trigger,
          start: opts.start || 'top 80%',
          toggleActions: 'play none none none',
          once: true
        },
        autoAlpha: 1,
        y: 0,
        x: 0,
        scale: 1,
        duration: opts.duration || 0.55,
        stagger: opts.stagger || 0.08,
        ease: opts.ease || 'power3.out',
        delay: opts.delay || 0
      }
    );
  }

  function initScrollAnim() {
    if (reduced) return;
    if (typeof gsap === 'undefined' || typeof ScrollTrigger === 'undefined') return;

    gsap.registerPlugin(ScrollTrigger);

    wordBurst('#about', '#about .reveal-line', 'blur');
    revealOnScroll('#about .tag, #about .about-main, #about .about-highlights li', {
      trigger: '#about', start: 'top 78%', stagger: 0.09
    });

    revealOnScroll('#stats .stat', {
      trigger: '#stats',
      start: 'top 85%',
      from: { autoAlpha: 0, scale: 0.88, y: 20 },
      duration: 0.5,
      stagger: 0.09,
      ease: 'back.out(1.35)'
    });

    wordBurst('#roles', '#roles .roles-head h3', 'snap');
    revealOnScroll('#roles .roles-head .eyebrow, #roles .roles-head p', {
      trigger: '#roles', start: 'top 80%', stagger: 0.08
    });
    revealOnScroll('#roles .role-card', {
      trigger: '#roles .roles-grid',
      start: 'top 82%',
      from: { autoAlpha: 0, y: 40 },
      stagger: 0.12,
      duration: 0.6
    });

    wordBurst('#work', '#work .work-head h3', 'snap');
    revealOnScroll('#work .work-head .eyebrow, #work .work-head p', {
      trigger: '#work', start: 'top 80%', stagger: 0.08
    });

    document.querySelectorAll('[data-case]').forEach((caseEl, i) => {
      const title = caseEl.querySelector('.case-title');
      if (title) wordBurst(caseEl, title, i % 2 ? 'slide' : 'blur');

      revealOnScroll(caseEl.querySelectorAll('.case-num, .case-role, .case-tags, .case-metrics'), {
        trigger: caseEl,
        start: 'top 80%',
        from: { autoAlpha: 0, y: 20 },
        stagger: 0.07,
        duration: 0.5
      });

      revealOnScroll(caseEl.querySelectorAll('.case-bullets li'), {
        trigger: caseEl,
        start: 'top 78%',
        from: { autoAlpha: 0, x: -16 },
        stagger: 0.06,
        delay: 0.15,
        duration: 0.45
      });

      revealOnScroll(caseEl.querySelector('.case-visual'), {
        trigger: caseEl,
        start: 'top 80%',
        from: { autoAlpha: 0, y: 24, scale: 0.97 },
        duration: 0.6,
        delay: 0.08
      });
    });

    revealOnScroll('#certs .certs-intro, #certs .cert-card', {
      trigger: '#certs', start: 'top 80%', stagger: 0.12
    });

    wordBurst('#experience', '#experience .exp-head h3', 'slide');
    revealOnScroll('#experience .exp-head .eyebrow, #experience .exp-head .exp-meta', {
      trigger: '#experience', start: 'top 80%', stagger: 0.08
    });
    revealOnScroll('#experience .exp-block, #experience .edu', {
      trigger: '#experience .exp-blocks',
      start: 'top 82%',
      from: { autoAlpha: 0, x: -28 },
      stagger: 0.14,
      duration: 0.6
    });

    wordBurst('#stack', '#stack .skills-head h3', 'blur');
    revealOnScroll('#stack .skills-head .eyebrow', { trigger: '#stack', start: 'top 82%' });
    revealOnScroll('#stack .skill-card', {
      trigger: '#stack .skill-grid',
      start: 'top 84%',
      from: { autoAlpha: 0, scale: 0.94, y: 18 },
      stagger: 0.07,
      duration: 0.5,
      ease: 'back.out(1.25)'
    });

    wordBurst('#contact', '#contact h2', 'snap');
    revealOnScroll('#contact .eyebrow, #contact .contact-left p, #contact .contact-details a, #contact .contact-form', {
      trigger: '#contact', start: 'top 82%', stagger: 0.08
    });

    requestAnimationFrame(() => ScrollTrigger.refresh());
    setTimeout(() => ScrollTrigger.refresh(), 400);
  }

  /* ===== mobile nav ===== */
  const navToggle = document.getElementById('navToggle');
  const siteNav = document.getElementById('siteNav');

  function closeNav() {
    document.body.classList.remove('nav-open');
    navToggle?.setAttribute('aria-expanded', 'false');
    navToggle?.setAttribute('aria-label', 'Open menu');
  }

  if (navToggle && siteNav) {
    navToggle.addEventListener('click', () => {
      const open = document.body.classList.toggle('nav-open');
      navToggle.setAttribute('aria-expanded', open ? 'true' : 'false');
      navToggle.setAttribute('aria-label', open ? 'Close menu' : 'Open menu');
    });
    siteNav.querySelectorAll('a').forEach((a) => a.addEventListener('click', closeNav));
    window.addEventListener('resize', () => {
      if (window.innerWidth > 900) closeNav();
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
