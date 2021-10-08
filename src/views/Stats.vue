<template>
  <v-container class="fullWidth">
    <v-row>
      <v-col cols="12" sm="2"> </v-col>

      <v-col cols="12" sm="8">
        <v-sheet min-height="70vh" rounded="lg" class="blured">
          <v-container>
            <gmap-map
              :center="center"
              :zoom="6"
              style="width: 100%; height: 600px"
            >
              <gmap-marker
                v-for="m in markers"
                :key="m.text"
                :position="{ lat: m.position[0], lng: m.position[1] }"
                :clickable="true"
                :draggable="true"
                @click="center = m.position"
                @mouseover="statusText = m.text"
                @mouseout="statusText = null"
              ></gmap-marker>

              <div slot="visible">
                <div
                  style="
                    bottom: 0;
                    left: 0;
                    background-color: #0000ff;
                    color: white;
                    position: absolute;
                    z-index: 100;
                  "
                >
                  {{ statusText }}
                </div>
              </div>
            </gmap-map>
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
    <v-row>
      <v-col cols="12" sm="2"> </v-col>

      <v-col cols="12" sm="8">
        <v-sheet min-height="70vh" rounded="lg" class="blured">
          <v-container>
            <v-data-table
              :headers="headers"
              :items="desserts"
              item-key="name"
              class="elevation-1"
              :search="search"
              :custom-filter="filterOnlyCapsText"
            >
              <template v-slot:top>
                <v-text-field
                  v-model="search"
                  label="Search (UPPER CASE ONLY)"
                  class="mx-4"
                ></v-text-field>
              </template>
              <template v-slot:body.append>
                <tr>
                  <td></td>
                  <td>
                    <v-text-field
                      v-model="calories"
                      type="number"
                      label="Less than"
                    ></v-text-field>
                  </td>
                  <td colspan="4"></td>
                </tr>
              </template>
            </v-data-table>
          </v-container>
        </v-sheet>
      </v-col>

      <v-col cols="12" sm="2"> </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { gmapApi } from "vue2-google-maps";

export default {
  computed: {
    google: gmapApi,
    headers() {
      return [
        {
          text: "Dessert (100g serving)",
          align: "start",
          sortable: false,
          value: "name",
        },
        {
          text: "Calories",
          value: "calories",
          filter: (value) => {
            if (!this.calories) return true;

            return value < parseInt(this.calories);
          },
        },
        { text: "Fat (g)", value: "fat" },
        { text: "Carbs (g)", value: "carbs" },
        { text: "Protein (g)", value: "protein" },
        { text: "Iron (%)", value: "iron" },
      ];
    },
  },
  methods: {
    filterOnlyCapsText(value, search) {
      return (
        value != null &&
        search != null &&
        typeof value === "string" &&
        value.toString().toLocaleUpperCase().indexOf(search) !== -1
      );
    },
  },
  data: () => ({
    center: { lat: 47.376332, lng: 2 },
    statusText: "",
    search: "",
    calories: "",
    desserts: [
      {
        name: "Frozen Yogurt",
        calories: 159,
        fat: 6.0,
        carbs: 24,
        protein: 4.0,
        iron: "1%",
      },
      {
        name: "Ice cream sandwich",
        calories: 237,
        fat: 9.0,
        carbs: 37,
        protein: 4.3,
        iron: "1%",
      },
      {
        name: "Eclair",
        calories: 262,
        fat: 16.0,
        carbs: 23,
        protein: 6.0,
        iron: "7%",
      },
      {
        name: "Cupcake",
        calories: 305,
        fat: 3.7,
        carbs: 67,
        protein: 4.3,
        iron: "8%",
      },
      {
        name: "Gingerbread",
        calories: 356,
        fat: 16.0,
        carbs: 49,
        protein: 3.9,
        iron: "16%",
      },
      {
        name: "Jelly bean",
        calories: 375,
        fat: 0.0,
        carbs: 94,
        protein: 0.0,
        iron: "0%",
      },
      {
        name: "Lollipop",
        calories: 392,
        fat: 0.2,
        carbs: 98,
        protein: 0,
        iron: "2%",
      },
      {
        name: "Honeycomb",
        calories: 408,
        fat: 3.2,
        carbs: 87,
        protein: 6.5,
        iron: "45%",
      },
      {
        name: "Donut",
        calories: 452,
        fat: 25.0,
        carbs: 51,
        protein: 4.9,
        iron: "22%",
      },
      {
        name: "KitKat",
        calories: 518,
        fat: 26.0,
        carbs: 65,
        protein: 7,
        iron: "6%",
      },
    ],
    markers: [
      {
        position: [48.864716, 2.349014],
        text: "Paris",
      },
      {
        position: [44.836151, -0.580816],
        text: "Bordeaux",
      },
      {
        position: [43.6045, 1.444],
        text: "Toulouse",
      },
      {
        position: [45.76342, 4.834277],
        text: "Lyon",
      },
      {
        position: [48.1147, -1.6794],
        text: "Rennes",
      },
    ],
  }),
};
</script>
