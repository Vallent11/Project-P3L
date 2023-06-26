<template>
    <v-main class="list">
        <v-card>
            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="headline">INSTRUKTUR</v-list-item-title>
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
                <v-btn color="success" dark @click="openDialog('tambah')"> Tambah </v-btn>
            </v-card-title>
        </v-card>
        <v-card>
            <v-data-table :key="kunciSurga" :headers="headers" :items="DataAllInstruktur" :search="search">
                <template v-slot:[`item.actions`]="{ item }">
                    <v-btn class="mx-2" dark small color="red" @click="openDialog('edit', item)">edit</v-btn>
                    <v-btn class="mx-2" dark small color="green" @click="openDialogDelete(item)">delete</v-btn>
                </template>
            </v-data-table>
        </v-card>
        <!-- Dialog Tambah dan Edit -->
        <v-dialog v-model="dialog" persistent max-width="600px">
            <v-card>
                <v-card-title>
                    <span class="headline">Instruktur </span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-text-field v-model="formTodo.nama_instruktur" label="Nama Instruktur" required></v-text-field>
                        <v-text-field v-show="pilihanAksi == 'tambah'" v-model="formTodo.username" label="Username" required></v-text-field>
                        <v-text-field v-show="pilihanAksi == 'tambah'" v-model="formTodo.password" label="Password" required></v-text-field>
                        <!-- <v-text-field v-model="formTodo.id_instruktur" label="ID Instruktur" required></v-text-field> -->
                        <v-text-field v-model="formTodo.tgl_lahir_instruktur" type="date" label="Tanggal Lahir" required></v-text-field>
                        <v-text-field v-model="formTodo.alamat_instruktur" label="Alamat" required></v-text-field>
                        <v-text-field v-model="formTodo.no_telp_instruktur" label="No Telepon" required></v-text-field>
                        <!-- <v-text-field v-model="formTodo.id_pengguna" label="ID Pengguna" required></v-text-field>
                        <v-text-field v-model="formTodo.id_jadwal_umum" label="Jadwal Umum" required></v-text-field> -->
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue darken-1" text @click="cancel"> Cancel</v-btn>
                    <v-btn color="blue darken-1" text @click="save"> Save</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
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
export default {
    name: "ListInstruktur",
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
                // { text: "ID Instruktur", value: "id_instruktur"},
                { text: "Nama", value: "nama_instruktur"},
                { text: "Tanggal Lahir", value: "tgl_lahir_instruktur"},
                { text: "Alamat", value: "alamat_instruktur"},
                { text: "Nomor Telepon", value: "no_telp_instruktur"},
                // { text: "ID Pengguna", value: "id_pengguna"},
                // { text: "Jadwal Umum", value: "id_jadwal_umum"},
                // { text: "Jadwal Harian", value: "id_jadwal_harian"},
                { text: "Actions", value: "actions"},
            ],
            DataInstruktur: ref([]),
            formTodo: {
                username : null,
                password : null,
                // id_instruktur : null,
                nama_instruktur : null,
                tgl_lahir_instruktur : null,
                alamat_instruktur : null,
                no_telp_instruktur : null,
                // id_pengguna : null,
                // id_jadwal_umum : null,
                // id_jadwal_harian : null,
            },
            willDelete : { },
        };
    },
    methods: {
        openDialog(aksi, item){
            this.dialog = true;
            this.pilihanAksi = aksi;
            if(aksi == 'edit' ){
                console.log(item)
                this.getInstruktur(item)
            }
        },

        openDialogDelete(item){
            this.willDelete = item;
            this.dialogDelete = true;
        },

        getInstruktur({id_instruktur}){
            axios.get(`http://127.0.0.1:8000/api/instruktur/${id_instruktur}`).then((response)=>{
                this.formTodo = response.data.data[0];
                this.formTodo.tgl_lahir_instruktur = this.formTodo.tgl_lahir_instruktur.split(" ");
                this.formTodo.tgl_lahir_instruktur = this.formTodo.tgl_lahir_instruktur[0];
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
                axios.post('http://127.0.0.1:8000/api/instruktur',this.formTodo)
                .then(response => {
                    console.log(response);
                    window.location.reload();
                }).catch(error =>{
                    alert('Gagal Menambahkan data instruktur');
                })
            this.resetForm();
            this.dialog = false;
        },

        edit(){
            axios.put(`http://127.0.0.1:8000/api/instruktur/${this.formTodo.id_instruktur}`,this.formTodo).then((response)=>{
                console.log(response);
                window.location.reload()
            }).catch(error =>{
                    alert('Gagal Mengedit data instruktur');
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
                username : null,
                password : null,
                // id_instruktur : null,
                nama_instruktur : null,
                tgl_lahir_instruktur : null,
                alamat_instruktur : null,
                no_telp_instruktur : null,
                // id_pengguna : null,
                // id_jadwal_umum : null,
                // id_jadwal_harian : null,
            };
        },
        
        deleteItem()
        {
            axios.delete(`http://127.0.0.1:8000/api/instruktur/${this.willDelete.id_instruktur}`)
            .then(response => {
                console.log(response);
                alert('Berhasil Menghapus')
                window.location.reload();              // this.kunciSurga += 1;
            })
            this.dialogDelete = false;
        },

        editItem(edit, item)
        {
            console.log(edit)
            console.log(item)
            this.formTodo = item
            console.log('data',this.formTodo.id_instruktur)  
            axios.put(`http://127.0.0.1:8000/api/instruktur/${item.id_instruktur}`,this.formTodo)
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
        axios.get('http://127.0.0.1:8000/api/instruktur')
            .then(response => { 
                this.DataInstruktur = response.data.data;})
    },
    computed : {
        DataAllInstruktur(){
            const newData = this.DataInstruktur;
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