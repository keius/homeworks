import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
//
// const addLoggingToDispatch = (store) => {
//   let oldDispatch = store.dispatch;
//   return (action) => {
//     console.log(store.getState());
//     console.log(action);
//     oldDispatch(action);
//     console.log(store.getState());
//   };
// };

const addLoggingToDispatch = store => next => action => {
  console.log(store.getState());
    console.log(action);
    next(action);
    console.log(store.getState());
};

const applyMiddlewares = (store, middlewares) => {
  let dispatch = store.dispatch;
  middlewares.forEach (middleware => {
    dispatch = middleware(store)(dispatch);
  });
  Object.assign({}, store, { dispatch });
};
