namespace university;
using { cuid, managed } from '@sap/cds/common';

@assert.unique: { nome: [nome] }
entity Alunos : cuid, managed {
  nome: String(100) @mandatory;
  inscricao: String(20);
  dataIngresso: Date;
  indiceDesempenho: Decimal(5,2);
}

@assert.unique: { nome: [nome] }
entity Disciplinas : cuid {
  nome: String(100) @mandatory;
  departamento: String(50);
  semestre: Integer;
  ano: Integer;
}

entity Matriculas : cuid {
  aluno: Association to one Alunos;
  disciplina: Association to one Disciplinas;
  semestre: Integer;
  ano: Integer;
}

