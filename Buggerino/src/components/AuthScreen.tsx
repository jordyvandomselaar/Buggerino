import React from 'react';
import {material} from 'react-native-typography';
import {Text} from 'react-native';
import {NavigationStackScreenComponent} from 'react-navigation-stack';
import TextInput from './TextInput';
import {Container} from './Layout';
import Button from './Button';

const AuthScreen: NavigationStackScreenComponent = () => {
  return (
    <Container bg="white" size="100%" p="10px" justifyContent="center">
      <Text style={material.display1}>Welcome to Buggerino!</Text>
      <Container mt="50px">
        <Text style={material.body1}>Login to get started</Text>
      </Container>
      <Container mt="10px">
        <TextInput label="Username" />
      </Container>
      <Container mt="10px">
        <TextInput
          label="Password"
          textContentType="password"
          secureTextEntry
        />
      </Container>
      <Container mt="20px">
        <Button title="Login" />
      </Container>
    </Container>
  );
};

export default AuthScreen;
