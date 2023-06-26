<!-- <template>
  
  <v-data-table
    :headers="headers"
    :items="izins"
    sort-by="calories"
    class="elevation-1"
  >
    <template v-slot:top>
      <v-toolbar
        flat
      >
        <v-toolbar-title><strong>Data Perizinan</strong> </v-toolbar-title>
        <v-divider
          class="mx-4"
          inset
          vertical
        ></v-divider>
        <v-spacer></v-spacer>
        

        <v-dialog v-model="dialogDelete" max-width="500px">
          <v-card>
            <v-card-title class="text-h5">Are you sure you want to delete this item?</v-card-title>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="blue darken-1" text @click="closeDelete">Cancel</v-btn>
              <v-btn color="blue darken-1" text @click="deleteItemConfirm">OK</v-btn>
              <v-spacer></v-spacer>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-toolbar>
    </template>
    <template v-slot:[`item.actions`]="{ item }">
      
      <v-dialog
          v-model="dialog"
          max-width="500px"
        >
          <v-card>
            <v-card-title>
              <span class="text-h5">Verifiksi Data</span>
            </v-card-title>

            <v-card-text>
              <v-container>
                <v-row>
                  <v-col
                    cols="12"
                    sm="6"
                    md="6"
                  >
                    <v-select
                      :items="dataInstruktur"
                      label="Pilih Instruktur"
                      outlined
                      item-text="username"
                      item-value="username"
                      v-model="value"
                    ></v-select>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-text>

            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="blue darken-1"
                text
                @click="close"
              >
                Cancel
              </v-btn>
              <v-btn
                color="blue darken-1"
                text
                @click="verifIzin(item)"
              >
                Save
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
        
      <div v-if=item.is_accepted>  
        <v-btn small color="primary" class="mr-2"  disabled elevation="2" @click="">Sudah Terkonfirmasi</v-btn>
      </div>
      <div v-else>  
        <v-btn small color="primary" class="mr-2" dark @click="dialog=true">Verif</v-btn>
      </div>
      
      <v-snackbar
      v-model="snackbar"
    >
      {{ error_message }}
    </v-snackbar>
    </template>
  </v-data-table>
</template>

<script>
  export default {
    //define seluruh prop data yang akan digunakan sebagai penampung dari response konsum API ataupun 
    //yang akan digunakan didalam template
    data: () => ({
      dialog: false,
      dialogDelete: false,
      error_message: '',
      snackbar: false,
      value: null,
      headers: [
        { text: 'ID Jadwal', value: 'jadwalID', align: 'start',  sortable: false,},
        { text: 'Nama Instrukur', value: 'instruktur' },
        { text: 'Status', value: 'is_accepted' },
        { text: 'Sesi', value: 'sesi' },
        { text: 'Tanggal Izin', value: 'tanggal_izin' },
        { text: 'Actions', value: 'actions', sortable: false },
      ],
      dataInstruktur: [],
      izins: [],
      editedIndex: -1,
      editedItem: {
        jadwalID: '',
        instruktur: '',
        penggantiInstruktur: '',
        is_accepted: null,
        sesi: '',
        tanggal_izin: '',
      },
      defaultItem: {
        jadwalID: '',
        instruktur: '',
        penggantiInstruktur: '',
        is_accepted: null,
        sesi: '',
        tanggal_izin: '',
      },
    }),

    watch: {
      dialog (val) {
        val || this.close()
      },
      dialogDelete (val) {
        val || this.closeDelete()
      },
    },

    //loop agar data terus dibaca dan ditarik dari database melalui konsum API
    created () {
      this.readData();
      this.readPegawai();
    },

    methods: {
      //membaca data lewat konsum API dan menampungnya dalam array izins
      readData() {
        var url = this.$api + '/izin';
        this.$http.get(url, {
            headers: {
                'Authorization' : 'Bearer ' + localStorage.getItem('token')
            }
        }).then(response => {
            this.izins = response.data.data;
        })
      },

      //memanggil data seluruh instruktur dan menampungnya dalam array dataInstruktur
      //akan digunakan dalam dropdown select pada form verifikasi
      readPegawai() {
        var url = this.$api + '/showInstruktur';
        this.$http.get(url, {
            headers: {
                'Authorization' : 'Bearer ' + localStorage.getItem('token')
            }
        }).then(response => {
            this.dataInstruktur = response.data.data;
        })
      },

      //memverifikasi izin dari instruktur dan melakukan penggantian instruktur pada jadwal yang sudah ditentukan
      verifIzin(item) {
        this.editedIndex = this.izins.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.editedItem.penggantiInstruktur = this.value

        var indeks = this.editedIndex + 1;
        var url = this.$api + '/verifIzin/' + this.editedItem.instruktur;
        this.$http.put(url, this.editedItem,{
            headers: {
                'Authorization' : 'Bearer ' + localStorage.getItem('token')
            }
        }).then(response => {
              this.error_message = response.data.message;
              this.color = "green";
              this.snackbar = true;
              this.dialog = false;
              this.readData();
          }).catch(error => {
              this.error_message = error.response.data.message;
              this.color = "red";
          });
      },

      //menampung data yang dipilih dalam tabel pada variabel editedItem. Menampung indeks data pada variabel editedIndex
      //memunculkan form verifikasi
      editItem (item) {
        this.editedIndex = this.izins.indexOf(item)
        this.editedItem = Object.assign({}, item)
        this.dialog = true
      },

      //menutup semua form dan membuat nilai editedIndex atau editedItem menjadi kosong kembali
      //agar dapat digunakan pada data yang akan dipilih selanjutnya
      close () {
        this.dialog = false
        this.$nextTick(() => {
          this.editedItem = Object.assign({}, this.defaultItem)
          this.editedIndex = -1
        })
      },
    },
  }
</script> -->