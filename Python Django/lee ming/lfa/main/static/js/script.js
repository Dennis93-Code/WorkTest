document.addEventListener('DOMContentLoaded', function () {
    const elements = document.querySelectorAll('.header-animate');

    function checkVisibility() {
        const windowHeight = window.innerHeight;
        elements.forEach(element => {
            const rect = element.getBoundingClientRect();
            if (rect.top <= windowHeight * 0.75) {
                element.classList.add('visible');
            }
        });
    }

    checkVisibility(); // Check on page load
    window.addEventListener('scroll', checkVisibility); // Check on scroll
});
	
<!-- JavaScript for Mouse Movement Effect -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.card');

        cards.forEach(card => {
            card.addEventListener('mousemove', function(e) {
                const rect = card.getBoundingClientRect();
                const centerX = rect.left + rect.width / 2;
                const centerY = rect.top + rect.height / 2;
                const deltaX = e.clientX - centerX;
                const deltaY = e.clientY - centerY;
                const rotateX = (deltaY / rect.height) * 10; // Adjust rotation values
                const rotateY = -(deltaX / rect.width) * 10; // Adjust rotation values

                card.querySelector('.card-inner').style.transform = `rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
            });

            card.addEventListener('mouseleave', function() {
                card.querySelector('.card-inner').style.transform = `rotateX(0deg) rotateY(0deg)`;
            });
        });
    });
</script>


