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
Verb.create(language: "Spanish", verb: "dormir", eng_verb: "to sleep")
Verb.create(language: "Spanish", verb: "necesitar", eng_verb: "to need")
Verb.create(language: "Spanish", verb: "fascinar", eng_verb: "to facinate")
Verb.create(language: "Spanish", verb: "retrasar", eng_verb: "to postpone")
Verb.create(language: "Spanish", verb: "aclarar", eng_verb: "to clarify")

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
Challenge.create(id: 100, user_id: 1, language: "Spanish", verb: "hablar", eng_verb: "to speak",
                 image_url: "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80", image_alt_text: "Paris from above")
Sentence.create(id: 40, challenge_id: 100, grammar_point: "presente", eng_grammar_point: "simple present tense", user_sent: "Él habla español y francés con fluidez.",
                ai_sent: "Él habla español y francés con fluidez.", ai_explanation: "This sentence is correct. Nice work rockstar!")
Sentence.create(id: 41, challenge_id: 100, grammar_point: "pretérito indefinido", eng_grammar_point: "simple past tense", user_sent: "Mi dos hijos estaban hablo francés al revisor de tren.",
                ai_sent: "Mis dos hijos estaban hablando francés al revisor del tren.", ai_explanation: "In the sentence, I corrected 'Mi' to 'Mis' to match the plurality of 'two sons', and changed 'hablo' to 'hablando' for correct verb tense. ")

Challenge.create(id: 101, user_id: 1, language: "Spanish", verb: "comer", eng_verb: "to eat",
                 image_url: "https://images.unsplash.com/photo-1602273660127-a0000560a4c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80", image_alt_text: "Noodles, Chicken, and Momos")
Sentence.create(id: 42, challenge_id: 101, grammar_point: "presente", eng_grammar_point: "simple present tense", user_sent: "Me gusta comer sushi de vez en cuando.",
                ai_sent: "Me gusta comer sushi de vez en cuando.", ai_explanation: "Correct! You win!")
Sentence.create(id: 43, challenge_id: 101, grammar_point: "futuro", eng_grammar_point: "simple future tense", user_sent: "Mis hijos no comer platos de fideos.",
                ai_sent: "Mis hijos no comerán platos de fideos.", ai_explanation: "Here, I added 'án' to 'comer' to correctly conjugate the verb into the future tense.")

Challenge.create(id: 102, user_id: 1, language: "Spanish", verb: "necesitar", eng_verb: "to need",
                 image_url: "https://images.unsplash.com/photo-1682253572700-4173885b68f2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80", image_alt_text: "playing guitar")
Sentence.create(id: 44, challenge_id: 102, grammar_point: "futuro", eng_grammar_point: "simple future tense", user_sent: "El hombre necesitará más práctica si quiere ser un buen guitarrista.",
                ai_sent: "El hombre necesitará más práctica si quiere ser un buen guitarrista.", ai_explanation: "This is grammatically correct in Spanish. Nice work!")
Sentence.create(id: 45, challenge_id: 102, grammar_point: "subjuntivo pasado", eng_grammar_point: "past subjunctive",
                user_sent: "Si yo hubiera necesitar ayuda, habría buscado a un profesor de guitarra que me enseñara.", ai_sent: "Si yo hubiera necesitado ayuda, habría buscado a un profesor de guitarra que me enseñara.",
                ai_explanation: "Here, I added 'ado' to 'necesitar' to properly conjugate the verb in the past perfect subjunctive, translating to 'If I had needed help...'.")

Challenge.create(id: 103, user_id: 1, language: "Spanish", verb: "retrasar", eng_verb: "to postpone",
                image_url: "https://images.unsplash.com/photo-1683567935687-2e22ca8c9805?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1767&q=80", image_alt_text: "walking at dusk in the mountains")
Sentence.create(id: 46, challenge_id: 103, grammar_point: "imperativo", eng_grammar_point: "imperative", user_sent: "Tu cena y disfruta del paisaje.", ai_sent: "Tu cena y disfruta del paisaje.",
                ai_explanation: "Good job my young padawan.")
