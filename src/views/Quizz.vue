<template>
  <v-container class="fullWidth">
    <v-row>
      <v-col cols="12" sm="2"> </v-col>

      <v-col cols="12" sm="8">
        <v-sheet min-height="70vh" rounded="lg" class="blured">
          <v-container v-if="!quizz.noData && !quizz.ended">
            <v-stepper vertical v-model="e1">
              <template v-for="n in steps">
                <v-stepper-step :key="`${n}-step`" :complete="e1 > n" :step="n">
                  {{ quizz.list_questions[n - 1].libelle }}
                </v-stepper-step>
                <v-stepper-content :key="`${n}-content`" :step="n">
                  <v-item-group active-class="primary">
                    <v-container>
                      <v-row>
                        <v-col v-for="m in 4" :key="m" cols="12" md="6">
                          <v-item v-slot="{ active, toggle }">
                            <v-card
                              class="d-flex align-center"
                              height="200"
                              @click="
                                toggle,
                                  selected(
                                    quizz.list_reponses[4 * (n - 1) + m - 1]
                                  )
                              "
                            >
                              <v-scroll-y-transition>
                                <div
                                  v-if="active"
                                  light
                                  class="
                                    text-h2
                                    flex-grow-1
                                    text-center text--black
                                  "
                                >
                                  {{
                                    quizz.list_reponses[4 * (n - 1) + m - 1]
                                      .libelle
                                  }}
                                </div>
                                <div
                                  v-else
                                  light
                                  class="
                                    text-h2
                                    flex-grow-1
                                    text-center text--black
                                  "
                                >
                                  {{
                                    quizz.list_reponses[4 * (n - 1) + m - 1]
                                      .libelle
                                  }}
                                </div>
                              </v-scroll-y-transition>
                            </v-card>
                          </v-item>
                        </v-col>
                      </v-row>
                    </v-container>
                  </v-item-group>

                  <v-btn color="primary" @click="nextStep(n)"> Continue </v-btn>
                </v-stepper-content>
              </template>
            </v-stepper>
          </v-container>
          <v-container v-else>
            <v-row align="center" justify="center">
              <h2 v-if="this.quizz.score != null">
                Votre Scrore est de {{ this.quizz.score }} / {{ this.steps }}
              </h2>
            </v-row>
            <v-row align="center" justify="center">
              <v-col cols="auto">
                <v-btn
                  shaped
                  x-large
                  @click="getQuizz()"
                  class="text-center text--black blured mx-auto"
                >
                  New Quizz
                </v-btn>
              </v-col>
            </v-row>
          </v-container>
        </v-sheet>
      </v-col>

      <v-col cols="12" sm="2">
        <v-sheet rounded="lg" min-height="268" class="blured">
          <h2>Le Saviez-vous ?</h2>
          <p>Un handicapé en fauteuil ne peut pas vous courrir après.</p>
        </v-sheet>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
export default {
  data: () => ({
    e1: 1,
    steps: 10,
    quizz: {
      list_questions: "",
      noData: true,
      list_reponses: "",
      user_temp_reponse: "",
      user_reponses: [],
      score: null,
      ended: false,
    },
  }),

  watch: {
    steps(val) {
      if (this.e1 > val) {
        this.e1 = val;
      }
    },
  },

  methods: {
    nextStep(n) {
      if (n === this.steps) {
        for (var i in this.quizz.user_reponses) {
          this.quizz.score += parseInt(this.quizz.user_reponses[i].resultat);
        }
        this.quizz.ended = true;
        console.log(this.quizz.score);
      } else {
        if (this.quizz.user_temp_reponse != "") {
          this.quizz.user_reponses.push(this.quizz.user_temp_reponse);
          this.e1 = n + 1;
          this.quizz.user_temp_reponse = "";
        }
      }
    },
    selected(rep) {
      this.quizz.user_temp_reponse = rep;
    },
    getQuizz() {
      this.quizz.user_reponses = [];
      this.quizz.score = 0;
      this.e1 = 1;
      this.quizz.ended = false;
      axios
        .get(
          "http://localhost/dashboard/ProjetHDD/handiquizz/public/getquizz.php"
        )
        .then((response) => {
          if (response.data.length > 0) {
            this.quizz.list_questions = response.data[0];
            this.quizz.list_reponses = response.data[1];
          } else {
            this.quizz.list_questions = "";
            this.quizz.list_reponses = "";
            this.quizz.noData = true;
          }
        })
        .catch((error) => {
          console.log(error);
        })
        .finally(() => {
          this.quizz.noData = false;
        });
    },
  },
  mounted() {
    // axios
    //   .get(
    //     "http://localhost/dashboard/ProjetHDD/handiquizz/public/getquizz.php"
    //   )
    //   .then((response) => {
    //     if (response.data.length > 0) {
    //       this.quizz.list_questions = response.data[0];
    //       this.quizz.list_reponses = response.data[1];
    //     } else {
    //       this.quizz.list_questions = "";
    //       this.quizz.list_reponses = "";
    //       this.quizz.noData = true;
    //     }
    //   })
    //   .catch((error) => {
    //     console.log(error);
    //   })
    //   .finally(() => {
    //     console.log(this.quizz.list_questions);
    //     console.log(this.quizz.list_reponses);
    //     this.quizz.noData = false;
    //   });
  },
};
</script>
