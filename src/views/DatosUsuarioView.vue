<template>
    <body class="pb-5">
        <HeaderComponent />
        <SideBarComponent />
        <form class="container mb-5" style="text-align: center; border-radius: 15px;">
            <div
                style="text-align: center; display: flex; flex-wrap: wrap; gap: 20px; align-items: center; justify-content: space-between;">
                <div>
                    <h1 class="mb-5">Datos de Usuario</h1>
                </div>
                <div class="form-group">
                    <a v-if="loadedImages < maxImagesAllowed" href="/ui/upload-pro" style="text-decoration: none;">
                        <label class="mt-3">Sube tu foto</label>
                    </a>
                    <label v-else class="mt-3">Foto de perfil:</label>
                    <div class="quita" style="display: flex; flex-direction: column; align-items: center;">
                        <img :src="imagenperfil(imagen.fullHttpUploadUrl)" alt="" class="rounded img" />
                        <a href="/ui/general-data" class="fa-solid fa-trash" style="color: #ff24247c; margin-top: 5px;"
                            @click="elimina(imagen)"></a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Nombre:</label>
                        <div class="box">
                            <p>{{ usuario.name }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Apellido Paterno:</label>
                        <div class="box">
                            <p>{{ usuario.apepaterno }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Apellido Materno:</label>
                        <div class="box">
                            <p></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Teléfono principal:</label>
                        <div class="box">
                            <p>{{ usuario.emailpro }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Email personal:</label>
                        <div class="box">
                            <p>{{ usuario.date }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Fecha de nacimiento:</label>
                        <div class="box">
                            <p>{{ usuario.cp }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Código postal:</label>
                        <div class="box">
                            <p>{{ usuario.nickname }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Nickname:</label>
                        <div class="box">
                            <p>{{ usuario.oficio }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Oficio:</label>
                        <div class="box">
                            <p>{{ usuario.phonework }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">Nùmero negocio:</label>
                        <div class="box">
                            <p>{{ usuario.cpwork }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="form-group">
                        <label class="mt-3">CP negocio:</label>
                        <div class="box">
                            <p>{{ usuario.phonepro }}</p>
                        </div>
                    </div>
                </div>
            </div>

        </form>
        <FooterComponent />
    </body>
</template>

<script>
import axios from 'axios';
import HeaderComponent from '@/components/HeaderComponent.vue'
import FooterComponent from '@/components/FooterComponent.vue';
import info from '@/views/Oficios.json';
import SideBarComponent from '@/components/SideBarComponent.vue';
import store from '@/store';
import usuario from '@/views/GeneralData.json'


export default {
    components: {
        HeaderComponent,
        FooterComponent,
        SideBarComponent
    },
    data() {
        return {
            esAnunciante: false,
            oficio: "",
            oficios: info.oficios,
            imagen: {},
            idUser: store.state.userData.idUser,
            maxImagesAllowed: 1,
            loadedImages: 0,
            usuario: usuario.usuario,
        };
    },
    mounted() {
        this.carga();
    },
    methods: {
        carga() {
            axios
                .get(
                    "https://upload.qbits.mx/api/up/get-user-pricipal-image/" +
                    this.idUser
                )
                .then((response) => {
                    this.imagen = response.data;
                    this.loadedImages = this.imagen.length;
                    console.log(this.imagen);
                })
                .catch((error) => {
                    console.log(error);
                });
        },
        elimina: function (imagen) {
            this.loader = "loader";
            let perfil = document.querySelector(".quita");
            perfil.textContent = "";
            const options = {
                method: "DELETE",
                url: `https://upload.qbits.mx/api/up/delete-media/${imagen.id}`,
                headers: {
                    idMedia: imagen.id,
                    IdUser: store.state.userData.idUser,
                    jwt: store.state.userData.jwt,
                },
            };
            axios
                .request(options)
                .then(function (response) {
                    this.loader = "none";
                    this.delete = response.data;
                    location.reload();
                })
                .catch(function (error) {
                    this.loader = "none";
                    console.error(error);
                });
        },
        imagenperfil(Nombreimg) {
            return `https://media.visitanos.net/image${Nombreimg}`;
        },
    },
}
</script>

<style scoped>
.box {
    background: #0040807c;
    border: 2px solid aquamarine;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 2px;
    width: 190px;
}

p {
    font-size: 15px;
    text-align: center;
    margin: 0;
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

. {
    color: ;
    font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    font-size: 20px;
}
</style>