import React, {
  useContext,
  useState,
  FunctionComponent,
  ReactNode,
} from "react";

type DarkmodeProviderProps = {
  children: ReactNode;
};
type DarkmodeContextTypes = { darkmode: boolean; toggleDarkmode: () => void };

const DarkmodeContext = React.createContext({
  darkmode: false,
  toggleDarkmode: () => {},
});

const useDarkModeContext: () => DarkmodeContextTypes = () =>
  useContext(DarkmodeContext);

const DarkmodeProvider: FunctionComponent<DarkmodeProviderProps> = ({
  children,
}: DarkmodeProviderProps) => {
  const [darkmode, setDarkmode] = useState(false);
  const toggleDarkmode = () => setDarkmode(!darkmode);

  return (
    <DarkmodeContext.Provider value={{ darkmode, toggleDarkmode }}>
      {children}
    </DarkmodeContext.Provider>
  );
};

export { DarkmodeProvider, useDarkModeContext };
