// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from '@rails/ujs';
Rails.start();

document.addEventListener('DOMContentLoaded', function() {
    const alertMessage = document.querySelector('.error-message');

    if (alertMessage) {
        setTimeout(() => {
            alertMessage.style.display = 'none'; // Скрывает сообщение через 3 секунды
        }, 5000); // 5000 миллисекунд (5 секунд)
    }
});