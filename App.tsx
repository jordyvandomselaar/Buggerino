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
            backgroundColor: '#9696ff',
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
            fontWeight: 'bold',
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
