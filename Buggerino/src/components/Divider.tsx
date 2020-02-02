import React, {FunctionComponent} from 'react';
import {Container} from './Layout';

interface Props {}

const Divider: FunctionComponent<Props> = () => {
  return <Container border="1px solid rgb(230,230,230)" />;
};

export default Divider;
