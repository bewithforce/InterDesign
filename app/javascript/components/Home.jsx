import React from "react";
import {NavLink} from "react-router-dom";


export default () => (
    <div className="jumbotron jumbotron-fluid bg-transparent">
        <div className="container secondary-color">
            <h1 className="display-4">Food Recipes</h1>
            <p className="lead">
                A curated list of recipes for the best homemade meal and delicacies.
            </p>
            <hr className="my-4"/>
            <NavLink
                to="/about"
                className="btn btn-lg custom-button"
                role="button"
            >
                View Recipes
            </NavLink>
        </div>
    </div>
);