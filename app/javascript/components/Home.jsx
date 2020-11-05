import React from "react";
import {Link} from "react-router-dom";

class Home extends React.Component {
    render() {
        return (
            <>
                <div>
                    Hello, Dzianis!
                </div>

                {/*<input type="file" name="newPhoto" accept="image/png, image/jpeg"
                        onChange={this.handleImageChange}/>*/
                }
                <input type={"text"} onChange={this.handleTextChange}/>
                <input type="button" onSubmit={this.uploadText} value="submit"/>

            </>
        );
    }

    handleTextChange = e => {
        console.log(e.target.value);
        this.setState({text: e.target.value});
    }

    uploadText = () => {
        fetch(`/api/v1/photos/add`, {
            method: "patch",
            body: this.state.text
        })
            .then(res => res.json())
            .then(data => {
                // do something with the returned data
            });
    }

    handleImageChange = e => {
        if (e.target.files[0]) this.setState({newPhoto: e.target.files[0]});
    }


    uploadPhoto = () => {
        const formData = new FormData();
        formData.append("file", this.state.newPhoto);

        // configure your fetch url appropriately
        fetch(`/api/v1/photos/add`, {
            method: "patch",
            body: formData
        })
            .then(res => res.json())
            .then(data => {
                // do something with the returned data
            });
    };
}

export {Home};