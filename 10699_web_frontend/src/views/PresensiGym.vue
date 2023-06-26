<template>
    <v-main class="list">
        <v-card>
            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="headline">Presensi Gym</v-list-item-title>
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
                <!-- Ga guna anjg -->
                <!-- <v-btn color="success" dark @click="openDialog('tambah')"> Tambah </v-btn> -->
            </v-card-title>
        </v-card>
        <v-card>
            <v-data-table :key="kunciSurga" :headers="headers" :items="DataAllBookingGym" :search="search">
                <template v-slot:[`item.actions`]="{ item }">
                    <v-btn class="mx-1" dark small color="blue" @click="openpresensiMemberGymDialog(item)">Presensi</v-btn>
                    <v-btn v-if ="item.kehadiran_gym == 'hadir'" class="mx-2" dark small color="black" @click="dialogStruk = true">cetakstruk</v-btn>
                    <v-row justify="center">
            <v-dialog
            v-model="dialogDelete"
            persistent
            width="auto"
            >
        <v-card>
            <v-card-title class="text-h5">
            Yakin Ingin Melakukan Konfirmasi Kehadiran Bro ?
            </v-card-title>
            <!-- <v-card-text></v-card-text> -->
            <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
                color="green-darken-1"
                variant="text"
                @click="dialogDelete = false"
            >
                Batalkan
            </v-btn>
            <v-btn
                color="green-darken-1"
                variant="text"
                @click="konfirmasiDek(item)"
            >
                Lanjut Konfirmasi
            </v-btn>
            </v-card-actions>
        </v-card>
        </v-dialog>
            <v-dialog
            v-model="dialogStruk"
            persistent
            width="auto"
            >
        <v-card>
            <v-card-title class="text-h5">
            Yakin Ingin Mencetak Struk ?
            </v-card-title>
            <!-- <v-card-text></v-card-text> -->
            <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn
                color="green-darken-1"
                variant="text"
                @click="dialogStruk = false"
            >
                Batalkan
            </v-btn>
            <v-btn
                color="green-darken-1"
                variant="text"
                @click="prosesCetakStruk(item)"
            >
                Lanjut Cetak Struk
            </v-btn>
            </v-card-actions>
        </v-card>
        </v-dialog>
        </v-row>
                </template>
            </v-data-table>
        </v-card>
        
      <!-- Ini Awal Struk -->
<div class="bg light" >
        <!-- <button @click="generateStrukAktivasi">Cetak Struk</button> -->
        <div  width="600px" id="pdfContent" style=" display: none; margin:500px;" class=" text-dark">
            <div width="600px" class="p-1 ">
                <table class="border border-dark">
                    <tr>
                        <td style="width: 70%;"><strong>Gofit</strong>
                        <p>Jl Centralpark No 10 Yogyakarta</p></td>
                    </tr>
                    <tr>
                        <td>
                            <table>
                                <tr style="width: 80%;">
                                    <td><strong>STRUK PRESENSI GYM</strong></td>
                                    
                                </tr>

                                    <td >No Struk : {{ dataHasilTransaksi.no_struk_transaksi }}</td>
                                <tr>
                                    <td >Tanggal : {{currentDate}}</td>
                                </tr>
                            </table>
                        </td>
                    </tr><tr>
                        <td>
                            <table>
                                <tr style="width: 80%;">
                                    <td><strong>Member</strong></td>
                                    <td>:</td>
                                    <td>{{ selectedBookingGym.id_member }} / {{ dataHasilTransaksi.member.nama_member }}</td> 
                                </tr>
                                <tr>
                                    <td >Slot Waktu</td>
                                    <td>:</td>
                                    <td>{{ dataHasilTransaksi.sesi.waktu_mulai }} - {{ dataHasilTransaksi.sesi.waktu_selesai }}</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                        
                    </table>
            </div>
        </div>
    </div>
<!-- Ini Akhir Struk -->

       
    </v-main>
</template>
<script>
import axios from "axios";
import { ref, defineComponent } from "vue";
import { jsPDF } from "jspdf";

