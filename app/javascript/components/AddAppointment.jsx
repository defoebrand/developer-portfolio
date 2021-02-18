import React, { useEffect, useState } from 'react';
import PropTypes from 'prop-types';

const AddAppointments = ({ appointments }) => {
  const [date, setDate] = useState();
  const [time, setTime] = useState();

  const changeDate = e => {
    setDate(e.target.value);
  };
  const changeTime = e => {
    setTime(e.target.value);
  };

  // useEffect(() => {
  //   const url = '/appointments';
  //   fetch(url, {
  //     headers: {
  //       'Content-type': 'application/json; charset=UTF-8',
  //     },
  //   })
  //     .then(response => {
  //       if (response.ok) {
  //         return response.json();
  //       }
  //       throw new Error('Failed to Retrieve Appointments.');
  //     }).then(data => {
  //       try {
  //         console.log(data);
  //       } catch {
  //         throw new Error('Failed to Retrieve Doctors.');
  //       }
  //     }).catch(err => {
  //       console.log(err);
  //     });
  // }, []);

  return (
    <>
      <h1>{appointments}</h1>
      <form action="/appointments" method="post" id="appt" name="appt">
        <input type="date" id="date" name="date" onChange={changeDate} value={date} />
        <input type="time" id="time" name="time" onChange={changeTime} value={time} />

        <input type="submit" value="Submit" />
      </form>
    </>
  );
};

AddAppointments.propTypes = {
  appointments: PropTypes.shape(),
};

AddAppointments.defaultProps = {
  appointments: '',
};

export default AddAppointments;
