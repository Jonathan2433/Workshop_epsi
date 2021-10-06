import Vue from "vue";
import Vuetify from "vuetify/lib/framework";
import CustomLogo from "@/components/CustomLogo.vue";
import tiktok from "@/components/tiktok.vue";

Vue.use(Vuetify);

export default new Vuetify({
  iconfont: "mdi",
  icons: {
    values: {
      customLogo: {
        component: CustomLogo,
      },
      tiktok: {
        component: tiktok,
      },
    },
  },
});
