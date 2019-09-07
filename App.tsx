import React from "react";
import {Provider} from "react-redux";
import store from "./src/store";
import SelectOrganizationScreen from "./src/components/views/SelectOrganization";
import {createAppContainer} from 'react-navigation';
import {createStackNavigator} from 'react-navigation-stack'
import HomeScreen from "./src/components/views/HomeScreen";
import ProjectListScreen from "./src/components/views/ProjectListScreen";

const MainNavigator = createStackNavigator({
    Home: HomeScreen,
    ProjectList: ProjectListScreen
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

export default App;
