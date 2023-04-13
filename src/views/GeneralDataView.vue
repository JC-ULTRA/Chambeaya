<template>
    <body>
        <HeaderComponent />
        <SideBarComponent />
        <main class="container pt-5 hoja">
            <form style="text-align: center;">
                <div>
                    <div>
                        <h1 class="text-center mb-5">Captura tus datos</h1>
                    </div>
                    <label>
                        Nombre<span class="required red">*</span>:
                        <input type="text" placeholder="Ingresa tu nombre" required />
                    </label>
                </div>
                <br />
                <div class="d-flex flex-column flex-md-row mt-4">
                    <label class="me-md-4">
                        Apellido Paterno<span class="required red">*</span>:
                        <input class="mt-3" type="text" placeholder="Ingresa tu apellido paterno" required />
                    </label>
                    <label class="ms-md-4 mt-3 mt-md-0">
                        Apellido Materno:
                        <input class="mt-3" type="text" placeholder="Ingresa tu apellido materno"
                            v-model="apellidoMaterno" />
                    </label>
                </div>
                <br />
                <div class="d-flex flex-column flex-md-row mt-4">
                    <label class="me-md-4">
                        Número telefónico personal<span class="required red">*</span>:
                        <input class="mt-3" type="tel" placeholder="1122 334 455" required />
                    </label>
                    <label class="ms-md-4 mt-3 mt-md-0">
                        Correo electrónico personal<span class="required red">*</span>:
                        <input class="mt-3" type="email" placeholder="pedroparamo@gmail.com" required />
                    </label>
                </div>
                <br />
                <label class="mt-5">
                    Fecha de nacimiento<span class="required red">*</span>:
                    <input type="date" required />
                </label>
                <br />
                <label class="mt-4">
                    Código postal personal<span class="required red">*</span>:
                    <input class="col-2" type="text" placeholder="00000" required />
                </label>
                <br />

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
import HeaderComponent from '@/components/HeaderComponent.vue'
import FooterComponent from '@/components/FooterComponent.vue';
import info from '@/views/Oficios.json';
import SideBarComponent from '@/components/SideBarComponent.vue';
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
            oficios: info.oficios
        };
    },

};
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
    width: 50%;
}

@media screen and (max-width: 768px) {
    .hoja {
        width: 100%;
    }
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