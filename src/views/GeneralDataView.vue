<template>
    <body>
        <HeaderComponent />
        <SideBarComponent />
        <main class="container pt-5 hoja">
            <form style="text-align: center;">
                <div class="container">
                    
                    <div>
                        <div>
                        <h1 class="text-center mb-5">Captura tus datos</h1>
                    </div>
                    <div class="form-group">
                                    <label class="mt-3">Foto de perfil:</label>
                                    <div>
                                        <a href="/ui/upload-pro">hola</a>
                                        <div class="elemento position-relative">
                                            <img :src="imagenperfil(imagen.fullHttpUploadUrl)" alt="" class="rounded img" />
                                            <i class="fa-solid fa-trash" style="color: #ff24247c"
                                                @click="elimina(imagen)"></i>
                                        </div>
                                    </div>
                                </div>
                    </div>

                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label class="mt-3">Nombre<span class="required red">*</span>:</label>
                                    <input type="text" placeholder="Ingresa tu nombre" required class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="mt-3">Apellido Paterno<span class="required red">*</span>:</label>
                                    <input class="mt-3 form-control" type="text" placeholder="Ingresa tu apellido paterno"
                                        required />
                                </div>
                                <div class="form-group">
                                    <label class="mt-3">Apellido Materno:</label>
                                    <input class="mt-3 form-control" type="text" placeholder="Ingresa tu apellido materno"
                                        v-model="apellidoMaterno" />
                                </div>
                            </div>
                            <div class="col-sm-12 col-md-6">
                                <div class="form-group">
                                    <label class="mt-3">Número telefónico personal<span
                                            class="required red">*</span>:</label>
                                    <input class="mt-3 form-control" type="tel" placeholder="1122 334 455" required />
                                </div>
                                <div class="form-group">
                                    <label class="mt-3">Correo electrónico personal<span
                                            class="required red">*</span>:</label>
                                    <input class="mt-3 form-control" type="email" placeholder="pedroparamo@gmail.com"
                                        required />
                                </div>
                                <div class="form-group">
                                    <label class="mt-3">Fecha de nacimiento<span class="required red">*</span>:</label>
                                    <input type="date" required class="form-control" />
                                </div>
                                <div class="form-group">
                                    <label class="mt-3">Código postal personal<span class="required red">*</span>:</label>
                                    <input class="col-2 form-control" type="text" placeholder="00000" required />
                                </div>
                            </div>
                        </div>
                    </div>


                </div>

                <div class="mt-4">
                    ¿Eres anunciante?
                    <input type="checkbox" v-model="esAnunciante" />
                </div>

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
        imagenperfil(Nombreimg) {
            return `https://media.visitanos.net/image${Nombreimg}`;
        },
    },
}
</script>

<style scoped>
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