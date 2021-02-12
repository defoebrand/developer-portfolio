import React, { useEffect, useState } from 'react';
import PropTypes from 'prop-types';

import NavItem from './NavItem';
import SiteItem from './SiteItem';

const horizDirection = 'd-flex col-sm justify-content-around align-items-center position-absolute topBar';

const vertDirection = 'd-flex flex-column col-sm justify-content-around align-items-center position-absolute';

const NavBar = ({ links }) => {
  const [direction, setDirection] = useState(() => (
    window.innerWidth > window.innerHeight ? vertDirection : horizDirection));
  const [location, setLocation] = useState(() => (
    window.innerWidth > window.innerHeight ? 'left' : 'top'));

  const [dimensions, setDimensions] = useState({
    width: window.innerWidth,
    height: window.innerHeight,
  });

  let movementTimer = null;

  const RESET_TIMEOUT = 10;

  const testDimensions = () => {
    setDimensions({
      width: window.innerWidth,
      height: window.innerHeight,
    });
  };

  window.addEventListener('resize', () => {
    clearInterval(movementTimer);
    movementTimer = setTimeout(testDimensions, RESET_TIMEOUT);
  });

  useEffect(() => {
    const main = document.querySelector('main div');
    const header = document.querySelector('header');
    const settings = document.querySelector('.signIn');
    if (dimensions.width <= dimensions.height) {
      setDirection(horizDirection);
      setLocation('top');
      main.classList.remove('navLeft');
      main.classList.add('navTop');
      if (header) {
        header.classList.remove('shiftLeft');
        header.classList.add('shiftTop');
      }
      settings.classList.remove('topRight');
      settings.classList.add('bottomLeft');
    } else {
      setDirection(vertDirection);
      setLocation('left');
      main.classList.remove('navTop');
      main.classList.add('navLeft');
      if (header) {
        header.classList.remove('shiftTop');
        header.classList.add('shiftLeft');
      }
      settings.classList.remove('bottomLeft');
      settings.classList.add('topRight');
    }
  }, [dimensions]);

  return (
    <nav className={direction}>

      {links.sort((a, b) => a.order - b.order).map(link => (link.direction === 'internal'
        ? (
          <SiteItem
            key={link.name}
            name={link.name}
            url={link.url}
            icon={link.icon}
            location={location}
          />
        ) : (
          <NavItem
            key={link.name}
            name={link.name}
            url={link.url}
            icon={link.icon}
            location={location}
          />
        )))}

    </nav>
  );
};

NavBar.propTypes = {
  links: PropTypes.arrayOf(
    PropTypes.shape(),
  ),
};

NavBar.defaultProps = {
  links: [],
};

export default NavBar;
