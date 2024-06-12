import {useState, useEffect} from 'react';
import { request, randomNumber } from './utils/utils';
import './App.css';

function App() {
  const [pokemon, setPokemon] = useState<any>();

  useEffect(() => {
    request("get", randomNumber(1))
    .then((response: any) => setPokemon(response))
  }, []);


  return (
    <div className="App">
      <header className="App-header">
        <img src={pokemon?.sprites.other.home.front_default} alt="logo" />
        <p>
          Your pokemon is {pokemon?.name}
        </p>
      </header>
    </div>
  );
}

export default App;
