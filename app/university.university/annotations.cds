using universitySrv as service from '../../srv/service';
using from '../annotations';

annotate service.Alunos with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : nome,
            Label : 'Nome',
        },
        {
            $Type : 'UI.DataField',
            Value : inscricao,
            Label : 'Inscrição',
        },
        {
            $Type : 'UI.DataField',
            Value : dataIngresso,
        },
        {
            $Type : 'UI.DataField',
            Value : indiceDesempenho,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
            @UI.Hidden,
        },
    ],
    UI.SelectionFields : [
        nome,
        inscricao,
        dataIngresso,
        indiceDesempenho,
    ],
    UI.HeaderFacets : [
    ],
    UI.FieldGroup #Main : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : dataIngresso,
            },
            {
                $Type : 'UI.DataField',
                Value : indiceDesempenho,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Main',
            Label : 'General Information',
            Target : '@UI.FieldGroup#Main',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Desempenho',
            ID : 'Desempenho',
            Target : '@UI.FieldGroup#Desempenho',
        },
    ],
    UI.FieldGroup #Desempenho : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : indiceDesempenho,
            },
            {
                $Type : 'UI.DataField',
                Value : dataIngresso,
            },
        ],
    },
);

