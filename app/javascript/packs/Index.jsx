import React from "react";
import {render} from "react-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import $ from 'jquery';
import Popper from 'popper.js';
import 'bootstrap/dist/js/bootstrap.bundle.min';
import App from "../App";
import Header from "../components/common/Header";
import Footer from "../components/common/Footer";


document.addEventListener("DOMContentLoaded", () => {
    let newDiv = document.createElement("div");
    //newDiv.classList.add('vh-100', 'vw-100')
    render(
        <App/>,
        document.body.appendChild(newDiv)
    );
});