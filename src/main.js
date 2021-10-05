import Vue from "vue";
import "./plugins/axios";
import App from "./App.vue";
import router from "./router";
import vuetify from "./plugins/vuetify";
import VueSessionStorage from "vue-sessionstorage";

// Vue.config.productionTip = false;
Vue.use(VueSessionStorage);
new Vue({
  router,
  vuetify,
  render: (h) => h(App),
}).$mount("#app");
