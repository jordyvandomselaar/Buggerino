import React, {useEffect, useRef} from "react";
import "./src/axios-btoa-polyfill";
import {Provider, useSelector} from "react-redux";
import store, {AppState} from "./src/store";
import {
    createAppContainer,
    NavigationActions,
    NavigationContainerComponent,
    NavigationNavigator
} from 'react-navigation';
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

const mainNavigator = createStackNavigator({
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

const AppContainer = createAppContainer(mainNavigator);

const App = () => {
        const navigator = useRef<NavigationContainerComponent>();

        useEffect(() => {
            store.subscribe(() => {
                const username = store.getState().user.username;

                if(!username) {
                    navigator.current.dispatch(NavigationActions.navigate({routeName: "Login"}))
                }
            });
        }, [navigator.current]);
    return (
        <Provider store={store}>
            <ThemeProvider>
                <AppContainer ref={ref => {
                    navigator.current = ref;
                }}/>
            </ThemeProvider>
        </Provider>
    );
};

// export default require('./storybook').default;
export default App;
