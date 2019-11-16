import React from "react";
import {BugsnagError} from "../../types/BugsnagError";
import {BugsnagEvent} from "../../types/BugsnagEvent";
import {Text} from "react-native-elements";
import styled from "styled-components";
import {ScrollView, View} from "react-native";
import ErrorItem from "../atoms/ErrorItem";

interface IProps {
    error: BugsnagError
    event: BugsnagEvent,
}

const CodeBlock = styled(View)`
  background-color: #f0f0f0;
  padding: 10px;
  margin: 0 10px;
  border-radius: 5px;
`;

const StacktraceHeaderText = styled(Text)`
  font-size: 18px;
  text-align: center;
  padding-bottom: 20px;
`;

const StacktraceItem = styled(View)`
  margin-bottom: 20px;
`;

const EventDetail = ({error, event}: IProps) => {
    return (
        <ScrollView>
            <ErrorItem error={error} event={event}/>

            {event.exceptions.map(exception => (
                (exception.stacktrace || []).map((stacktraceItem, key) => (
                    <StacktraceItem key={key}>
                        <StacktraceHeaderText>
                            {stacktraceItem.file}:{stacktraceItem.line_number} - {stacktraceItem.method}
                        </StacktraceHeaderText>
                    <CodeBlock>
                        {Object.keys(stacktraceItem.code || {}).map(lineNumber => (
                            <Text key={lineNumber}>{lineNumber}: {stacktraceItem.code[lineNumber]}</Text>
                        ))}
                    </CodeBlock>
                    </StacktraceItem>
                ))
            ))}
        </ScrollView>
    );
};

export default EventDetail;
