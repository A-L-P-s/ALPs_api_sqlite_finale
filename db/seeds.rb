# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


###################### Spanish Language ######################

#### Verbs & GrammarPoints ####
Verb.create(language: "Spanish", verb: "hablar", eng_verb: "to speak")
Verb.create(language: "Spanish", verb: "bailar", eng_verb: "to dance")
Verb.create(language: "Spanish", verb: "averiguar", eng_verb: "to investigate")
Verb.create(language: "Spanish", verb: "descifrar", eng_verb: "to decipher")
Verb.create(language: "Spanish", verb: "comer", eng_verb: "to be eat")
Verb.create(language: "Spanish", verb: "apañar", eng_verb: "to arrange")
Verb.create(language: "Spanish", verb: "precisar", eng_verb: "to need/to require")
Verb.create(language: "Spanish", verb: "deslumbrar", eng_verb: "to dazzle")
Verb.create(language: "Spanish", verb: "retrasar", eng_verb: "to postpone")
Verb.create(language: "Spanish", verb: "esclarecer", eng_verb: "to clarify")

GrammarPoint.create(language: "Spanish", grammar_point: "presente", eng_grammar_point: "simple present tense")
GrammarPoint.create(language: "Spanish", grammar_point: "pretérito perfecto", eng_grammar_point: "present perfect tense")
GrammarPoint.create(language: "Spanish", grammar_point: "pretérito indefinido", eng_grammar_point: "simple past tense")
GrammarPoint.create(language: "Spanish", grammar_point: "pretérito imperfecto", eng_grammar_point: "imperfect past tense")
GrammarPoint.create(language: "Spanish", grammar_point: "futuro", eng_grammar_point: "simple future tense")
GrammarPoint.create(language: "Spanish", grammar_point: "condicional", eng_grammar_point: "conditional")
GrammarPoint.create(language: "Spanish", grammar_point: "imperativo", eng_grammar_point: "imperative")
GrammarPoint.create(language: "Spanish", grammar_point: "subjuntivo presente", eng_grammar_point: "subjunctive")
GrammarPoint.create(language: "Spanish", grammar_point: "subjuntivo pasado", eng_grammar_point: "past subjunctive")
GrammarPoint.create(language: "Spanish", grammar_point: "infinitivo", eng_grammar_point: "infinitive")

#### User ####
User.create(id: 1, name: "Alexis", preferred_lang: "Spanish")

#### Challenges & Sentences ####
Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak", image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
#correct:
Sentence.create(id: 200, challenge_id: 100, grammar_point: "presente", eng_grammar_point: "simple present tense", user_sent: "Él habla español y francés con fluidez.", ai_sent: "Él habla español y francés con fluidez.")
#incorrect:
Sentence.create(id: 201, challenge_id: 100, grammar_point: "pretérito indefinido", eng_grammar_point: "simple past tense", user_sent: "Mi dos hijos estaban hablo francés al revisor de tren.", ai_sent: "Mis dos hijos estaban hablando francés al revisor del tren.")

Challenge.create(id: 101, user_id: 1, language: "Spanish", verb: "comer", eng_verb: "to eat", image_url: "https://images.unsplash.com/photo-1602273660127-a0000560a4c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80", image_alt_text: "Noodles, Chicken, and Momos")
#correct:
Sentence.create(id: 202, challenge_id: 101, grammar_point: "presente", eng_grammar_point: "simple present tense", user_sent: "Me gusta comer sushi de vez en cuando.", ai_sent: "Me gusta comer sushi de vez en cuando.")
#incorrect:
Sentence.create(id: 203, challenge_id: 101, grammar_point: "futuro", eng_grammar_point: "simple future tense", user_sent: "Mis hijos no comer platos de fideos.", ai_sent: "Mis hijos no comerán platos de fideos.")


###################### Turkish Language ######################

#### Verbs & GrammarPoints ####
Verb.create(language: "Turkish", verb: "(le/la) uğraşmak", eng_verb: "to deal with")
Verb.create(language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go")
Verb.create(language: "Turkish", verb: "(e/a) tavsiye etmek", eng_verb: "to recommend")
Verb.create(language: "Turkish", verb: "(e/a) aldırmak", eng_verb: "to pay attention/to ignore")
Verb.create(language: "Turkish", verb: "(i) tercih etmek", eng_verb: "to prefer")
Verb.create(language: "Turkish", verb: "(i) bilmek", eng_verb: "to know")
Verb.create(language: "Turkish", verb: "(i) alışmak", eng_verb: "to get used to")
Verb.create(language: "Turkish", verb: "(den/dan) hoşlanmak", eng_verb: "to enjoy")
Verb.create(language: "Turkish", verb: "(den/dan) etkilenmek", eng_verb: "to be influenced by")
Verb.create(language: "Turkish", verb: "(den/dan) ödünç almak", eng_verb: "to borrow from")


GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman (-iyor)", eng_grammar_point: "present/present continuous tense")
GrammarPoint.create(language: "Turkish", grammar_point: "şimdiki zaman resmi (-mekte)", eng_grammar_point: "formal present/present continuous tense")
GrammarPoint.create(language: "Turkish", grammar_point: "geniş zaman (-ir/-er)", eng_grammar_point: "simple present tense")
GrammarPoint.create(language: "Turkish", grammar_point: "gelecek zaman (-ecek)", eng_grammar_point: "future tense")
GrammarPoint.create(language: "Turkish", grammar_point: "olumlu geçmiş zaman (-di/-tı)", eng_grammar_point: "positive past tense")
GrammarPoint.create(language: "Turkish", grammar_point: "olumsuz geçmiş zaman (-me/-ma +di/-tı)", eng_grammar_point: "negative past tense")
GrammarPoint.create(language: "Turkish", grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense")
GrammarPoint.create(language: "Turkish", grammar_point: "zarf fiili (-erek/-arak)", eng_grammar_point: "adverbial participle")
GrammarPoint.create(language: "Turkish", grammar_point: "ulaçlar sebep (-me/-ma +kişi için)", eng_grammar_point: "because")
GrammarPoint.create(language: "Turkish", grammar_point: "ulaçlar amaç (-mek için)", eng_grammar_point: "in order to")

#### User ####
User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")

#### Challenges & Sentences ####
Challenge.create(id: 102, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go", image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
#correct:
Sentence.create(id: 300, challenge_id: 102, grammar_point: "gelecek zaman (-ecek)", eng_grammar_point: "future tense", user_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.", ai_sent: "Yarın annem beni havalimanına bırakmak için araba kullanacak.")
#incorrect:
Sentence.create(id: 301, challenge_id: 102, grammar_point: "olumsuz geçmiş zaman (-me/-ma + di/-tı)", eng_grammar_point: "negative past tense", user_sent: "Dün havalimana gittik ama arkadaşım uçak gelmedi.", ai_sent: "Dün havalimanına gittik, ancak arkadaşımızın uçağı gelmedi.")

Challenge.create(id: 103, user_id: 55, language: "Turkish", verb: "(i) bilmek", eng_verb: "to know", image_url: "https://plus.unsplash.com/premium_photo-1674831140622-93f54b70bfbf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Elephant")
#correct:
Sentence.create(id: 302, challenge_id: 103, grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense", user_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.", ai_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.")
#incorrect:
Sentence.create(id: 303, challenge_id: 103, grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle", user_sent: "Filleri çok şey bilerek, hayvanat bahçesin işini alabildim.", ai_sent: "Filler hakkında çok şey bilerek, hayvanat bahçesinde işi alabildim.")
