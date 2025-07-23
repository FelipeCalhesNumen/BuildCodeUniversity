using universitySrv as service from '../../srv/service';
using from '../annotations';

annotate service.Matriculas with @(
    UI.SelectionFields : [
        aluno_ID,
        disciplina_ID,
        semestre,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Aluno',
            Value : aluno_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : aluno.inscricao,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Disciplina',
            Value : disciplina_ID,
        },
        {
            $Type : 'UI.DataField',
            Value : disciplina.departamento,
        },
    ],
);

