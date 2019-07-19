# coding=utf-8

# 本脚本仅实现了数据的Push，数据采集请根据自己系统的情况进行编写，数据实时Push请自己实现。
# 本脚本也未实现自动Push，请自行小调整即可。
# 发送信息
import requests
import json
import pymysql
import time

try:

    
    conn2 = pymysql.connect(host='host', user='user', passwd='passwd', db='dbname', port=3306, charset='utf8')
    cur2 = conn2.cursor(cursor=pymysql.cursors.DictCursor)

except Exception:
    raise Exception("数据库连接异常")

company_id = 'diditaxi'


def curl(url, sql, IPCType, tag=1):
    cur2.execute(sql.format(company_id=company_id, ))
    result = cur2.fetchall()
	#  请自行根据提供的服务器修改IP
    url = "http://********:8080/{}?company={}".format(url,company_id)
    headers = {
        'content-type': 'application/json',
    }

    r = ""

    print("数量：{}".format(len(result)))

    if tag == 2:
        print('a')
        result = result[0]

        data = {
            "Source": "0",
            "CompanyId": company_id,
            "IPCType": IPCType,
            IPCType: result
        }

        r = requests.post(url, data=json.dumps(data), headers=headers)
        # if r.status_code != 201:
        #     raise Exception('error')
        print(url)
        print(r.status_code)
        time.sleep(1)

    else:
        lenght = len(result) - 1
        sept = 100
        for i in range(0, lenght + 1, sept):
            data = {
                "Source": "0",
                "CompanyId": company_id,
                "IPCType": IPCType,
                IPCType: result[i:i + sept]
            }

            print("{}:{} 数量：{}".format(i, i + sept, len(result[i:i + sept])))
            # print(data)
            r = requests.post(url, data=json.dumps(data), headers=headers)
            # if r.status_code != 201:
            #     raise Exception('error')
            print(url)
            print(r.status_code)
            # print(data['IPCType'])
            print("最终发送数量:{}".format(len(data[IPCType])))
            time.sleep(3)


def baseinfo_company():
    """
    网约车平台公司基本信息接口定义
    """
    url = "baseinfo/company"
    sql = """
    select `CompanyId`, `CompanyName`, `Identifier`, `Address`, `BusinessScope`, `ContactAddress`, `EconomicType`, 
    `RegCapital`, `LegalName`, `LegalID`, `LegalPhone`, `LegalPhoto`, `State`, `Flag`, `UpdateTime` 
    from a_baseinfo_company where CompanyId='{company_id}'
    """
    curl(url, sql, "baseInfoCompany", 2)


def baseinfo_companystat():
    """
    4.2 公司运营规模信息接口定义
    """
    url = "baseinfo/companystat"
    sql = """
    SELECT `CompanyId`, `VehicleNum`, `DriverNum`, `Flag`, `UpdateTime` FROM `a_baseinfo_companystat` where CompanyId='{company_id}'
    """
    curl(url, sql, "baseInfoCompanyStat", 2)


def baseinfo_companypay():
    """
    4.3 网约车平台公司支付信息接口
    """
    url = "baseinfo/companypay"
    sql = """
    SELECT `CompanyId`, `PayName`, `PayId`, `PayType`, `PayScope`, `PrepareBank`, 
    `CountDate`, `State`, `Flag`, `UpdateTime` FROM `a_baseinfo_companypay` where CompanyId='{company_id}'
    """
    curl(url, sql, "baseInfoCompanyPay")


def baseinfo_companyservice():
    """
    4.4 网约车平台公司服务机构接口定义
    """
    url = "baseinfo/companyservice"
    sql = """
    SELECT `CompanyId`, `Address`, `ServiceName`, `ServiceNo`, `DetailAddress`, `ResponsibleName`, 
    `ResponsiblePhone`, `ManagerName`, `ManagerPhone`, `ContactPhone`, `MailAddress`, `CreateDate`,
    `State`, `Flag`, `UpdateTime` FROM `a_baseinfo_companyservice` where CompanyId='{company_id}'
    """
    curl(url, sql, "baseInfoCompanyService", 2)


