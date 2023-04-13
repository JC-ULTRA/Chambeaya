<template>
    <nav class="navbar navbar-expand-lg cabecera">
        <div class="container-fluid">
            <a class="" href="/ui/login">
                <img src="../assets/chambeaya.png" alt="Logo" width="50" class=" align-text-top fa-beat-fade">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <form class="d-flex mx-auto">
                    <input class="form-control buscador" type="search" placeholder="Busca Oficios...." aria-label="Buscar">
                    <button class="btn btn-outline-success search" type="submit"><i
                            class="fa-solid fa-magnifying-glass fa-beat-fade"></i></button>
                </form>
                <ul class="navbar-nav center">
                    <div class="user-info">


                    </div>
                    <li class="nav-item login">
                        <span v-if="nick">{{ nick }}</span>
                        <router-link v-else :to="{ name: 'login' }">Login</router-link>
                    </li>
                    <li class="nav-item sign">
                        <a v-on:click="handleLogout" class="nav-link" href="#">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
    name: "HeaderComponent",
    computed: {
        ...mapState({
            nick: (state) => state.userData.nick,
        }),
    },
    methods: {
        ...mapMutations({
            clearUserData: "clearUserData",
        }),
        handleLogout() {
            this.clearUserData();
            localStorage.clear();
            this.$router.push({ name: 'login' })
        },
    },
};
</script>


<style scoped>
.cabecera {
    background: #FF9900;
    margin-bottom: 3rem;
}

.search {
    z-index: 2px;
    position: relative;
    left: -2.5rem;
    background: #8BC34A;
}

.buscador {
    width: 25rem;
}

.sign {
    width: 7rem;
    margin: 2px;
    border: 2px solid white;
    background: rgba(255, 255, 255, 0.356);
}

.center {
    align-items: center;
}

.login {
    width: 7rem;
    margin: 2px;
    border: 2px solid;
    background: #ff9900c0;
}
</style>