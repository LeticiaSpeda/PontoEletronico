import Foundation

enum Data {
    case time
    case dateTime
}

struct FormatTimeDate {
    func getDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-3")
        return dateFormatter.string(from: date)
    }

    func getTime(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.timeZone = TimeZone(abbreviation: "GMT-3")
        timeFormatter.dateFormat = "HH:mm"
        return timeFormatter.string(from: date)
    }
}