def baseinfo_companypermit():
    """
    4.5 网约车平台经营许可证接口
    """
    url = "baseinfo/companypermit"
    sql = """
    SELECT `CompanyId`, `Address`, `Certificate`, 
    `OperationArea`, `OwnerName`, `Organization`, `StartDate`, 
    `StopDate`, `CertifyDate`, `State`, `Flag`, `UpdateTime` 
    FROM `a_baseinfo_companypermit` where CompanyId='{company_id}'
    """
    curl(url, sql, "baseInfoCompanyPermit", 2)


def baseinfo_companyfare():
    """
    4.6 网约车平台公司运价信息接口
    """
    url = "baseinfo/companyfare"
    sql = """
    SELECT `CompanyId`, `Address`, `FareType`, `FareTypeNote`, `FareValidOn`, `FareValidOff`, `StartFare`, 
    `StartMile`, `UnitPricePerMile`, `UnitPricePerMinute`, `UpPrice`, `UpPriceStartMile`, `MorningPeakTimeOn`, 
    `MorningPeakTimeOff`, `EveningPeakTimeOn`, `EveningPeakTimeOff`, `OtherPeakTimeOn`, `OtherPeakTimeOff`, 
    `PeakUnitPrice`, `PeakPriceStartMile`, `LowSpeedPricePerMinute`, `NightPricePerMile`, `NightPricePerMinute`, 
    `OtherPrice`, `State`, `UpdateTime`, `Flag` 
    FROM `a_baseinfo_companyfare` where CompanyId='{company_id}'
    """
    curl(url, sql, "baseInfoCompanyFare", 2)


def baseinfo_vehicle():
    """
    4.7 车辆基本信息接口
    """

    url = "baseinfo/vehicle"
    sql = """
    SELECT `CompanyId`, `Address`, `VehicleNo`, `PlateColor`, `Seats`, `Brand`, `Model`, 
    `VehicleType`, `OwnerName`, `VehicleColor`, `EngineId`, `VIN`, `CertifyDateA`, 
    `FuelType`, `EngineDisplace`, `PhotoId`, `Certificate`, `TransAgency`, 
    `TransArea`, `TransDateStart`, `TransDateStop`, `CertifyDateB`, 
    `FixState`, `NextFixDate`, `CheckState`, `FeePrintId`, `GPSBrand`, `GPSModel`, 
    `GPSIMEI`, `GPSInstallDate`, `RegisterDate`, `CommercialType`, `FareType`, `State`, 
    `Flag`, `UpdateTime` FROM `a_baseinfo_vehicle` where CompanyId='{company_id}' order by id asc
    """
    curl(url, sql, "baseInfoVehicle")


def baseinfo_vehicleinsurance():
    """
    4.8 车辆保险接口
    """
    url = "baseinfo/vehicleinsurance"
    sql = """
    SELECT `CompanyId`, `VehicleNo`, `InsurCom`, `InsurNum`, `InsurType`, `InsurCount`, `InsurEff`,
     `InsurExp`, `Flag`, `UpdateTime` FROM `a_baseinfo_vehicleinsurance` where CompanyId='{company_id}' order by id asc
    """

    curl(url, sql, "baseInfoVehicleInsurance")


def baseinfo_vehicletotalmile():
    """
    4.9 车辆里程信息接口
    """
    url = "baseinfo/vehicletotalmile"
    sql = """
    SELECT `CompanyId`, `Address`, `VehicleNo`, `TotalMile`, `Flag`, `UpdateTime`
    FROM `a_baseinfo_vehicletotalmile` where CompanyId='{company_id}' order by id asc
    """
    curl(url, sql, "baseInfoVehicleTotalMile")


