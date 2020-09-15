import React from "react";
import {
    BrowserRouter as Router,
    Route,
    Switch,
    Redirect,
    useHistory
} from "react-router-dom";
import 'bootstrap/dist/css/bootstrap.min.css';
import Home from "../components/Home";
import About from "../components/About"
import Component404 from "../components/404"
import Footer from "../components/common/Footer";
import Header from "../components/common/Header";


function Routes() {

    return (
        <Router>
            <Header/>
            <div className="primary-color d-flex align-items-center justify-content-center real_body">
                <Switch>
                    <Route path="/" exact component={Home}/>
                    <Route path="/about" exact component={About}/>
                    <Route path='/404' component={Component404}/>
                    <Redirect from='*' to='/404'/>
                </Switch>
            </div>
            {Footer}
        </Router>
    );
}

export default Routes;