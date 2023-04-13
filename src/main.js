import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Toast from "vue-toastification";
import "vue-toastification/dist/index.css";
import MessageComponent from '@/components/MessageComponent'
import ImageCropper from '@/components/ImageCropper'


const app = createApp(App);

app
.component("MessageComponent",MessageComponent)
.component("ImageCropper", ImageCropper)
.use(Toast)
.use(store)
.use(router)
.mount('#app')