def baseinfo_driver():
    """
    4.10 驾驶员基本信息接口
    """
    url = "baseinfo/driver"
    sql = """
    SELECT `CompanyId`, `Address`, `DriverName`, `DriverPhone`, `DriverGender`, 
    `DriverBirthday`, `DriverNationality`, `DriverNation`, `DriverMaritalStatus`, 
    `DriverLanguageLevel`, `DriverEducation`, `DriverCensus`, `DriverAddress`, 
    `DriverContactAddress`, `PhotoId`, `LicenseId`, `LicensePhotoId`, `DriverType`, 
    `GetDriverLicenseDate`, `DriverLicenseOn`, `DriverLicenseOff`, `TaxiDriver`, 
    `CertificateNo`, `NetworkCarIssueOrganization`, `NetworkCarIssueDate`,  
    `GetNetworkCarProofDate`, `NetworkCarProofOn`, `NetworkCarProofOff`, `RegisterDate`, 
    `FullTimeDriver`, `InDriverBlacklist`, `CommercialType`, `ContractCompany`, `ContractOn`, 
    `ContractOff`, `EmergencyContact`, `EmergencyContactPhone`, `EmergencyContactAddress`, 
    `State`, `Flag`, `UpdateTime`
    FROM `a_baseinfo_driver` WHERE CompanyId='{company_id}' order by id asc limit 1
    """
    curl(url, sql, "baseInfoDriver")


def baseinfo_drivereducate():
    """
    4.11 网约车驾驶员培训信息接口
    """
    url = "baseinfo/drivereducate"
    sql = """
    SELECT `CompanyId`, `Address`, `LicenseId`, `CourseName`, `CourseDate`, 
    `StartTime`, `StopTime`, `Duration`, `Flag`, `UpdateTime` FROM `a_baseinfo_drivereducate`
    WHERE CompanyId='{company_id}'
    order by id asc
    """
    curl(url, sql, "baseInfoDriverEducate")


def baseinfo_driverapp():
    """
    4.12 驾驶员移动终端信息接口
    """
    url = "baseinfo/driverapp"
    sql = """
    SELECT `CompanyId`, `Address`, `LicenseId`, `DriverPhone`, `NetType`, 
    `AppVersion`, `MapType`, `State`, `Flag`, `UpdateTime` FROM `a_baseinfo_driverapp` 
    WHERE CompanyId='{company_id}'
    order by id asc 
    """
    curl(url, sql, "baseInfoDriverApp")


def baseinfo_driverstat():
    """
    4.13 驾驶员统计信息接口
    """
    url = "baseinfo/driverstat"
    sql = """
    SELECT `CompanyId`, `Address`, `LicenseId`, `Cycle`, `OrderCount`, 
    `TrafficViolationCount`, `ComplainedCount`, `Flag`, 
    `UpdateTime` FROM `a_baseinfo_driverstat` 
    WHERE CompanyId='{company_id}'
    order by id asc
    """
    curl(url, sql, "baseInfoDriverStat")


def baseinfo_passenger():
    """
    4.14 乘客基本信息接口
    """
    url = "baseinfo/passenger"
    sql = """
    SELECT `CompanyId`, `RegisterDate`, `PassengerPhone`, `PassengerName`, `PassengerGender`, `State`, `Flag`, `UpdateTime`
    FROM `a_baseinfo_passenger`
    WHERE CompanyId='{company_id}'
    """
    curl(url, sql, "baseInfoPassenger")


def order_create():
    """
    5.1 订单发起接口
    """
    url = "order/create"
    sql = """
    SELECT `CompanyId`, `Address`, `OrderId`, `DepartTime`, `OrderTime`, `PassengerNote`, `Departure`, 
    `DepLongitude`, `DepLatitude`, `Destination`, `DestLongitude`, `DestLatitude`, `Encrypt`, `FareType` 
    FROM `a_order_create` 
    WHERE CompanyId='{company_id}' order by OrderTime asc
    """
    curl(url, sql, "orderCreate")


def order_match():
    """
    5.2 订单成功接口
    """
    url = "order/match"
    sql = """
    SELECT  `CompanyId`, `Address`, `OrderId`, `Longitude`, `Latitude`, `Encrypt`, `LicenseId`, 
    `DriverPhone`, `VehicleNo`, `DistributeTime` FROM `a_order_match`
    WHERE CompanyId='{company_id}' order by DistributeTime asc
    """

    curl(url, sql, "orderMatch")


def order_cancel():
    """
    5.3 订单撤销接口
    """
    url = "order/cancel"
    sql = """
    SELECT `CompanyId`, `Address`, `OrderId`, `OrderTime`, `CancelTime`, `Operator`, 
    `CancelTypeCode`, `CancelReason` FROM `a_order_cancel`
    WHERE CompanyId='{company_id}' order by CancelTime asc
    """
    curl(url, sql, "orderCancel")


