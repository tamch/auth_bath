//# xsc 17.5.3-9e1425-20170523

import Foundation
import SAPOData

public class PeopleMetadata {
    public static let source: String = "<edmx:Edmx xmlns:edmx=\"http://schemas.microsoft.com/ado/2007/06/edmx\" Version=\"1.0\">\n<edmx:DataServices xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\" m:DataServiceVersion=\"2.0\">\n<Schema xmlns:d=\"http://schemas.microsoft.com/ado/2007/08/dataservices\" xmlns:m=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\" xmlns=\"http://schemas.microsoft.com/ado/2008/09/edm\" Namespace=\"SAP_DigitalBriefcase_DEV.services.people\">\n<EntityType Name=\"PeopleType\">\n<Key>\n<PropertyRef Name=\"EMPNO\"/>\n</Key>\n<Property Name=\"EMPNO\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"72\"/>\n<Property Name=\"FIRST_NAME\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"72\"/>\n<Property Name=\"LAST_NAME\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"72\"/>\n<Property Name=\"EMAIL\" Type=\"Edm.String\" Nullable=\"false\" MaxLength=\"72\"/>\n<Property Name=\"PHOTO\" Type=\"Edm.String\" MaxLength=\"250\"/>\n<Property Name=\"JOB_TITLE\" Type=\"Edm.String\" MaxLength=\"500\"/>\n<Property Name=\"PHONE\" Type=\"Edm.String\" MaxLength=\"150\"/>\n<Property Name=\"BIO\" Type=\"Edm.String\" MaxLength=\"1000\"/>\n<Property Name=\"LINKEDIN\" Type=\"Edm.String\" MaxLength=\"200\"/>\n<Property Name=\"REGISTERED_DATE\" Type=\"Edm.DateTime\"/>\n</EntityType>\n<EntityContainer Name=\"people\" m:IsDefaultEntityContainer=\"true\">\n<EntitySet Name=\"People\" EntityType=\"SAP_DigitalBriefcase_DEV.services.people.PeopleType\"/>\n</EntityContainer>\n</Schema>\n</edmx:DataServices>\n</edmx:Edmx>\n"

    internal static let parsed: CSDLDocument = PeopleMetadata.parse()

    public static let document: CSDLDocument = PeopleMetadata.resolve()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)
        return parser.parseInProxy(PeopleMetadata.source, url: "SAP_DigitalBriefcase_DEV.services.people")
    }

    static func resolve() -> CSDLDocument {
        PeopleMetadata.EntityTypes.peopleType.registerFactory(ObjectFactory.with(create: { PeopleType() }))
        return PeopleMetadata.parsed
    }

    public class EntityTypes {
        public static let peopleType: EntityType = PeopleMetadata.parsed.entityType(withName: "SAP_DigitalBriefcase_DEV.services.people.PeopleType")
    }

    public class EntitySets {
        public static let people: EntitySet = PeopleMetadata.parsed.entitySet(withName: "People")
    }
}
