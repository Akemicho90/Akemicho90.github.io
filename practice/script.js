
let currentSlide = 0;
const slides = document.querySelectorAll('.product-slide');
const totalSlides = slides.length;

function showSlide(n) {
    if (n < 0) {
        currentSlide = totalSlides - 1;
    } else if (n >= totalSlides) {
        currentSlide = 0;
    }

    slides.forEach((slide, index) => {
        slide.style.transform = `translateX(${-100 * currentSlide}%)`;
    });
}

function nextSlide() {
    currentSlide++;
    showSlide(currentSlide);
}

function prevSlide() {
    currentSlide--;
    showSlide(currentSlide);
}

showSlide(currentSlide);
setInterval(nextSlide, 5000);

// const prev= document.querySelector('.prev-button');
// const next= document.querySelector('.next-button');
// // prev.onclick() = prevSlide;
// next.onclick() = nextSlide;

let toggleBtn = document.querySelector('.toggle-btn');

toggleBtn.onclick = function (){
    nav = document.querySelector('.nav');
    nav.classList.toggle('active');
}
