// 1. შევქმნათ Class-ი SuperEnemy with properties: String name, Int hitPoints (ანუ სიცოცხლის რაოდენობა). სურვილისამებრ დაამატებ properties რომელიც მას აღწერს.

class SuperEnemy {
    let name: String
    var hitPoint: Int
    
    init(name: String, hitPoint: Int) {
        self.name = name
        self.hitPoint = hitPoint
    }
}

// 2. შევქმნათ Superhero Protocol-ი. შემდეგი get only properties: String name, String alias, Bool isEvil და დიქშენარი (dictionary) superPowers [String: Int], სადაც String-ი არის სახელი და Int არის დაზიანება (damage). Method attack, რომელიც მიიღებს target SuperEnemy-ის და დააბრუნებს (return) Int-ს ანუ დარჩენილ სიცოცხლე. Method performSuperPower, რომელიც მიიღებს SuperEnemy-ის და დააბრუნებს (return) Int-ს, აქაც დარჩენილ სიცოცხლე.

protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get set } // პირობაში კი ეწერა რომ ყველა უნდა ყოფილიყო get only. მაგრამ იმ ცვლილებების გამო მოითხოვა ესე :)
    
    func attack(target: SuperEnemy) -> Int
    mutating func performSuperPower(target: SuperEnemy) -> Int
}

// 3. Superhero-ს extension-ი გავაკეთოთ სადაც შევქმნით method-ს რომელიც დაგვი-print-ავს ინფორმაციას სუპერ გმირზე და მის დარჩენილ superPower-ებზე.

extension Superhero {
    func remainingSuperpower() {
        if isEvil {
            print("Superhero's name is: \(name). His alias is \(alias). He is Evil. His remaining superpowers are: \(superPowers.keys)")
        } else {
            print("Superhero's name is: \(name). His alias is \(alias). He is not Evil. His remaining superpowers are: \(superPowers.keys)")
        }
    }
}

// 4. შევქმნათ რამოდენიმე სუპერგმირი Struct-ი რომელიც ჩვენს Superhero protocol-ს დააიმპლემენტირებს მაგ: struct SpiderMan: Superhero და ავღწეროთ protocol-ში არსებული ცვლადები და მეთოდები. attack მეთოდში -> 20-იდან 40-ამდე დავაგენერიროთ Int-ის რიცხვი და ეს დაგენერებული damage დავაკლოთ SuperEnemy-ს სიცოცხლეს და დარჩენილი სიცოცხლე დავაბრუნოთ( return). performSuperPower-ს შემთხვევაში -> დიქშენერიდან ერთ superPower-ს ვიღებთ და ვაკლებთ enemy-ს (სიცოცხლეს ვაკლებთ). ვშლით ამ დიქშენერიდან გამოყენებულ superPower-ს. გამოყენებული superPower-ი უნდა იყოს დარანდომებული. დარჩენილ enemy-ს სიცოცხლეს ვაბრუნებთ (return).

struct IronMan: Superhero {
    var name: String = "Tony Stark"
    var alias: String = "Iron Man"
    var isEvil: Bool = false
    var superPowers: [String : Int] = ["Repulsor Blast": 45,
                                       "Laser Beams":  50,
                                       "EMP": 55,
                                       "Smart Missiles": 40]
    
    func attack(target: SuperEnemy) -> Int {
        var generatedDamage = Int.random(in: 20...40)
        
        target.hitPoint -= generatedDamage
        
        print("\(alias) used attack on \(target.name) and dealt \(generatedDamage) damage. Now \(target.name) has \(target.hitPoint) hitpoints.")
        
        return target.hitPoint
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        var randomSuperPower = superPowers.randomElement()
        
        target.hitPoint -= randomSuperPower!.value
        superPowers.removeValue(forKey: randomSuperPower!.key)
        
        print("\(alias) used Super Power \"\(randomSuperPower!.key)\" on \(target.name) and dealt \(randomSuperPower!.value) damage. Now \(target.name) has \(target.hitPoint) hitpoints.")
        
        return target.hitPoint
    }
}

struct Thor: Superhero {
    var name: String = "Thor Odinson"
    var alias: String = "God of Thunder"
    var isEvil: Bool = false
    var superPowers: [String : Int] = ["Mjolnir: God Blast": 75,
                                       "Anti-Force":  55,
                                       "Force-Field": 60,
                                       "Thermo-Blast": 65]
    
    func attack(target: SuperEnemy) -> Int {
        var generatedDamage = Int.random(in: 20...40)
        
        target.hitPoint -= generatedDamage
        
        print("\(alias) used attack on \(target.name) and dealt \(generatedDamage) damage. Now \(target.name) has \(target.hitPoint) hitpoints.")
        
        return target.hitPoint
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        var randomSuperPower = superPowers.randomElement()
        
        target.hitPoint -= randomSuperPower!.value
        superPowers.removeValue(forKey: randomSuperPower!.key)
        
        print("\(alias) used Super Power \"\(randomSuperPower!.key)\" on \(target.name) and dealt \(randomSuperPower!.value) damage. Now \(target.name) has \(target.hitPoint) hitpoints.")
        
        return target.hitPoint
    }
}

