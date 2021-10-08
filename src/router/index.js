import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Quizz from "../views/Quizz.vue";
import Stats from "../views/Stats.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/Quizz",
    name: "Quizz",
    component: Quizz,
  },
  {
    path: "/Stats",
    name: "Stats",
    component: Stats,
  },
  {
    path: "/about",
    name: "About",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue"),
  },
];

const router = new VueRouter({
  routes,
});

export default router;
