import React from "react";
import { cleanup, render } from "@testing-library/react";

import Home from "../Home";

describe("<Home />", () => {
  beforeAll(() => {
    // fix bug with font-awesome icon title
    // https://github.com/FortAwesome/react-fontawesome/issues/194
    const mockMath = Object.create(global.Math);
    mockMath.random = () => 0;
    global.Math = mockMath;
  });

  afterEach(cleanup);

  it("renders correct structure", () => {
    const { container } = render(<Home />);
    expect(container).toMatchSnapshot();
  });
});
