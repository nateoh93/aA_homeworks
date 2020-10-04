import React from 'react';
import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            searchTerm: 'puppies'
        }
        this.handleChange = this.handleChange.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    componentDidMount() {
        this.props.fetchSearchGiphys('golden+retriever')
    }

    handleChange(e) {
        this.setState({searchTerm: e.currentTarget.value})
    }

    handleSubmit(e) {
        e.preventDefault();
        let searchTerm = this.state.searchTerm.split(" ").join("+");
        this.props.fetchSearchGiphys(searchTerm);
    }

    render () {
        let {giphys} = this.props;
        
        return (
            <div>
                <form onSubmit={this.handleSubmit}>
                    <input onChange={this.handleChange} value={this.state.searchTerm}/>
                    <button type="submit" >Search Giphy</button>
                </form>

                <GiphysIndex giphys={giphys} />
            </div>
        )
    }
}

export default GiphysSearch;