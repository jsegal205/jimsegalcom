import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faEnvelope } from "@fortawesome/free-solid-svg-icons";
import {
  faDev,
  faGithub,
  faLinkedin,
  faStackOverflow,
} from "@fortawesome/free-brands-svg-icons";

import ExternalLink from "../components/ExternalLink";
import DarkmodeToggle from "../components/DarkmodeToggle";

type HomeProps = {};

const Home = ({}: HomeProps) => {
  return (
    <section className="home container">
      <div>
        <img
          alt="profile picture of me, Jim"
          className="avatar"
          src="img/jim.jpg"
        />
        <DarkmodeToggle />
      </div>
      <div className="wrapper">
        <h1 className="title">Jim Segal</h1>
        <nav className="link-row">
          {/* TODO: replace with react router internals when moving for v2 */}
          <a href="mailto:hello@jimsegal.com" title="email">
            <FontAwesomeIcon icon={faEnvelope} title="email" />
          </a>
          <ExternalLink link="https://dev.to/jsegal205/" title="dev dot to">
            <FontAwesomeIcon icon={faDev} title="dev dot to" />
          </ExternalLink>
          <ExternalLink link="https://github.com/jsegal205" title="github">
            <FontAwesomeIcon icon={faGithub} title="github" />
          </ExternalLink>
          <ExternalLink
            link="https://www.linkedin.com/in/jimsegal/"
            title="linkedin"
          >
            <FontAwesomeIcon icon={faLinkedin} title="linkedin" />
          </ExternalLink>
          <ExternalLink
            link="https://stackoverflow.com/users/282110/jim"
            title="stack overflow"
          >
            <FontAwesomeIcon icon={faStackOverflow} title="stack overflow" />
          </ExternalLink>
        </nav>
        <div className="about">website developer, hobbyist 3D creator</div>
        <div className="projects">
          <h2 className="projects-banner">Projects</h2>
          <ul>
            {/* make map for these links and iterate over them */}
            <li>
              <ExternalLink
                link="https://jimsegal.com/printer/"
                title="3D Printer"
              >
                3D Printer
              </ExternalLink>
            </li>
            <li>
              <ExternalLink
                link="https://jimsegal.com/IsChicagoColderThanAnchorage/"
                title="Is Chicago colder than Anchorage"
              >
                Is Chicago colder than Anchorage?
              </ExternalLink>
            </li>
            <li>
              <ExternalLink
                link="https://projects.jimsegal.com/"
                title="Jim Segal projects page"
              >
                My Projects
              </ExternalLink>
            </li>
            <li>
              <ExternalLink
                link="https://jimsegal.com/readinglist/"
                title="Reading List"
              >
                My Reading List
              </ExternalLink>
            </li>
            <li>
              <ExternalLink
                link="https://jimsegal.com/tabletop/"
                title="Tabletop Games"
              >
                My Tabletop Games
              </ExternalLink>
            </li>
            <li>
              <ExternalLink
                link="https://jimsegal.com/travel/"
                title="My Travels"
              >
                My Travels
              </ExternalLink>
            </li>
          </ul>
        </div>
      </div>
    </section>
  );
};

export default Home;
