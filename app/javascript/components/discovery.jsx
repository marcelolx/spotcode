import React, { Fragment } from 'react';
import Album from './album';
import styled from 'styled-components';
import { Columns, Heading } from 'react-bulma-components';

const DivVSpaced= styled.div`
  margin-top: 50px;
`

const Discovery =() => {
  const albums_mock = [
    { artist_name: 'Andrew Howes', title: 'Gubernator', cover_url: '/rails/active_storage/...' },
    { artist_name: 'Andrew Howes', title: 'The Great Bear', cover_url: '/rails/active_storage/...' },
    { artist_name: 'Yellow Chair', title: 'Barcelona', cover_url: '/rails/active_storage/...' },
    { artist_name: 'Andrew Howes', title: 'Gubernator', cover_url: '/rails/active_storage/...' }
  ]
  
  return (
    <Fragment>
      <div>
        <Heading className='has-text-white' size={4}>
          Tocadas recentemente
        </Heading>
        <Columns className="is-mobile">

        </Columns>
      </div>

      <DivVSpaced>
        <Heading className='has-text-white' size={4}>
          Recomendadas
        </Heading>
        <Columns className='is-mobile'>

        </Columns>
      </DivVSpaced>
    </Fragment>
  )
}

export default Discovery;