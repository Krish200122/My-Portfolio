/* KrishPortfolio.web.app — Portfolio Script */
'use strict';

// ── Custom Cursor — minimal glowing dot ───────────────────
const cursorDot = document.getElementById('cursorDot');

document.addEventListener('mousemove', e => {
  cursorDot.style.left = e.clientX + 'px';
  cursorDot.style.top  = e.clientY + 'px';
});


// ── Navbar scroll behaviour ───────────────────────────────
const navbar = document.getElementById('navbar');
const navProgress = document.getElementById('navProgress');

window.addEventListener('scroll', () => {
  const scrolled = window.scrollY;
  const maxScroll = document.body.scrollHeight - window.innerHeight;
  const pct = (scrolled / maxScroll) * 100;
  navProgress.style.width = pct + '%';
  navbar.classList.toggle('scrolled', scrolled > 40);
});

// Active nav link on scroll
const sections = document.querySelectorAll('section[id]');
const navLinks  = document.querySelectorAll('.nl');
const observer = new IntersectionObserver(entries => {
  entries.forEach(e => {
    if (e.isIntersecting) {
      navLinks.forEach(l => l.classList.remove('active'));
      const match = document.querySelector(`.nl[href="#${e.target.id}"]`);
      if (match) match.classList.add('active');
    }
  });
}, { threshold: 0.35 });
sections.forEach(s => observer.observe(s));


// ── Hamburger / Drawer ────────────────────────────────────
const burger  = document.getElementById('burger');
const drawer  = document.getElementById('drawer');

burger.addEventListener('click', () => {
  burger.classList.toggle('open');
  drawer.classList.toggle('open');
});
document.querySelectorAll('.dr-link').forEach(l => {
  l.addEventListener('click', () => {
    burger.classList.remove('open');
    drawer.classList.remove('open');
  });
});


// ── Typewriter — navbar brand ─────────────────────────────
const brandTyped = document.getElementById('brandTyped');
const brandCaret = document.getElementById('brandCaret');
const BRAND_TEXT  = 'KrishPortfolio';

function typewriterBrand() {
  let i = 0;
  const tick = setInterval(() => {
    brandTyped.textContent = BRAND_TEXT.slice(0, ++i);
    if (i >= BRAND_TEXT.length) {
      clearInterval(tick);
      setTimeout(() => { brandCaret.style.display = 'none'; }, 800);
    }
  }, 90);
}
window.addEventListener('load', () => setTimeout(typewriterBrand, 300));


// ── Typewriter — hero name (looping) ─────────────────────
const heroTyped  = document.getElementById('heroTyped');
const nameCursor = document.getElementById('nameCursor');
const HERO_TEXTS = ['Tarun', 'Tarun Krishna'];

function typewriterHero() {
  let textIdx = 0;
  let charCount = 0;
  let deleting = false;

  function tick() {
    const current = HERO_TEXTS[textIdx];
    if (!deleting) {
      charCount++;
      heroTyped.textContent = current.slice(0, charCount);
      if (charCount >= current.length) {
        // fully typed — pause then delete
        setTimeout(() => { deleting = true; tick(); }, 1600);
        return;
      }
    } else {
      charCount--;
      heroTyped.textContent = current.slice(0, charCount);
      if (charCount <= 0) {
        // fully deleted — move to next text, pause then type
        deleting = false;
        textIdx = (textIdx + 1) % HERO_TEXTS.length;
        setTimeout(tick, 400);
        return;
      }
    }
    setTimeout(tick, deleting ? 50 : 80);
  }

  // keep cursor always visible and blinking
  nameCursor.style.animation = '';
  nameCursor.style.opacity = '1';
  tick();
}
window.addEventListener('load', () => setTimeout(typewriterHero, 600));


// ── Scroll-reveal ─────────────────────────────────────────
const revealEls = document.querySelectorAll('.reveal');
const revealObs = new IntersectionObserver(entries => {
  entries.forEach((e, idx) => {
    if (e.isIntersecting) {
      // stagger siblings by reading --i var or index
      const delay = e.target.style.getPropertyValue('--i') || 0;
      e.target.style.transitionDelay = (parseFloat(delay) * 0.15) + 's';
      e.target.classList.add('visible');
      revealObs.unobserve(e.target);
    }
  });
}, { threshold: 0.1, rootMargin: '0px 0px -60px 0px' });
revealEls.forEach(el => revealObs.observe(el));


// ── Smooth scroll for all anchor links ───────────────────
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
  anchor.addEventListener('click', function(e) {
    const target = document.querySelector(this.getAttribute('href'));
    if (!target) return;
    e.preventDefault();
    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
  });
});


// ── Tech pill hover ripple ────────────────────────────────
document.querySelectorAll('.tp').forEach(tp => {
  tp.addEventListener('mouseenter', () => {
    tp.style.setProperty('--ripple', '1');
  });
});


