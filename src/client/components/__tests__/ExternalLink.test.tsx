import React from "react";
import { cleanup, render } from "@testing-library/react";

import ExternalLink from "../ExternalLink";

describe("<ExternalLink />", () => {
  afterEach(cleanup);

  it("renders correct structure with text children", () => {
    const { container } = render(
      <ExternalLink link="#" title="title-prop">
        Link text
      </ExternalLink>
    );
    expect(container).toMatchSnapshot();
  });

  it("renders correct structure with HTML children", () => {
    const { container } = render(
      <ExternalLink link="#" title="title-prop">
        <div>inner div</div>
      </ExternalLink>
    );
    expect(container).toMatchSnapshot();
  });
});
