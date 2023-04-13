<template>
    <router-link :to="to" class="link" :class="{ active: isActive }">
        <i class="icon" :class="icon"></i>
        <transition name="fade">
            <span v-if="!collapsed">
                <slot />
            </span>
        </transition>
    </router-link>
</template>

<script>
import { computed } from 'vue'
import { useRoute } from 'vue-router';
import { collapsed } from './state';

export default{
    props:{
        to: { type: String, required: true},
        icon: { type: String, required: true}
    },
    setup(props){
        const route = useRoute()
        const isActive = computed(() => route.path === props.to)
        return { isActive, collapsed }
    }
}
</script>

<style scoped>

.link {
    cursor: pointer;
    font-weight: 400;
    user-select: none;
    padding: 0.4em;
    padding-top: 1em;
    padding-bottom: 1em;
    border-radius: .7em;
    height: .5em;

    color: rgb(255, 255, 255);
    text-decoration: none;
}

.link:hover {
    background-color: var(--sidebar-item-hover);
}

.link.active {
    background-color: var(--sidebar-item-active);
}

.link .icon {
    flex-shrink: 0;
    width: 20px;
}

</style>