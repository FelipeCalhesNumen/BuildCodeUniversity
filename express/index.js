// import express from 'express'
const express = require('express');
const cal = require('./calculadora');

const app = express();

app.get('/', (req, res) => {
    const params = req.query;
    // encodeURI
    let str = 'Hello University!: '
    str += params.num1 + ' ' + params.num2 + ' '+ params.op
  res.send(str + '\n' + cal.calculadora(1,2,'+'))
})

app.listen(5000)