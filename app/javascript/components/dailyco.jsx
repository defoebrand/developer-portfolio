import React from 'react';
import DailyIframe from '@daily-co/daily-js';

const Room = () => {
  const callFrame = DailyIframe.createFrame();
  callFrame.join({ url: 'https://defoebrand.daily.co/Brandon' });
  return (
    <>
    </>
  );
};

export default Room;
