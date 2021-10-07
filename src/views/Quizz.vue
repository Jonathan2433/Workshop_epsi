<template>
  <v-container class="fullWidth">
    <v-row>
      <v-col cols="12" sm="2">
        <v-sheet rounded="lg" min-height="268" class="blured">
          <!--  -->
        </v-sheet>
      </v-col>

      <v-col cols="12" sm="8">
        <v-sheet min-height="70vh" rounded="lg" class="blured">
          <v-stepper
    v-model="e6"
    vertical
  >
    <v-stepper-step
      :complete="e6 > 1"
      step="1"
    >
      Select an app
      <small>Summarize if needed</small>
    </v-stepper-step>
    <v-stepper-content step="1">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 2"
      >
        Continue
      </v-btn>
    </v-stepper-content>

    <v-stepper-step
      :complete="e6 > 2"
      step="2"
    >
      Configure analytics for this app
    </v-stepper-step>
    <v-stepper-content step="2">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 3"
      >
        Continue
      </v-btn>
    </v-stepper-content>

    <v-stepper-step
      :complete="e6 > 3"
      step="3"
    >
      Select an ad format and name ad unit
    </v-stepper-step>
    <v-stepper-content step="3">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 4"
      >
        Continue
      </v-btn>
    </v-stepper-content>

    <v-stepper-step step="4">
      View setup instructions
    </v-stepper-step>
    <v-stepper-content step="4">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 5"
      >
        Continue
      </v-btn>
    </v-stepper-content>

    <v-stepper-step step="5">
      View setup instructions
    </v-stepper-step>
    <v-stepper-content step="5">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 6"
      >
        Continue
      </v-btn>
    </v-stepper-content>

    <v-stepper-step step="6">
      View setup instructions
    </v-stepper-step>
    <v-stepper-content step="6">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 7"
      >
        Continue
      </v-btn>
    </v-stepper-content>

    <v-stepper-step step="8">
      View setup instructions
    </v-stepper-step>
    <v-stepper-content step="8">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 9"
      >
        Continue
      </v-btn>
    </v-stepper-content>

    <v-stepper-step step="9">
      View setup instructions
    </v-stepper-step>
    <v-stepper-content step="9">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 10"
      >
        Continue
      </v-btn>
    </v-stepper-content>
    
    <v-stepper-step step="10">
      View setup instructions
    </v-stepper-step>
    <v-stepper-content step="10">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 1"
      >
        Continue
      </v-btn>
    </v-stepper-content>
  </v-stepper>
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
  export default {
    data () {
      return {
        e6: 1,
      }
    },
  }
</script>