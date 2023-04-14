import { createRouter, createWebHistory } from 'vue-router'
import store from '@/store'
import axios from 'axios';

import RegisterView from '@/views/RegisterView'
import RegisterConfirmView from '@/views/RegisterConfirmView'
import ForbiddenView from '@/views/ForbiddenView'
import ForgotPassView from '@/views/ForgotPassView'
import ForgotConfirmView from '@/views/ForgotConfirmView'
import LoginView from '@/views/LoginView'
import OfficialDocUpLoad from '@/views/OfficialDocUpLoadView'
import PaymentMethodsView from '@/views/PaymentMethodsView'
import GeneralDataView from '@/views/GeneralDataView'
import PostAdView from '@/views/PostAdView'
import TermsConditionsView from '@/views/TermsConditionsView'
import MainMenuView from '@/views/MainMenuView'
import DatosUsuarioView from '@/views/DatosUsuarioView'
import HomeView from "@/views/HomeView";
import UploadImageView from "@/views/UploadImageView";
import UploadImageProView from "@/views/UploadImageProView";
import PostadImageView from '@/views/PostadImageView'; 

const routes = [

  {
    path: "/",
    name: "home",
    component: HomeView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/payment',
    name: 'payment',
    component: PaymentMethodsView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/upload-pro',
    name: 'upload-pro',
    component: UploadImageProView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/post-img',
    name: 'post-img',
    component: PostadImageView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/upload',
    name: 'upload',
    component: UploadImageView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/general-data',
    name: 'general-data',
    component: GeneralDataView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/datosUsuario',
    name: 'datosUsuario',
    component: DatosUsuarioView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/official-doc',
    name: 'official-doc',
    component: OfficialDocUpLoad,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/post',
    name: 'post',
    component: PostAdView,
    meta: { allowedRoles: ["admin", "regular"] },
  },
  {
    path: '/ui/login',
    name: 'login',
    component: LoginView
  },
  {
    path: '/ui/forgot-confirm',
    name: 'forgot-confirm',
    component: ForgotConfirmView
  },
  {
    path: '/ui/forgot',
    name: 'forgot',
    component: ForgotPassView
  },
  {
    path: '/ui/forbidden',
    name: 'forbidden',
    component: ForbiddenView
  },
  {
    path: '/ui/register-confirm',
    name: 'register-confirm',
    component: RegisterConfirmView
  },
  {
    path: '/ui/register',
    name: 'register',
    component: RegisterView
  },
  {
    path: '/ui/terms',
    name: 'terms',
    component: TermsConditionsView
  },
  {
    path: '/ui/main',
    name: 'main',
    component: MainMenuView
  },
]

const router = createRouter({
  history: createWebHistory(),
  scrollBehavior: () => ({ y: 0 }),
  routes
})

function parseJwt(token) {
  var base64Url = token.split('.')[1];
  var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
  var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
    return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
  }).join(''));
  return JSON.parse(jsonPayload);
}

function checaJwt() {
  //  var jwt = store.getters.getjwt;
  var jwt = store.state.userData.jwt;
  if (jwt && jwt !== undefined && jwt.length > 0) {
    const jwtPayload = parseJwt(jwt);
    //jwtPayload.exp=1625505833-28*60;
    let now = new Date();
    let limite = new Date(jwtPayload.creation);
    limite.setMinutes(limite.getMinutes() + 30);
    if (now > limite) {
      store.commit('setUserData', {
        userData: {
          idUser: 0,
          nick: 'cyz',
          email: '',
          role: '',
          lastSuccesfullAccess: '',
          jwt: '', //  jwt='' => signed: false,
          usuarioDetalle: null,
        },
      });
      store.commit('setDestination', '/');
    } else {
      //const timeToExpire =  jwtPayload.exp - (Date.now()/1000);
      //console.log('Tiempo para que expire:' + timeToExpire);
    }
  }
}

router.beforeEach((to, from, next) => {
  axios.defaults.headers.common = { "X-CSRFToken": store.state.userData.jwt };
  axios.defaults.headers.common = { "jwt": store.state.userData.jwt };
  checaJwt();
  //TODO: VALIDAR  EL JWT porque no tiene el valor de expire
  if (to.matched.some(record => record.meta.allowedRoles)) { // *** El recurso SI requiere autenticación ya que pide ciertos roles
    // NO estás autenticado actualmente:
    if (store.state.userData.jwt === '' || store.state.userData.jwt == undefined) {
      store.commit('setDestination', to.fullPath);
      router.push("/ui/login");
      return;
    }
    // SI estoy autenticado actualmente, asi que solo voy a checar si mi rol es el adecuado:              
    if (to.matched.some(ok => !ok.meta.allowedRoles.includes(store.state.userData.role))) {
      router.push('/ui/forbidden'); // no tengo el rol asociado a esa interfaz
      return;
    }
  }
  next(); // *** El recurso NO requiere autenticación
})

export default router
