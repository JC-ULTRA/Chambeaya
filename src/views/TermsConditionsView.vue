<template>
    <HeaderComponent />
    <div class="container">
        <h1 class="mb-4">Alta de Anuncios</h1>
        <form>
            <div class="mb-3">
                <label for="descripcionBreve" class="form-label">Descripción breve:</label>
                <input type="text" class="form-control" id="descripcionBreve" placeholder="Ingresa una descripción breve" />
            </div>
            <div class="mb-3">
                <label for="descripcionLarga" class="form-label">Descripción larga:</label>
                <textarea class="form-control" id="descripcionLarga"
                    placeholder="Ingresa una descripción detallada"></textarea>
            </div>
            <div class="mb-3">
                <label for="codigoPostal" class="form-label">Código postal:</label>
                <input type="text" class="form-control" id="codigoPostal" placeholder="Ingresa el código postal" />
            </div>
            <div class="mb-3">
                <label for="oficios" class="form-label">Selecciona un oficio:</label>
                <select class="form-select" id="oficios">
                    <option selected>Selecciona un oficio</option>
                    <option value="1">Plomería</option>
                    <option value="2">Carpintería</option>
                    <option value="3">Electricidad</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="fotografias" class="form-label">Agregar fotografías:</label>
                <input type="file" class="form-control" id="fotografias" multiple />
                <div class="mt-3">
                    <label>Previsualización de fotografías:</label>
                    <div class="row" v-if="fotografiasPreview.length > 0">
                        <div class="col-4 mb-3" v-for="(preview, index) in fotografiasPreview" :key="index">
                            <img :src="preview" class="img-fluid" alt="Previsualización" />
                        </div>
                    </div>
                    <p v-else>No se han seleccionado fotografías</p>
                </div>
            </div>
            <div class="mb-3">
                <label for="videos" class="form-label">Agregar videos:</label>
                <input type="file" class="form-control" id="videos" multiple />
                <div class="mt-3">
                    <label>Previsualización de videos:</label>
                    <div class="row" v-if="videosPreview.length > 0">
                        <div class="col-4 mb-3" v-for="(preview, index) in videosPreview" :key="index">
                            <video :src="preview" class="img-fluid" controls></video>
                        </div>
                    </div>
                    <p v-else>No se han seleccionado videos</p>
                </div>
            </div>
            <div class="mb-3">
                <label for="telefono" class="form-label">Número telefónico:</label>
                <input type="tel" class="
                            form-control" id="telefono" placeholder="Ingresa el número telefónico" />
            </div>
            <div class="mb-3">
                <label for="correo" class="form-label">Correo electrónico:</label>
                <input type="email" class="form-control" id="correo" placeholder="Ingresa el correo electrónico" required />
            </div>
            <div class="mb-3">
                <label for="redes" class="form-label">Redes sociales:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-facebook"></i></span>
                    <input type="text" class="form-control" id="facebook" placeholder="Ingresa el enlace de Facebook" />
                </div>
                <div class="input-group mt-3">
                    <span class="input-group-text"><i class="bi bi-instagram"></i></span>
                    <input type="text" class="form-control" id="instagram" placeholder="Ingresa el enlace de Instagram" />
                </div>
                <div class="input-group mt-3">
                    <span class="input-group-text"><i class="bi bi-twitter"></i></span>
                    <input type="text" class="form-control" id="twitter" placeholder="Ingresa el enlace de Twitter" />
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Cargar datos</button>
        </form>
    </div>
    <FooterComponent />
</template>

<script>
import HeaderComponent from '@/components/HeaderComponent.vue';
import FooterComponent from '@/components/FooterComponent.vue';
export default {
    components: {
        HeaderComponent,
        FooterComponent,
    },
    data() {
        return {
            fotografiasPreview: [],
            videosPreview: [],
        };
    },
    methods: {
        previewFotografias(event) {
            const files = event.target.files;
            const previewArray = [];
            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const reader = new FileReader();
                reader.onload = () => {
                    previewArray.push(reader.result);
                };
                reader.readAsDataURL(file);
            }
            this.fotografiasPreview = previewArray;
        },
        previewVideos(event) {
            const files = event.target.files;
            const previewArray = [];
            for (let i = 0; i < files.length; i++) {
                const file = files[i];
                const reader = new FileReader();
                reader.onload = () => {
                    previewArray.push(reader.result);
                };
                reader.readAsDataURL(file);
            }
            this.videosPreview = previewArray;
        },
    },
};
</script>
