<template>
  <v-app class="random-background">
    <v-navigation-drawer
      v-model="drawer"
      app
      dark
      fixed
      temporary
      bottom
      right
      hide-overlay
      class="blured"
    >
      <v-sheet class="pa-4" dark>
        <v-btn-toggle rounded>
          <v-dialog
            transition="dialog-top-transition"
            v-model="login.dialog"
            absolute
            max-width="600px"
            min-width="360px"
            background-color="transparent"
            hide-overlay
          >
            <template v-slot:activator="{ on, attrs }">
              <v-btn
                v-if="!islogged()"
                v-bind="attrs"
                v-on="on"
                rounded
                elevation="6"
              >
                <v-icon left dark>mdi-account</v-icon>
                Login
              </v-btn>
              <v-btn @click="logoutFunction" v-else rounded elevation="6">
                <v-icon left dark>mdi-account-off</v-icon>
                Logout
              </v-btn>
            </template>

            <v-card class="transparent">
              <div class="transparent">
                <v-tabs
                  v-model="login.tab"
                  show-arrows
                  icons-and-text
                  dark
                  grow
                  class="transparent"
                >
                  <v-tabs-slider color="purple darken-4"></v-tabs-slider>
                  <v-tab
                    v-for="formtab in login.formtabs"
                    :key="formtab.name"
                    class="transparent"
                  >
                    <v-icon large>{{ formtab.icon }}</v-icon>
                    <div class="caption py-1">
                      {{ formtab.name }}
                    </div>
                  </v-tab>
                  <v-tab-item class="blured">
                    <v-card class="px-4">
                      <v-card-text>
                        <v-form
                          ref="loginForm"
                          v-model="login.valid"
                          lazy-validation
                        >
                          <v-row>
                            <v-col cols="12">
                              <v-text-field
                                v-model="login.loginMail"
                                :rules="login.loginMailRules"
                                label="E-mail"
                                required
                              ></v-text-field>
                            </v-col>
                            <v-col cols="12">
                              <v-text-field
                                v-model="login.loginPassword"
                                :append-icon="login.show1 ? 'eye' : 'eye-off'"
                                :rules="[login.rules.required, login.rules.min]"
                                :type="login.show1 ? 'text' : 'password'"
                                name="input-10-1"
                                label="Password"
                                hint="At least 8 characters"
                                counter
                                @click:append="login.show1 = !login.show1"
                              ></v-text-field>
                            </v-col>
                            <v-col
                              class="d-flex"
                              cols="12"
                              sm="6"
                              xsm="12"
                            ></v-col>
                            <v-spacer></v-spacer>
                            <v-col
                              class="d-flex"
                              cols="12"
                              sm="3"
                              xsm="12"
                              align-end
                            >
                              <v-btn
                                :loading="loading"
                                x-large
                                block
                                :disabled="!login.valid"
                                color="success"
                                @click="validateLogin"
                              >
                                Login
                                <template v-slot:loader color="orange">
                                  <span>Loading...</span>
                                </template>
                              </v-btn>
                            </v-col>
                          </v-row>
                        </v-form>
                      </v-card-text>
                    </v-card>
                  </v-tab-item>
                  <v-tab-item class="blured">
                    <v-card class="px-4">
                      <v-card-text>
                        <v-form
                          ref="registerForm"
                          v-model="login.valid"
                          lazy-validation
                        >
                          <v-row>
                            <v-col cols="12" sm="6" md="6">
                              <v-text-field
                                v-model="login.nom"
                                :rules="[login.rules.required]"
                                label="First Name"
                                maxlength="20"
                                required
                              ></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="6">
                              <v-text-field
                                v-model="login.prenom"
                                :rules="[login.rules.required]"
                                label="Last Name"
                                maxlength="20"
                                required
                              ></v-text-field>
                            </v-col>
                          </v-row>
                          <v-row>
                            <v-col cols="12" sm="6" md="6">
                              <v-select
                                v-model="login.centre_formation"
                                :items="list_centre_formation"
                                item-text="nom"
                                :menu-props="{
                                  top: true,
                                  offsetY: true,
                                }"
                                :rules="[login.rules.required]"
                                label="Centre de Formation"
                                required
                                return-object
                                @change="getFormation"
                              ></v-select>
                            </v-col>
                            <v-col cols="12" sm="6" md="6">
                              <v-select
                                v-model="login.formation"
                                :items="list_formation"
                                item-text="libelle"
                                :menu-props="{
                                  top: true,
                                  offsetY: true,
                                }"
                                :rules="[login.rules.required]"
                                label="Formation"
                                required
                                return-object
                              ></v-select>
                            </v-col>
                          </v-row>
                          <v-row>
                            <v-col cols="10">
                              <v-text-field
                                v-model="login.mail"
                                :rules="login.mailRules"
                                label="E-mail"
                                required
                              ></v-text-field>
                            </v-col>
                            <v-col cols="2">
                              <v-select
                                v-model="login.age"
                                :items="listAge"
                                :menu-props="{
                                  top: true,
                                  offsetY: true,
                                }"
                                :rules="[login.rules.required]"
                                label="Age"
                                required
                              ></v-select>
                            </v-col>
                          </v-row>
                          <v-row>
                            <v-col cols="12" sm="6" md="6">
                              <v-text-field
                                v-model="login.password"
                                :append-icon="
                                  login.show1 ? 'mdi-eye' : 'mdi-eye-off'
                                "
                                :rules="[login.rules.required, login.rules.min]"
                                :type="login.show1 ? 'text' : 'password'"
                                name="input-10-1"
                                label="Password"
                                hint="At least 8 characters"
                                counter
                                @click:append="login.show1 = !login.show1"
                              ></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6" md="6">
                              <v-text-field
                                block
                                v-model="login.verify"
                                :append-icon="
                                  login.show1 ? 'mdi-eye' : 'mdi-eye-off'
                                "
                                :rules="[login.rules.required, passwordMatch]"
                                :type="login.show1 ? 'text' : 'password'"
                                name="input-10-1"
                                label="Confirm Password"
                                counter
                                @click:append="login.show1 = !login.show1"
                              ></v-text-field>
                            </v-col>
                            <v-spacer></v-spacer>
                            <v-col
                              class="d-flex ml-auto"
                              cols="12"
                              sm="3"
                              xsm="12"
                            >
                              <v-btn
                                :loading="loading"
                                x-large
                                block
                                :disabled="!login.valid"
                                color="success"
                                @click="validateRegister"
                              >
                                Register
                                <template v-slot:loader>
                                  <span>Loading...</span>
                                </template>
                              </v-btn>
                            </v-col>
                          </v-row>
                        </v-form>
                      </v-card-text>
                    </v-card>
                  </v-tab-item>
                </v-tabs>
              </div>
            </v-card>
          </v-dialog>
          <v-btn
            v-if="islogged()"
            rounded
            outlined
            color="warning"
            elevation="6"
          >
            {{ this.$session.get("nom") }}
          </v-btn>
        </v-btn-toggle>
      </v-sheet>

      <v-divider></v-divider>

      <v-list>
        <v-list-item
          v-for="item in drawer_links"
          :key="item.icon"
          :to="item.link"
          link
        >
          <v-list-item-icon v-if="!isdisabled(item)">
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content v-if="!isdisabled(item)">
            <v-list-item-title>
              {{ item.text }}
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar
      app
      :src="require('./assets/background1.gif')"
      color="rgba(255, 255, 255, 0.3)"
      dark
    >
      <template v-slot:img="{ props }">
        <v-img
          v-bind="props"
          gradient="to top right, rgba(100,115,201,.7), rgba(25,32,72,.7)"
        ></v-img>
      </template>

      <v-toolbar-title class="text-h4" id="toolbar-title">
        <v-icon x-large left>$customLogo</v-icon>
        <span class="logo">HandiQuizz</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>
    </v-app-bar>

    <v-main>
      <router-view />
    </v-main>

    <v-footer v-bind="null" padless class="transparent" v-resize="onResize">
      <v-card flat tile width="100%" class="text-center trasparent">
        <v-divider dark class="ma-8"></v-divider>
        <v-card-text>
          <h1 class="pb-2 white--text">
            You can find
            <span class="white--text">us</span> at
          </h1>
          <v-btn-toggle rounded class="custom-card-text blured">
            <v-btn
              large
              rounded
              outlined
              color="warning"
              v-bind:href="social.url"
              :key="social.name"
              v-for="social in socials"
            >
              <v-icon class="white--text" size="24px">{{ social.icon }}</v-icon>
            </v-btn>
          </v-btn-toggle>
        </v-card-text>

        <v-card-text class="pt-0 text-left text-md-center">
          <v-expansion-panels
            accordion
            v-model="panel"
            multiple
            class="transparent"
          >
            <v-expansion-panel
              v-for="item in footeritems"
              :key="item.name"
              class="custom-card-text col-md-3 col-12 custom-panel blured"
            >
              <h3 class="d-none d-md-block py-2 white--text">
                {{ item.name }}
              </h3>
              <v-expansion-panel-header class="d-md-none white--text">
                {{ item.name }}
                <template v-slot:actions>
                  <v-icon color="white">$expand</v-icon>
                </template>
              </v-expansion-panel-header>
              <v-expansion-panel-content>
                <li v-for="tag in item.tags" :key="tag.urlname">
                  <a v-bind:href="tag.url" class="white--text d-md-flex"
                    >{{ tag.urlname }}
                  </a>
                </li>
              </v-expansion-panel-content>
            </v-expansion-panel>
          </v-expansion-panels>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-text class="white--text">
          <v-icon color="white">mdi-copyright</v-icon>
          Copyright 2019 - {{ new Date().getFullYear() }} —
          <strong>AoKoori</strong>
        </v-card-text>
      </v-card>
    </v-footer>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  name: "App",

  computed: {
    passwordMatch() {
      return () =>
        this.login.verify === this.login.password || "Password must match";
    },
  },

  methods: {
    onResize() {
      if (window.innerWidth >= 960) {
        this.panel = [...Array(4).keys()].map((k, i) => i);
      } else {
        this.panel = [];
      }
    },
    range(start, end) {
      return Array(end - start + 1)
        .fill()
        .map((_, idx) => start + idx);
    },

    loginFunction(request) {
      axios
        .get(
          "http://localhost/dashboard/ProjetHDD/handiquizz/public/loginrequest.php",
          {
            params: {
              requestType: request,
              nom: this.login.nom,
              prenom: this.login.prenom,
              age: this.login.age,
              centre_formation: this.login.centre_formation.id_etablissement,
              formation: this.login.formation.id_metier,
              mail: this.login.mail,
              password: this.login.password,
              loginMail: this.login.loginMail,
              loginPassword: this.login.loginPassword,
            },
          }
        )
        .then((response) => {
          this.users = response.data;
          if (this.users[0]) {
            this.$session.set("id", this.users[0].id_utilisateur);
            this.$session.set("nom", this.users[0].nom);
            this.$session.set("prenom", this.users[0].prenom);
            this.$session.set("mail", this.users[0].mail);
            this.$session.set("role", this.users[0].abilitation);
            this.$session.set(
              "id_centre_formation",
              this.users[0].id_etablissement
            );
            this.$session.set("id_metier", this.users[0].id_metier);
          } else {
            alert("Invalid User or Password! \nTry again please");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getCentreFormation() {
      axios
        .get(
          "http://localhost/dashboard/ProjetHDD/handiquizz/public/getcentreformation.php"
        )
        .then((response) => {
          if (response.data.length > 0) {
            this.list_centre_formation = response.data;
            this.noData_centre_formation = false;
          } else {
            this.list_centre_formation = [];
            this.noData_centre_formation = true;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getFormation() {
      this.login.formation = "";
      axios
        .get(
          "http://localhost/dashboard/ProjetHDD/handiquizz/public/getformation.php",
          {
            params: {
              id_centre_formation: this.login.centre_formation.id_etablissement,
            },
          }
        )
        .then((response) => {
          if (response.data.length > 0) {
            this.list_formation = response.data;
            this.noData_formation = false;
          } else {
            this.list_formation = [];
            this.noData_formation = true;
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    getQuizz() {
      axios
        .get(
          "http://localhost/dashboard/ProjetHDD/handiquizz/public/getquizz.php"
        )
        .then((response) => {
          if (response.data.length > 0) {
            this.quizz.list_questions = response.data[0];
            this.quizz.list_reponses = response.data[1];
            this.quizz.noData = false;
            console.log("response");
          } else {
            this.quizz.list_questions = "";
            this.quizz.list_reponses = "";
            this.quizz.noData = true;
            console.log("no response");
          }
        })
        .catch((error) => {
          console.log(error);
        })
        .finally(() => {
          this.loading = false;
          console.log("done");
        });
    },
    validateLogin() {
      if (this.$refs.loginForm.validate()) {
        this.loader = "loading";
        this.loginFunction("select");
      }
    },
    validateRegister() {
      if (this.$refs.registerForm.validate()) {
        this.loader = "loading";
        this.loginFunction("insert");
      }
    },
    reset() {
      this.$refs.form.reset();
    },
    resetValidation() {
      this.$refs.form.resetValidation();
    },
    logoutFunction() {
      this.$session.clear();
      window.location.reload();
    },
    isdisabled(item) {
      return !(this.islogged() || item.allowed);
    },
    islogged() {
      return this.$session.exists("mail");
    },
  },
  watch: {
    loader() {
      const l = this.loader;
      this[l] = !this[l];

      setTimeout(() => (this[l] = false), 2000);

      this.loader = null;
    },
  },

  beforeDestroy() {
    if (typeof window !== "undefined") {
      window.removeEventListener("resize", this.onResize, {
        passive: true,
      });
    }
  },

  mounted() {
    this.getCentreFormation();
    this.onResize();
    window.addEventListener("resize", this.onResize, { passive: true });
    this.listAge = [...this.range(10, 100)];
  },

  data: () => ({
    users: "",
    list_centre_formation: [],
    noData_centre_formation: false,
    list_formation: [],
    noData_formation: false,
    loading: false,
    loader: null,
    userid: null,
    listAge: [],
    login: {
      dialog: false,
      tab: 0,
      formtabs: [
        { name: "Login", icon: "mdi-account" },
        { name: "Register", icon: "mdi-account-outline" },
      ],
      valid: true,

      nom: "",
      prenom: "",
      age: "",
      centre_formation: "",
      formation: "",
      mail: "",
      password: "",
      verify: "",
      loginPassword: "",
      loginMail: "",
      loginMailRules: [
        (v) => !!v || "Required",
        (v) => /.+@.+\..+/.test(v) || "E-mail must be valid",
      ],
      mailRules: [
        (v) => !!v || "Required",
        (v) => /.+@.+\..+/.test(v) || "E-mail must be valid",
      ],

      show1: false,
      rules: {
        required: (value) => !!value || "Required.",
        min: (v) => (v && v.length >= 8) || "Min 8 characters",
      },
    },

    drawer: false,
    drawer_links: [
      { icon: "mdi-home", text: "Accueil", link: "/", allowed: true },
      { icon: "mdi-account", text: "Profile", link: "/", allowed: false },
      {
        icon: "mdi-progress-question",
        text: "Quizz",
        link: "/Quizz",
        allowed: false,
      },
      {
        icon: "mdi-chart-bar-stacked",
        text: "Statistiques",
        link: "/Stats",
        allowed: false,
      },
      {
        icon: "mdi-shield-key-outline",
        text: "Admin",
        link: "/Admin",
        allowed: false,
      },
    ],
    panel: [0, 1, 2, 3],
    socials: [
      {
        name: "facebook",
        icon: "mdi-facebook",
        url: "https://www.facebook.com/HandiQuizz-100680439063768",
      },
      {
        name: "twitter",
        icon: "mdi-twitter",
        url: "https://twitter.com/HandiQuizz?t=UuPE0l-jdjXo0-t-ZWIOWQ&s=09",
      },
      {
        name: "linkedin",
        icon: "mdi-linkedin",
        url: "https://www.linkedin.com/company/handiquizz/",
      },
      {
        name: "instagram",
        icon: "mdi-instagram",
        url: "https://www.instagram.com/handiquizz/?hl=fr",
      },
      {
        name: "tiktok",
        icon: "$vuetify.icons.tiktok",
        url: "https://www.tiktok.com/@handiquizz",
      },
    ],
    footeritems: [
      {
        name: "Get Help",
        tags: [
          { urlname: "Comment s'inscrire ? ", url: "#!" },
          { urlname: "Comment se connecter ? ", url: "#!" },
          {
            urlname: "Des idées de contenu à rajouter ? ",
            url: "#!",
          },
          {
            urlname: "Changer vos informations personnelles",
            url: "#!",
          },
        ],
      },
      {
        name: "Contact Us",
        tags: [
          { urlname: "114 - Rue Lucien Faure, 33000, Bordeaux" },
          { urlname: "06 12 34 56 78" },
          { urlname: "handiquizzfr@gmail.com" },
        ],
      },
    ],
  }),
};
</script>

<style>
@font-face {
  font-family: Mainfont;
  src: url(./assets/Poppins-Medium.ttf);
}
::-webkit-scrollbar {
  display: none;
}
* {
  font-family: Mainfont !important;
}

.fullWidth {
  max-width: 100vw !important;
}

.blured {
  background: rgba(184, 184, 184, 0.2) !important;
  box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1) !important;
  backdrop-filter: blur(5px) !important;
  -webkit-backdrop-filter: blur(4px) !important;
  border-radius: 10px !important;
  border: 1px solid rgba(255, 255, 255, 0.18) !important;

  /* background: rgba(255, 255, 255, 0.2) !important;
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37) !important;
    backdrop-filter: blur(6.5px) !important;
    -webkit-backdrop-filter: blur(6.5px) !important;
    border-radius: 20px !important;
    border: 1px solid rgba(255, 255, 255, 0.18) !important; */
}

.logo {
  font-weight: bolder;
  background-image: linear-gradient(
    349deg,
    #f0dbff,
    #d8c4f5,
    #add4f0,
    #9fcbf5,
    #7d8cff
  ) !important;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  -moz-background-clip: text;
  -moz-text-fill-color: transparent;
}

.random-background {
  background: linear-gradient(
    135deg,
    rgba(125, 140, 255, 1) 0%,
    rgba(159, 203, 245, 1) 25%,
    rgba(173, 212, 240, 1) 50%,
    rgba(240, 219, 255, 0.8063958859911152) 75%,
    rgba(216, 196, 245, 1) 100%
  ) !important;
}

.transparent,
.v-footer > *,
.login_form * {
  background: transparent !important;
  background-color: transparent !important;
}

@-webkit-keyframes AnimationName {
  0% {
    background-position: 0% 14%;
  }
  50% {
    background-position: 100% 87%;
  }
  100% {
    background-position: 0% 14%;
  }
}
@keyframes AnimationName {
  0% {
    background-position: 0% 14%;
  }
  50% {
    background-position: 100% 87%;
  }
  100% {
    background-position: 0% 14%;
  }
}
.custom-card-text,
.custom-card-text::after {
  border: transparent !important;
}
@media (min-width: 960px) {
  .custom-panel {
    flex: 0 0 100% !important;
    max-width: 100% !important;
    border-radius: 0 0 0 0 !important;
  }
}
@media (min-width: 961px) {
  .custom-panel {
    flex: 0 0 25% !important;
    max-width: 25% !important;
    border-radius: 0 0 0 0 !important;
  }
  .custom-panel:first-of-type {
    border-radius: 20px 0 0 20px !important;
  }
  .custom-panel:last-of-type {
    border-radius: 0 20px 20px 0 !important;
  }
}
</style>
