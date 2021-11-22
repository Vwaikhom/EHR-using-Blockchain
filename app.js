const express = require('express');
const path = require('path');
const ejsMate = require('ejs-mate');

const app = express();

app.set('view engine','ejs');
app.set('views', path.join(__dirname,'views'));
app.use(express.urlencoded({extended: true}));
app.use(express.static(path.join(__dirname,'public')));


app.get('/', (req, res) => {
    res.render('home');
})

app.get('/hospital', (req, res) => {
    res.render('hospital');
})

app.get('/view_hospital', (req, res) => {
    res.render('hospital_details');
})

app.get('/doctor', (req,res) => {
    res.render('doctor');
})

app.get('/view_doctor', (req, res) => {
    res.render('doctor_details');
})

app.get('/patient', (req,res) => {
    res.render('patient');
})

app.get('/view_patient', (req, res) => {
    res.render('patient_details');
})

app.get('/history', (req,res) => {
    res.render('history');
})

app.get('/view_history', (req, res) => {
    res.render('view_history');
})

app.get('/checkup', (req, res) => {
    res.render('checkup');
})

app.get('/checkup_details', (req, res) => {
    res.render('checkup_details');
})

app.listen(3000, () => {
    console.log(`Listening on port 3000`)
})
