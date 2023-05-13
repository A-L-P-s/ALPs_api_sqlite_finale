# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#### Spanish ####
User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")

Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak", image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
#correct sentence:
Sentence.create(id: 200, challenge_id: 100, grammar_point: "presente", eng_grammar_point: "simple present", user_sent: "Él habla español y francés con fluidez.", ai_sent: "Él habla español y francés con fluidez.")
#incorrect sentence:
Sentence.create(id: 201, challenge_id: 100, grammar_point: "pretérito indefinido", eng_grammar_point: "past continous", user_sent: "Mi dos hijos estaban hablo francés al revisor de tren.", ai_sent: "Mis dos hijos estaban hablando francés al revisor del tren.")

Challenge.create(id: 101, user_id: 1, language: "Spanish", verb: "comer", eng_verb: "to eat", image_url: "https://images.unsplash.com/photo-1602273660127-a0000560a4c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80", image_alt_text: "Noodles, Chicken, and Momos")
#correct sentence:
Sentence.create(id: 202, challenge_id: 101, grammar_point: "presente", eng_grammar_point: "simple present", user_sent: "Me gusta comer sushi de vez en cuando.", ai_sent: "Me gusta comer sushi de vez en cuando.")
#incorrect sentence:
Sentence.create(id: 203, challenge_id: 101, grammar_point: "futuro simple", eng_grammar_point: "future tense", user_sent: "Mis hijos no comer platos de fideos.", ai_sent: "Mis hijos no comerán platos de fideos.")


#### Turkish ####
User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")

Challenge.create(id: 102, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go", image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
#correct sentence:
Sentence.create(id: 300, challenge_id: 102, grammar_point: "gelecek zaman", eng_grammar_point: "simple future", user_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.", ai_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.")
#incorrect sentence:
Sentence.create(id: 301, challenge_id: 102, grammar_point: "geçmiş zaman", eng_grammar_point: "past simple", user_sent: "Dün havalimana gittik ama arkadaşım uçak gelmedi.", ai_sent: "Dün havalimanına gittik, ancak arkadaşımızın uçağı gelmedi.")

Challenge.create(id: 103, user_id: 55, language: "Turkish", verb: "(i) istemek", eng_verb: "to understand", image_url: "https://plus.unsplash.com/premium_photo-1674831140622-93f54b70bfbf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Elephant")
# #correct sentence:
Sentence.create(id: 302, challenge_id: 103, grammar_point: "görüldü geçmiş zaman (miş)", eng_grammar_point: "evidential past tense", user_sent: "Hindistan'ı ziyaret ettiğinde bir fili binmiş.", ai_sent: "Hindistan'ı ziyaret ettiğinde bir fili binmiş.")
# #incorrect sentence:
Sentence.create(id: 303, challenge_id: 103, grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle", user_sent: "Filleri çok şey bilerek, hayvanat bahçesin işini alabildim.", ai_sent: "Filler hakkında çok şey bilerek, hayvanat bahçesinde işi alabildim.")


#### Spanish Words ####
# SpanishVerb.create(verb: "hablar", eng_verb: "to speak")
# SpanishVerb.create(verb: "bailar", eng_verb: "to dance")
# SpanishVerb.create(verb: "correr", eng_verb: "to run")
# SpanishVerb.create(verb: "dormir", eng_verb: "to sleep")
# SpanishVerb.create(verb: "comer", eng_verb: "to be eat")

#### Spanish Grammar Points ####
# SpanishGrammar.create(grammar_point: "presente", eng_grammar_point: "simple present")
# SpanishGrammar.create(grammar_point: "pretérito perfecto simple", eng_grammar_point: "simple past")
# SpanishGrammar.create(grammar_point: "futuro simple", eng_grammar_point: "simple future")
# SpanishGrammar.create(grammar_point: "pretérito indefinido", eng_grammar_point: "past continous")
# SpanishGrammar.create(grammar_point: "adverbio", eng_grammar_point: "adverb")


#### Turkish Words ####
# TurkishVerb.create(verb: "(e/a) gitmek", eng_verb: "to go")
# TurkishVerb.create(verb: "(i) istemek", eng_verb: "to want")
# TurkishVerb.create(verb: "(i) bilmek", eng_verb: "to know")
# TurkishVerb.create(verb: "(i) anlamak", eng_verb: "to understand")
# TurkishVerb.create(verb: "(den/dan) korkmak", eng_verb: "to be afraid")

#### Turkish Grammar Points ####
# TurkishGrammar.create(grammar_point: "geniş zaman", eng_grammar_point: "simple present")
# TurkishGrammar.create(grammar_point: "geçmiş zaman", eng_grammar_point: "simple past")
# TurkishGrammar.create(grammar_point: "görüldü geçmiş zaman (miş)", eng_grammar_point: "evidential past tense")
# TurkishGrammar.create(grammar_point: "gelecek zaman", eng_grammar_point: "simple future")
# TurkishGrammar.create(grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle")
