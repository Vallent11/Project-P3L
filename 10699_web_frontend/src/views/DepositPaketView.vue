<!-- <template>
    <v-main class="list">
        <v-card>
            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="headline">Transaksi Deposit Kelas</v-list-item-title>
                </v-list-item-content>
            </v-list-item>
        </v-card>
        <v-card>
            <v-form>
                    <v-container>
                        <v-select v-model="formTodo.id_member" :items="[`bonus1`, `bonus2`]" label="id member" required></v-select>
                        <v-text-field v-model="formTodo.nominal" label="nominal" required></v-text-field>
                        <v-text-field v-model="formTodo.id_kelas" label="id kelas" required></v-text-field>
                        <v-text-field v-model="formTodo.jenis_transaksi" label="jenis transaksi" required></v-text-field>
                        <v-text-field v-model="formTodo.id_promo" label="id promo" required></v-text-field>
                        <v-btn color="red darken-1" text @click="cancel">Cancel</v-btn>
                        <v-btn color="green darken-1" text @click="cancel">Bayar</v-btn>
                    </v-container>
                </v-form>
        </v-card>

    </v-main>
    
</template>
<script>
/* eslint-disable */
import axios from 'axios'
import { ref } from 'vue';
export default {
    name: "ListMember",
    data() {
        return {
            kunciSurga : 1,
            search: null,
            dialog: false,

            DataMember: ref([]),
            formTodo: {
                nama_member : null,
                alamat_member : null,
                tgl_lahir_member : null,
                no_telp_member : null,
                email : null,
            },
        };
    },
    methods: {
        cancel()
        {
            this.$router.push({name:'transaksi'})
        },
        
        save() {
            console.log('data',this.formTodo)  
            let data = this.formTodo
            axios.post('http://127.0.0.1:8000/api/member/register',this.formTodo, {headers:{
                'Access-Control-Allow-Origin' : '*',
            }})
            .then(response => {
                console.log(response);
            })
            window.location.reload();
        },

        resetForm() {
            this.formTodo = {
                id_member : null,
                nama_member : null,
                alamat_member : null,
                tgl_lahir_member : null,
                deposit_uang_member : null,
                deposit_paket_member : null,
                no_telp_member : null,
                id_user : null,
                kadaluarsa_kelas : null,
                email : null,
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

        resetPassword({id_member})
        {
            axios.get(`http://127.0.0.1:8000/api/passReset/${id_member}`)
            .then(response => {
                console.log(response);
                alert('berhasil reset password')
            })
        },
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
</style> -->