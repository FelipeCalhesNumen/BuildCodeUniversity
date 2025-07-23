sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'university/university/test/integration/FirstJourney',
		'university/university/test/integration/pages/AlunosList',
		'university/university/test/integration/pages/AlunosObjectPage'
    ],
    function(JourneyRunner, opaJourney, AlunosList, AlunosObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('university/university') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheAlunosList: AlunosList,
					onTheAlunosObjectPage: AlunosObjectPage
                }
            },
            opaJourney.run
        );
    }
);