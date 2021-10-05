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
            class="blured"
        >
            <v-sheet class="pa-4" dark>
                                <v-btn-toggle rounded>
                    <!-- <v-btn icon>
          <v-icon>mdi-magnify</v-icon>
        </v-btn> -->

                    <v-dialog
                        transition="dialog-top-transition"
                        v-model="login.dialog"
                        absolute
                        max-width="600px"
                        min-width="360px"
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
                            <v-btn
                                @click="logoutFunction"
                                v-else
                                rounded
                                elevation="6"
                            >
                                <v-icon left dark>mdi-account-off</v-icon>
                                Logout
                            </v-btn>
                        </template>

                        <v-card>
                            <div>
                                <v-tabs
                                    v-model="login.tab"
                                    show-arrows
                                    background-color="deep-purple accent-4"
                                    icons-and-text
                                    dark
                                    grow
                                >
                                    <v-tabs-slider
                                        color="purple darken-4"
                                    ></v-tabs-slider>
                                    <v-tab
                                        v-for="formtab in login.formtabs"
                                        :key="formtab.name"
                                    >
                                        <v-icon large>{{
                                            formtab.icon
                                        }}</v-icon>
                                        <div class="caption py-1">
                                            {{ formtab.name }}
                                        </div>
                                    </v-tab>
                                    <v-tab-item>
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
                                                                v-model="
                                                                    login.loginEmail
                                                                "
                                                                :rules="
                                                                    login.loginEmailRules
                                                                "
                                                                label="E-mail"
                                                                required
                                                            ></v-text-field>
                                                        </v-col>
                                                        <v-col cols="12">
                                                            <v-text-field
                                                                v-model="
                                                                    login.loginPassword
                                                                "
                                                                :append-icon="
                                                                    login.show1
                                                                        ? 'eye'
                                                                        : 'eye-off'
                                                                "
                                                                :rules="[
                                                                    login.rules
                                                                        .required,
                                                                    login.rules
                                                                        .min,
                                                                ]"
                                                                :type="
                                                                    login.show1
                                                                        ? 'text'
                                                                        : 'password'
                                                                "
                                                                name="input-10-1"
                                                                label="Password"
                                                                hint="At least 8 characters"
                                                                counter
                                                                @click:append="
                                                                    login.show1 = !login.show1
                                                                "
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
                                                                :loading="
                                                                    loading
                                                                "
                                                                x-large
                                                                block
                                                                :disabled="
                                                                    !login.valid
                                                                "
                                                                color="success"
                                                                @click="
                                                                    validateLogin
                                                                "
                                                            >
                                                                Login
                                                                <template
                                                                    v-slot:loader
                                                                    color="orange"
                                                                >
                                                                    <span
                                                                        >Loading...</span
                                                                    >
                                                                </template>
                                                            </v-btn>
                                                        </v-col>
                                                    </v-row>
                                                </v-form>
                                            </v-card-text>
                                        </v-card>
                                    </v-tab-item>
                                    <v-tab-item>
                                        <v-card class="px-4">
                                            <v-card-text>
                                                <v-form
                                                    ref="registerForm"
                                                    v-model="login.valid"
                                                    lazy-validation
                                                >
                                                    <v-row>
                                                        <v-col
                                                            cols="12"
                                                            sm="6"
                                                            md="6"
                                                        >
                                                            <v-text-field
                                                                v-model="
                                                                    login.firstName
                                                                "
                                                                :rules="[
                                                                    login.rules
                                                                        .required,
                                                                ]"
                                                                label="First Name"
                                                                maxlength="20"
                                                                required
                                                            ></v-text-field>
                                                        </v-col>
                                                        <v-col
                                                            cols="12"
                                                            sm="6"
                                                            md="6"
                                                        >
                                                            <v-text-field
                                                                v-model="
                                                                    login.lastName
                                                                "
                                                                :rules="[
                                                                    login.rules
                                                                        .required,
                                                                ]"
                                                                label="Last Name"
                                                                maxlength="20"
                                                                required
                                                            ></v-text-field>
                                                        </v-col>
                                                        <v-col cols="12">
                                                            <v-text-field
                                                                v-model="
                                                                    login.email
                                                                "
                                                                :rules="
                                                                    login.emailRules
                                                                "
                                                                label="E-mail"
                                                                required
                                                            ></v-text-field>
                                                        </v-col>
                                                        <v-col cols="12">
                                                            <v-text-field
                                                                v-model="
                                                                    login.password
                                                                "
                                                                :append-icon="
                                                                    login.show1
                                                                        ? 'mdi-eye'
                                                                        : 'mdi-eye-off'
                                                                "
                                                                :rules="[
                                                                    login.rules
                                                                        .required,
                                                                    login.rules
                                                                        .min,
                                                                ]"
                                                                :type="
                                                                    login.show1
                                                                        ? 'text'
                                                                        : 'password'
                                                                "
                                                                name="input-10-1"
                                                                label="Password"
                                                                hint="At least 8 characters"
                                                                counter
                                                                @click:append="
                                                                    login.show1 = !login.show1
                                                                "
                                                            ></v-text-field>
                                                        </v-col>
                                                        <v-col cols="12">
                                                            <v-text-field
                                                                block
                                                                v-model="
                                                                    login.verify
                                                                "
                                                                :append-icon="
                                                                    login.show1
                                                                        ? 'mdi-eye'
                                                                        : 'mdi-eye-off'
                                                                "
                                                                :rules="[
                                                                    login.rules
                                                                        .required,
                                                                    passwordMatch,
                                                                ]"
                                                                :type="
                                                                    login.show1
                                                                        ? 'text'
                                                                        : 'password'
                                                                "
                                                                name="input-10-1"
                                                                label="Confirm Password"
                                                                counter
                                                                @click:append="
                                                                    login.show1 = !login.show1
                                                                "
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
                                                                :loading="
                                                                    loading
                                                                "
                                                                x-large
                                                                block
                                                                :disabled="
                                                                    !login.valid
                                                                "
                                                                color="success"
                                                                @click="
                                                                    validateRegister
                                                                "
                                                            >
                                                                Register
                                                                <template
                                                                    v-slot:loader
                                                                >
                                                                    <span
                                                                        >Loading...</span
                                                                    >
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
                        {{ this.$session.get("firstName") }}
                    </v-btn>
                </v-btn-toggle>
                <v-avatar
                    class="mb-4"
                    color="grey darken-1"
                    size="64"
                ></v-avatar>

                <div dark>plop@plop.com</div>
            </v-sheet>

            <v-divider></v-divider>

            <v-list>
                <v-list-item
                    v-for="[icon, text] in drawer_links"
                    :key="icon"
                    link
                >
                    <v-list-item-icon>
                        <v-icon>{{ icon }}</v-icon>
                    </v-list-item-icon>

                    <v-list-item-content>
                        <v-list-item-title>{{ text }}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
        </v-navigation-drawer>

        <!-- <v-app-bar
            /app
            :src="require('./assets/background1.gif')"
            color="rgba(255, 255, 255, 0.3)"
            dark
        > -->
        <v-app-bar color="rgba(255, 255, 255, 0.3)"
            dark >
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
                            <v-icon class="white--text" size="24px">{{
                                social.icon
                            }}</v-icon>
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
                            class="
                                custom-card-text
                                col-md-3 col-12
                                custom-panel
                                blured
                            "
                        >
                            <h3 class="d-none d-md-block py-2 white--text">
                                {{ item.name }}
                            </h3>
                            <v-expansion-panel-header
                                class="d-md-none white--text"
                            >
                                {{ item.name }}
                                <template v-slot:actions>
                                    <v-icon color="white">$expand</v-icon>
                                </template>
                            </v-expansion-panel-header>
                            <v-expansion-panel-content>
                                <li v-for="tag in item.tags" :key="tag.urlname">
                                    <a
                                        v-bind:href="tag.url"
                                        class="white--text d-md-flex"
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
                this.login.verify === this.login.password ||
                "Password must match";
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

        loginFunction(request) {
            axios
                .get(
                    "http://localhost/dashboard/stuwarden/public/ajaxrequest.php",
                    {
                        params: {
                            requestType: request,
                            firstName: this.login.firstName,
                            lastName: this.login.lastName,
                            email: this.login.email,
                            password: this.login.password,
                            loginEmail: this.login.loginEmail,
                            loginPassword: this.login.loginPassword,
                        },
                    }
                )
                .then((response) => {
                    this.users = response.data;
                    console.log(this.users[0]);
                    if (this.users[0]) {
                        this.$session.set("firstName", this.users[0].firstName);
                        this.$session.set("lastName", this.users[0].lastName);
                        this.$session.set("email", this.users[0].email);
                        this.$session.set("spaceSize", 2147483648);
                        this.buildJson();
                    } else {
                        alert("Invalid User or Password! \nTry again please");
                    }
                })
                .catch((error) => {
                    console.log(error);
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
            // console.log(item.tabName);
            // console.log("email : ", this.$session.exists('email'));
            // console.log("blocked : ", !item.blocked);
            // console.log(!(this.$session.exists('email') || !item.blocked));
            return !(this.islogged() || item.allowed);
        },
        islogged() {
            return this.$session.exists("email");
        },
    },
    watch: {
        loader() {
            const l = this.loader;
            this[l] = !this[l];

            setTimeout(() => (this[l] = false), 6000);

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
        this.onResize();
        window.addEventListener("resize", this.onResize, { passive: true });
    },

    // methods: {
    //     onResize() {
    //         let x = window.innerWidth;
    //         if (x <= 961) {
    //             this.panel = [];
    //         } else {
    //             this.panel = [0, 1, 2, 3];
    //         }
    //     },
    // },

    data: () => ({
        loading: false,
        loader: null,
        userid: null,
        login: {
            dialog: false,
            tab: 0,
            formtabs: [
                { name: "Login", icon: "mdi-account" },
                { name: "Register", icon: "mdi-account-outline" },
            ],
            valid: true,

            firstName: "",
            lastName: "",
            email: "",
            password: "",
            verify: "",
            loginPassword: "",
            loginEmail: "",
            loginEmailRules: [
                (v) => !!v || "Required",
                (v) => /.+@.+\..+/.test(v) || "E-mail must be valid",
            ],
            emailRules: [
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
            ["mdi-home", "Accueil"],
            ["mdi-account", "Profile"],
            ["mdi-progress-question", "Quizz"],
            ["mdi-chart-bar-stacked", "Statistiques"],
            ["mdi-shield-key-outline", "Admin"],
            ["mdi-account-off", "Déconnexion"],
        ],
        panel: [0, 1, 2, 3],
        socials: [
            { name: "facebook", icon: "mdi-facebook", url: "#" },
            { name: "twitter", icon: "mdi-twitter", url: "#" },
            { name: "google", icon: "mdi-google", url: "#" },
            { name: "linkedin", icon: "mdi-linkedin", url: "#" },
            { name: "instagram", icon: "mdi-instagram", url: "#" },
        ],
        footeritems: [
            {
                name: "Product",
                tags: [
                    {
                        urlname: "Create Websites",
                        url: "#!",
                    },
                    {
                        urlname: "Secure Cloud Hosting",
                        url: "#!",
                    },
                    {
                        urlname: "Engage Your Audience",
                        url: "#!",
                    },
                    {
                        urlname: "Website Support",
                        url: "#!",
                    },
                ],
            },
            {
                name: "Company",
                tags: [
                    { urlname: "About", url: "#!" },
                    { urlname: "Careers", url: "#!" },
                    { urlname: "Support", url: "#!" },
                    { urlname: "Pricing", url: "#!" },
                    { urlname: "FAQ", url: "#!" },
                ],
            },
            {
                name: "Resources",
                tags: [
                    { urlname: "Blog", url: "#!" },
                    { urlname: "eBooks", url: "#!" },
                    { urlname: "Whitepapers", url: "#!" },
                    { urlname: "Comparison Guide", url: "#!" },
                    { urlname: "Website Grader", url: "#!" },
                ],
            },
            {
                name: "Get Help",
                tags: [
                    { urlname: "Help Center", url: "#!" },
                    { urlname: "Contact Us", url: "#!" },
                    { urlname: "Privacy Policy", url: "#!" },
                    { urlname: "Terms", url: "#!" },
                    { urlname: "Login", url: "#!" },
                ],
            },
        ],
    }),
};
</script>

<style>
@font-face {
    font-family: Mainfont;
    src: url(./assets/VarelaRound-Regular.ttf);
}
::-webkit-scrollbar {
    display: none;
}
* {
    font-family: Mainfont !important;
}

.blured {
    background: rgba(255, 255, 255, 0.25) !important;
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37) !important;
    backdrop-filter: blur(4px) !important;
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
        349deg,
        #f0dbff,
        #d8c4f5,
        #add4f0,
        #9fcbf5,
        #7d8cff
    ) !important;
    background-size: 1000% 1000%;

    -webkit-animation: AnimationName 10s ease infinite;
    animation: AnimationName 10s ease infinite;
}

.transparent,
.v-footer > * {
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
