import React from "react";
import {NavLink} from "react-router-dom";

import style from '../../assets/stylesheets/common/home.module.css'

class Home extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            photos: [],
            filters: []
        };
    }

    handleSubmit = e => {
        const url = "/api/v1/photos/show?filter=" + this.state.filters.reduce((result, item) => {
            return `${result},${item}`
        })
        e.preventDefault()
        fetch(url)
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => this.setState({photos: response}))
            .catch(() => this.props.history.push("/"));
    }

    handleCheck = e => {
        const name = e.target.name;
        const checked = e.target.checked;
        if(checked){
            this.setState(prevState => { prevState.filters.push(name)})
        } else {
            this.setState(prevState => {
                prevState.filters.splice(prevState.filters.indexOf(name), 1)
            })
        }

    }

    componentDidMount() {
        const url = "/api/v1/photos/index";
        fetch(url)
            .then(response => {
                if (response.ok) {
                    return response.json();
                }
                throw new Error("Network response was not ok.");
            })
            .then(response => this.setState({photos: response}))
            .catch(() => this.props.history.push("/"));
    }

    render() {
        const {photos} = this.state;
        const allPhotos = photos.map((photo, index) => (
            <div key={index}
                 className={style.img_wrapper}
                 style={
                     {
                         "background": `url(${photo.src}) center no-repeat`,
                         "backgroundSize": "contain",
                     }
                 }
            >
            </div>
        ));

        const noPhotos = (
            <div>
                <h4>
                    No photos yet. Why not create one?
                </h4>
            </div>
        );

        return (
            <div className={style.main_container}>
                <div className={style.chooser_form}>
                    <form onSubmit={this.handleSubmit}>
                        <div>
                            <input type="checkbox" name="me" value="Dzianis" onChange={this.handleCheck}/>
                            <label htmlFor="me">Son</label>
                        </div>

                        <div>
                            <input type="checkbox" name="sister" value="Maryna" onChange={this.handleCheck}/>
                            <label htmlFor="sister">Daughter</label>
                        </div>

                        <div>
                            <input type="checkbox" name="mommy" value="Mommy" onChange={this.handleCheck}/>
                            <label htmlFor="mommy">Mommy</label>
                        </div>

                        <div>
                            <input type="checkbox" name="daddy" value="Daddy" onChange={this.handleCheck}/>
                            <label htmlFor="daddy">Daddy</label>
                        </div>

                        <div>
                            <input type="checkbox" name="cat" value="Cat" onChange={this.handleCheck}/>
                            <label htmlFor="cat">Cat</label>
                        </div>

                        <div>
                            <input type="checkbox" name="dog" value="Dog" onChange={this.handleCheck}/>
                            <label htmlFor="dog">Dog</label>
                        </div>

                        <input type="submit" value="Submit"/>
                    </form>
                </div>
                <div className={style.images_wrapper}>
                    {photos.length > 0 ? allPhotos : noPhotos}
                </div>

            </div>
        );
    }


}

export default (props) => new Home(props);