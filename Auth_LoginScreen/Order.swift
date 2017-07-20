// # Proxy Compiler 17.5.3-9e1425-20170523

import Foundation
import SAPOData

open class Order: EntityValue {
    public static let orderID: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "OrderID")

    public static let customerID: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "CustomerID")

    public static let employeeID: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "EmployeeID")

    public static let orderDate: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "OrderDate")

    public static let requiredDate: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "RequiredDate")

    public static let shippedDate: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShippedDate")

    public static let shipVia: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipVia")

    public static let freight: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Freight")

    public static let shipName: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipName")

    public static let shipAddress: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipAddress")

    public static let shipCity: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipCity")

    public static let shipRegion: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipRegion")

    public static let shipPostalCode: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipPostalCode")

    public static let shipCountry: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "ShipCountry")

    public static let customer: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Customer")

    public static let employee: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Employee")

    public static let orderDetails: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Order_Details")

    public static let shipper: Property = NorthwindEntitiesMetadata.EntityTypes.order.property(withName: "Shipper")

    public init() {
        super.init(type: NorthwindEntitiesMetadata.EntityTypes.order)
    }

    open class func array(from: EntityValueList) -> Array<Order> {
        return ArrayConverter.convert(from.toArray(), Array<Order>())
    }

    open func copy() -> Order {
        return CastRequired<Order>.from(self.copyEntity())
    }

    

    open var customerID: String? {
        get {
            return StringValue.optional(self.dataValue(for: Order.customerID))
        }
        set(value) {
            self.setDataValue(for: Order.customerID, to: StringValue.of(optional: value))
        }
    }

    open var employee: Employee? {
        get {
            return CastOptional<Employee>.from(self.dataValue(for: Order.employee))
        }
        set(value) {
            self.setDataValue(for: Order.employee, to: value)
        }
    }

    open var employeeID: Int? {
        get {
            return IntValue.optional(self.dataValue(for: Order.employeeID))
        }
        set(value) {
            self.setDataValue(for: Order.employeeID, to: IntValue.of(optional: value))
        }
    }

    open var freight: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: Order.freight))
        }
        set(value) {
            self.setDataValue(for: Order.freight, to: DecimalValue.of(optional: value))
        }
    }

    open class func key(orderID: Int) -> EntityKey {
        return EntityKey().with(name: "OrderID", value: IntValue.of(orderID))
    }

    open var old: Order {
        get {
            return CastRequired<Order>.from(self.oldEntity)
        }
    }

    open var orderDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Order.orderDate))
        }
        set(value) {
            self.setDataValue(for: Order.orderDate, to: value)
        }
    }

    
    open var orderID: Int {
        get {
            return IntValue.unwrap(self.dataValue(for: Order.orderID))
        }
        set(value) {
            self.setDataValue(for: Order.orderID, to: IntValue.of(value))
        }
    }

    open var requiredDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Order.requiredDate))
        }
        set(value) {
            self.setDataValue(for: Order.requiredDate, to: value)
        }
    }

    open var shipAddress: String? {
        get {
            return StringValue.optional(self.dataValue(for: Order.shipAddress))
        }
        set(value) {
            self.setDataValue(for: Order.shipAddress, to: StringValue.of(optional: value))
        }
    }

    open var shipCity: String? {
        get {
            return StringValue.optional(self.dataValue(for: Order.shipCity))
        }
        set(value) {
            self.setDataValue(for: Order.shipCity, to: StringValue.of(optional: value))
        }
    }

    open var shipCountry: String? {
        get {
            return StringValue.optional(self.dataValue(for: Order.shipCountry))
        }
        set(value) {
            self.setDataValue(for: Order.shipCountry, to: StringValue.of(optional: value))
        }
    }

    open var shipName: String? {
        get {
            return StringValue.optional(self.dataValue(for: Order.shipName))
        }
        set(value) {
            self.setDataValue(for: Order.shipName, to: StringValue.of(optional: value))
        }
    }

    open var shipPostalCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: Order.shipPostalCode))
        }
        set(value) {
            self.setDataValue(for: Order.shipPostalCode, to: StringValue.of(optional: value))
        }
    }

    open var shipRegion: String? {
        get {
            return StringValue.optional(self.dataValue(for: Order.shipRegion))
        }
        set(value) {
            self.setDataValue(for: Order.shipRegion, to: StringValue.of(optional: value))
        }
    }

    open var shipVia: Int? {
        get {
            return IntValue.optional(self.dataValue(for: Order.shipVia))
        }
        set(value) {
            self.setDataValue(for: Order.shipVia, to: IntValue.of(optional: value))
        }
    }

    open var shippedDate: GlobalDateTime? {
        get {
            return GlobalDateTime.castOptional(self.dataValue(for: Order.shippedDate))
        }
        set(value) {
            self.setDataValue(for: Order.shippedDate, to: value)
        }
    }

    
}
