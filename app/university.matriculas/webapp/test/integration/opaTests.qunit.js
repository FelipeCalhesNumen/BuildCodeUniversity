sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'university/matriculas/test/integration/FirstJourney',
		'university/matriculas/test/integration/pages/MatriculasList',
		'university/matriculas/test/integration/pages/MatriculasObjectPage'
    ],
    function(JourneyRunner, opaJourney, MatriculasList, MatriculasObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('university/matriculas') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheMatriculasList: MatriculasList,
					onTheMatriculasObjectPage: MatriculasObjectPage
                }
            },
            opaJourney.run
        );
    }
);