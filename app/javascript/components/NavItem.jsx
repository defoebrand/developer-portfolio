import React from 'react';
import PropTypes from 'prop-types';

const Option = ({
  name, url, icon, location,
}) => {
  const tipDirection = location === 'left' ? 'tipLeft' : 'tipTop';

  return (
    <a href={url} target="_blank" rel="noreferrer">
      <span className={tipDirection}>{name}</span>
      <span>
        <i className={icon} />
      </span>
    </a>
  );
};

Option.defaultProps = {
  name: '',
  url: '',
  icon: '',
  location: 'left',
};

Option.propTypes = {
  name: PropTypes.string,
  url: PropTypes.string,
  icon: PropTypes.string,
  location: PropTypes.string,
};

export default Option;