def operate_login():
    """
    6.1 车辆经营上线接口
    """
    url = "operate/login"
    sql = """
    SELECT `CompanyId`, `LicenseId`, `VehicleNo`, `LoginTime`, `Longitude`, `Latitude`, `Encrypt` FROM `a_operate_login`
    WHERE CompanyId='{company_id}' order by LoginTime asc
    """

    curl(url, sql, "operateLogin")


def operate_logout():
    """
    6.2 车辆经营下线接口
    """
    url = "operate/logout"
    sql = """
    SELECT `CompanyId`, `LicenseId`, `VehicleNo`, `LogoutTime`, `Longitude`, `Latitude`, `Encrypt` FROM `a_operate_logout` 
    WHERE CompanyId='{company_id}' order by LogoutTime asc
    """
    curl(url, sql, "operateLogout")


def operate_depart():
    """
    6.3 经营出发接口
    """
    url = "operate/depart"
    sql = """
    SELECT `CompanyId`, `OrderId`, `LicenseId`, `FareType`, `VehicleNo`, `DepLongitude`, `DepLatitude`, 
    `Encrypt`, `DepTime`, `WaitMile`, `WaitTime` FROM `a_operate_depart`
    WHERE CompanyId='{company_id}' order by DepTime asc
    """
    curl(url, sql, "operateDepart")


def operate_arrive():
    """
    6.4 经营到达接口
    """
    url = "operate/arrive"
    sql = """
    SELECT `CompanyId`, `OrderId`, `DestLongitude`, `DestLatitude`, `Encrypt`, 
    `DestTime`, `DriveMile`, `DriveTime` FROM `a_operate_arrive` 
    WHERE CompanyId='{company_id}' order by DestTime asc
    """
    curl(url, sql, "operateArrive")


def operate_pay():
    """
    6.5 经营支付接口定义
    """
    url = "operate/pay"
    sql = """
    SELECT `CompanyId`, `OrderId`, `OnArea`, `DriverName`, `LicenseId`, 
    `FareType`, `VehicleNo`, `BookDepTime`, `WaitTime`, `DepLongitude`, `DepLatitude`, 
    `DepArea`, `DepTime`, `DestLongitude`, `DestLatitude`, `DestArea`, `DestTime`, 
    `BookModel`, `Model`, `DriveMile`, `DriveTime`, `WaitMile`, `FactPrice`, `Price`, 
    `CashPrice`, `LineName`, `LinePrice`, `PosName`, `PosPrice`, `BenfitPrice`, 
    `BookTip`, `PassengerTip`, `PeakUpPrice`, `NightUpPrice`, `FarUpPrice`, `OtherUpPrice`, 
    `PayState`, `PayTime`, `OrderMatchTime`, `InvoiceStatus` FROM `a_operate_pay`
    WHERE CompanyId='{company_id}' order by PayTime asc
    """
    curl(url, sql, "operatePay")


def position_driver():
    """
    7.1 驾驶员定位信息接口
    """

    url = "position/driver"
    sql = """
    SELECT `CompanyId`, `LicenseId`, `DriverRegionCode`, `VehicleNo`, `PositionTime`, `Longitude`, 
    `Latitude`, `Encrypt`, `Direction`, `Elevation`, `Speed`, `BizStatus`, `OrderId` FROM `a_position_driver`
    WHERE CompanyId='{company_id}' order by PositionTime asc
    limit %d,1000
    """

    cur2.execute(
        "select count(*) as c from a_position_driver WHERE CompanyId='{company_id}'".format(company_id=company_id, ))
    count = cur2.fetchone()

    for index in range(0, count["c"], 1000):
        curl(url, sql % index, "positionDriver")


def position_vehicle():
    """
    7.2 车辆定位信息接口
    """
    url = "position/vehicle"
    sql = """
    SELECT `CompanyId`, `VehicleNo`, `VehicleRegionCode`, `PositionTime`, `Longitude`, 
    `Latitude`, `Speed`, `Direction`, `Elevation`, `Mileage`, `Encrypt`, `WarnStatus`, `VehStatus`, 
    `BizStatus`, `OrderId` FROM `a_position_vehicle`
    WHERE CompanyId='{company_id}' order by PositionTime asc
    LIMIT %d,1000
    """

    cur2.execute(
        "select count(*) as c from a_position_vehicle WHERE CompanyId='{company_id}'".format(company_id=company_id, ))
    count = cur2.fetchone()

    for index in range(0, count["c"], 1000):
        curl(url, sql % index, "positionVehicle")


