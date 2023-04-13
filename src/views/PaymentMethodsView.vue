<template>
    <body>
        
        <HeaderComponent />
        <SideBarComponent />
                <main class="container pt-5 hoja">

            <div>
                <div>
                    <h1 class="text-center mb-1">Ingresa tus datos bancarios</h1>
                </div>
                <div style="text-align: right;">
                    <img src="@/assets/visa.png" width="100" alt="visa-america-master">
                </div>
                <form @submit.prevent="submitForm">
                    <label for="nombre-titular" class="mt-4">Nombre del titular:</label>
                    <input type="text" class="col-10" id="nombre-titular" name="nombre-titular"
                        placeholder="Ingresa tu nombre">

                    <label for="numero-cuenta" class="mt-4">Tarjeta de crédito o débito:</label>
                    <input type="text" class="col-10" id="numero-cuenta" name="numero-cuenta"
                        placeholder="0000 0000 0000 0000">

                    <div class="d-flex mt-5">
                        <div>
                            <label for="fecha-vencimiento">Fecha de expiración:</label><br>
                            <input type="text" class="col-3" style="text-align: center;" id="fecha-vencimiento"
                                name="fecha-vencimiento" placeholder="00/00">
                        </div>

                        <div class="ms-3">
                            <label for="codigo-verificacion">Código de verificación:</label><br>
                            <input type="text" class="col-3" style="text-align: center;" id="codigo-verificacion"
                                name="codigo-verificacion" placeholder="000">
                        </div>
                    </div>

                    <div class="d-flex mt-5">
                        <input type="checkbox" id="terminos" name="terminos" v-model="aceptaTerminos" required> &nbsp;&nbsp;
                        <div>
                            <label for="terminos">He leido y estoy de acuerdo con los </label> <br>
                            <a href="/terminos">términos y las condiciones</a>
                        </div>
                    </div>
                    <div class="d-grid pb-5 mt-5 col-2 mx-auto">
                        <button type="submit" class="btn btn1">Enviar</button>
                    </div>
                </form>
            </div>
        </main>
        <FooterComponent />
    </body>
</template>

<script>
import HeaderComponent from '@/components/HeaderComponent.vue';
import FooterComponent from '@/components/FooterComponent.vue';
import SideBarComponent from '@/components/SideBarComponent.vue';
export default {
    components: {
        HeaderComponent,
        FooterComponent,
        SideBarComponent,
    },
    data() {
        return {
            nombreTitular: '',
            numeroCuenta: '',
            fechaVencimiento: '',
            codigoVerificacion: '',
            aceptaTerminos: false
        }
    },
    methods: {

    }
}
</script>

<style scoped>
form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

input,
label {
    margin: 5px 0;
}

.btn1 {
    background: #8BC34A;
}

.btn1:hover {
    color: white;
}

footer {
    margin-top: 30px;
}

h1{
    font-family:Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
    color: black;
    text-shadow: 5px 0px 3px whitesmoke;;
    font-size: 2.5rem;
    line-height: 1.2;
}
body {
    background-image: url('../assets/oficios.jpg');
    background-size: cover;
    position: relative;
}

.hoja {
    background: #a5a5a5dc;
    width: 40%;
    margin: 0 auto; /* Para centrar el contenedor horizontalmente */
}

@media screen and (max-width: 575.98px) {
    /* Pantallas pequeñas */
    .hoja {
        width: 90%;
    }
}

@media screen and (min-width: 576px) {
    /* Pantallas medianas y grandes */
    .hoja {
        width: 40%;
    }
}
</style>