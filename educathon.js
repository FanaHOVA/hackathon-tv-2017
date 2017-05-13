var emoji= require('node-emoji');
var tgbot = require('node-telegram-bot-api');
var wikipedia = require("node-wikipedia");
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


/*
bot.onText(/\/menu/, function (msg) { 
  var chatId = msg.chat.id;
  var topts = {
      reply_markup: JSON.stringify({
        keyboard: [
    ['Italian'],
   ['English']
   ],
        resize_keyboard:true    
      })
    };
    bot.sendMessage(chatId, 'Welcome to Olympia, choose a language: ');
});


bot.onText(/\Italian/, function (msg) { 
  var chatId = msg.chat.id;
  var topts = {
      reply_markup: JSON.stringify({
        keyboard: [
    ['Seleziona Team'],
	 ['Eventi Live'],
    ['Eventi futuri'],
    [''],
	 [rewind + 'Menu']
	 ],
        one_time_keyboard:true,
        resize_keyboard:true    
      })
    };
    bot.sendMessage(chatId, 'Benvenuto nel bot di Olympia, tramite questo bot è possibile avere un interazione più rapida con gli utenti di Olympia:' + sunglasses, topts);
});

bot.onText(/Seleziona Team/, function (msg) {
  var chatId = msg.chat.id;

    bot.sendMessage(chatId, 'Scrvi il team che vuoi seguire');

});



bot.onText(/Eventi Live/, function (msg) {
  
  var chatId = msg.chat.id;
    bot.sendMessage(chatId, 'Sono presenti i seguenti eventi Live da poter seguire: ');
});



bot.onText(/Eventi futuri/, function (msg) { 
  var chatId = msg.chat.id;
  var topts = {
      reply_markup: JSON.stringify({
        keyboard: [
    ['Acquista biglietti'],
   ['Scommetti'],
   [rewind + 'Menu Italian']
   ],
        one_time_keyboard:true,
        resize_keyboard:true    
      })
    };
    bot.sendMessage(chatId, 'Ecco gli eventi futuri: ');
});

/*
bot.onText(/\eco OFF/, function (msg) { 
        if(!isAuthorized(msg.from.id)) return;
    invio('8,1,1,1');
  var chatId = msg.chat.id;

    bot.sendMessage(chatId, 'Ecomode disattivato');    
});

bot.onText(/\Set Temperature/, function (msg) { 
        if(!isAuthorized(msg.from.id)) return;
   invio('7,1,1,1');
   var chatId = msg.chat.id;

    bot.sendMessage(chatId, 'Temperature: ');   
      
});

bot.onText(/\Movy/, function (msg) {
        if(!isAuthorized(msg.from.id)) return;  
  var chatId = msg.chat.id;
  var opts = {
      reply_markup: JSON.stringify({
        keyboard: [
          ['Battery status'],
	['Menu']],
        resize_keyboard:true    
      })
    };
    bot.sendMessage(chatId, 'Movy commands', opts);
    
});

bot.onText(/\Battery status/, function (msg) { 
        if(!isAuthorized(msg.from.id)) return;
        invio('7,1,1,1');
  //deve ricevere lo stato della batteria   
  var chatId = msg.chat.id;
    bot.sendMessage(chatId,battery+ ' Battery Status: ');
});


bot.onText(/\Smoky/, function (msg) { 
        if(!isAuthorized(msg.from.id)) return;

  var chatId = msg.chat.id;
  var topts = {
      reply_markup: JSON.stringify({
        keyboard: [
    ['Alarm OFF','Get Gas'],
    ['Menu']
    ],
        resize_keyboard:true     
      })
    };
    bot.sendMessage(chatId, 'Smoky commands:', topts);
});

bot.onText(/\Alarm OFF/, function (msg) { 
    if(!isAuthorized(msg.from.id)) return;
  invio('7,1,1,1');
  var chatId = msg.chat.id;
    bot.sendMessage(chatId, 'Gas alarm is off');
    
});

bot.onText(/\Get Gas/, function (msg) { 
        if(!isAuthorized(msg.from.id)) return;
  invio('7,1,1,1');
  var chatId = msg.chat.id;
    bot.sendMessage(chatId, 'Gas is: '); 
});

*/