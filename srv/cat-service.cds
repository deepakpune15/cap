using { sap.capire.bookshop as my } from '../db/schema';

using { northwind as external } from './external/northwind';

service CatalogService {

@readonly
    entity Products as projection on external.Products {
        key ProductID,
        ProductName	

    };

  /** For displaying lists of Books */
  @readonly entity ListOfBooks as projection on Books
  excluding { descr };

  /** For display in details pages */
  @readonly entity Books as projection on my.Books { *,
    author.name as author
  } excluding { createdBy, modifiedBy };

  @requires: 'authenticated-user'
  action submitOrder (
    book    : Books:ID @mandatory,
    quantity: Integer  @mandatory
  ) returns { stock: Integer };

  event OrderedBook : { book: Books:ID; quantity: Integer; buyer: String };
}
