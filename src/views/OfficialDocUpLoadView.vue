<template>
    <body>
        <div>
            <HeaderComponent />
            <div class="d-md-block col-md-3">
                <SideBarComponent />
            </div>
            <main class="container pt-5 hoja">

                <div>
                    <h1 class="text-center mb-5">Captura de identificación oficial</h1>
                </div>

                <form>
                    <div v-if="loadedImages < maxImagesAllowed" class="row justify-content-center">
                        <div class="col-sm-6 col-md-4 mb-4">
                            <label>Identificación oficial anverso</label>
                            <div class="mb-3">
                                <a href="/ui/upload">
                                    <img src="../assets/anverso.png" alt="Identificación oficial anverso"
                                        class="img-fluid mb-2 img-thumbnail fa-fade"
                                        style="--fa-animation-duration: 2s; --fa-fade-opacity: 0.6;  width: 200px; height: 125px; ">
                                </a>
                            </div>
                        </div>

                        <div class="col-sm-6 col-md-4 mb-4">
                            <label>Identificación oficial reverso</label>
                            <div class="mb-3">
                                <a href="/ui/upload">
                                    <img src="../assets/reverso.png" alt="Identificación oficial reverso"
                                        class="img-fluid mb-2 img-thumbnail fa-fade"
                                        style="--fa-animation-duration: 2s; --fa-fade-opacity: 0.6; width: 200px; height: 125px;">
                                </a>
                            </div>
                        </div>
                    </div>
                    <div v-else class="mb-5">
                        <h2 class="animated-border">Identificaciones completas</h2>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-md-4 mb-4 elemento position-relative" v-for="imagen in imagenes" v-bind:key="imagen.id" >
                                <img :src="muestraimg(imagen.fullHttpUploadUrl)" class="img-fluid mb-2 img-thumbnail"
                        style="width: 400px; height: 200px;" />
                                <i class="fa-solid fa-trash  fa-2xl position-absolute top-0 end-0 border border-light"
                                style="color: #d65c5c;" @click="elimina(imagen)"><button type="submit" class="btn btn1"></button></i>
                        </div>
                    </div><i ></i>
                    <div class="d-grid pb-5 mt-5 col-2 mx-auto">
                        <button type="submit" class="btn btn1">Enviar</button>
                    </div>
                </form>


            </main>
            <FooterComponent />
        </div>
    </body>
</template>

<script>
import axios from 'axios';
import HeaderComponent from '@/components/HeaderComponent.vue';
import FooterComponent from '@/components/FooterComponent.vue';
import SideBarComponent from '@/components/SideBarComponent.vue';
import store from '@/store';

export default {
    components: {
        HeaderComponent,
        FooterComponent,
        SideBarComponent,
    },
    data() {
        return {
            imagenes: [],
            maxImagesAllowed: 2,
            loadedImages: 0,
            idUser: store.state.userData.idUser,
        }
    },
    mounted() {
        this.carga();
    },
    methods: {
        carga() {
            axios
                .get(
                    "https://upload.qbits.mx/api/up/get-user-identification-images/" +
                    this.idUser
                )
                .then((response) => {
                    this.imagenes = response.data;
                    this.loadedImages = this.imagenes.length;
                    console.log(this.imagenes);
                })
                .catch((error) => {
                    console.log(error);
                });
        },
        elimina: function (imagen) {
            let tarjeta = document.querySelectorAll(".elemento");
            console.log("La imagen se ha eliminado correctamente");
            // Eliminar la imagen de la matriz de imágenes
            const index = this.imagenes.indexOf(imagen);
            //this.imagenes.splice(index,1);
            console.log(index);
            tarjeta[index].textContent = "";
            console.log(imagen.id);
            console.log("estoy llegando");
            const options = {
                method: "DELETE",
                url: `https://upload.qbits.mx/api/up/delete-media/${imagen.id}`,
                headers: {
                    idMedia: imagen.id,
                    IdUser: store.state.userData.idUser,
                    jwt: store.state.userData.jwt,
                },
            };
            console.log("estoy llegando");
            axios
                .request(options)
                .then(function (response) {
                    this.loader = "none";
                    console.log(response.data);
                    this.delete = response.data;
                    location.reload();
                })
                .catch(function (error) {
                    this.loader = "none";
                    console.error(error);
                });
        },
        muestraimg(Nombreimg) {
            return `https://media.visitanos.net/image${Nombreimg}`;
        },
    },
}
</script>

<style scoped>
.ordenar img {
    display: block;
}
 


div.row {
    justify-content: center;
    gap: 10%;
}

.ordenar button {
    display: block;
}

.hoja {
    background: #a5a5a5dc;
}

.ordenar {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background: whitesmoke;
    border-radius: 10px;
}

.btn1 {
    background: #8BC34A;
}

h1 {
    font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    color: black;
    text-shadow: 5px 0px 3px whitesmoke;
    ;
    font-size: 2.5rem;
    line-height: 1.2;
}

body {
    background-image: url('../assets/oficios.jpg');
    background-size: cover;
    position: relative;
}

#titulo {
    cursor: pointer;
    transition: color 0.3s ease-in-out;
}

#titulo:hover {
    cursor: crosshair;
    color: darkblue;
}

.btn1:hover {
    color: white;
}
</style>