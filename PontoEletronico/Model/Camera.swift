import UIKit

final class Camera: NSObject {

    func openCamera(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.cameraDevice = UIImagePickerController.isCameraDeviceAvailable(.front) ? .front: .rear
        controller.present(imagePicker, animated: true)
    }
}
