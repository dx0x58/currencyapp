$(document).ready(function($) {
    App.news_items = App.cable.subscriptions.create('CurrencyChannel', {
        connected: function() {
            console.log('Connected to currency channel');
        },

        received: function(data) {
            console.log(data);
            $('.currency-value').text(data.value + ' ₽');
        }
    });
});

