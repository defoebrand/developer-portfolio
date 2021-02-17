import React from 'react';
import Card from 'react-bootstrap/Card';
import ListGroup from 'react-bootstrap/ListGroup';

const cardStyle = {
  width: '18rem',
  margin: 5,
};

const StackTable = () => (
  <div className="d-flex flex-wrap justify-content-center align-items-center mb-5" style={{ color: 'black' }}>
    <Card style={cardStyle}>
      <Card.Header style={{ fontWeight: 700 }}>Languages</Card.Header>
      <ListGroup variant="flush">
        <ListGroup.Item>HTML/(S)CSS</ListGroup.Item>
        <ListGroup.Item>JavaScript</ListGroup.Item>
        <ListGroup.Item>Ruby</ListGroup.Item>
        <ListGroup.Item>Java*</ListGroup.Item>
        <ListGroup.Item>TCL*</ListGroup.Item>
      </ListGroup>
    </Card>
    <Card style={cardStyle}>
      <Card.Header style={{ fontWeight: 700 }}>Databases</Card.Header>
      <ListGroup variant="flush">
        <ListGroup.Item>SQLite</ListGroup.Item>
        <ListGroup.Item>PostgreSQL</ListGroup.Item>
        <ListGroup.Item>MS Access*</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
      </ListGroup>
    </Card>
    <Card style={cardStyle}>
      <Card.Header style={{ fontWeight: 700 }}>Frameworks</Card.Header>
      <ListGroup variant="flush">
        <ListGroup.Item>Bootstrap</ListGroup.Item>
        <ListGroup.Item>Svelte</ListGroup.Item>
        <ListGroup.Item>React / Redux</ListGroup.Item>
        <ListGroup.Item>Rails</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
      </ListGroup>
    </Card>
    <Card style={cardStyle}>
      <Card.Header style={{ fontWeight: 700 }}>Testing</Card.Header>
      <ListGroup variant="flush">
        <ListGroup.Item>Jest</ListGroup.Item>
        <ListGroup.Item>React Testing Library</ListGroup.Item>
        <ListGroup.Item>RSpec / MiniTest</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
        <ListGroup.Item>{' '}</ListGroup.Item>
      </ListGroup>
    </Card>
  </div>
);

export default StackTable;
