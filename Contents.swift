import Foundation

// optionals indicate a value that might or might not be present


/*
func multiplyByTwo(_ value: Int = 0) -> Int {
    value * 0
}
*/


func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

multiplyByTwo()
multiplyByTwo(nil)
multiplyByTwo(4)
multiplyByTwo(16)


// you can compare optionals with nil
// nil is a special value meaning that the absence of a value basically

let age: Int? = nil

if age != nil {
    "Age is there. How odd!"
} else {
    "Age is nil. Correct"
}

if let age {
    "Age is there. How odd! Its value is \(age) "
} else {
    "No age is present. As expected."
}


//  *************************************************

func checkAge() {  // this function value still optional. it is not unwrapped
    guard age != nil else {
        "Age is nil as expected"
        return
    }

    "Age is not nil here. Strange!"
}

checkAge()



let age2: Int? = 0
func checkAge2() { // with guard let this function value is not optional. it is unwrapped
    guard let age2 else {
        "Age2 is nil. How strange!"
        return
    }

    "Age2 is not nil as expected. Value = \(age2)"
}

checkAge2()

// ***************************************************

// optionals are actually an instance of an enumeration
// this optional enumeration has two cases

switch age {
    
// either is the value of none meaning that it is nil
case .none:
    "Age has no value as expected"
    break
    
// or it has some value inside it
case let .some(value): // of some we can unwrap it and say let's, say value. Before syntax: case .some(_):
    "Age has the value of \(value)"
    break
}


// ***************************************************
// Aşağıdaki iki yol da aynı anlama gelir. İlkinde optional olduğu hemen anlaşılmazken ikinci yolla optional olduğu hemen anlaşılır.

//1.This way uses to conditional

if age2 == 0 {
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange!"
}

//2.This way uses to enumeration

if age2 == .some(0) {
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange!"
}

if age2 == .none {
    "Age2 is 0 as expected, and is not nil"
} else {
    "Age2 is not 0. How strange!"
}

// ***************************************************
// optional chaning
// that means optionally access optional Properties or methods of some classes or structures

struct Person {
    let name: String
    let address: Address?
    
    struct Address {
        let firstLine: String?
    }
}

let person = Person(name: "John", address: nil)

if let firstLine = person.address?.firstLine {
    firstLine
} else {
    "person doesn't have an address."
}

if let personAddress = person.address,
   let firstLine = personAddress.firstLine {
    personAddress
    firstLine
}

let foo: Person? = Person(name: "Foo", address: Person.Address(firstLine: nil))

if foo?.name == "Foo",
   foo?.address?.firstLine == nil {
    "Foo has an address"
} else {
    "it doesn't work right"
}

// you can also switch on optionals where clauses using an optional chan

let baz: Person? = Person(name: "Baz", address: Person.Address(firstLine: "Baz first line"))

switch baz?.address?.firstLine {
    
case let .some(firstLine) where firstLine.starts(with: "Baz"):
    "Baz first address line = \(firstLine)"
    break
case let .some(firsLine):
    "Baz first address line that didn't match the previous case"
    firsLine
    break
case .none:
    "Baz first address line is nil."
    break
}

// *********************************************************

func getFullName(firstName: String, lastName: String?) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}

getFullName(firstName: "Baz", lastName: nil)
getFullName(firstName: "Baz", lastName: "Bar")

func getFullName2(firstName: String, lastName: String?) -> String? {
    guard let lastName else { return nil }
    
    return "\(firstName) \(lastName)"
}

getFullName2(firstName: "Baz", lastName: nil)
getFullName2(firstName: "Baz", lastName: "Bar")
