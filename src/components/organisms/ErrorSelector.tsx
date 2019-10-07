import React, {useEffect} from "react";
import {useDispatch, useSelector} from "react-redux";
import {AppState} from "../../store";
import {NavigationStackScreenComponent} from "react-navigation-stack"
import {BugsnagError} from "../../types/BugsnagError";
import {loadErrors} from "../../store/errors/actions";
import ErrorList from "../molecules/ErrorList";
import {Text} from "react-native-elements";

const ErrorSelector: NavigationStackScreenComponent = ({navigation}) => {
    const dispatch = useDispatch();
    const errors = useSelector<AppState, BugsnagError[]>(state => state.errors.errors);
    const loading = useSelector<AppState, boolean>(state => state.errors.loading);

    const projectId = navigation.getParam('projectId');

    const handleRedirect = (errorId: string) => navigation.navigate("EventList", {errorId});

    useEffect(() => {
        dispatch(loadErrors(projectId));
    }, [projectId]);

    if(loading) {
        return <Text>Loading…</Text>
    }

    return (
        <ErrorList errors={errors} onSelectError={handleRedirect}/>
    );
};

export default ErrorSelector;
