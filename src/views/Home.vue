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
          <h1 style="mix-blend-mode: difference">Bienvenue sur HandiQuizz !</h1>
          <p>Apprenez les faiblesses des handicapés :)</p>
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
  name: "Home",
};
</script>

<style scoped>
.fullWidth {
  max-width: 100vw !important;
}
</style>
