GeneralData

<template>
    <body>
        <HeaderComponent />
        <SideBarComponent />
        <main class="container pt-5 hoja">
            <form style="text-align: center;">
                <div class="container">
                    <div>
                        <h1 class="text-center mb-5">Captura tus datos</h1>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 col-md-6">
                            <div style="display: flex; flex-direction: column; align-items: center;">
                                <label class="mt-4 mb-2">
                                    <div >
                                        Foto de perfil:
                                    </div>

<div></div>

                                </label>
                                <div>
                                    <a href="/ui/upload-pro">hola</a>
                                    <div class="elemento position-relative">
                                        <img :src="muestraimg(imagen.fullHttpUploadUrl)" alt="" class="rounded img" />
                                        <i class="fa-solid fa-trash" style="color: #ff24247c" @click="elimina(imagen)"></i>
                                    </div>








                                    
                                </div>
                            </div>
                            <label class="pt-3">
                                Nombre<span class="required red">*</span>:
                                <input type="text" placeholder="Ingresa tu nombre" required class="form-control" />
                            </label>
                            <br />
                            <div class="d-flex flex-column flex-sm-row mt-4">
                                <label class="me-sm-4">
                                    Apellido Paterno<span class="required red">*</span>:
                                    <input class="mt-3 form-control" type="text" placeholder="Ingresa tu apellido paterno"
                                        required />
                                </label>
                                <label class="ms-sm-4 mt-3 mt-sm-0">
                                    Apellido Materno:
                                    <input class="mt-3 form-control" type="text" placeholder="Ingresa tu apellido materno"
                                        v-model="apellidoMaterno" />
                                </label>
                            </div>
                            <br />
                        </div>
                        <div class="col-sm-12 col-md-6">
                            <div class="d-flex flex-column flex-sm-row mt-4">
                                <label class="me-sm-4">
                                    Número telefónico personal<span class="required red">*</span>:
                                    <input class="mt-3 form-control" type="tel" placeholder="1122 334 455" required />
                                </label>
                                <label class="ms-sm-4 mt-3 mt-sm-0">
                                    Correo electrónico personal<span class="required red">*</span>:
                                    <input class="mt-3 form-control" type="email" placeholder="pedroparamo@gmail.com"
                                        required />
                                </label>
                            </div>
                            <br />
                            <label class="mt-5">
                                Fecha de nacimiento<span class="required red">*</span>:
                                <input type="date" required class="form-control" />
                            </label>
                            <br />
                            <label class="mt-4">
                                Código postal personal<span class="required red">*</span>:
                                <input class="col-2 form-control" type="text" placeholder="00000" required />
                            </label>
                            <br />
                        </div>
                    </div>
                </div>

                <label class="mt-4">
                    ¿Eres anunciante?
                    <input type="checkbox" v-model="esAnunciante" />
                </label>
                <br />

                <div v-if="esAnunciante" style="text-align: justify;">
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <label>
                                Nickname<span class="required red">*</span>:
                                <input type="text" placeholder="Ingresa un nickname" v-model="nickname" required />
                            </label>
                        </div>
                        <div class="col-md-6">
                            <label for="oficios">Elige tu oficio:</label>
                            <select id="oficios" class="form-select mt-3" v-model="oficio" required>
                                <option disabled value="">Selecciona un oficio</option>
                                <option v-for="oficio in oficios" :value="oficio.name" :key="oficio.id">{{ oficio.name }}
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <label class="mt-3">
                                Número telefónico del negocio<span class="required red">*</span>:
                                <input type="tel" placeholder="1122 334 455" required />
                            </label>
                        </div>
                        <div class="col-md-6">
                            <label class="mt-3">
                                Código postal personal<span class="required red">*</span>:
                                <input class="form-control" type="text" placeholder="00000" required />
                            </label>
                        </div>
                    </div>
                </div>

                <div class="d-grid pb-5 mt-5 col-2 mx-auto">
                    <button type="submit" class="btn btn1">Enviar</button>
                </div>
            </form>
        </main>
    </body>
    <FooterComponent />
</template>

<script>
import axios from 'axios';
import HeaderComponent from '@/components/HeaderComponent.vue'
import FooterComponent from '@/components/FooterComponent.vue';
import info from '@/views/Oficios.json';
import SideBarComponent from '@/components/SideBarComponent.vue';
import store from '@/store';


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
            let tarjeta = document.querySelector(".elemento");
            console.log("La imagen se ha eliminado correctamente");
            // Eliminar la imagen de la matriz de imágenes
            //this.imagenes.splice(index,1);
            tarjeta.textContent = "";
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