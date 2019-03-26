import React from 'react';
import ReactDOM from 'react-dom';


// navbarのアイコンにmouseoverした際、背景色がwhiteになる処理
document.addEventListener('DOMContentLoaded', function(){
  document.querySelector('#navbar-brand').addEventListener('mouseover', function(e){
      e.currentTarget.style.backgroundColor = 'white'      
      });
      document.querySelector('#navbar-brand').addEventListener('mouseout', function(e){
      e.currentTarget.style.backgroundColor = ''     
     });  
  });    

