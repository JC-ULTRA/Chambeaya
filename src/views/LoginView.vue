<template>
    <body>
        <div>
            <HeaderComponent />
            <main class="container pb-5 hoja">
                <div class="card ancho">
                    <div class="card-body text-align-left">
                        <div class="row">
                            <div class="col">
                                <h1>Login</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control icon-user" id="text-usr" v-model="fieldUser"
                                    placeholder="william@email.com" />
                                <span :class="usrErrorMsgClass">Formato de correo inválido</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="d-flex justify-content-between">
                                    <input :type="credential" class="form-control icon-key" id="text-usr"
                                        v-model="fieldPassword" placeholder="******" />
                                    <a :class="eye" href="#" @click="toogle"></a>
                                </div>
                                <span :class="passErrorMsgClass">Formato de clave inválido</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col" style="text-align: right;">
                                <a class="liga" href="/ui/forgot">Forgot password ?</a>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col">
                                <div class="d-flex justify-content-between">
                                    <button class="btn btn-success" :disabled=inhabilitado
                                        @click="checkCredentials">Login</button>
                                    <a class="btn btn-warning" href="/ui/register">Register</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <MessageComponent 
                ref="message01" 
                alertType=3 
                duration=4000 
                :text=errorText iconType=1
                    style="max-width: 600px;" />

            </main>
            <FooterComponent class="down" />
        </div>
    </body>
</template>

<script>
import axios from 'axios'
import store from '@/store'
import router from '@/router'
import HeaderComponent from '@/components/HeaderComponent.vue'
import FooterComponent from '@/components/FooterComponent.vue'


const emaiRegex = new RegExp(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
// nice icons from: https://www.flaticon.com/free-icons/user
const apiEndpoint = 'https://access.qbits.mx/api/login'

export default {
    components: {
        HeaderComponent,
        FooterComponent,
    },
    data: function () {
        return {
            fieldUser: '',
            fieldPassword: '',
            usrErrorMsgClass: 'error-free',
            passErrorMsgClass: 'error-free',
            errorText: '',
            eye: 'open-eye',
            credential: 'password'
        }
    },
    watch: {
        fieldUser() {
            this.usrErrorMsgClass = "error-free"
            var flagBadMail = this.fieldUser.length < 30 && !emaiRegex.test(this.fieldUser)
            if (flagBadMail) this.usrErrorMsgClass = "err-msg"
        },
        fieldPassword() {
            this.passErrorMsgClass = "error-free"
            var flagBadMail = this.fieldPassword.length < 5
            if (flagBadMail) this.passErrorMsgClass = "err-msg"
        }
    },
    computed: {
        inhabilitado() {
            var b =
                this.fieldUser.length > 0 &&
                this.fieldPassword.length > 0 &&
                this.usrErrorMsgClass == "error-free" &&
                this.passErrorMsgClass == "error-free"
            return !b
        }
    },
    methods: {
        toogle: function () {
            if (this.eye == 'close-eye') {
                this.eye = 'open-eye'
                this.credential = 'password'
            } else {
                this.eye = 'close-eye'
                this.credential = 'text'
            }
        },
        checkCredentials: function () {
            axios.post(apiEndpoint, {
                user: this.fieldUser,
                cred: this.fieldPassword
            }).then(response => {
                var ud = response.data;
                store.commit("setUserData", ud);
                const target = this.detecta(store.state.userData.role);
                router.push(target);
            }).catch(error => {
                this.errorText = error.response ? error.response.data.exceptionLongDescription : error
                this.$refs.message01.presenta()
            })
        },
        detecta: function (roles) {
            if (store.state.destination.length > 0) {
                var target = store.state.destination;
                store.commit('setDestination', '');
                return target;
            }
            if (typeof roles === 'string') {
                return '/';
            } else {
                for (var i = 0; i < roles.length; i++) {
                    switch (roles[i].nombre) {
                        case 'admin': return '/ui/admin'; // rol 1 = administrador
                        case 'user': return '/'; // rol 2 = usuario comun y corriente
                        case 'normal': return '/'; // rol 2 = usuario comun y corriente
                        default: return '/'; // otro rol cualquiera
                    }
                } // ends for cycle with switch inside
            }
        },
    }
}
</script>

<style scoped>
.open-eye {
    background: url("@/assets/eye-open.png") no-repeat left;
    background-size: 14px;
    width: 20px;
    margin-left: 8px;
}

.close-eye {
    background: url("@/assets/eye-close.png") no-repeat left;
    background-size: 14px;
    width: 20px;
    margin-left: 8px;
}

.error-free {
    color: transparent;
}

.err-msg {
    color: red;
}

.icon-user {
    padding-left: 30px;
    background: url("@/assets/user.png") no-repeat left;
    background-size: 14px;
    background-position: 2%50%;
}

.icon-key {
    padding-left: 30px;
    background: url("@/assets/key.png") no-repeat left;
    background-size: 14px;
    background-position: 2%50%;
}

.ancho {
    max-width: 380px;
    margin: auto;
    margin-top: 100px;
}

.text-align-left {
    text-align: left;
}

.liga {
    text-decoration: none;
}

.liga:hover {
    text-decoration: underline;
}

.color1 {
    background-color: #D8CFB5;
}

.color2 {
    background-color: #CDC3A7;
}

.color3 {
    background-color: #E0D8B0;
}

.color4 {
    background-color: red;
}

.color5 {
    background-color: #CCB9A5;
}

.color6 {
    background-color: #C3B091;
}

.tam {
    width: 100%;
    height: 1200px;
}

body {
    background-image: url('../assets/oficios.jpg');
    background-size: cover;
    position: relative;
}


</style>