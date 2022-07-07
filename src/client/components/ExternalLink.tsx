import React, { FunctionComponent, ReactNode } from "react";

type ExternalLinkProps = {
  children: ReactNode;
  link: string;
  title: string;
};

const ExternalLink: FunctionComponent<ExternalLinkProps> = ({
  children,
  link,
  title,
}: ExternalLinkProps) => (
  <a href={link} rel="noopener noreferrer" target="_blank" title={title}>
    {children}
  </a>
);

export default ExternalLink;
