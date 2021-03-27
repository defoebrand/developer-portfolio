import React from 'react';
import DailyIframe from '@daily-co/daily-js';
import PropTypes from 'prop-types';

const VideoChat = ({ token, classRoom }) => {
  const callFrame = DailyIframe.createFrame({
    showFullscreenButton: true,
    showLeaveButton: true,
  });
  if (token) {
    callFrame.join({ url: `https://defoebrand.daily.co/${classRoom}`, token });
  } else {
    callFrame.join({ url: `https://defoebrand.daily.co/${classRoom}` });
  }

  return (
    <>
    </>
  );
};
VideoChat.propTypes = {
  token: PropTypes.string,
  classRoom: PropTypes.string,
};

VideoChat.defaultProps = {
  token: '',
  classRoom: '',
};

export default VideoChat;
