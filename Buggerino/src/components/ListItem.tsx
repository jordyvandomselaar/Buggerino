import React, {FunctionComponent} from 'react';
import {Container} from './Layout';

interface Props {}

const ListItem: FunctionComponent<Props> = ({children}) => {
  return <Container>{children}</Container>;
};

export default ListItem;
