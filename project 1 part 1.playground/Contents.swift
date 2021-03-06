//part one
//store the player information in dictionaries

let player1: [String: String] =
    ["Name": "Joe Smith",
     "Height": "42.0",
     "Experience": "Yes",
     "Guardian(s)": "Jim and Jan Smith"]

let player2: [String: String] =
    ["Name": "Jill Tanner",
     "Height": "36.0",
     "Experience": "Yes",
     "Guardian(s)": "Clara Tanner"]

let player3: [String: String] =
    ["Name": "Bill Bon",
     "Height": "43.0",
     "Experience": "Yes",
     "Guardian(s)": "Sara and Jenny Bon"]

let player4: [String: String] =
    ["Name": "Eva Gordon",
     "Height": "45.0",
     "Experience": "No",
     "Guardian(s)": "Wendy and Mike Gordon"]

let player5: [String: String] =
    ["Name": "Matt Gill",
     "Height": "40.0",
     "Experience": "No",
     "Guardian(s)": "Charles and Sylvia Gill"]

let player6: [String: String] =
    ["Name": "Kimmy Stein",
     "Height": "41.0",
     "Experience": "No",
     "Guardian(s)": "Bill and Hillary Stein"]

let player7: [String: String] =
    ["Name": "Sammy Adams",
     "Height": "45.0",
     "Experience": "No",
     "Guardian(s)": "Jeff Adams"]

let player8: [String: String] =
    ["Name": "Karl Saygan",
     "Height": "42.0",
     "Experience": "Yes",
     "Guardian(s)": "Heather Bledsoe"]

let player9: [String: String] =
    ["Name": "Suzane Greenberg",
     "Height": "44.0",
     "Experience": "Yes",
     "Guardian(s)": "Henrietta Dumas"]

let player10: [String: String] =
    ["Name": "Sal Dali",
     "Height": "41.0",
     "Experience": "No",
     "Guardian(s)": "Gala Dali"]

let player11: [String: String] =
    ["Name": "Joe Kavalier",
     "Height": "39.0",
     "Experience": "No",
     "Guardian(s)": "Sam and Elaine Kavalier"]

let player12: [String: String] =
    ["Name": "Ben Finkelstein",
     "Height": "44.0",
     "Experience": "No",
     "Guardian(s)": "Aaron and Jill Finkelstein"]

let player13: [String: String] =
    ["Name": "Diego Soto",
     "Height": "41.0",
     "Experience": "Yes",
     "Guardian(s)": "Robin and Sarika Soto"]

let player14: [String: String] =
    ["Name": "Chloe Alaska",
     "Height": "47.0",
     "Experience": "No",
     "Guardian(s)": "David and Jamie Alaska"]

let player15: [String: String] =
    ["Name": "Arnold Willis",
     "Height": "43.0",
     "Experience": "No",
     "Guardian(s)": "Claire Willis"]

let player16: [String: String] =
    ["Name": "Phillip Helm",
     "Height": "44.0",
     "Experience": "Yes",
     "Guardian(s)": "Thomas Helm and Eva Jones"]

let player17: [String: String] =
    ["Name": "Les Clay",
     "Height": "42.0",
     "Experience": "Yes",
     "Guardian(s)": "Wynonna Brown"]

let player18: [String: String] =
    ["Name": "Herschel Krustofski",
     "Height": "45.0",
     "Experience": "Yes",
     "Guardian(s)": "Hyman and Rachel Krustofski"]

//declare variables for the other dictionaries I will need to create from the above dictionaries

var players: [[String: String]] = []
var experiencedPlayers: [[String: String]] = []
var inexperiencedPlayers: [[String: String]] = []
var averagePlayerHeight: [Float] = []
var teamDragon: [[String: String]] = []
var teamRaptors: [[String: String]] = []
var teamSharks: [[String: String]] = []
var theLeague: [[String: String]] = []

