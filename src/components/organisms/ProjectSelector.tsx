import React, {useCallback, useEffect} from "react";
import {useDispatch, useSelector} from "react-redux";
import {AppState} from "../../store";
import {NavigationScreenProps} from "react-navigation";
import {Project} from "../../types/Project";
import ProjectList from "../molecules/ProjectList";
import {loadProjects} from "../../store/projects/actions";

const ProjectSelector = ({navigation}: NavigationScreenProps) => {
    const dispatch = useDispatch();
    const projects = useSelector<AppState, Project[]>(state => state.projects.projects).sort((a, b) => a.name.localeCompare(b.name));

    const organizationId = navigation.getParam('organizationId');

    const handleRedirect = (projectId: string) => navigation.navigate("ErrorList", {projectId});

    useEffect(() => {
        dispatch(loadProjects(organizationId));
    }, [organizationId]);
    return (
        <ProjectList projects={projects} onSelectProject={handleRedirect}/>
    );
};

export default ProjectSelector;
