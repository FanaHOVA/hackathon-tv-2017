var emoji= require('node-emoji');
var tgbot = require('node-telegram-bot-api');
var http = require("http");
var request = require('request');


//various emoji, still more to add
var rewind= emoji.get('rewind');
var sunglasses=emoji.get('sunglasses');
var sorriso= emoji.get('grin');
var batteria=emoji.get('battery');  //non vuole funzionare
var frecciaindietro=emoji.get('arrow_left');
var sunny=emoji.get('sunny');
var moon=emoji.get('new_moon');
var erba=emoji.get('leaves');
var erbasecca=emoji.get('fallen_leaf');

var sunglasses=emoji.get('sunglasses');
var kissingface = emoji.get('kissing_heart');

var arrayRisposte = ["Prego, non c'è di che", "Sono un professionista "+ sunglasses, "Sono il migliore " + sunglasses];

var arrayInsulti = ["Ciao bello", "Ciao", "Ciao bellissimo " + kissingface];

// Inizializzazione del bot con il token
var token = "392683641:AAFnuBMUhJJPFZ3tKpC5IvSnDS0uon3_wCk";
var bot = new tgbot(token, {polling:true});

/*bot.onText(/\//, function (msg) {  //quando riceve il comando menu
  var chatId = msg.chat.id;
  bot.sendMessage(chatId, 'Welcome to Olympia, choose a language: ');
});
*/

bot.onText(/\/start/, function (msg) {  //quando riceve il comando menu
  var chatId = msg.chat.id;
    bot.sendMessage(chatId, "Benvenuto in Educathon, l'assistente che ti guiderà nel mondo della programmazione!\n ");

});

bot.onText(/\/help/, function (msg) {  //quando riceve il comando menu
  var chatId = msg.chat.id;
    bot.sendMessage(chatId, "Ponimi qualche domanda ad esempio: Come funziona internet?\n");

});

bot.onText(/[C|c]iao.*[E|e]ducathon|[E|e]ducathon.*[C|c]iao/i, function onEchoText(msg, match) {
  var random = arrayInsulti[Math.floor(Math.random()*arrayInsulti.length)];
  bot.sendMessage(msg.chat.id, random);
});

bot.onText(/grazie.*educathon|educathon.*grazie/i, function onEchoText(msg, match) {
  var random = arrayRisposte[Math.floor(Math.random()*arrayRisposte.length)];
  bot.sendMessage(msg.chat.id, random);
});



bot.onText(/[N|n]on ho capito (.+)/i, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/domanda/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
});

bot.onText(/[T|t]utorial (.+)/i, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/tutorial/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
});

/*
bot.onText(/[C|c]ome funziona (.+)/, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/domanda/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
});
*/
bot.onText(/[C|c]os'?[e|è|é] \b\w*\b ([A-z0-9\s]*)/i, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/domanda/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
});

bot.onText(/^come (.+)/i, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/tutorial/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
  bot.sendDocument(msg.chat.id, 'aranzulla.gif');
});

bot.onText(/^spiegami come (.+)/i, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/domanda/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
});

bot.onText(/[N|n]on capisco (.+)/i, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/domanda/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
});

bot.onText(/[S|s]erve.*tutor (.+)/i, function onEchoText(msg, match) {
  const resp = match[1];
  request('https://educkathon.herokuapp.com/api/tutor/'+resp, (error, response, body) =>
        bot.sendMessage(msg.chat.id, body.toString())
  );
});
