import React from "react";
import '../../../assets/stylesheets/common/header.css'
import {NavLink} from "react-router-dom";

function Header(props){
    return (
        <header className="header">
            <div className="header__logo">
                <button className="header__button">
                    <i className="fas fa-landmark"/>
                </button>
            </div>
            <div className="header__navigation">
                <NavLink
                    to="/about"
                    className="header__button"
                    role="button"
                >
                    About
                </NavLink>
            </div>
        </header>
    );
}

export default Header;


