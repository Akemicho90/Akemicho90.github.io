function sendEmail(){
    Email.send({
        Host : "smtp.gmail.com",
        Username : "ichoakem4@gmail.com",
        Password : "790AF8CE2650AA5B147B9C7AAD05EFCA31F1",
        To : 'ichoakem4@gmail.com',
        From : document.getElementById("email").value,
        Subject : "This is the subject",
        Body : "And this is the body"
    }).then(
      message => alert(message)
    );
}

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

const prev= document.querySelector('.prev-button');
const next= document.querySelector('.next-button');
prev.onclick() = prevSlide;
next.onclick() = nextSlide;