struct DoctorStrange: Superhero {
    var name: String = "Stephen Strange"
    var alias: String = "Doctor Strange"
    var isEvil: Bool = false
    var superPowers: [String : Int] = ["Mystic Bolts": 70,
                                       "Chaos Magic":  50,
                                       "Eldritch Whips": 45,
                                       "Tao Mandalas": 65]
    
    func attack(target: SuperEnemy) -> Int {
        var generatedDamage = Int.random(in: 20...40)
        
        target.hitPoint -= generatedDamage
        
        print("\(alias) used attack on \(target.name) and dealt \(generatedDamage) damage. Now \(target.name) has \(target.hitPoint) hitpoints.")
        
        return target.hitPoint
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        var randomSuperPower = superPowers.randomElement()
        
        target.hitPoint -= randomSuperPower!.value
        superPowers.removeValue(forKey: randomSuperPower!.key)
        
        print("\(alias) used Super Power \"\(randomSuperPower!.key)\" on \(target.name) and dealt \(randomSuperPower!.value) damage. Now \(target.name) has \(target.hitPoint) hitpoints.")
        
        return target.hitPoint
    }
}


// 5. შევქმნათ class SuperheroSquad, რომელიც ჯენერიკ Superhero-s მიიღებს. მაგ: class SuperheroSquad<T: Superhero>. შევქმნათ array სუპერგმირების var superheroes: [T]. შევქმნათ init-ი. შევქმნათ method რომელიც ჩამოგვითვლის სქვადში არსებულ სუპერგმირებს.

class SuperHeroSquad<T: Superhero> {
    var superheroes: [T]
    
    init(superheroes: [T]) {
        self.superheroes = superheroes
    }
    
    func whoIsInThisSquad() {
        let arrayOfAliases = superheroes.map() { $0.alias }
        print("The Squad consists of: ", terminator: "")
        for alias in arrayOfAliases {
            print(alias, terminator: "; ")
        }
    }
}

class AnySuperhero: Superhero {
    var superhero: Superhero
    
    var name: String {
        return superhero.name // task-ის update-ში ეწერა რომ აქ უნდა ყოფილიყო base.name მაგრამ ეგრე არ გამოდიოდა. ესე პრობლემა არ აქვს.
    }
    
    var alias: String {
        return superhero.alias
    }
    
    var isEvil: Bool {
        return superhero.isEvil
    }
    
    var superPowers: [String : Int] {
        get {
            return superhero.superPowers
        }
        set {
            superhero.superPowers = newValue
        }
    }
    
    init(superhero: Superhero) {
        self.superhero = superhero
    }
    
    func attack(target: SuperEnemy) -> Int {
        return superhero.attack(target: target)
    }
    
    func performSuperPower(target: SuperEnemy) -> Int {
        return superhero.performSuperPower(target: target)
    }
    
}

// 6.ამ ყველაფრის მერე მოვაწყოთ ერთი ბრძოლა. 🤺🤜🏻🤛🏻 შევქმნათ method simulateShowdown. ეს method იღებს სუპერგმირების სქვადს და იღებს SuperEnemy-ს. სანამ ჩვენი super enemy არ მოკვდება, ან კიდევ სანამ ჩვენ სუპერგმირებს არ დაუმთავრდებათ სუპერ შესაძლებლობები გავმართოთ ბრძოლა. ჩვენმა სუპერ გმირებმა რანდომად შეასრულონ superPowers, ყოველი შესრულებული superPowers-ი იშლება ამ გმირის ლისტიდან. თუ გმირს დაუმთავრდა superPowers, მას აქვს ბოლო 1 ჩვეულებრივი attack-ის განხორციელება (ამ attack განხორიციელება მხოლოდ ერთხელ შეუძლია როცა superPowers უმთავრდება).

func simulateShowdown<T: AnySuperhero>(squad: SuperHeroSquad<T>, enemy: SuperEnemy) {
    print("Welcome to final Showdown. In this battle \(enemy.name) will stand against squad of Superheroes. Let's see who claims the victory.\n\n\(enemy.name) has \(enemy.hitPoint) at the beginning.\n")
    
    for superhero in squad.superheroes { // ალბათ ძაან და-nest-ილია. თავიდან უფრო ცუდი იყო :დ
        while !superhero.superPowers.isEmpty && enemy.hitPoint > 0 {
            superhero.performSuperPower(target: enemy)
            if superhero.superPowers.isEmpty {
                superhero.attack(target: enemy)
                if enemy.hitPoint > 0 {
                    squad.superheroes.removeAll { $0.alias == superhero.alias }
                    print("\(superhero.alias) has fallen in battle. RIP.")
                } else {
                    print("Superhero Squad has won battle against \(enemy.name).")
                    break
                }
            }
            if enemy.hitPoint <= 0 {
                print("Superhero Squad has won battle against \(enemy.name).")
                break
            }
        }
        if squad.superheroes.count == 0 {
            print("Superhero Squad has lost battle against \(enemy.name). Maybe we get him next time with better luck or more heroes 😈")
        }
    }
}
    
let thanos = SuperEnemy(name: "Thanos", hitPoint: 500)
let ironMan = IronMan()
let thor = Thor()
let doctorStrange = DoctorStrange()
let squad = SuperHeroSquad(superheroes: [AnySuperhero(superhero: ironMan), AnySuperhero(superhero: thor)])

simulateShowdown(squad: squad, enemy: thanos)
