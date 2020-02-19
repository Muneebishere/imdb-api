# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

celeb1 = Celebrity.create(full_name: "Matt Damon", biography: "Matthew Paige Damon was born on October 8, 1970, in Boston, Massachusetts, to Kent Damon, a stockbroker, realtor and tax preparer, and Nancy Carlsson-Paige, an early childhood education professor at Lesley University. Matt has an older brother, Kyle, a sculptor. His father was of English and Scottish descent, and his mother is of Finnish", birth_date: Date.parse("8-10-1970"))
celeb2 = Celebrity.create(full_name: "Jon Bernthal", biography: "Jon Bernthal was born and raised in Washington D.C., the son of Joan (Marx) and Eric Bernthal, a lawyer. His grandfather was musician Murray Bernthal. Jon went to study at The Moscow Art Theatre School, in Moscow, Russia, where he also played professional baseball in the European professional baseball federation.", birth_date: Date.parse("20-9-1976"))
celeb3 = Celebrity.create(full_name: "Christian Bale", biography: "Christian Charles Philip Bale was born in Pembrokeshire, Wales, UK on January 30, 1974, to English parents Jennifer 'Jenny' (James) and David Bale. His mother was a circus performer and his father, who was born in South Africa, was a commercial pilot. The family lived in different countries throughout Bale's childhood, including England, Portugal", birth_date: Date.parse("30-1-1974"))
celeb4 = Celebrity.create(full_name: "Caitriona Balfe", biography: "Caitriona Balfe was born in Dublin, Ireland, and grew up in the village of Tydavnet, in County Monaghan. She started modeling at the age of 19 after she was scouted by an agent while she was collecting money for charity at a local mall. She has both walked the runway and been featured in advertising campaigns for many top fashion brands", birth_date: Date.parse("4-10-1979"))
celeb5 = Celebrity.create(full_name: "James Mangold", biography: "James Mangold is an American film and television director, screenwriter and producer. he has directed include Girl, Interrupted (1999), Walk the Line (2005), which he also co-wrote, the 2007 remake 3:10 to Yuma (2007), The Wolverine (2013), and Logan (2017).", birth_date: Date.parse("16-12-1963"))

celeb1.display_picture.attach(io: File.open('public/celebrity/display_pictures/matt_damon.jpg'), filename: "matt_damon.jpg")
celeb2.display_picture.attach(io: File.open('public/celebrity/display_pictures/jon_bernthal.jpg'), filename: "jon_bernthal.jpg")
celeb3.display_picture.attach(io: File.open('public/celebrity/display_pictures/christian_bale.jpg'), filename: "christian_bale.jpg")
celeb4.display_picture.attach(io: File.open('public/celebrity/display_pictures/caitriona_balfe.jpg'), filename: "caitriona_balfe.jpg")
celeb5.display_picture.attach(io: File.open('public/celebrity/display_pictures/james_mangold.jpg'), filename: "james_mangold.jpg")