Sentence.create(id: 47, challenge_id: 103, grammar_point: "pretérito indefinido", eng_grammar_point: "simple past tense", user_sent: "Retrasa su cena y disfrutó del paisaje.",
                ai_sent: "Retrasó su cena y disfrutó del paisaje.", ai_explanation: "Here, I changed 'Retrasa' to 'Retrasó' to match the past tense verb 'disfrutó', translating to 'He delayed his dinner and enjoyed the landscape.'")

###################### Turkish Language ######################

#### Verbs & GrammarPoints ####
Verb.create(language: "Turkish", verb: "(le/la) uğraşmak", eng_verb: "to deal with")
Verb.create(language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go")
Verb.create(language: "Turkish", verb: "(e/a) tavsiye etmek", eng_verb: "to recommend")
Verb.create(language: "Turkish", verb: "(e/a) aldırmamak", eng_verb: "to ignore")
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
GrammarPoint.create(language: "Turkish", grammar_point: "olumsuz geçmiş zaman (-me/-ma + di/-tı)", eng_grammar_point: "negative past tense")
GrammarPoint.create(language: "Turkish", grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense")
GrammarPoint.create(language: "Turkish", grammar_point: "zarf fiili (-erek/-arak)", eng_grammar_point: "adverbial participle")
GrammarPoint.create(language: "Turkish", grammar_point: "ulaçlar sebep (-me/-ma + kişi için)", eng_grammar_point: "because")
GrammarPoint.create(language: "Turkish", grammar_point: "ulaçlar amaç (-mek için)", eng_grammar_point: "in order to")

#### User ####
User.create(id: 55, name: "Deniz", preferred_lang: "Turkish")

#### Challenges & Sentences ####
Challenge.create(id: 50, user_id: 55, language: "Turkish", verb: "(e/a) gitmek", eng_verb: "to go",
                 image_url: "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Plane flying")
Sentence.create(id: 10, challenge_id: 50, grammar_point: "gelecek zaman (-ecek)", eng_grammar_point: "future tense", user_sent: "Yarın annem beni tatile bırakmak için havalimanına gidecek.",
                ai_sent: "Yarın annem, beni tatile bırakmak için havaalanına götürecek.", ai_explanation: "Here, the change is the verb 'gidecek' being replaced with 'götürecek'. The original sentence implies that the mother is the one going to the airport. The corrected sentence correctly implies that the mother is taking the speaker to the airport.")
Sentence.create(id: 11, challenge_id: 50, grammar_point: "olumsuz geçmiş zaman (-me/-ma + di/-tı)", eng_grammar_point: "negative past tense",
                user_sent: "Dün havalimana gittik ama arkadaşım uçak gelmedi.", ai_sent: "Dün havaalanına gittik ama arkadaşımın uçağı gelmedi.", ai_explanation: "I added the possessive suffix 'ın' to 'arkadaşım' to make 'arkadaşımın' which makes is possessive. This change corrects the sentence to indicate that it's the friend's plane that didn't arrive, not the friend themselves.")

Challenge.create(id: 51, user_id: 55, language: "Turkish", verb: "(i) bilmek", eng_verb: "to know",
                 image_url: "https://images.unsplash.com/photo-1525616332682-f763cf05c55e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80", image_alt_text: "Ganesha")
Sentence.create(id: 12, challenge_id: 51, grammar_point: "belirsiz geçmiş zaman (-miş)", eng_grammar_point: "evidential past tense",
                user_sent: "Hindistan'ı ziyaret ettiği için, bir fili binmeyi bilmiş.", ai_sent: "Hindistan'ı ziyaret ettiği için, bir filin üzerine binmeyi öğrendi.",
                ai_explanation: "Here, I changed 'bir filin binmeyı öğrendi' to 'bir filin üzerine binmeyi öğrendi'. The original phrase would literally mean 'he learned an elephant's riding', which is incorrect. The corrected phrase 'bir filin üzerine binmeyi öğrendi' translates to 'he learned to ride on an elephant', which is grammatically correct and conveys the intended meaning.")
Sentence.create(id: 13, challenge_id: 51, grammar_point: "zarf fiili (erek/arak)", eng_grammar_point: "adverbial participle",
                user_sent: "Filleri çok şey bilerek, hayvanat bahçesin işini alabildim.", ai_sent: "Filler hakkında çok şey bilerek, hayvanat bahçesinde işi alabildim.", 
                ai_explanation: "In the original Turkish sentence, I added 'hakkında' after 'Filler' to clarify that it means 'knowing a lot about elephants'. Also, I changed 'hayvanat bahçesin' to 'hayvanat bahçesinde' and 'işini alabildim' to 'işi alabildim' to correct the meaning to 'I could get a job at the zoo'.")

Challenge.create(id: 52, user_id: 55, language: "Turkish", verb: "(e/a) aldırmamak", eng_verb: "to ignore",
                 image_url: "https://images.unsplash.com/photo-1681477492304-374921480d2e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=772&q=80", image_alt_text: "holding a cappuccino")
Sentence.create(id: 14, challenge_id: 52, grammar_point: "ulaçlar amaç (-mek için)", eng_grammar_point: "in order to", user_sent: "Nişanlısının ailesini etkilemek için tuzlu kahveyi aldırmadı.",
                ai_sent: "Nişanlısının ailesini etkilemek için tuzlu kahveyi aldırmadı.", ai_explanation: "The sentene is correct. Nice work beautiful!")
Sentence.create(id: 15, challenge_id: 52, grammar_point: "şimdiki zaman resmi (-mekte)", eng_grammar_point: "formal present/present continuous tense",
                user_sent: "Kahveyi içerken etrafındaki herkesi aldırmamakta.", ai_sent: "Kahve içerken etrafındaki herkese aldırmamakta.", ai_explanation: "Removed the ending 'yi' on 'kahve' because it doesn't need to be a specific coffee.")

Challenge.create(id: 53, user_id: 55, language: "Turkish", verb: "(den/dan) etkilenmek", eng_verb: "to be influenced by",
                 image_url: "https://images.unsplash.com/photo-1682080307124-22e3e0bbc141?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80", image_alt_text: "experimental galaxy and ocean")
Sentence.create(id: 16, challenge_id: 53, grammar_point: "olumlu geçmiş zaman (-di/-tı)", eng_grammar_point: "positive past tense", user_sent: "Yakamozdan etkilendim.",
                ai_sent: "Yakamozdan etkilendim.", ai_explanation: "The sentence 'Yakamozdan etkilendim' is grammatically correct in Turkish and translates to 'I was impressed by the phosphorescence' or 'I was influenced by the sea sparkle' in English.")
Sentence.create(id: 17, challenge_id: 53, grammar_point: "ulaçlar sebep (-me/-ma + kişi için)", eng_grammar_point: "because",
                user_sent: "Denizin güzelliğiden etkilendiği için ay ışığına dans etti.", ai_sent: "Denizin güzelliğinden etkilendiği için ay ışığında dans etti.",
                ai_explanation: "The original phrase 'güzellikten etkilendiği' would translate to 'affected by beauty', which is nonspecific. The corrected phrase 'güzelliğinden etkilendiği' means 'affected by its beauty', referring specifically to the sea's beauty. I changed 'ay ışığına', 'danced to the moonlight' to 'ay ışığında' which translates to 'danced in the moonlight'.")

Verb.create(language: "Vietnamese", verb: "Đi", eng_verb: "to go")
Verb.create(language: "Vietnamese", verb: "Làm", eng_verb: "to do")
Verb.create(language: "Vietnamese", verb: "Học", eng_verb: "to study")
Verb.create(language: "Vietnamese", verb: "Ăn", eng_verb: "to eat")
Verb.create(language: "Vietnamese", verb: "Uống", eng_verb: "to drink")
Verb.create(language: "Vietnamese", verb: "Nói", eng_verb: "to speak")
Verb.create(language: "Vietnamese", verb: "Đọc", eng_verb: "to read")
Verb.create(language: "Vietnamese", verb: "Viết", eng_verb: "to write")
Verb.create(language: "Vietnamese", verb: "Nghe", eng_verb: "to listen")
Verb.create(language: "Vietnamese", verb: "Chơi", eng_verb: "to play")

GrammarPoint.create(language: "Vietnamse", grammar_point: "hiếm khi", eng_grammar_point: "Adverbs of Time and Frequency")
GrammarPoint.create(language: "Vietnamse", grammar_point: "ở đâu", eng_grammar_point: "Adverbs of Place")
GrammarPoint.create(language: "Vietnamse", grammar_point: "của", eng_grammar_point: "Possession")
GrammarPoint.create(language: "Vietnamse", grammar_point: "rất", eng_grammar_point: "Adjective Intensifiers")
GrammarPoint.create(language: "Vietnamse", grammar_point: "đã", eng_grammar_point: "past tense")
GrammarPoint.create(language: "Vietnamse", grammar_point: "sẽ", eng_grammar_point: "future tense")
GrammarPoint.create(language: "Vietnamse", grammar_point: "đang", eng_grammar_point: "present tense")
GrammarPoint.create(language: "Vietnamse", grammar_point: "bởi vì", eng_grammar_point: "because")
GrammarPoint.create(language: "Vietnamse", grammar_point: "nếu", eng_grammar_point: "conditional")


User.create(id: 10, name: "Hai", preferred_lang: "Vietnamese")

Challenge.create(id: 200, user_id: 10, language: "Vietnamese", verb: "Ăn", eng_verb: "to eat",
  image_url: "https://images.unsplash.com/photo-1682865990641-d897fe51f887?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NDgxNjV8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODQ4ODEyMDV8&ixlib=rb-4.0.3&q=80&w=1080", image_alt_text: "a building that has a lot of lights on it")
Sentence.create(id: 50, challenge_id: 200, grammar_point: "rất", eng_grammar_point: "adjective intensifiers", user_sent: "Tôi ăn rất nhiều.",
 ai_sent: "Tôi ăn rất nhiều.", ai_explanation: "This sentence is correct. Nice work rockstar!")
Sentence.create(id: 51, challenge_id: 200, grammar_point: "đang", eng_grammar_point: "present tense", user_sent: "Tôi đang ăn roi.",
 ai_sent: "Tôi đang ăn cơm.", ai_explanation: "The word 'roi' does not have a clear meaning in this context, and it doesn't fit grammatically in the sentence.")

Challenge.create(id: 201, user_id: 10, language: "Vietnamese", verb: "học", eng_verb: "to study",
  image_url: "https://images.unsplash.com/photo-1682621034494-2242e054972c?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NDgxNjV8MHwxfHJhbmRvbXx8fHx8fHx8fDE2ODQ4ODE5NDB8&ixlib=rb-4.0.3&q=80&w=1080", image_alt_text: "a fire burning in the middle of a blue sky")
Sentence.create(id: 52, challenge_id: 201, grammar_point: "đã", eng_grammar_point: "past present tense", user_sent: "Tôi đã học tiếng Anh được 3 năm.",
 ai_sent: "Tôi đã học tiếng Anh được 3 năm.", ai_explanation: "Correct! You win!")
Sentence.create(id: 53, challenge_id: 201, grammar_point: "nếu", eng_grammar_point: "conditional", user_sent: "Tôi sẽ học lập trình nếu mẹ cho không phép.",
 ai_sent: "Tôi sẽ học lập trình nếu mẹ cho phép.", ai_explanation: "If you want to say 'I will study coding if my mom lets me' in Vietnamese, you can use the following sentence: 'Tôi sẽ học lập trình nếu mẹ cho phép.'")