import React, { useEffect, useState } from 'react';
import PropTypes from 'prop-types';

import NavItem from './NavItem';
import SiteItem from './SiteItem';

const horizDirection = 'd-flex col-sm justify-content-around align-items-center position-absolute topBar';

const vertDirection = 'd-flex flex-column col-sm justify-content-around align-items-center position-absolute';

const NavBar = ({ links }) => {
  const [direction, setDirection] = useState();

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

  useEffect(() => {
    testDimensions();
  }, []);

  window.addEventListener('resize', () => {
    clearInterval(movementTimer);
    movementTimer = setTimeout(testDimensions, RESET_TIMEOUT);
  });

  useEffect(() => {
    const main = document.querySelector('main div');
    const settings = document.querySelector('.signIn');
    if (dimensions.width <= dimensions.height) {
      setDirection(horizDirection);
      main.classList.remove('navLeft');
      main.classList.add('navTop');
      settings.classList.remove('topRight');
      settings.classList.add('bottomLeft');
    } else {
      setDirection(vertDirection);
      main.classList.remove('navTop');
      main.classList.add('navLeft');
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
          />
        ) : (
          <NavItem
            key={link.name}
            name={link.name}
            url={link.url}
            icon={link.icon}
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
