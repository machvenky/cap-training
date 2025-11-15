namespace com.cap.training;
using { cuid,managed , sap.common.CodeList} from '@sap/cds/common';

entity Books : cuid, managed {
    //key ID          : UUID;
        title       :  localized String(255); //@mandatory;
        author      : Association to Authors @assert.target; // one-to-one
        genre       : Genre @assert.range : [ 1, 2 ];
        publCountry : String(3);
        stock       : NoOfBooks;
        price       : Price;
        isHardcover : Boolean;
}

type Genre     : Integer enum {
    fiction     = 1;
    non_fiction = 2;
}

type NoOfBooks : Integer;

type Price {
    amount   : Decimal;
    currency : String(3);
}


entity Authors: cuid, managed  {
   // key ID          : UUID;
        name        : String(100);
        dateOfBirth : Date;
        dateOfDeath : Date;
        books       : Association to many Books // one-to-many 
                          on books.author = $self;
                          //<assocname>.<backlink> = $self
}

// aspect demo : CodeList {
//      empid: Integer;

// }

// extend Authors with demo;
// aspect demo {

//     age :Integer;
// }
