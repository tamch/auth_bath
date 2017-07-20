//# xsc 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class PeopleType: EntityValue {
    public static let empno: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "EMPNO")

    public static let firstName: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "FIRST_NAME")

    public static let lastName: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "LAST_NAME")

    public static let email: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "EMAIL")

    public static let photo: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "PHOTO")

    public static let jobTitle: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "JOB_TITLE")

    public static let phone: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "PHONE")

    public static let bio: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "BIO")

    public static let linkedin: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "LINKEDIN")

    public static let registeredDate: Property = PeopleMetadata.EntityTypes.peopleType.property(withName: "REGISTERED_DATE")

    public init() {
        super.init(type: PeopleMetadata.EntityTypes.peopleType)
    }

    open class func array(from: EntityValueList) -> Array<PeopleType> {
        return ArrayConverter.convert(from.toArray(), Array<PeopleType>())
    }

    open var bio: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.bio))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.bio, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> PeopleType {
        return CastRequired<PeopleType>.from(self.copyEntity())
    }

    open var email: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.email))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.email, to: StringValue.of(optional: value))
        }
    }

    open var empno: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.empno))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.empno, to: StringValue.of(optional: value))
        }
    }

    open var firstName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.firstName))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.firstName, to: StringValue.of(optional: value))
        }
    }

    open var jobTitle: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.jobTitle))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.jobTitle, to: StringValue.of(optional: value))
        }
    }

    open class func key(empno: String?) -> EntityKey {
        return EntityKey().with(name: "EMPNO", value: StringValue.of(optional: empno))
    }

    open var lastName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.lastName))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.lastName, to: StringValue.of(optional: value))
        }
    }

    open var linkedin: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.linkedin))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.linkedin, to: StringValue.of(optional: value))
        }
    }

    open var old: PeopleType {
        get {
            return CastRequired<PeopleType>.from(self.oldEntity)
        }
    }

    open var phone: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.phone))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.phone, to: StringValue.of(optional: value))
        }
    }

    open var photo: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PeopleType.photo))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.photo, to: StringValue.of(optional: value))
        }
    }

    open var registeredDate: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: PeopleType.registeredDate))
        }
        set(value) {
            self.setOptionalValue(for: PeopleType.registeredDate, to: value)
        }
    }
}
