import React from "react";
import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";
import { DarkmodeProvider } from "./contexts/DarkmodeContext";
import Home from "./pages/Home";

interface AppProps {}

const App = (props: AppProps) => {
  return (
    <DarkmodeProvider>
      <Router>
        <Switch>
          <Route path="/">
            <Home />
          </Route>
        </Switch>
      </Router>
    </DarkmodeProvider>
  );
};

export default App;
