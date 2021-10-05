import Vue from "vue";
import Vuetify from "vuetify/lib/framework";
import CustomLogo from "@/components/CustomLogo.vue";

Vue.use(Vuetify);

export default new Vuetify({
    icons: {
        values: {
            customLogo: {
                component: CustomLogo,
            },
        },
    },
});
