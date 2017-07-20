// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Employee: EntityValue {
    public static let employeeID: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "EmployeeID")

    public static let lastName: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "LastName")

    public static let firstName: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "FirstName")

    public static let title: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Title")

    public static let titleOfCourtesy: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "TitleOfCourtesy")

    public static let birthDate: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "BirthDate")

    public static let hireDate: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "HireDate")

    public static let address: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Address")

    public static let city: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "City")

    public static let region: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Region")

    public static let postalCode: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "PostalCode")

    public static let country: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Country")

    public static let homePhone: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "HomePhone")

    public static let `extension`: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Extension")

    public static let photo: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Photo")

    public static let notes: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Notes")

    public static let reportsTo: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "ReportsTo")

    public static let photoPath: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "PhotoPath")

    public static let employees1: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Employees1")

    public static let employee1: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Employee1")

    public static let orders: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Orders")

    public static let territories: Property = NorthwindEntitiesMetadata.EntityTypes.employee.property(withName: "Territories")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.employee)
    }

    open var `extension`: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.`extension`))
        }
        set(value) {
            self.setDataValue(for: Employee.`extension`, to: StringValue.of(optional: value))
        }
    }

    open var address: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.address))
        }
        set(value) {
            self.setDataValue(for: Employee.address, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<Employee> {
        return ArrayConverter.convert(from.toArray(), Array<Employee>())
    }

    open var birthDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Employee.birthDate))
        }
        set(value) {
            self.setDataValue(for: Employee.birthDate, to: value)
        }
    }

    open var city: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.city))
        }
        set(value) {
            self.setDataValue(for: Employee.city, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Employee {
        return CastRequired<Employee>.from(self.copyEntity())
    }

    open var country: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.country))
        }
        set(value) {
            self.setDataValue(for: Employee.country, to: StringValue.of(optional: value))
        }
    }

    open var employee1: Employee? {
        get {
            return CastOptional<Employee>.from(self.dataValue(for: Employee.employee1))
        }
        set(value) {
            self.setDataValue(for: Employee.employee1, to: value)
        }
    }

    open var employeeID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Employee.employeeID))
        }
        set(value) {
            self.setDataValue(for: Employee.employeeID, to: IntValue.of(value))
        }
    }

    open var employees1: Array<Employee> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Employee.employees1)).toArray(), Array<Employee>())
        }
        set(value) {
            Employee.employees1.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var firstName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Employee.firstName))
        }
        set(value) {
            self.setDataValue(for: Employee.firstName, to: StringValue.of(value))
        }
    }

    open var hireDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Employee.hireDate))
        }
        set(value) {
            self.setDataValue(for: Employee.hireDate, to: value)
        }
    }

    open var homePhone: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.homePhone))
        }
        set(value) {
            self.setDataValue(for: Employee.homePhone, to: StringValue.of(optional: value))
        }
    }

    open class func key(employeeID: Int) -> EntityKey {
        return EntityKey().with(name: "EmployeeID", value: IntValue.of(employeeID))
    }

    open var lastName: String {
        get {
            return StringValue.unwrap(self.dataValue(for: Employee.lastName))
        }
        set(value) {
            self.setDataValue(for: Employee.lastName, to: StringValue.of(value))
        }
    }

    open var notes: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.notes))
        }
        set(value) {
            self.setDataValue(for: Employee.notes, to: StringValue.of(optional: value))
        }
    }

    open var old: Employee {
        get {
            return CastRequired<Employee>.from(self.oldEntity)
        }
    }

    open var orders: Array<Order> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: Employee.orders)).toArray(), Array<Order>())
        }
        set(value) {
            Employee.orders.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open var photo: Data? {
        get {
            return BinaryValue.optional(self.dataValue(for: Employee.photo))
        }
        set(value) {
            self.setDataValue(for: Employee.photo, to: BinaryValue.of(optional: value))
        }
    }

    open var photoPath: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.photoPath))
        }
        set(value) {
            self.setDataValue(for: Employee.photoPath, to: StringValue.of(optional: value))
        }
    }

    open var postalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.postalCode))
        }
        set(value) {
            self.setDataValue(for: Employee.postalCode, to: StringValue.of(optional: value))
        }
    }

    open var region: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.region))
        }
        set(value) {
            self.setDataValue(for: Employee.region, to: StringValue.of(optional: value))
        }
    }

    open var reportsTo: Int? {
        get {
            return IntValue.optional(self.dataValue(for: Employee.reportsTo))
        }
        set(value) {
            self.setDataValue(for: Employee.reportsTo, to: IntValue.of(optional: value))
        }
    }

    
    open var title: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.title))
        }
        set(value) {
            self.setDataValue(for: Employee.title, to: StringValue.of(optional: value))
        }
    }

    open var titleOfCourtesy: String? {
        get {
            return StringValue.optional(self.dataValue(for: Employee.titleOfCourtesy))
        }
        set(value) {
            self.setDataValue(for: Employee.titleOfCourtesy, to: StringValue.of(optional: value))
        }
    }
}
