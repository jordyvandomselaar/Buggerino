import React, {useEffect} from "react";
import {useDispatch, useSelector} from "react-redux";
import {AppState} from "../../store";
import {NavigationScreenProps} from "react-navigation";
import {BugsnagError} from "../../types/BugsnagError";
import {loadErrors} from "../../store/errors/actions";
import ErrorList from "../molecules/ErrorList";

const ErrorSelector = ({navigation}: NavigationScreenProps) => {
    const dispatch = useDispatch();
    const errors = useSelector<AppState, BugsnagError[]>(state => state.errors.errors);

    const projectId = navigation.getParam('projectId');

    const handleRedirect = (errorId: string) => navigation.navigate("EventList", {errorId});

    useEffect(() => {
        dispatch(loadErrors(projectId));
    }, [projectId]);
    return (
        <ErrorList errors={errors} onSelectError={handleRedirect}/>
    );
};

export default ErrorSelector;
