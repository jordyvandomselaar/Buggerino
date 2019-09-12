import React from "react";
import {ListItem} from "react-native-elements"
import {FlatList} from "react-native";
import {BugsnagError} from "../../types/BugsnagError";
import ErrorItem from "../atoms/ErrorItem";

interface IProps {
    errors: BugsnagError[],
    onSelectError: (errorId: string) => void
}

const ErrorList = ({errors, onSelectError}: IProps) => {
    return (
        <FlatList
            data={errors}
            keyExtractor={(item) => item.id}
            renderItem={({item}) => (
                <ErrorItem error={item} onSelectError={onSelectError}/>
            )}
        />
    );
};

export default ErrorList;
