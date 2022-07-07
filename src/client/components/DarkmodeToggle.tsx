import React, { useEffect, FunctionComponent } from "react";
import { useDarkModeContext } from "../contexts/DarkmodeContext";

type DarkmodeToggleProps = {};

const DarkmodeToggle: FunctionComponent<DarkmodeToggleProps> =
  ({}: DarkmodeToggleProps) => {
    const { darkmode, toggleDarkmode } = useDarkModeContext();

    useEffect(() => {
      document.body.className = darkmode ? "dark" : "";
      return () => {
        document.body.className = darkmode ? "" : "dark";
      };
    });

    return (
      <div className="toggle">
        <label className="switch">
          <input type="checkbox" onClick={toggleDarkmode} />
          <div className="slider round">{darkmode ? "LIGHT?" : "DARK?"}</div>
        </label>
      </div>
    );
  };

export default DarkmodeToggle;
