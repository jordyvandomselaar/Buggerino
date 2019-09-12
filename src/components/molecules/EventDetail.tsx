import React from "react";
import {Error} from "../../types/Error";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import {Card, Text} from "react-native-elements";
import styled from "styled-components";
import {ScrollView, View} from "react-native";

interface IProps {
    error: Error
    event: BugsnagEvent,
}

const ErrorClass = styled(Text)`
  font-weight: bold;
`;

const CodeBlock = styled(View)`
  background-color: #FFF;
`;

const EventDetail = ({error, event}: IProps) => {
    const receivedAtDate = new Date(event.received_at);

    return (
        <ScrollView>
            <Text><ErrorClass h1>{error.error_class}</ErrorClass> <Text h2>{error.context}</Text></Text>
            <Text>{error.message}</Text>
            <Text>{receivedAtDate.toLocaleString()}</Text>

            {event.exceptions.map(exception => (
                (exception.stacktrace || []).map((stacktraceItem, key) => (
                    <Card key={key} title={`${stacktraceItem.file}: ${stacktraceItem.line_number} ${stacktraceItem.method}`}>
                    <CodeBlock>
                        {Object.keys(stacktraceItem.code || {}).map(lineNumber => (
                            <Text key={lineNumber}>{lineNumber}: {stacktraceItem.code[lineNumber]}</Text>
                        ))}
                    </CodeBlock>
                    </Card>
                ))
            ))}
        </ScrollView>
    );
};

export default EventDetail;
