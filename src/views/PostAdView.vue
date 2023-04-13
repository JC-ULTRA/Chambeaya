<template>
  <body>
    <HeaderComponent />
    <SideBarComponent />
    <main class="container pt-5 hoja">
      <h1>Publicación de anuncio</h1>
<ImageCropper />
      <form>
        <div>
          <div class="container">
            <div class="row">
              <div class="col-sm-6" v-for="(anuncio, index) in oficio" :key="index">
                <div class="form-group">
                  <label for="nickname">Nickname:</label>
                  <input type="text" class="form-control" :value="anuncio.nickname" readonly>
                </div>
                <div class="form-group">
                  <label for="occupation">Oficio:</label>
                  <input type="text" class="form-control" :value="anuncio.occupation" readonly>
                </div>
                <div class="form-group">
                  <label for="phone">Teléfono:</label>
                  <input type="text" class="form-control" :value="anuncio.phone" readonly>
                </div>
              </div>
              <div class="col-sm-6" v-for="(anuncio, index) in oficio" :key="index">
                <div class="form-group">
                  <label for="postalCode">Código postal:</label>
                  <input type="text" class="form-control" :value="anuncio.postalCode" readonly>
                </div>
                <div class="form-group">
                  <label for="email">Correo electrónico:</label>
                  <input type="text" class="form-control" :value="anuncio.email" readonly>
                </div>
              </div>
            </div>
          </div>

        </div>
        <div class="mt-4">
          <p for="descripcion">Breve descripción:</p>
          <textarea id="descripcion" required></textarea>
        </div>
        <div class="mt-4">
          <p for="descripcion-amplia">Descripción amplia:</p>
          <textarea id="descripcion-amplia" maxlength="2000"></textarea>
        </div>
        <div class="mt-4">
          <label for="tiempo-publicacion">Tiempo de publicación:</label>
          <input type="date" id="tiempo-publicacion">
        </div>
        <div class="mt-4">
          <p>Redes sociales:</p>
          <div class="d-flex justify-content-center flex-wrap">
            <div class="d-flex align-items-center mb-3 mx-1">
              <i class="fab fa-instagram" style="color: #945ba9; font-size: 30px;"></i>
              <input type="text" id="redes-sociales" placeholder="instagram" class="form-control ms-3">
            </div>
            <div class="d-flex align-items-center mb-3 mx-1">
              <i class="fab fa-facebook" style="color: #0000ff; font-size: 30px;"></i>
              <input type="text" id="redes-sociales" placeholder="facebook" class="form-control ms-3">
            </div>
            <div class="d-flex align-items-center mb-3 mx-1">
              <i class="fab fa-tiktok" style="color: #da4e4e; font-size: 30px;"></i>
              <input type="text" id="redes-sociales" placeholder="tiktok" class="form-control ms-3">
            </div>
          </div>
        </div>
        <div class="d-grid pb-5 mt-5 col-2 mx-auto">
          <button type="submit" class="btn btn1">Publicar anuncio</button>
        </div>
      </form>
    </main>
    <FooterComponent />
  </body>
</template>
  
<script>
import info from "@/views/Datos.json";
import HeaderComponent from "@/components/HeaderComponent.vue";
import FooterComponent from "@/components/FooterComponent.vue";
import ImageCropper from "@/components/ImageCropper.vue";
import SideBarComponent from '@/components/SideBarComponent.vue';

export default {
  components: {
    HeaderComponent,
    FooterComponent,
    ImageCropper,
    SideBarComponent
  },

  data() {
    return {
      oficio: info.anuncios,
    };
  },

};
</script>

<style scoped>
.hoja {
  background: #a5a5a5dc;
  width: 80%;
}

@media screen and (max-width: 768px) {
  .hoja {
    width: 100%;
  }
}

body {
  background-image: url('../assets/oficios.jpg');
  background-size: cover;
  position: relative;
}

h1 {
  font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
  color: black;
  text-shadow: 5px 0px 3px whitesmoke;
  ;
  font-size: 2.5rem;
  line-height: 1.2;
}

.btn1 {
  background: #8BC34A;
}

p {
  font-weight: bold;
}
</style>