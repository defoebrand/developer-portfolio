import React from 'react';
import DailyIframe from '@daily-co/daily-js';

const VideoChat = () => {
  const callFrame = DailyIframe.createFrame({
    showFullscreenButton: true,
  });
  callFrame.join({ url: 'https://defoebrand.daily.co/Brandon' });
  return (
    <>
    </>
  );
};

export default VideoChat;
