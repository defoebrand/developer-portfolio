import React from 'react';
import PropTypes from 'prop-types';

const Appointments = ({ appointments }) => {
  console.log(appointments);

  return (
    <h1>{appointments}</h1>
  );
};

Appointments.propTypes = {
  appointments: PropTypes.shape(),
};

Appointments.defaultProps = {
  appointments: '',
};

export default Appointments;
