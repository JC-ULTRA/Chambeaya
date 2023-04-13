<template>
  <div class="sidebar d-flex flex-column flex-shrink-0" @mouseenter="abre" @mouseleave="cierra"
    :style="{ width: sidebarWidth }">
    <div class="m-auto sidebar2">
      <SidebarLinks to="/" class="mb-1 d-flex align-items-center justify-content-between">
        <div><i class="fa-sharp fa-solid fa-house me-1"></i>Home</div>
      </SidebarLinks>
      <SidebarLinks to="/ui/payment" class="mb-2 d-flex align-items-center justify-content-between">
        <div><i class="fa-sharp fa-solid fa-credit-card me-1"></i>Pago</div>
      </SidebarLinks>
      <SidebarLinks to="/ui/general-data" class="mb-2 d-flex align-items-center justify-content-between">
        <div><i class="fa-solid fa-user me-1"></i>Datos</div>
      </SidebarLinks>
      <SidebarLinks to="/ui/official-doc" class="mb-2 d-flex align-items-center justify-content-between">
        <div><i class="fa-regular fa-id-card me-1"></i>INE</div>
      </SidebarLinks>
      <SidebarLinks to="/ui/post" class="mb-2 d-flex align-items-center justify-content-between">
        <div><i class="fa-sharp fa-solid fa-newspaper me-1"></i>Anuncio</div>
      </SidebarLinks>
    </div>
  </div>
</template>

<script>
import { collapsed, toggleSidebar, sidebarWidth, abre, cierra } from './state';
import SidebarLinks from './SidebarLinks.vue';

export default {
  props: {},
  components: { SidebarLinks },
  setup() {
    return { collapsed, toggleSidebar, sidebarWidth, abre, cierra }
  },
  data() {
    return {
      sidebarWidth2: "110px"
    }
  },
  methods: {
    collapsed2: function () {
      return collapsed.value ? this.sidebarWidth2 = "55px" : this.sidebarWidth2
    }
  },
}
</script>

<style>
:root {
  --sidebar-bg-color: rgba(0, 28, 184, 0.548);
  --sidebar-item-active: #ff910056;
}
</style>

<style scoped>
.sidebar {
  background-color: var(--sidebar-bg-color);
  float: left;
  z-index: 1000;
  overflow-y: auto;
  min-height: 780px;
  position: absolute;
  top: 4.3em;
  transition: 0.3s;
  align-items: center;
  margin: auto;
}

.sidebar2 {
  position: absolute;
  top: 3em;
  text-align: left;
  margin-left: 10px;
}
</style>