//I tried concatenating the players together but xcode kept timing out and said it was too complex even after I tried breaking it into a few different blocks. I wasn't able to find a way to append more than one at a time.

players.append(player1)
players.append(player2)
players.append(player3)
players.append(player4)
players.append(player5)
players.append(player6)
players.append(player7)
players.append(player8)
players.append(player9)
players.append(player10)
players.append(player11)
players.append(player12)
players.append(player13)
players.append(player14)
players.append(player15)
players.append(player16)
players.append(player17)
players.append(player18)

//part two
//It's time to break up the players into the experienced and inexperienced dictionaries.

for obj in players {
    if obj["Experience"] == "Yes" {
        experiencedPlayers.append(obj)
    } else {
        inexperiencedPlayers.append(obj)
    }
}

// This Assigns players to teams. Each team has 6 players. If I had more players to assign, I would add additional else if statements and adjust the rest of the code accordingly.

let teams = [teamSharks, teamRaptors, teamDragon]
let experiencedPlayersPerTeam = experiencedPlayers.count / teams.count
let inexperiencedPlayersPerTeam = inexperiencedPlayers.count / teams.count
let playersPerTeam = experiencedPlayersPerTeam + inexperiencedPlayersPerTeam
var counterExperiencedPlayers = 0
var counterInexperiencedPlayers = 0
for player in experiencedPlayers {
    if counterExperiencedPlayers < experiencedPlayersPerTeam {
        teamDragon.append(player)
    } else if counterExperiencedPlayers < experiencedPlayersPerTeam * experiencedPlayersPerTeam {
        teamSharks.append(player)
    } else {
        teamRaptors.append(player)
    }
    counterExperiencedPlayers += 1
}

for player in inexperiencedPlayers {
    if counterInexperiencedPlayers < inexperiencedPlayersPerTeam {
        teamDragon.append(player)
    } else if counterInexperiencedPlayers < inexperiencedPlayersPerTeam * inexperiencedPlayersPerTeam {
        teamSharks.append(player)
    } else {
        teamRaptors.append(player)
    }
    counterInexperiencedPlayers += 1
}

theLeague = teamRaptors + teamSharks + teamDragon
//print(teamRaptors)
//part three
//create loop to iterate over the teams so I can use string interpolation to create the letters
//https://stackoverflow.com/questions/36367362/swift-for-loop-expression-type-string-string-is-ambiguous-without-more
// helped me figure out how to get the values for the keys from the dictionary since teamRaptor["Name"] was not working
var letters: [String] = []
var teamName = ""
var practiceTime = ""
for obj in theLeague {
    let guardian = (obj["Guardian(s)"])
    let nameOfPlayer = (obj["Name"])
    
   if nameOfPlayer == "Karl Saygan" || nameOfPlayer == "Suzane Greenberg" || nameOfPlayer == "Diego Soto" || nameOfPlayer == "Sammy Adams" || nameOfPlayer == "Sal Dali" || nameOfPlayer == "Joe Kavalier" {
        teamName = "Sharks"
        practiceTime = "March 17th at 3 PM."
     } else if nameOfPlayer == "Phillip Helm" || nameOfPlayer == "Les Clay" || nameOfPlayer == "Herschel Krustofski" || nameOfPlayer == "Ben Finkelstein" || nameOfPlayer == "Chloe Alaska" || nameOfPlayer == "Arnold Willis" {
      teamName = "Raptors"
      practiceTime = "March 18th at 1 PM."
     } else {
     teamName = "Dragons"
     practiceTime = "March 17th at 1 PM."
    }
   
    // looked at the optional documentation in swift
    let bodyOfLetters = [("Dear \(guardian ?? ""), \(nameOfPlayer ?? "") has been placed on team \(teamName). The \(teamName) have practice on \(practiceTime) Please have the players wear appropriate clothing, shin guards, and cleats. We are looking forward to have a great season. See you on the field.")]


    for obj in bodyOfLetters {
        letters.append(obj)
    }
    
}

for letter in letters{
    print(letter)
}
