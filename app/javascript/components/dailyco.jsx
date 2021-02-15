import React from 'react';
import DailyIframe from '@daily-co/daily-js';
import PropTypes from 'prop-types';

const VideoChat = ({ token, classRoom }) => {
  // const classToken = JSON.parse(token);
  console.log(token);
  // const options = {
  //   method: 'GET',
  //   headers: {
  //     Authorization: 'Bearer 84a3583043afeb6745cf0b8f1e885f38b871d494b3d95e9260f4fa5235cd516c',
  //   },
  // };
  //
  // fetch(`https://api.daily.co/v1/meeting-tokens/${token}`, options)
  //   .then(response => response.json())
  //   .then(data => {
  //     console.log(data);
  //     const callFrame = DailyIframe.createFrame({
  //       showFullscreenButton: true,
  //       showLeaveButton: true,
  //     });
  //     callFrame.join({ url: `https://defoebrand.daily.co/${data.room_name}`, token });
  //   })
  //   .catch(err => console.error(err));
  const callFrame = DailyIframe.createFrame({
    showFullscreenButton: true,
    showLeaveButton: true,
  });
  if (token) {
    callFrame.join({ url: `https://defoebrand.daily.co/${classRoom}`, token });
    console.log('we got a token!');
  } else {
    callFrame.join({ url: `https://defoebrand.daily.co/${classRoom}` });
    console.log('No token!');
  }
  // callFrame.join({ url: `https://defoebrand.daily.co/${classRoom}`, token });
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
