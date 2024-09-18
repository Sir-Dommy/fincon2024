<template>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Register Employer</div>

                    <div class="card-body">
                        
                        <form method="POST" @submit.prevent="onSubmit">

                            <div class="form-group row">
                                <label for="company_name" class="col-md-4 col-form-label text-md-right">Company Name</label>
                                <div class="col-md-6">
                                    <input id="company_name" type="text" v-model="form.company_name" class="form-control" name="company_name"  autocomplete="company_name" autofocus>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="job_title" class="col-md-4 col-form-label text-md-right">Job Title</label>
                                <div class="col-md-6">
                                    <input id="job_title" type="text" v-model="form.job_title" class="form-control" name="job_title"  autocomplete="job_title" >
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">Full Name</label>
                                <div class="col-md-6">
                                    <input id="name" type="text" v-model="form.name" class="form-control" name="name"  autocomplete="name">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>
                                <div class="col-md-6">
                                    <input id="email" type="email" v-model="form.email" class="form-control" name="email"  autocomplete="email">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="contact_number" class="col-md-4 col-form-label text-md-right">Contact Number</label>
                                <div class="col-md-6">
                                    <input type="tel" v-model="form.contact_number" class="form-control" name="contact_number"  autocomplete="contact_number">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <input id="password" type="password" v-model="form.password" class="form-control" name="password"  autocomplete="new-password">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password-confirm" class="col-md-4 col-form-label text-md-right">Confirm Password</label>
                                <div class="col-md-6">
                                    <input id="password-confirm" type="password" v-model="form.password_confirmation" class="form-control" name="password_confirmation"  autocomplete="new-password">
                                </div>
                            </div>

                            <small>* By creating your free account, you are agreeing to our <a href="#" target="_blank">Terms of Use</a></small>

                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary btn-block">
                                        Create Company Account
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                form: {
                    company_name: '',
                    job_title: '',
                    name: '',
                    email: '',
                    contact_number: '',
                    password: '',
                    password_confirmation: ''
                }
            }
        },
        methods: {
            onSubmit(e) {
                e.preventDefault();
                let chegz = this;
                axios.post('http://127.0.0.1:8000/register', this.form).then(response => {
                    console.log(response.data)
                }).catch(error => {
                    console.log(error)
                });
            }
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
