import React from "react";
import "./src/axios-btoa-polyfill";
import {Provider} from "react-redux";
import store from "./src/store";
import {createAppContainer} from 'react-navigation';
import {createStackNavigator} from 'react-navigation-stack'
import ProjectListScreen from "./src/components/views/ProjectListScreen";
import ErrorListScreen from "./src/components/views/ErrorListScreen";
import EventListScreen from "./src/components/views/EventListScreen";
import EventDetailScreen from "./src/components/views/EventDetailScreen";
import bugsnag from '@bugsnag/expo';
import LoginScreen from "./src/components/views/LoginScreen";
import OrganizationListScreen from "./src/components/views/OrganizationListScreen";
import ThemeProvider from "./src/components/organisms/ThemeProvider";

const bugsnagClient = bugsnag();

const MainNavigator = createStackNavigator({
    Login: LoginScreen,
    OrganizationList: OrganizationListScreen,
    ProjectList: ProjectListScreen,
    ErrorList: ErrorListScreen,
    EventList: EventListScreen,
    EventDetail: EventDetailScreen
}, {
    initialRouteName: "Login",
    defaultNavigationOptions: {
        title: "Buggerino",
        headerStyle: {
            backgroundColor: '#FFF',
        },
        headerTintColor: '#42a5f5',
        headerTitleStyle: {
            fontWeight: 'bold',
            color: '#42a5f5',
        },
    },
});

const AppContainer = createAppContainer(MainNavigator);

const App = () => {
    return (
        <Provider store={store}>
            <ThemeProvider>
                <AppContainer/>
            </ThemeProvider>
        </Provider>
    );
};

// export default require('./storybook').default;
export default App;
