import React from 'react';
import PropTypes from 'prop-types';

const Option = ({ name, url, icon }) => (
  <a href={url}>
    <span className="tip">{name}</span>
    <span>
      <i className={icon} />
    </span>
  </a>
);

Option.defaultProps = {
  name: '',
  url: '',
  icon: '',
};

Option.propTypes = {
  name: PropTypes.string,
  url: PropTypes.string,
  icon: PropTypes.string,
};

export default Option;
