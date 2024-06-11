eliminarSprites: function() {
 var arrayAux = [];
 for (var i in this.sprites) {
 if (this.spritesExcluidos.indexOf(this.sprites[i]) == -1) {
 arrayAux.push(this.sprites[i]);
 }
 }
 this.spritesExcluidos = [];
 this.sprites = arrayAux;
 },
 verificar: function() {
 for (var x = 0; x < this.sprites.length - 1; x++) {
 for (var y = x + 1; y < this.sprites.length; y++) {
 this.testarColisao(this.sprites[x], this.sprites[y]);
 }
 }
 this.eliminarSprites();
 },
 eliminarSprites: function() {
    var arrayAux = [];
    for (var i in this.sprites) {
    if (this.spritesExcluidos.indexOf(this.sprites[i]) == -1) {
    arrayAux.push(this.sprites[i]);
    }
    }
    this.spritesExcluidos = [];
    this.sprites = arrayAux;
    },
    verificar: function() {
    for (var x = 0; x < this.sprites.length - 1; x++) {
    for (var y = x + 1; y < this.sprites.length; y++) {
    this.testarColisao(this.sprites[x], this.sprites[y]);
    }
    }
    this.eliminarSprites();
    },