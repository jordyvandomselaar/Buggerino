import React from "react";
import {ListItem} from "react-native-elements"
import {FlatList} from "react-native";
import {Error} from "../../types/Error";

interface IProps {
    errors: Error[],
    onSelectError: (errorId: string) => void
}

const ErrorList = ({errors, onSelectError}: IProps) => {
    return (
        <FlatList
            data={errors}
            keyExtractor={(item) => item.id}
            renderItem={({item}) => (
                <ListItem onPress={() => {
                    onSelectError(item.id);
                }} title={item.message}/>
            )}
        />
    );
};

export default ErrorList;
