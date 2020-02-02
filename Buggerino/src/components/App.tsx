import React from 'react';
import AuthScreen from './AuthScreen';
import {createStackNavigator} from 'react-navigation-stack';
import {createAppContainer} from 'react-navigation';
import {ThemeProvider} from 'styled-components';
import theme from '../theme';
import SelectOrganization from './SelectOrganization';

const appNavigator = createStackNavigator(
  {
    Login: {
      screen: AuthScreen,
    },
    SelectOrganization: {
      screen: SelectOrganization,
    },
  },
  {
    initialRouteName: 'SelectOrganization',
    headerMode: 'none',
  },
);

const AppContainer = createAppContainer(appNavigator);

const App = () => {
  return (
    <ThemeProvider theme={theme}>
      <AppContainer />
    </ThemeProvider>
  );
};

export default App;
