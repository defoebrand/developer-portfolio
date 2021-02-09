import React from 'react';
import PropTypes from 'prop-types';

import NavItem from './NavItem';
import SiteItem from './SiteItem';

const NavBar = ({ links }) => (
  <nav className="d-flex flex-column col-sm justify-content-around align-items-center position-absolute">

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

NavBar.propTypes = {
  links: PropTypes.arrayOf(
    PropTypes.shape(),
  ),
};

NavBar.defaultProps = {
  links: [],
};

export default NavBar;
