import React from 'react';
import './App.css';
import {Route,BrowserRouter as Router,Switch, Link} from 'react-router-dom';
import Home from "./pages/home";
import About from './pages/about';

function app(){
  return(
    <Router>
      <div className = "container">
        <ul>
          <li>
            <Link to = "./">Home</Link>
          </li>
          <li>
            <Link to = "./about">About</Link>
          </li>
        </ul>
      <Switch>
      <Route path = "/about" component = {About}/>
      <Route path = "/" component = {Home}/>
      
      </Switch>
      </div>
    </Router>
    
  )
}

export default app;