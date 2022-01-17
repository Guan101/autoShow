import { createApp } from 'vue';
import naive from 'naive-ui';
import Vant from 'vant';
import { NavBar } from 'vant';
import 'vant/lib/index.css';
import App from './App.vue';
import router from './router';
import store from './store';
import Vuex from 'vuex';
import 'default-passive-events';

createApp(App).use(store).use(router).use(naive).use(Vant).use(NavBar).use(Vuex).mount('#app');
