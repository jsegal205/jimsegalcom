import React from "react";
import { cleanup, render, screen } from "@testing-library/react";
import userEvent from "@testing-library/user-event";

import DarkModeToggle from "../DarkmodeToggle";
import { DarkmodeProvider } from "../../contexts/DarkmodeContext";

describe("<DarkmodeToggle />", () => {
  afterEach(cleanup);

  it("renders correct structure", () => {
    const { container } = render(<DarkModeToggle />);
    expect(container).toMatchSnapshot();
  });

  describe("actions", () => {
    beforeEach(() => {
      render(
        <DarkmodeProvider>
          <DarkModeToggle />
        </DarkmodeProvider>
      );
    });

    describe("when component is initialized", () => {
      it("then sets the light class by default", () => {
        expect(screen.getByText(/Dark/i)).toBeTruthy();
        expect(document.body.className).toEqual("");
      });
    });

    describe("when the toggle theme input is clicked", () => {
      beforeEach(() => {
        userEvent.click(screen.getByText(/Dark/i));
      });

      it("then sets the dark class", () => {
        expect(screen.getByText(/Light/i)).toBeTruthy();
        expect(document.body.className).toEqual("dark");
      });
    });
  });
});
