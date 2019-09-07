import React, {useCallback, useEffect} from "react";
import {useDispatch, useSelector} from "react-redux";
import {AppState} from "../../store";
import {NavigationScreenProps} from "react-navigation";
import {Project} from "../../types/Project";
import ProjectList from "../molecules/ProjectList";
import {loadProjects} from "../../store/projects/actions";

const ProjectSelector = ({navigation}: NavigationScreenProps) => {
    const dispatch = useDispatch();
    const projects = useSelector<AppState, Project[]>(state => state.projects.projects);

    const organizationId = navigation.getParam('organizationId');

    useEffect(() => {
        dispatch(loadProjects(organizationId));
    }, [organizationId]);
    return (
        <ProjectList projects={projects}/>
    );
};

export default ProjectSelector;
