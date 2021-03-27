// In App.js
import React, { useEffect } from 'react';
import DailyIframe from '@daily-co/daily-js';

const Room = () => {
  const callFrame = DailyIframe.wrap(MY_IFRAME);
  useEffect(() => {
    if (!callObject) return;

    const events = ['joined-meeting', 'left-meeting', 'error'];

    function handleNewMeetingState(event) {
      event && logDailyEvent(event);
      switch (callObject.meetingState()) {
        case 'joined-meeting':
          // update component state to a "joined" state...
          break;
        case 'left-meeting':
          callObject.destroy().then(() => {
            // update component state to a "left" state...
          });
          break;
        case 'error':
          // update component state to an "error" state...
          break;
        default:
          break;
      }
    }

    // Use initial state
    handleNewMeetingState();

    // Listen for changes in state
    for (const event of events) {
      callObject.on(event, handleNewMeetingState);
    }

    // Stop listening for changes in state
    return function cleanup() {
      for (const event of events) {
        callObject.off(event, handleNewMeetingState);
      }
    };
  }, [callObject]);

  return (
    <h1>{message}</h1>
  );
};

export default Room;