export default defineComponent({
  //Component yang digunakan
  data() {
        return {
            pegawaiGanteng : {},
            kunciSurga : 1,
            search: null,
            dialog: false,
            dialogStruk: false,
            dialogDelete: false,
            pilihanAksi : 'tambah',
            headers: [
                {
                    align: "start",
                    sortable: true,
                    value: "task",
                },
                { text: "Tanggal Presensi", value: "tgl_booking_gym"},
                { text: "Tanggal Booking", value: "tanggal_sesi_gym"},
                { text: "Status", value: "kehadiran_gym"},
                { text: "ID Member", value: "id_member"},
                { text: "No Struk", value: "no_struk_transaksi"},
                { text: "Actions", value: "actions"},
            ],
            dataHasilTransaksi :ref({
                data : {no_struk :'', 
            },
            sesi : {
                waktu_mulai : '', 
                waktu_selesai: ''},
                // transaksi_member :{},
            member : {
                id_member : '',
                nama_member : '',
            }
            }),
            DataPresensiGym: ref([]),
            formTodo: {
                tgl_booking_gym : null,
                tanggal_sesi_gym : null,
                kehadiran_gym : null,
                id_member : null,
                no_struk_transaksi : null,
            },
            willDelete : { },
            dialogDelete : false,
            currentDate : '',
            selectedBookingGym : {},
        };
    },

  methods: {
    strukData() {
            var elementHTML = document.querySelector('#pdfContent');
            elementHTML.style.display = "block";
            elementHTML.style.fontSize = '5px';
            //Spasi
            elementHTML.style.lineHeight = '1.2'; 
            elementHTML.style.margin = '0';
            elementHTML.style.padding = '0';

            let doc = new jsPDF({
                orientation: 'l', 
                unit: 'mm', 
                format: ['300','100'], 
            });

            doc.html(elementHTML, {
            callback: function (doc) {
                doc.save(`struk.pdf`);
                elementHTML.style.display = "none";
            },
            x: 10,
            y: 10
            });
        },

        prosesCetakStruk(item){
            //Cari data pegawai 
            this.selectedBookingGym = item;
            let dataLogin = localStorage.getItem('datalogin')
            dataLogin = JSON.parse(dataLogin)
            this.pegawaiGanteng = dataLogin;
            let dataKirim = {
                id_pegawai: dataLogin.id_pegawai
            }
            this.currentDate = this.getCurrentDateTime();
            axios.post(`http://127.0.0.1:8000/api/cetakstrukgym/${item.no_booking_gym}`,dataKirim)
            .then((response) => {
                console.log(response.data.data)
                this.dataHasilTransaksi = response.data.data
                this.strukData();
                this.dialogStruk = false;
            }).catch(error => {
                alert('Gagal Mendapatkan Data Transaksi')
                //Cetak Struk 
                //Tutup Dialog Struk anjenk
                this.dialogStruk = false;
            });
        },

        getCurrentDateTime() {
            var now = new Date();
            var date = now.getDate();
            var month = now.getMonth() + 1; // Perhatikan penambahan 1 karena indeks bulan dimulai dari 0
            var year = now.getFullYear();
            var hours = now.getHours();
            var minutes = now.getMinutes();

            // Format tanggal
            var formattedDate = this.addLeadingZero(date) + "/" + this.addLeadingZero(month) + "/" + year;
            
            // Format waktu
            var formattedTime = this.addLeadingZero(hours) + ":" + this.addLeadingZero(minutes);
            
            // Gabungkan tanggal dan waktu
            var dateTime = formattedDate + " " + formattedTime;
            
            return dateTime;
            },

        // Fungsi untuk menambahkan angka 0 di depan angka satu digit (0-9)
        addLeadingZero(number) {
        return (number < 10 ? "0" : "") + number;
        },

        edit(){
            axios.put(`http://127.0.0.1:8000/api/presensigym/${this.formTodo.no_booking}`,this.formTodo).then((response)=>{
                console.log(response);
                window.location.reload()
            }).catch(error =>{
                    alert('Gagal Mengedit data presensi gym');
                })
            this.resetForm();
            this.dialog = false;
        },

        cancel() {
            this.resetForm();
            this.dialog = false;
        },
    
        openpresensiMemberGymDialog(){
            this.dialogDelete = true;
        },

        konfirmasiDek(item){
            // console.log(item)
            axios.put('http://127.0.0.1:8000/api/presensigym/' + item.no_booking_gym, item)
            .then(response => { 
                console.log(response) 
                alert('berhasil konfirmasi')   
                this.dialogDelete = false;
                window.location.reload();
            })
        }

    },

    mounted()
    {
        axios.get('http://127.0.0.1:8000/api/presensigym')
            .then(response => { 
                this.DataPresensiGym = response.data.data;})
    },
    computed : {
        DataAllBookingGym(){
            const newData = this.DataPresensiGym;
            return newData;
        }
    },
});
</script>

<style scoped>
.table-custom {
  border-radius: 10px;
}

.title.active {
  background-color: #e6e6e6;
}

.title:hover {
  background-color: #f2f2f2;
}
</style>
