using { university as my } from '../db/schema.cds';

@path: '/service/university'
// @requires: 'authenticated-user'
service universitySrv {
  
  entity Alunos as projection on my.Alunos;
  
  entity Disciplinas as projection on my.Disciplinas;
  
  entity Matriculas as projection on my.Matriculas;

  function matricular(alunoId: UUID, disciplinaId: UUID) returns String;
}