import React from "react";
import {Provider} from "react-redux";
import store from "./src/store";
import {createAppContainer} from 'react-navigation';
import {createStackNavigator} from 'react-navigation-stack'
import HomeScreen from "./src/components/views/HomeScreen";
import ProjectListScreen from "./src/components/views/ProjectListScreen";
import ErrorListScreen from "./src/components/views/ErrorListScreen";
import EventListScreen from "./src/components/views/EventListScreen";
import EventDetailScreen from "./src/components/views/EventDetailScreen";
import bugsnag from '@bugsnag/expo';

const bugsnagClient = bugsnag();

const MainNavigator = createStackNavigator({
    Home: HomeScreen,
    ProjectList: ProjectListScreen,
    ErrorList: ErrorListScreen,
    EventList: EventListScreen,
    EventDetail: EventDetailScreen
}, {
    initialRouteName: "Home",
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
            <AppContainer/>
        </Provider>
    );
};

// export default require('./storybook').default;
 export default App;
