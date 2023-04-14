<template>
  <HeaderComponent />
  <SideBarComponent />
  <div class="container mx-auto"  style="background-color: rgba(173, 216, 230, 0.5); border-radius: 15px;">
    <h1 class="text-center">Chambeaya - Portal de Oficios</h1>
    <article class="galeria p-5">
  <div class="row">
    <div class="col-6 col-md-3 mb-3" v-for="image in images" :key="image.id">
      <div class="">
        <img :src="inicio2+image.src" class="w-100 imagen">
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
.imagen{
width: 200px;
height: 200px;
border-radius: 15px;
}

h3 {
  font-size: 15px;
  color: rgb(71, 71, 219);
}

body {
    font-family: Arial, sans-serif;
    background-color: #F2F2F2;
}

h1 {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
    color: #003366;
}

form {
    background-color: #FFFFFF;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    padding: 30px;
    margin-bottom: 50px;
    max-width: 800px;
    margin: 0 auto;
}

label {
    font-size: 16px;
    font-weight: bold;
    color: #003366;
    margin-bottom: 10px;
    display: block;
}

input[type="text"],
input[type="email"],
input[type="tel"],
input[type="date"],
input[type="password"],
select,
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #CCCCCC;
    border-radius: 5px;
    box-sizing: border-box;
    margin-bottom: 20px;
    font-size: 16px;
    color: #333333;
    background-color: #F2F2F2;
}

input[type="submit"] {
    background-color: #003366;
    color: #FFFFFF;
    font-size: 18px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    padding: 15px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: 20px;
}

input[type="submit"]:hover {
    background-color: #004080;
}

.required {
    color: #FF0000;
}

.col-2 {
    width: 40%;
}

@media screen and (max-width: 767px) {
    form {
        padding: 20px;
    }

    input[type="submit"] {
        font-size: 16px;
        padding: 10px;
    }

    label {
        font-size: 14px;
    }

    input[type="text"],
    input[type="email"],
    input[type="tel"],
    input[type="date"],
    input[type="password"],
    select,
    textarea {
        font-size: 14px;
    }

    .col-2 {
        width: 60%;
    }
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

.hoja {
    background: #a5a5a5dc;
    width: 80%;
}

@media screen and (max-width: 768px) {
    .hoja {
        width: 100%;
    }
}

img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    background-image: url('../assets/danger.jpg');
}

.btn1 {
    background: #8BC34A;
}

.btn1:hover {
    color: white;
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

.red {
    color: red;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-size: 20px;
}
</style>