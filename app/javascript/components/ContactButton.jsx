import React from 'react';

const style = {
  position: 'fixed',
  bottom: '15px',
  right: '15px',
  color: 'white',
  fontSize: 'calc(20px + 1vw)',
};

const Message = () => {
  console.log('hello');
  return (
    <form action="/web_form" method="get">
      <button className="contact-btn" type="submit">
        CONTACT ME NOW
      </button>
    </form>
  );
};

export default Message;
