## Organizing Studied Content

***Chapter 1***  
[Quiz project]
- Design Pattern
  - MVC : Model - View - Controller
  - MVVM : Model - View - View Model
  - [learn more about Design Pattern](https://www.raywenderlich.com/160651/design-patterns-ios-using-swift-part-12)
- Auto Layout

***Chapter 2***  
[MyPlayground project]
- Type
  - Structure
  - Class
  - Enum
- Optional

***Chapter 3***  
[WorldTrotter project]
- View Hierarchy
  - UIWindow -> UIView -> UIView
  - view located focusing on superview
- Auto Layout
  - add constraints based on nearest neighbor

***Chapter 4***  
[WorldTrotter project]
- Text Field
- Delegate
  - delegate protocol : define methods
  - if method type -> optional : not necessary  
  else : necessary

***Chapter 5***  
[WorldTrotter project]
- View Controller
  - viewDidLoad() : called when view done loading
  - loadView() : making view controller's view by programming


***Chapter 6***  
[WorldTrotter project]
- Anchor
  - view's property
  - attribute : constrain by using other view's anchor
  - [learn more about Anchor and NSLayoutConstraint](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/ProgrammaticallyCreatingConstraints.html)
- Action-Target Design Pattern
  - use @objc func & action: #selector

***Chapter 7***  
[WorldTrotter project]
- Internationalization
  - interface apply to various language and region
- Localization
  - converting app's string and resource to new language
  - Localizable.strings

***Chapter 9***  
[Homepwner project]
- UITableView
  - MVC design pattern
  - ViewController, DataSource, Delegate needed
  - UITableViewDataSource, UITableViewDelegate: follow ViewController protocol
- Dependency Inversion Principle
  - usually use Dependency Injection pattern
  - [learn more about Dependency Inversion Principle](http://vandbt.tistory.com/42)

***Chapter 10***  
[Homepwner project]
- Learned Design Pattern
  - Delegation
  - DataSource
  - MVC
  - Target-Action

***Chapter 11***  
[Homepwner project]
- UITableViewCell
  - content view: automatically resize
- Dynamic Type
  - provide optimized text style

***Chapter 12***  
[Homepwner project]
- UIStackView
- Segue
  - sub-instance of UIStoryboardSegue
  - relocate another ViewController's view to screen
  - style, action-item, identifier
  - [learn more about segue](https://developer.apple.com/library/content/featuredarticles/ViewControllerPGforiPhoneOS/UsingSegues.html)

***Chapter 13***  
[Homepwner project]
- UINavigationController
  - UIViewController's subclass
  - before exchanging views -> call viewWillDisappear, viewWillAppear methods
  - deal with renewal of inset for table view
- UINavigationBar
  - edit, add
- UINavigationItem
  - title, leftBarButtonItem, rightBarButtonItem

***Chapter 14***  
[Homepwner project]
- UIImageView
  - show pictured or picked image
- UIImagePickerController
  - sourceType: .camera, .photoLibrary, .savedPhotosAlbum
  - UIImagePickerControllerDelegate follows UINavigationControllerDelegate
- UUID(universally unique identifier) or GUID
  - cocoa touch
  - making unique key
- [learn more about ImagePickerController](http://www.codingexplorer.com/choosing-images-with-uiimagepickercontroller-in-swift/)

***Chapter 15***  
[Homepwner project]
- Archiving
  - save and call object
  - generally used to save model object
  - classes must follow NSCoding protocol
- Unarchiving
  - remake object from archived data
  - classes must follow NSCoding protocol
- Application sandbox
  - Documents/, Library/Caches/, Library/Preferences/, tmp/
- NSKeyedArchiver, NSKeyedUnarchiver

***Chapter 16***  
[Homepwner project]
- Any Width | Any Height -> Any Width | Compact Height
- function (_ parameter)
  - if _ : don't mention parameter name
  - use _ at first parameter and write function name including first parameter name

***Chapter 17***
[TouchTracker]
- Structure
  - no inheritance
  - no initializer -> get initializer per member
  - value type(class: reference type)
- value type vs reference type
  - value type: allocate by copying the value
  - reference type: same instance's reference is given
- @IBInspectable
  - announce property, which wants to be set, using attribute inspector to interface builder
  - apply: CGPoint, CGSize, CGRect, UIColor, UIImage etc

***Chapter 18***
[TouchTracker]
- UIGestureRecognizer
  - Target-Action
  - func action(gestureRecognizer: UIGestureRecognizer)
- UIMenuController
  - have UIMenuItem object list and show at view
  - each list have title, action
  - only one per program
