<html>
<head>
<title>GamesWeb</title>
<script src="gameLoop.js"></script>
<script src="nave.js"></script>
<script src="tiro.js"></script>
<script src="inimigo.js"></script>
<script src="colisao.js"></script>
<script src="explosao.js"></script>
<script src="spriteSheet.js"></script>
<script src="fundo.js"></script>
<script src="painel.js"></script>
</head>
<body>
<canvas id="canv" width="500" height="500">
      </canvas>
    <input type="button" id="btnSom" value="tocar"
     onclick="tocaSom()" />
     <script>
        var canvas = document.getElementById('canv');
        var contexto = canvas.getContext('2d');
        TOTAL_IMAGENS = 6;
        imagensCarregadas = 0;
        imgEspaco = new Image();
        imgEspaco.src = 'img/espaco.png';
        imgEspaco.onload = verificaCarregamento;
        imgEstrelas = new Image();
        imgEstrelas.src = 'img/estrelas.png';
        imgEstrelas.onload = verificaCarregamento;

        imgNuvens = new Image();
 imgNuvens.src = 'img/nuvens.png';
 imgNuvens.onload = verificaCarregamento;

 imgNave = new Image();
 imgNave.src = "img/nave.png";
 imgNave.onload = verificaCarregamento;
 imgInimigo = new Image();
 imgInimigo.src = "img/inimigo.png";
 imgInimigo.onload = verificaCarregamento;

 imgExplosao = new Image();
 imgExplosao.src = "img/explosao.png";
 imgExplosao.onload = verificaCarregamento;
 musicaFundo = new Audio();
 musicaFundo.src = 'snd/musica-acao.mp3';
 musicaFundo.load();
 musicaFundo.volume = 0.5;
 musicaFundo.loop = true;
tocando = false;

function tocaSom() {
 var btn = document.getElementById("btnSom");
 tocando = !tocando;
 if (tocando) {
 btn.value = "pausar";
 som.play();
 } else {
 btn.value = "tocar";
 som.pause();
 }
 }
 
 function verificaCarregamento() {
 contexto.save();
 contexto.drawImage(imgEspaco, 0, 0,
canvas.width, canvas.height);
 contexto.fillStyle = 'white';
 contexto.strokeStyle = 'black';
 contexto.font = '50px sans-serif';
 contexto.fillText("Carregando...", 100, 200);
 contexto.strokeText("Carregando...", 100, 200);

 imagensCarregadas++;
 var tamanhoBarra = imagensCarregadas / TOTAL_IMAGENS;
 contexto.fillStyle = 'yellow';
 contexto.fillRect(100, 250, tamanhoBarra * 300, 50);
 contexto.restore();
 //alert(tamanhoBarra);

 if (imagensCarregadas == TOTAL_IMAGENS) {
 criarObjetos();
 }
 }
function criarObjetos() {
 nave = new Nave(contexto, imgNave,
canvas.width / 2 - imgNave.width / 2,
canvas.height - imgNave.height, imgExplosao);
 espaco = new Fundo(contexto, imgEspaco, 1);
 estrelas = new Fundo(contexto, imgEstrelas, 2);
 nuvens = new Fundo(contexto, imgNuvens, 1);

 colisao = new Colisao();
 colisao.adicionarSprite(nave);

 painel = new Painel(contexto, nave);

 loop = new GameLoop(contexto, colisao, musicaFundo);
 loop.adicionarSprite(espaco);
 loop.adicionarSprite(estrelas);
 loop.adicionarSprite(nuvens);
 loop.adicionarSprite(painel);
 loop.adicionarSprite(nave);
 loop.rodar()
  nave.acabaramVidas = function() {
 loop.parar();
 loop.gameOver = true;
 contexto.save();
 contexto.fillStyle = 'white';
 contexto.strokeStyle = 'black';
 contexto.font = '70px sans-serif';
 contexto.fillText("GAME OVER", 40, 200);
 contexto.strokeText("GAME OVER", 40, 200);
 contexto.restore();
 }
 setInterval(criarInimigo, 2000);
 }

 function criarInimigo() {
 if (loop.rodando) {
 var deslocamento = Math.floor( 1 + Math.random() * 5);
 var x = Math.floor(Math.random() * (canvas.width –
imgInimigo.width + 1) );
 var y = -imgInimigo.height;
 inimigo = new Inimigo(contexto, imgInimigo, x, y,
deslocamento, imgExplosao,
painel);
 loop.adicionarSprite(inimigo);
 colisao.adicionarSprite(inimigo);
 }
 }
 function criarInimigo() {
 if (loop.rodando) {
 var deslocamento = Math.floor( 1 + Math.random() * 5);
 var x = Math.floor(Math.random() * (canvas.width –
imgInimigo.width + 1) );
 var y = -imgInimigo.height;
 inimigo = new Inimigo(contexto, imgInimigo, x, y,
deslocamento, imgExplosao,
painel);
 loop.adicionarSprite(inimigo);
 colisao.adicionarSprite(inimigo);
 }
 function pausarJogo() {
 if (loop.rodando) {
 loop.parar();
 contexto.save();
 contexto.fillStyle = 'blue';
 contexto.strokeStyle = 'white';
 contexto.font = '50px sans-serif';
 contexto.fillText("Pausado", 160, 200);
 contexto.strokeText("Pausado", 160, 200);
 contexto.restore();
 } else {
 if (!loop.gameOver) {
 loop.rodar();
 }
 }
 }
 document.addEventListener("keydown",
 function(evento) {
 var tecla = evento.keyCode;
 if (tecla == 13) { 
 pausarJogo();
 } else {
 if (loop.rodando) 
 if (tecla == 37) { 
 nave.esquerda(50);
 } else if (tecla == 39) { 
 nave.direita(50);
 } else if (tecla == 38) { 
 nave.subir(30);
 } else if (tecla == 40) {
 nave.descer(30);
 } else if (tecla == 32) { 
 nave.atirar();
 }
 }
 }
 })
 </script>
</body>
</html>