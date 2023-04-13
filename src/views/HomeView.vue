<template>
  <HeaderComponent />
  <SideBarComponent />
  <h1>Chambeaya - Portal de Oficios</h1>
  <main>

    <section class="fotos pb-5">
      <article class="galeria">
        <div class="imagen1">
          <img src="../assets/oficios/afilador.jpg" alt="Imagen 1">
        </div>
        <div class="imagen2">
          <img src="../assets/oficios/camotero.jpg" alt="Imagen 2">
        </div>
        <div class="imagen3">
          <img src="../assets/oficios/carpintero.jpg" alt="Imagen 3">
        </div>
        <div class="imagen4">
          <img src="../assets/oficios/cartonero.jpg" alt="Imagen 4">
        </div>
        <div class="imagen5">
          <img src="../assets/oficios/curandero.jpg" alt="Imagen 5">
        </div>
        <div class="imagen6">
          <img src="../assets/oficios/globero.jpg" alt="Imagen 6">
        </div>
        <div class="imagen7">
          <img src="../assets/oficios/organillero.jpg" alt="Imagen 7">
        </div>
        <div class="imagen8">
          <img src="../assets/oficios/piñatero.jpg" alt="Imagen 8">
        </div>
        <div class="imagen9">
          <img src="../assets/oficios/pulquero.jpg" alt="Imagen 9">
        </div>
        <div class="imagen10">
          <img src="../assets/oficios/taquero.jpg" alt="Imagen 10">
        </div>
        <div class="imagen11">
          <img src="../assets/oficios/tortillera.jpg" alt="Imagen 11">
        </div>
        <div class="imagen12">
          <img src="../assets/oficios/zapatera.jpg" alt="Imagen 12">
        </div>
      </article>
    </section>

    <div class="recommendations">

<h2>Recomendaciones de usuarios</h2>

<div class="row">
  <div v-for="users in user" v-bind:key="users.id" class="col-md-3">
    <div class="text-center">
      <img :src=inicio2+users.img width="90px" class="rounded-circle" alt="Usuario 1">
      <h3>{{users.nickname}}</h3>
    </div>
    <div>
      <p>{{users.recomienda}}</p>
    </div>
  </div>
</div>

</div>


    <section class="social">
      <div class="container">
        <h2>Síguenos en redes sociales</h2>
        <div class="row mt-5">
          <div class="col-md-3">
            <a href="https://www.facebook.com/chambeaya/"><i class="fab fa-facebook" style="font-size: 40px;"></i></a>
          </div>
          <div class="col-md-3">
            <a href="https://twitter.com/chambacreativos/status/1371125227313303552"><i class="fab fa-twitter" style="font-size: 40px;"></i></a>
          </div>
          <div class="col-md-3">
            <a href="https://www.instagram.com/chambea_ya/"><i class="fab fa-instagram" style="font-size: 40px;"></i></a>
          </div>
          <div class="col-md-3">
            <a href="https://www.youtube.com/watch?v=o9GVIYeF0oY"><i class="fab fa-youtube" style="font-size: 40px;"></i></a>
          </div>
        </div>
      </div>
    </section>
  </main>
  <FooterComponent />
</template>

<script>
import HeaderComponent from '@/components/HeaderComponent.vue'
import FooterComponent from '@/components/FooterComponent.vue';
import SideBarComponent from '@/components/SideBarComponent.vue';
import users from './Recomienda.json';
const url = 'http://127.0.0.1/'

export default {
  components: {
    HeaderComponent,
    FooterComponent,
    SideBarComponent
  },
  data: function () {
    return {
    inicio2: url,
    user: users,
  }
}
}
</script>

<style scoped>
.fotos {
  display: flex;
  justify-content: center;
  align-items: center;
}

.fotos .galeria {
  max-width: auto;
  display: grid;
  grid-template-columns: 200px 200px 200px 200px;
  grid-template-rows: 200px 200px;
  grid-gap: .1em;
}

h3 {
  font-size: 15px;
  color: rgb(71, 71, 219);
}
</style>