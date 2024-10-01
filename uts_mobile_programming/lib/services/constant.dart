//link url untuk connect ke back end 
const baseURL = 'http://192.168.0.141:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const updateUserDetailsURL =  baseURL + '/user/details';
const deleteAccountURL = baseURL + '/delete-account';

const serverError = 'Server error';
const unathorized = 'Unathorized';
const somethingWentWrong = 'Something went wrong try again';