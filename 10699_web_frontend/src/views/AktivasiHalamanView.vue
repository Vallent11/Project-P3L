<template>
    <v-main class="list">
        <v-card>
            <v-list-item>
               
                <v-list-item-content>
                    <v-list-item-title class="headline">Aktivasi Member</v-list-item-title>
                </v-list-item-content>
            </v-list-item>
            <v-card-title></v-card-title>
        </v-card>
        <v-card>
            <v-data-table :key="kunci" :headers="headers" :items="DataAllMember" :search="search">
                <template v-slot:[`item.actions`]="{ item }">
                    <v-btn class="mx-2" dark small color="#01579B" @click="aktivasi(item)">aktivasi</v-btn>
                </template>
            </v-data-table>
        </v-card>
        <v-dialog v-model="dialog" persistent max-width="600px">
            <v-card>
                <v-card-title>
                    <span class="headline"> Data Member </span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-text-field v-model="formTodo.id_member" label="id member" required></v-text-field>
                        <v-text-field v-model="formTodo.nama_member" label="nama member" required></v-text-field>
                        <v-text-field v-model="formTodo.alamat_member" label="alamat member" required></v-text-field>
                        <v-text-field v-model="formTodo.tgl_lahir_member" label="tgl lahir member" required></v-text-field>
                        <v-text-field v-model="formTodo.deposit_uang_member" label="deposit uang member" required></v-text-field>
                        <v-text-field v-model="formTodo.deposit_paket_member" label="deposit paket member" required></v-text-field>
                        <v-text-field v-model="formTodo.no_telp_member" label="no telp member" required></v-text-field>
                        <v-text-field v-model="formTodo.id_pengguna" label="id pengguna" required></v-text-field>
                        <v-text-field v-model="formTodo.kadaluarsa_member" label="kadaluarsa member" required></v-text-field>
                        <v-text-field v-model="formTodo.kadaluarsa_paket_member" label="kadaluarsa paket member" required></v-text-field>
                        <v-text-field v-model="formTodo.email" label="email" required></v-text-field>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="cancel"> Cancel</v-btn>
                    <v-btn color="blue darken-1" text @click="save"> Save</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <div class="bg light" >
        <!-- <button @click="generateStrukAktivasi">Cetak Struk</button> -->
        <div  width="600px" id="pdfContent" style=" display: none; margin:500px;" class=" text-dark">
            <div width="600px" class="p-1 ">
                <table class="border border-dark">
                    <tr>
                        <td style="width: 60%;">
                            <tr>
                            <strong>Struk Aktivasi Member GOFIT</strong>
                        </tr>
                        <tr>
                        <td>Alamat : Jl Centralpark No 10 Yogyakarta</td>
                        </tr>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        
                    </tr>
                    <tr></tr>
                    <tr>
                        <td>
                            <table>
                                <tr style="width:90%;">
                                    <td><strong>Member : {{ dataHasilTransaksi.transaksi_member.id_member }}</strong></td>
                                </tr>
                                <td>Kasir : {{this.pegawaiGanteng.id_pegawai}}/{{this.pegawaiGanteng.nama_pegawai}} </td>
                                <tr>
                                <td>No Struk Transaksi : {{ dataHasilTransaksi.transaksi_aktivasi_member.no_struk_transaksi }}</td>
                            </tr>
                                <tr>
                                    <td >Aktivasi Tahunan : Rp.3.000.0000,-</td>
                                </tr>
                                <tr>
                                    <td>Masa Aktif Member : {{   dataHasilTransaksi.member_masa_aktif }} </td>
                                    
                                </tr>
                                
                                
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    
                </table>
            </div>
        </div>
    </div>
    </v-main>
