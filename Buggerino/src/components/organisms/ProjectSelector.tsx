import React, {useEffect} from "react";
import {useDispatch, useSelector} from "react-redux";
import {AppState} from "../../store";
import {NavigationStackScreenComponent} from "react-navigation-stack"
import {Project} from "../../types/Project";
import ProjectList from "../molecules/ProjectList";
import {loadProjects} from "../../store/projects/actions";
import {AsyncStorage} from "react-native";

const ProjectSelector: NavigationStackScreenComponent = ({navigation}) => {
    const dispatch = useDispatch();
    const projects = useSelector<AppState, Project[]>(state => state.projects.projects).sort((a, b) => a.name.localeCompare(b.name));

    const organizationId = navigation.getParam('organizationId');

    AsyncStorage.setItem("organizationId", organizationId);

    const handleRedirect = (projectId: string) => navigation.navigate("ErrorList", {projectId});

    useEffect(() => {
        dispatch(loadProjects(organizationId));
    }, [organizationId]);
    return (
        <ProjectList projects={projects} onSelectProject={handleRedirect}/>
    );
};

export default ProjectSelector;