// ── Contact form — EmailJS ────────────────────────────────
// REPLACE these 3 values with your EmailJS credentials:
//   https://dashboard.emailjs.com/admin
const EMAILJS_SERVICE_ID  = 'service_co42jyb';   // e.g. 'service_abc123'
const EMAILJS_TEMPLATE_ID = 'template_09j0nrw';  // e.g. 'template_xyz789'
const EMAILJS_PUBLIC_KEY  = 'LCX5Odd5orbnK5GaQ';   // e.g. 'abcDEFghiJKL'

const form    = document.getElementById('contactForm');
const sendBtn = document.getElementById('sendBtn');
const formOk  = document.getElementById('formOk');
const formErr = document.getElementById('formErr');

form.addEventListener('submit', async (e) => {
  e.preventDefault();
  formOk.classList.remove('show');
  formErr.classList.remove('show');

  const first = document.getElementById('fFirst').value.trim();
  const last  = document.getElementById('fLast').value.trim();
  const email = document.getElementById('fEmail').value.trim();
  const msg   = document.getElementById('fMsg').value.trim();

  if (!first || !last || !email || !msg) {
    formErr.textContent = 'Please fill in all fields.';
    formErr.classList.add('show');
    return;
  }

  if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    formErr.textContent = 'Please enter a valid email address.';
    formErr.classList.add('show');
    return;
  }

  // Send via EmailJS
  sendBtn.classList.add('loading');
  const label = sendBtn.querySelector('.btn-label');
  label.textContent = 'Sending…';

  try {
    await emailjs.send(
      EMAILJS_SERVICE_ID,
      EMAILJS_TEMPLATE_ID,
      {
        from_name:  first + ' ' + last,
        from_email: email,
        message:    msg,
        to_name:    'Tarun Krishna',
      },
      EMAILJS_PUBLIC_KEY
    );

    sendBtn.classList.remove('loading');
    label.textContent = 'Send Message';
    formOk.textContent = '✓ Message sent — I\'ll be in touch soon!';
    formOk.classList.add('show');
    form.reset();
    setTimeout(() => formOk.classList.remove('show'), 5000);

  } catch (err) {
    sendBtn.classList.remove('loading');
    label.textContent = 'Send Message';
    formErr.textContent = 'Failed to send. Please email me directly at tarunkrish2001@gmail.com';
    formErr.classList.add('show');
    console.error('EmailJS error:', err);
  }
});


// ── Magnetic effect on buttons ────────────────────────────
document.querySelectorAll('.btn, .nav-cta, .btn-send').forEach(el => {
  el.addEventListener('mousemove', function(e) {
    const rect = this.getBoundingClientRect();
    const cx = rect.left + rect.width / 2;
    const cy = rect.top  + rect.height / 2;
    const dx = (e.clientX - cx) * 0.2;
    const dy = (e.clientY - cy) * 0.2;
    this.style.transform = `translate(${dx}px, ${dy}px)`;
  });
  el.addEventListener('mouseleave', function() {
    this.style.transform = '';
  });
});


// ── Profile image tilt on hover ───────────────────────────
const photoFrame = document.querySelector('.photo-frame');
const heroPhoto  = document.querySelector('.hero-photo');

if (heroPhoto) {
  heroPhoto.addEventListener('mousemove', e => {
    const rect = heroPhoto.getBoundingClientRect();
    const cx = rect.left + rect.width  / 2;
    const cy = rect.top  + rect.height / 2;
    const rx = ((e.clientY - cy) / (rect.height / 2)) * -8;
    const ry = ((e.clientX - cx) / (rect.width  / 2)) *  8;
    if (photoFrame) {
      photoFrame.style.transform = `rotateX(${rx}deg) rotateY(${ry}deg)`;
    }
  });
  heroPhoto.addEventListener('mouseleave', () => {
    if (photoFrame) photoFrame.style.transform = '';
  });
}


// ── Counter animation for stat numbers ───────────────────
function animateCounter(el, target, suffix, duration = 1200) {
  let start = 0;
  const step = (timestamp) => {
    if (!start) start = timestamp;
    const progress = Math.min((timestamp - start) / duration, 1);
    const eased = 1 - Math.pow(1 - progress, 3);
    el.textContent = Math.floor(eased * target) + suffix;
    if (progress < 1) requestAnimationFrame(step);
  };
  requestAnimationFrame(step);
}

const counters = document.querySelectorAll('.hcard-num');
let countersStarted = false;

const counterObs = new IntersectionObserver(entries => {
  entries.forEach(e => {
    if (e.isIntersecting && !countersStarted) {
      countersStarted = true;
      counters.forEach(c => {
        const raw = c.textContent;
        const num = parseFloat(raw);
        const suffix = raw.replace(String(num), '');
        if (!isNaN(num)) animateCounter(c, num, suffix);
      });
    }
  });
}, { threshold: 0.5 });

const heroCards = document.querySelector('.hero-cards');
if (heroCards) counterObs.observe(heroCards);


// ── Keyboard navigation ───────────────────────────────────
document.addEventListener('keydown', e => {
  if (e.key === 'Escape') {
    burger.classList.remove('open');
    drawer.classList.remove('open');
  }
});