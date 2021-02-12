import React from 'react';
import PropTypes from 'prop-types';

const Message = ({ message }) => (
  <textarea id="message" name="message" rows="4" cols="25">
    {message}
  </textarea>
);

Message.defaultProps = {
  message: '',
};

Message.propTypes = {
  message: PropTypes.string,
};

export default Message;
