<template>
  <v-container class="fullWidth">
    <v-row>
      <v-col cols="12" sm="2"> </v-col>

      <v-col cols="12" sm="8">
        <v-sheet min-height="70vh" rounded="lg" class="blured">
          <v-container>
            <h1>Bienvenue sur HandiQuizz !</h1>
            <h2>Prévention du handicap</h2>
            <p>
              Le champ de la prévention des handicaps est vaste, et certains
              domaines de recherche peu explorés – notamment sur la
              compréhension des maladies invalidantes, leur dépistage, les
              facteurs de risque et ceux d’amélioration du pronostic – donnent
              des raisons d’espérer prévenir ou guérir. Le bénéfice du dépistage
              et des interventions précoces est souligné, par exemple, chez les
              adolescents en souffrance psychique ou à conduite suicidaire, avec
              de nouveaux programmes de recherche, la formation des étudiants
              aux premiers secours en santé mentale, l’expérimentation du
              dispositif "Écout’ émoi" (qui permet le repérage et la prise en
              charge de consultations avec un psychologue libéral)
            </p>
            <h2>Protéger ses oreilles</h2>
            <p>
              Les jeunes, étant sujets à des comportements à risque, constituent
              une cible privilégiée des actions de prévention. Ainsi, dans le
              cadre du plan Priorité prévention, lancé en mars 2018 par le
              Comité interministériel pour la santé, ils sont l’objet de
              plusieurs mesures concernant les conduites addictives (tabac,
              alcool, drogues), l’obésité, la souffrance psychique, les risques
              auditifs…, qui peuvent entraîner des handicaps en l’absence
              d’intervention précoce.
            </p>
          </v-container>
        </v-sheet>
      </v-col>

      <v-col cols="12" sm="2">
        <v-sheet rounded="lg" min-height="268" class="blured">
          <v-container>
            <h2>Le Saviez-vous ?</h2>
            <p>Un handicapé en fauteuil ne peut pas vous courrir après.</p>
          </v-container>
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
