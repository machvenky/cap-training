using com.cap.training as db from '../db/schema';


/**
 * Serves administrators managing everything
 */
service AdminService @(path: '/admin') {

    entity Books   as projection on db.Books;
    entity Authors as projection on db.Authors;

annotate Books with @(restrict: [
    {
        grant: ['DELETE'],
        to   : 'admin',
        where: 'stock = 0'
    },
    {
        grant: [
            'READ',
            'CREATE',
            'UPDATE'
        ],
        to   : 'admin'
    }
]);

annotate Authors with @(requires: 'admin');


}

