<template>
    <div>
      <v-card max>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="headline">Tabel Laporan Tahun</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-card-title>
          <v-text-field
            v-model="search"
            append-icon="mdi-magnify"
            label="Search"
            outlined
            hiddendetails
            style="margin-top: 30px"
          ></v-text-field>
          <v-spacer></v-spacer>
          <v-btn color="#00695C" dark @click="printData">Print</v-btn>
        </v-card-title>
        <!-- End Untuk bagian atas copy biar gk berantakan  -->
        <v-data-table
          id="printable"
          :headers="headers"
          :items="dataJadwal"
          :search="search"
        >
          <template v-slot:[`item.actions`]="{ item }">
            <!-- Dialog Confirm -->
            <v-dialog v-model="dialogConfirm" persistent max-width="420px">
              <v-card color="white">
                <v-card-title>
                  <span class="headline">Ingin Menghapus Jadwal ?</span>
                </v-card-title>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="green" text @click="dialogConfirm = false"> Cancel </v-btn>
                  <v-btn color="red darken-1" text @click="deleteData(item.id)"> Delete </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </template>
        </v-data-table>
        <canvas id="chart"></canvas>
      </v-card>
    </div>
  </template>
  
  <script>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { Chart} from 'chart.js';
//   import {CategoryScale} from 'chart.js'; 
//   Chart.register(CategoryScale);
  
  export default {
    data() {
      return {
        dialogConfirm2: false,
        dialogConfirm: false,
        color: '',
        search: '',
        headers: [
          { text: 'Bulan', value: 'nama_bulan' },
          { text: 'Aktivasi', value: 'total_pendapatan_aktivasi' },
          { text: 'Deposit', value: 'total_pendapatan_deposit' },
          { text: 'Total', value: 'total_pendapatan' }
        ],
        editId: '',
        deleteId: '',
        dataJadwal: ref([])
      };
    },
    methods: {
      printTable() {
        window.print();
      },
  
      printData() {
  // Membuka jendela baru untuk mencetak konten
  const printWindow = window.open('', '', 'width=800,height=600');
  printWindow.document.open();
  printWindow.document.write(`
    <html>
    <head>
        <style>
        @media print {
            /* Gaya untuk menyembunyikan elemen yang tidak perlu dicetak */
            #printable {
                visibility: visible;
            }
            /* Gaya khusus lainnya sesuai kebutuhan Anda */
        }
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        
        th {
            background-color: #f2f2f2;
        }
        </style>
    </head>
    <h1>Gofit</h1>
        <subtitle>Jl. Centralpark No. 10 Yogyakarta</subtitle>
    <body>
        <h1>Laporan Tahunan</h1>
        <h2>Bulan: Mei   Tahun: 2023</h2>
        <h3>Tanggal Cetak: 2023-05-29</h3>
        <table>
            <thead>
                <tr>
                    <th>Bulan</th>
                    <th>Aktivasi</th>
                    <th>Deposit</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                ${this.dataJadwal
                  .map(
                    row => `
                    <tr>
                        <td>${row.nama_bulan}</td>
                        <td>${row.total_pendapatan_aktivasi}</td>
                        <td>${row.total_pendapatan_deposit}</td>
                        <td>${row.total_pendapatan}</td>
                    </tr>
                `
                  )
                  .join('')}
            </tbody>
        </table>
        <img src="${this.getChartImage()}" />
    </body>
    </html>
  `);
  printWindow.document.close();

  // Tunggu beberapa saat sebelum mencetak untuk memastikan konten dimuat
  setTimeout(() => {
    printWindow.print();
    printWindow.close();
  }, 500);
},
getChartImage() {
  const canvas = document.getElementById('chart');
  const dataURL = canvas.toDataURL(); // Mengambil citra dari elemen canvas
  return dataURL;
},
      async getDataTahunan() {
        const url = 'http://127.0.0.1:8000/api/laporanpendapatantahunan';
        const request = await axios.get(url);
        console.log(request.data.data);
        this.dataJadwal = request.data.data;
        // this.calculateTotalM ember();
        this.renderChart();
      },
      editHandler(item) {
        // this.dialogConfirm = true;
        console.log('Gagal');
        console.log(item);
        this.$router.push({ name: 'Mo-Jadwal-UmumViewEdit', query: item });
      },
  
      deleteHandler(id) {
        this.deleteId = id;
        this.dialogConfirm = true;
      },
      deleteData(id) {
        console.log(id);
        axios
          .delete(`http://127.0.0.1:8000/api/jadwal_umum/${id}`)
          .then(response => {
            this.error_message = response.data.message;
            this.color = 'green';
            this.dialogConfirm = false;
            this.snackbar = true;
            // this.load = false;
            // this.close();
            this.getDataTahunan();
            // this.type = "Tambah";
          })
          .catch(error => {
            this.error_message = error.response.data.message;
            this.color = 'red';
            // this.snackbar = true;
            // this.load = false;
          });
      },
      renderChart() {
    const ctx = document.getElementById('chart').getContext('2d');
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: this.dataJadwal.map(row => row.nama_bulan),
        datasets: [
          {
            label: 'Aktivasi',
            data: this.dataJadwal.map(row => row.total_pendapatan_aktivasi),
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
          },
          {
            label: 'Deposit',
            data: this.dataJadwal.map(row => row.total_pendapatan_deposit),
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1
          },
          {
            label: 'Total',
            data: this.dataJadwal.map(row => row.total_pendapatan),
            backgroundColor: 'rgba(255, 159, 64, 0.2)',
            borderColor: 'rgba(255, 159, 64, 1)',
            borderWidth: 1
          }
        ]
      },
      options: {
        responsive: true,
        scales: {
          x: {
            display: true,
            grid: {
              display: false
            }
          },
          y: {
            display: true,
            beginAtZero: true
          }
        }
      }
    });
  },
  
  renderChart() {
  const ctx = document.getElementById('chart').getContext('2d');
  if (this.chart) {
    this.chart.destroy();
  }
  this.chart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: this.dataJadwal.map(row => row.nama_bulan),
      datasets: [
        {
          label: 'Aktivasi',
          data: this.dataJadwal.map(row => row.total_pendapatan_aktivasi),
          backgroundColor: 'rgba(75, 192, 192, 0.2)',
          borderColor: 'rgba(75, 192, 192, 1)',
          borderWidth: 1
        },
        {
          label: 'Deposit',
          data: this.dataJadwal.map(row => row.total_pendapatan_deposit),
          backgroundColor: 'rgba(153, 102, 255, 0.2)',
          borderColor: 'rgba(153, 102, 255, 1)',
          borderWidth: 1
        },
        {
          label: 'Total',
          data: this.dataJadwal.map(row => row.total_pendapatan),
          backgroundColor: 'rgba(255, 159, 64, 0.2)',
          borderColor: 'rgba(255, 159, 64, 1)',
          borderWidth: 1
        }
      ]
    },
    options: {
      responsive: true,
      scales: {
        x: {
        // type: 'category-axis', // Menggunakan skala "category-axis" untuk sumbu x
          grid: {
            display: false
          }
        },
        y: {
          beginAtZero: true
        }
      }
    }
  });
},
    },
    mounted() {
      this.getDataTahunan();
    }
  };
  </script>
  
  <style>
  @media print {
    body > *:not(#printable) {
      display: none;
    }
  }
  /* Show only the data table when printing */
  </style>  