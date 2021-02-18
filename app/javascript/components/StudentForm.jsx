import React, { useState } from 'react';
import PropTypes from 'prop-types';

const StudentForm = ({ student }) => {
  const message = 'Hello!';
  const [date, setDate] = useState();
  const [time, setTime] = useState();
  const [schedule, setSchedule] = useState([]);
  const adjustDate = e => {
    console.log(e.target.value);
    setDate(e.target.value);
  };
  const adjustTime = e => {
    console.log(e.target.value);
    setTime(e.target.value);
  };
  const addToSchedule = e => {
    console.log(date);
    console.log(time);
    // const newDate = new Date(date.year, date.month, date.day);
    // console.log(newDate);
    e.preventDefault();
  };
  return (
    <>
      <form>
        <label htmlFor="name">
          Name:
          <br />
          <input type="text" id="name" name="name" />
        </label>
        <br />
        <label htmlFor="email">
          Email:
          <br />
          <input type="email" id="email" name="email" />
        </label>
        <br />
        <label htmlFor="datetime">
          Meeting Time:
          <br />
          {schedule}
          <br />
          <input type="date" id="date" name="datetime" onChange={adjustDate} />
          <input type="time" id="time" name="datetime" onChange={adjustTime} />
          <input type="submit" value="Add to Schedule" name="datetime" onClick={addToSchedule} />
        </label>
        <br />
        <input type="submit" value="Submit" />
      </form>
    </>
  );
};

StudentForm.propTypes = {
  student: PropTypes.shape(),
};

StudentForm.defaultProps = {
  student: {},
};

export default StudentForm;
