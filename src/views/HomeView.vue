<template>
  <HeaderComponent />
  <SideBarComponent />
  <div class="container mx-auto">
    <h1 class="text-center">Chambeaya - Portal de Oficios</h1>
    <article class="galeria">
      <div class="row">
        <div class="col-6 col-md-3 mb-3" v-for="image in images" :key="image.id">
          <div class="imagen">
            <img :src="inicio2+image.src" class="w-100">
          </div>
        </div>
      </div>
    </article>
    <section class="recomendaciones pt-4 pb-5">
      <h2 class="text-center pb-4">Recomendaciones de usuarios</h2>
      <div class="row">
        <div v-for="users in user" :key="users.id" class="col-md-3 mb-3">
          <div class="text-center">
            <img :src="inicio2+users.img" style="width: 90px;" class="rounded-circle mb-4"/>
            <h3>{{users.nickname}}</h3>
          </div>
          <div class="container ps-md-5 pe-md-5">
            <p>{{users.recomienda}}</p>
          </div>
        </div>
      </div>
    </section>
    <section class="social">
      <div class="container">
        <h2 class="text-center">Síguenos en redes sociales</h2>
        <div class="row mt-3 justify-content-center">
          <div class="col-md-3 text-center mb-3">
            <a href="https://www.facebook.com/chambeaya/"><i class="fab fa-facebook" style="font-size: 40px;"></i></a>
          </div>
          <div class="col-md-3 text-center mb-3">
            <a href="https://twitter.com/chambacreativos/status/1371125227313303552"><i class="fab fa-twitter" style="font-size: 40px;"></i></a>
          </div>
          <div class="col-md-3 text-center mb-3">
            <a href="https://www.instagram.com/chambea_ya/"><i class="fab fa-instagram" style="font-size: 40px;"></i></a>
          </div>
          <div class="col-md-3 text-center mb-3">
            <a href="https://www.youtube.com/watch?v=o9GVIYeF0oY"><i class="fab fa-youtube" style="font-size: 40px;"></i></a>
          </div>
        </div>
      </div>
    </section>
  </div>
  <FooterComponent />
</template>




<script>
import HeaderComponent from '@/components/HeaderComponent.vue'
import FooterComponent from '@/components/FooterComponent.vue';
import SideBarComponent from '@/components/SideBarComponent.vue';
import HomeImages from '@/views/HomeImages.json';
import users from './Recomienda.json';
const url = 'http://192.168.0.5/'

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
    images: HomeImages,
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