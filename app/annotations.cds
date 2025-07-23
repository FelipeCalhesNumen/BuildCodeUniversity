using { universitySrv } from '../srv/service.cds';

annotate universitySrv.Alunos with @UI.HeaderInfo: { TypeName: 'Aluno', TypeNamePlural: 'Alunos', Title: { Value: nome } };
annotate universitySrv.Alunos with {
  ID @UI.Hidden @Common.Text: { $value: nome, ![@UI.TextArrangement]: #TextOnly }
};
annotate universitySrv.Alunos with @UI.Identification: [{ Value: nome }];
annotate universitySrv.Alunos with @UI.DataPoint #inscricao: {
  Value: inscricao,
  Title: 'Número de Inscrição',
};
annotate universitySrv.Alunos with {
  nome @title: 'Nome';
  inscricao @title: 'Número de Inscrição';
  dataIngresso @title: 'Data de Ingresso';
  indiceDesempenho @title: 'Índice de Desempenho';
  createdAt @title: 'Created At';
  createdBy @title: 'Created By';
  modifiedAt @title: 'Modified At';
  modifiedBy @title: 'Modified By'
};

annotate universitySrv.Alunos with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: inscricao },
 { $Type: 'UI.DataField', Value: dataIngresso },
 { $Type: 'UI.DataField', Value: indiceDesempenho },
 { $Type: 'UI.DataField', Value: createdAt, ![@UI.Hidden]},
];

annotate universitySrv.Alunos with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: inscricao },
 { $Type: 'UI.DataField', Value: dataIngresso },
 { $Type: 'UI.DataField', Value: indiceDesempenho },
 { $Type: 'UI.DataField', Value: createdAt },
 { $Type: 'UI.DataField', Value: createdBy },
 { $Type: 'UI.DataField', Value: modifiedAt },
 { $Type: 'UI.DataField', Value: modifiedBy }
  ]
};

annotate universitySrv.Alunos with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#inscricao' }
];

annotate universitySrv.Alunos with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate universitySrv.Alunos with @UI.SelectionFields: [
  nome, inscricao, dataIngresso
];

annotate universitySrv.Disciplinas with @UI.HeaderInfo: { TypeName: 'Disciplina', TypeNamePlural: 'Disciplinas', Title: { Value: nome } };
annotate universitySrv.Disciplinas with {
  ID @UI.Hidden @Common.Text: { $value: nome, ![@UI.TextArrangement]: #TextOnly }
};
annotate universitySrv.Disciplinas with @UI.Identification: [{ Value: nome }];
annotate universitySrv.Disciplinas with {
  departamento @title: 'Departamento';
  semestre @title: 'Semestre'
};

annotate universitySrv.Disciplinas with @UI.LineItem: [
 { $Type: 'UI.DataField', Value: departamento },
 { $Type: 'UI.DataField', Value: semestre }
];

annotate universitySrv.Disciplinas with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
 { $Type: 'UI.DataField', Value: departamento },
 { $Type: 'UI.DataField', Value: semestre }
  ]
};

annotate universitySrv.Disciplinas with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate universitySrv.Disciplinas with @UI.SelectionFields: [
  nome
];

annotate universitySrv.Matriculas with @UI.HeaderInfo: { TypeName: 'Matrícula', TypeNamePlural: 'Matrículas' };
annotate universitySrv.Matriculas with {
  aluno @Common.ValueList: {
    CollectionPath: 'Alunos',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: aluno_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'nome'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'inscricao'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'dataIngresso'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'indiceDesempenho'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'createdBy'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedAt'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'modifiedBy'
      },
    ],
  }
};
annotate universitySrv.Matriculas with {
  disciplina @Common.ValueList: {
    CollectionPath: 'Disciplinas',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: disciplina_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'nome'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'departamento'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'semestre'
      },
    ],
  }
};
annotate universitySrv.Matriculas with {
  semestre @Common.ValueList: {
    CollectionPath: 'Disciplinas',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: semestre_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'nome'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'departamento'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'semestre'
      },
    ],
  }
};
annotate universitySrv.Matriculas with @UI.LineItem: [
    { $Type: 'UI.DataField', Label: 'Aluno', Value: aluno_ID },
    { $Type: 'UI.DataField', Label: 'Disciplina', Value: disciplina_ID },
    { $Type: 'UI.DataField', Label: 'Semestre', Value: semestre_ID }
];

annotate universitySrv.Matriculas with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Label: 'Aluno', Value: aluno_ID },
    { $Type: 'UI.DataField', Label: 'Disciplina', Value: disciplina_ID },
    { $Type: 'UI.DataField', Label: 'Semestre', Value: semestre_ID }
  ]
};

annotate universitySrv.Matriculas with {
  aluno @Common.Text: { $value: aluno.nome, ![@UI.TextArrangement]: #TextOnly };
  disciplina @Common.Text: { $value: disciplina.nome, ![@UI.TextArrangement]: #TextOnly };
  semestre @Common.Text: { $value: semestre.nome, ![@UI.TextArrangement]: #TextOnly }
};

annotate universitySrv.Matriculas with {
  aluno @Common.Label: 'Aluno';
  disciplina @Common.Label: 'Disciplina';
  semestre @Common.Label: 'Semestre'
};

annotate universitySrv.Matriculas with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate universitySrv.Matriculas with @UI.SelectionFields: [
  aluno_ID,
  disciplina_ID,
  semestre_ID
];

