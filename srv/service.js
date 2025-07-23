const cds = require('@sap/cds');

module.exports = class universitySrv extends cds.ApplicationService {
  init() {
    const { Alunos, Disciplinas, Matriculas } = cds.entities('universitySrv');

    this.before(['CREATE', 'UPDATE'], Alunos, async (req) => {
      console.log('Before CREATE/UPDATE Alunos', req.data);
    });

    this.after('READ', Alunos, async (alunos, req) => {
      console.log('After READ Alunos', alunos);
    });

    this.before(['CREATE', 'UPDATE'], Disciplinas, async (req) => {
      console.log('Before CREATE/UPDATE Disciplinas', req.data);
    });

    this.after('READ', Disciplinas, async (disciplinas, req) => {
      console.log('After READ Disciplinas', disciplinas);
    });

    this.before(['CREATE', 'UPDATE'], Matriculas, async (req) => {
      console.log('Before CREATE/UPDATE Matriculas', req.data);
    });

    this.after('READ', Matriculas, async (matriculas, req) => {
      console.log('After READ Matriculas', matriculas);
    });

    /**
     * @On(event = "matricular")
     */
    this.on('matricular', async (req) => {
      const { alunoId, disciplinaId } = req.data;

      if (!alunoId || !disciplinaId) {
        return false;
      }

      // Check if the Aluno exists
      const alunoExists = await SELECT.one.from(Alunos).where({ ID: alunoId });
      if (!alunoExists) {
        return false;
      }

      // Check if the Disciplina exists
      const disciplinaExists = await SELECT.one.from(Disciplinas).where({ ID: disciplinaId });
      if (!disciplinaExists) {
        return false;
      }

      // Insert the new Matricula record
      try {
        await INSERT.into(Matriculas).entries(
          {
            aluno_ID : alunoId,
            disciplina_ID: disciplinaId,
            semestre: 1,
            ano: 2025
          }
        );
        return true;
      } catch (error) {
        console.error('Error inserting Matricula:', error);
        return false;
      }
    });

    return super.init();
  }
};