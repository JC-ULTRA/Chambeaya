<template>
    <div class="content">
        <SidebarComponent />
        <h1>Forbidden</h1>
    </div>
</template>

<script>
import SidebarComponent from '@/components/SideBarComponent.vue'
export default {
    components: {
        SidebarComponent
    }
}
</script>
<style scoped>
.content {
    min-height: 800px;
}
</style>