</template>
<script>
/* eslint-disable */
import axios from 'axios'
import { ref } from 'vue';
import { jsPDF } from "jspdf";
export default {
    name: "ListMember",
    data() {
        return {
            pegawaiGanteng :{},
            dataHasilTransaksi : ref({
                transaksi_aktivasi_member : {},
                transaksi_member : {},}),
            kunci : 1,
            search: null,
            dialog: false,
            headers: [
                {
                    align: "start",
                    sortable: true,
                    value: "task",
                },
                { text: "ID Member", value: "id_member"},
                { text: "Nama Member", value: "nama_member"},
                { text: "Alamat Member", value: "alamat_member"},
                { text: "Tanggal Lahir", value: "tgl_lahir_member"},
                { text: "Deposit Uang", value: "deposit_uang_member"},
                { text: "Deposit Paket", value: "deposit_paket_member"},
                { text: "Nomor Telepon", value: "no_telp_member"},
                { text: "ID Pengguna", value: "id_pengguna"},
                { text: "Kadaluarsa", value: "kadaluarsa_member"},
                { text: "Actions", value: "actions", key: "actions"},
            ],
            DataMember: ref([]),
            formTodo: {
                id_member : null,
                nama_member: null,
                alamat_member : null,
                tgl_lahir_member : null,
                deposit_uang_member: null,
                deposit_paket_member: null,
                no_telp_member : null,
                id_user : null,
                kadaluarsa_member : null,
                kadaluarsa_paket_member : null,
                email : null
            },
        };

        function aktivasi(){
            let formData = new FormData();
    
            formData.append('id_member', newProduct.id_member);
            formData.append('nama_member', newProduct.nama_member);
            formData.append('alamat_member', newProduct.alamat_member);
            formData.append('tgl_lahir_member', newProduct.tgl_lahir_member);
            formData.append('deposit_uang_member', newProduct.deposit_uang_member);
            formData.append('deposit_paket_member', newProduct.deposit_paket_member);
            formData.append('no_telp_member', newProduct.no_telp_member);
            formData.append('id_user', newProduct.id_user);
            formData.append('kadaluarsa_member', newProduct.kadaluarsa_member);
            formData.append('kadaluarsa_paket_member', newProduct.kadaluarsa_paket_member);
            formData.append('email', newProduct.email);
        }
    },

    
    methods: {
        strukData() {
            // this.formatDateStruk();
            // window.jspPDF = window.jspdf.jsPDF;
            var elementHTML = document.querySelector('#pdfContent');
            elementHTML.style.display = "block";
            elementHTML.style.fontSize = '5px';
            //Spasi
            elementHTML.style.lineHeight = '1.2'; 
            elementHTML.style.margin = '0';
            elementHTML.style.padding = '0';

            let doc = new jsPDF({
                orientation: 'l', // orientasi landscape
                unit: 'mm', // satuan millimeter
                format: ['300','100'], // ukuran kertas A4
            });

            doc.html(elementHTML, {
            callback: function (doc) {
                doc.save(`struk.pdf`);
                elementHTML.style.display = "none";
            },
            x: 10,
            y: 10
            });
            // window.location.reload();
        },
        pindahHalaman()
        {
            this.$router.push({name:'kasir'})
        },
        
        save() {
            console.log('data',this.formTodo)  
            let data = this.formTodo
            axios.post('http://127.0.0.1:8000/api/daftarmember/register',this.aktivasi, {headers:{
                'Access-Control-Allow-Origin' : '*',
            }})
            .then(response => {
                newProduct.id_member = "";
                newProduct.nama_member
                newProduct.alamat_member
                newProduct.tgl_lahir_member
                newProduct.deposit_uang_member
                newProduct.deposit_paket_member
                newProduct.no_telp_member
                newProduct.id_user
                newProduct.kadaluarsa_member
                newProduct.kadaluarsa_paket_member
                newProduct.email
            })
            // window.location.reload();
        },

        cancel() {
            this.resetForm();
            this.dialog = false;
        },

        resetForm() {
            this.formTodo = {
                id_member : null,
                nama_member: null,
                alamat_member : null,
                tgl_lahir_member : null,
                deposit_uang_member: null,
                deposit_paket_member: null,
                no_telp_member : null,
                id_user : null,
                kadaluarsa_member : null,
                kadaluarsa_paket_member : null,
                email : null
            };
        },

        deleteItem({id_member})
        {
            axios.delete(`http://127.0.0.1:8000/api/member/${id_member}`)
            .then(response => {
                console.log(response);
                alert('berhasil menghapus')
            })
            window.location.reload();
        },

        aktivasi({id_member})
        {
            let dataLogin = localStorage.getItem('datalogin')
            dataLogin = JSON.parse(dataLogin)
            this.pegawaiGanteng = dataLogin;
            let dataKirim = {
                id_member:id_member,
                id_pegawai: dataLogin.id_pegawai
            }
                        
            axios.post(`http://127.0.0.1:8000/api/transaksiaktivasi`,dataKirim)
            .then(response => {
                console.log(response.data.data);
                this.dataHasilTransaksi = response.data.data;
                this.strukData();
            })
            alert('berhasil aktivasi');
            // window.location.reload();
        }
    },

    mounted()
    {
        axios.get('http://127.0.0.1:8000/api/member')
            .then(response => { this.DataMember = response.data.data;})

    },
    computed : {
        DataAllMember(){
            const newData = this.DataMember;
            return newData;
        }

    }


};
</script>
<style>
    .text {
        font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        font-size: 40px;
        font-style: italic;
    }
</style>