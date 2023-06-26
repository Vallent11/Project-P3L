<template>
    <v-main class="list">
        <v-card>
            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="headline">JADWAL UMUM</v-list-item-title>
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
            <v-data-table :key="kunciSurga" :headers="headers" :items="DataAllJadwal" :search="search">
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
                    <span class="headline">JadwalUmum </span>
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-text-field v-model="formTodo.hari_jadwal" label="Hari Jadwal" required></v-text-field>
                        <v-text-field v-model="formTodo.jam_mulai" label="Jam Mulai" required></v-text-field>
                        <v-text-field v-model="formTodo.jam_selesai" label="Jam Selesai" required></v-text-field>
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
import axios from 'axios'
import { ref } from 'vue';
export default {
    name: "ListJadwalUmum",
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
                { text: "Hari Jadwal", value: "hari_jadwal"},
                { text: "Jam Mulai", value: "jam_mulai"},
                { text: "Jam Selesai", value: "jam_selesai"},
                { text: "Actions", value: "actions"},
            ],
            DataJadwalUmum: ref([]),
            formTodo: {
                hari_jadwal : null,
                jam_mulai : null,
                jam_selesai : null,
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
                this.getJadwalUmum(item)
            }
        },

        openDialogDelete(item){
            this.willDelete = item;
            this.dialogDelete = true;
        },

        getJadwalUmum({id_jadwal_umum}){
            axios.get(`http://127.0.0.1:8000/api/jadwalumum/${id_jadwal_umum}`).then((response)=>{
                this.formTodo = response.data.data[0];
                this.formTodo.hari_jadwal = this.formTodo.hari_jadwal.split(" ");
                this.formTodo.hari_jadwal = this.formTodo.hari_jadwal[0];
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
                axios.post('http://127.0.0.1:8000/api/jadwalumum',this.formTodo)
                .then(response => {
                    console.log(response);
                    window.location.reload();
                }).catch(error =>{
                    alert('Gagal Menambahkan Jadwal');
                })
            this.resetForm();
            this.dialog = false;
        },

        edit(){
            axios.put(`http://127.0.0.1:8000/api/jadwalumum/${this.formTodo.id_jadwal_umum}`,this.formTodo).then((response)=>{
                console.log(response);
                window.location.reload()
            }).catch(error =>{
                    alert('Gagal Mengedit data Jadwal');
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
                hari_jadwal : null,
                jam_mulai : null,
                jam_selesai : null,

            };
        },
        
        deleteItem()
        {
            axios.delete(`http://127.0.0.1:8000/api/jadwalumum/${this.willDelete.id_jadwal_umum}`)
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
            console.log('data',this.formTodo.id_jadwal_umum)  
            axios.put(`http://127.0.0.1:8000/api/jadwalumum/${item.id_jadwal_umum}`,this.formTodo)
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
        axios.get('http://127.0.0.1:8000/api/jadwalumum')
            .then(response => { 
                this.DataJadwalUmum = response.data.data;})
    },
    computed : {
        DataAllJadwal(){
            const newData = this.DataJadwalUmum;
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