<template>
    <v-main class="list">
        <v-card>
            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="headline">Data Member</v-list-item-title>
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
                <v-btn color="#0091EA" dark @click="openDialog('tambah')"> Tambah </v-btn>
            
            
            </v-card-title>
        </v-card>
        <v-card>
            <v-data-table :key="kunciSurga" :headers="headers" :items="DataAllMember" :search="search">
                <template v-slot:[`item.actions`]="{ item }">
                    <v-btn class="mx-2" dark small color="#01579B" @click="openDialog('edit', item)">edit</v-btn>
                    <v-btn class="mx-2" dark small color="red" @click="openDialogDelete(item)">delete</v-btn>
                    <v-btn class="mx-2"  dark small color="black" @click="resetPassword(item)">resetPassword</v-btn>
                    <v-btn class="mx-2" dark color="#00695C" @click="cetakartu(item)"> Cetak Kartu</v-btn>
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
                        <v-text-field v-model="formTodo.nama_member" label="Nama Member" required></v-text-field>
                        <v-text-field v-model="formTodo.alamat_member" label="Alamat member" required></v-text-field>
                        <v-text-field v-model="formTodo.tgl_lahir_member" type="date" label="Tanggal Lahir Member" required></v-text-field>
                        <v-text-field v-model="formTodo.no_telp_member" label="Nomor Telepon Member" required></v-text-field>
                        <v-text-field v-model="formTodo.email" label="Email" required></v-text-field>
                        <v-text-field v-model="formTodo.deposit_uang_member" label="Deposit Uang" required></v-text-field>
                        <v-text-field v-model="formTodo.deposit_paket_member" label="Deposit Paket" required></v-text-field>
                        <v-text-field v-model="formTodo.username" label="Username" required></v-text-field>
                        <v-text-field v-model="formTodo.password" label="Password" :rules="formTodo.password" disabled></v-text-field>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="cancel"> Cancel</v-btn>
                    <v-btn color="blue darken-1" text @click="save"> Save</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        <!-- <div  width="600px" id="pdfContent" style=" display: none; margin:500px;" class=" text-dark">
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
                    </tr> -->
        <!-- Disini Dialog Delete -->
        <v-row justify="center">
            <v-dialog
            v-model="dialogDelete"
            persistent
            width="auto"
            >
        <v-card>
            <v-card-title class="text-h5">
            Yakin Ingin Menghapus?
            </v-card-title>
            <v-card-text>Setelah Aksi dilakukan data tidak dapat dibalikan lagi</v-card-text>
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
                @click="deleteItem()"
            >
                Lanjut
            </v-btn>
            </v-card-actions>
        </v-card>
        </v-dialog>
        </v-row>
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
            kunciSurga : 1,
            search: null,
            dialog: false,
            dialogDelete: false,
            pilihanAksi : 'tambah',
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
                { text: "Nomor Telepon", value: "no_telp_member"},
                { text: "Email", value: "email"},
                { text: "Deposit Uang", value: "deposit_uang_member"},
                { text: "Deposit Paket", value: "deposit_paket_member"},
                { text: "Actions", value: "actions"},
            ],
            DataMember: ref([]),
            formTodo: {
                nama_member : null,
                alamat_member : null,
                tgl_lahir_member : null,
                no_telp_member : null,
                email : null,
                deposit_uang_member : null,
                deposit_paket_member : null,
                username : null,
                // password : null,

            },
            willDelete : { },
        };
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
        openDialog(aksi, item){
            this.dialog = true;
            this.pilihanAksi = aksi;
            if(aksi == 'edit' ){
                console.log(item)
                this.getMember(item)
            }
        },

        openDialogDelete(item){
            this.willDelete = item;
            this.dialogDelete = true;
        },

        getMember({id_member}){
            axios.get(`http://127.0.0.1:8000/api/member/${id_member}`).then((response)=>{
                this.formTodo = response.data.data[0];
                this.formTodo.tgl_lahir_member = this.formTodo.tgl_lahir_member.split(" ");
                this.formTodo.tgl_lahir_member = this.formTodo.tgl_lahir_member[0];
            })
        },

        save() {
            console.log(this.pilihanAksi);
            if(this.pilihanAksi == 'tambah'){
                this.tambah()
            }else if(this.pilihanAksi =='edit'){
                this.edit()
            }
        },

        tambah(){
            console.log(this.formTodo);
                axios.post('http://127.0.0.1:8000/api/member',this.formTodo)
                .then(response => {
                    console.log(response);
                    window.location.reload();
                }).catch(error =>{
                    console.log(error);
                    alert('Gagal Menambahkan data member');
                })
            this.resetForm();
            this.dialog = false;
        },

        edit(){
            axios.put(`http://127.0.0.1:8000/api/member/${this.formTodo.id_member}`,this.formTodo).then((response)=>{
                console.log(response);
                window.location.reload()
            }).catch(error =>{
                    alert('Gagal Mengedit data member');
                })
            this.resetForm();
            this.dialog = false;
        },

        cancel() {
            this.resetForm();
            this.dialog = false;
        },

        resetForm() {
            this.formTodo = {
                id_member : null,
                nama_member : null,
                alamat_member : null,
                tgl_lahir_member : null,
                email : null,
                deposit_uang_member : null,
                deposit_paket_member : null,
                no_telp_member : null,
                username : null,
                // id_pengguna : null,
                // kadaluarsa_member : null,
            };
        },

        deleteItem()
        {
            axios.delete(`http://127.0.0.1:8000/api/member/${this.willDelete.id_member}`)
            .then(response => {
                console.log(response);
                alert('Berhasil Menghapus')
                window.location.reload();
            })
            this.dialogDelete = false;
        },

        editItem(edit, item)
        {
            console.log(edit)
            console.log(item)
            this.formTodo = item
            console.log('data',this.formTodo.id_member)  
            axios.put(`http://127.0.0.1:8000/api/member/${item.id_member}`,this.formTodo)
            .then(response => {
                console.log(response);
            })
            this.resetForm();
            this.dialog = false;
            this.kunciSurga += 1;
        }
    },

    mounted()
    {
        axios.get('http://127.0.0.1:8000/api/member')
            .then(response => { 
                this.DataMember = response.data.data;})
    },
    computed : {
        DataAllMember(){
            const newData = this.DataMember;
            return newData;
        }
    },

    resetPassword({id_member})
        {
            axios.get(`http://127.0.0.1:8000/api/passReset/${id_member}`)
            .then(response => {
                console.log(response);
                alert('berhasil reset password')
            })
        },
    };
</script>
<style>
    .text {
        font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        font-size: 40px;
        font-style: italic;
    }
</style>