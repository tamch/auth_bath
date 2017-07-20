// # Proxy Compiler 1.7.2.28

import Foundation
import SAPOData

open class SalesOrderHeader: EntityValue {
    public static let createdAt: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CreatedAt")

    public static let currencyCode: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CurrencyCode")

    public static let customerID: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerId")

    public static let grossAmount: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "GrossAmount")

    public static let lifeCycleStatus: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatus")

    public static let lifeCycleStatusName: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "LifeCycleStatusName")

    public static let netAmount: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "NetAmount")

    public static let salesOrderID: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "SalesOrderId")

    public static let taxAmount: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "TaxAmount")

    public static let customerDetails: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "CustomerDetails")

    public static let items: Property = ESPMContainerMetadata.EntityTypes.salesOrderHeader.property(withName: "Items")

    public init() {
        super.init(type: ESPMContainerMetadata.EntityTypes.salesOrderHeader)
    }

    open class func array(from: EntityValueList) throws -> Array<SalesOrderHeader> {
        return ArrayConverter.convert(from.toArray(), Array<SalesOrderHeader>())
    }

    open func copy() -> SalesOrderHeader {
        return CastRequired<SalesOrderHeader>.from(self.copyEntity())
    }

    open var createdAt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: SalesOrderHeader.createdAt))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.createdAt, to: value)
        }
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.currencyCode))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.currencyCode, to: StringValue.of(optional: value))
        }
    }

    

    open var customerID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.customerID))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.customerID, to: StringValue.of(optional: value))
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderHeader.grossAmount))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    
    open class func key(salesOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "SalesOrderId", value: StringValue.of(optional: salesOrderID))
    }

    open var lifeCycleStatus: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.lifeCycleStatus))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.lifeCycleStatus, to: StringValue.of(optional: value))
        }
    }

    open var lifeCycleStatusName: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.lifeCycleStatusName))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.lifeCycleStatusName, to: StringValue.of(optional: value))
        }
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderHeader.netAmount))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: SalesOrderHeader {
        get {
            return CastRequired<SalesOrderHeader>.from(self.oldEntity)
        }
    }

    open var salesOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: SalesOrderHeader.salesOrderID))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.salesOrderID, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: SalesOrderHeader.taxAmount))
        }
        set(value) {
            self.setDataValue(for: SalesOrderHeader.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