def rated_passenger():
    """
    8.1 乘客评价信息接口
    """

    url = "rated/passenger"
    sql = """
    SELECT `CompanyId`, `OrderId`, `EvaluateTime`, `ServiceScore`, `DriverScore`, `VehicleScore`, `Detail` FROM `a_rated_passenger` 
    WHERE CompanyId='{company_id}' order by EvaluateTime asc
    """
    curl(url, sql, "ratedPassenger")


def rated_passengercomplaint():
    """
    8.2 乘客投诉信息接口
    """
    url = "rated/passengercomplaint"
    sql = """
    SELECT `CompanyId`, `OrderId`, `ComplaintTime`, `Detail`, `Result` FROM `a_rated_passengercomplaint` 
    WHERE CompanyId='{company_id}' order by ComplaintTime asc
    """

    curl(url, sql, "ratedPassengerComplaint")


def rated_driverpunish():
    """
    8.3 驾驶员处罚信息接口
    """
    url = "rated/driverpunish"
    sql = """
    SELECT `CompanyId`, `LicenseId`, `PunishTime`, `PunishReason`, `PunishResult` FROM `a_rated_driverpunish`
    WHERE CompanyId='{company_id}' order by PunishTime asc
    """
    curl(url, sql, "ratedDriverPunish")


def rated_driver():
    """
    8.4 驾驶员荣誉信息接口
    """
    url = "rated/driver"
    sql = """
    SELECT `CompanyId`, `LicenseId`, `Level`, `TestDate`, `TestDepartment` FROM `a_rated_driver`
    WHERE CompanyId='{company_id}'
    """
    curl(url, sql, "ratedDriver")


def main():
    # print(baseinfo_company.__doc__)
    # baseinfo_company()

    # print(baseinfo_companystat.__doc__)
    # baseinfo_companystat()

    # print(baseinfo_companypay.__doc__)
    # baseinfo_companypay()

    # print(baseinfo_companyservice.__doc__)
    # baseinfo_companyservice()

    # print(baseinfo_companypermit.__doc__)
    # baseinfo_companypermit()

    # print(baseinfo_companyfare.__doc__)
    # baseinfo_companyfare()

    # print(baseinfo_vehicle.__doc__)
    baseinfo_vehicle()

    # print(baseinfo_vehicleinsurance.__doc__)
    # baseinfo_vehicleinsurance()

    # print(baseinfo_vehicletotalmile.__doc__)
    # baseinfo_vehicletotalmile()

    # print(baseinfo_driver.__doc__)
    # baseinfo_driver()

    # print(baseinfo_drivereducate.__doc__)
    # baseinfo_drivereducate()

    # print(baseinfo_driverapp.__doc__)
    # baseinfo_driverapp()

    # print(baseinfo_driverstat.__doc__)
    # baseinfo_driverstat()

    # print(baseinfo_passenger.__doc__)
    # baseinfo_passenger()

    # print(order_create.__doc__)
    # order_create()

    # print(order_match.__doc__)
    # order_match()

    # print(order_cancel.__doc__)
    # order_cancel()

    # print(operate_login.__doc__)
    # operate_login()

    # print(operate_logout.__doc__)
    # operate_logout()

    # print(operate_depart.__doc__)
    # operate_depart()

    # print(operate_arrive.__doc__)
    # operate_arrive()

    # print(operate_pay.__doc__)
    # operate_pay()

    # print(position_driver.__doc__)
    # position_driver()

    # print(position_vehicle.__doc__)
    # position_vehicle()

    # print(rated_passenger.__doc__)
    # rated_passenger()

    # print(rated_passengercomplaint.__doc__)
    # rated_passengercomplaint()

    # print(rated_driverpunish.__doc__)
    # rated_driverpunish()

    # print(rated_driver.__doc__)
    # rated_driver()


if __name__ == "__main__":
    main()
