# AI Project: Agricultural Advisory Chatbot
### Course: Artificial Intelligence | Logic Programming (Prolog)

---

## 1. Project Title

**AI-Powered Agricultural Advisory Chatbot Using Logic Programming**

---

## 2. Project Description

This project implements an AI-based agricultural advisory chatbot using Prolog logic programming. The system acts as a virtual agricultural expert that farmers can query to get advice on crop diseases, recommended treatments, suitable crops for their soil and season, fertilizer recommendations, and pest control. Instead of relying on a human expert, a farmer can ask the system questions and receive intelligent, logic-based answers derived from a structured knowledge base of agricultural facts and rules.

The system is built entirely using Prolog's declarative knowledge representation — facts describe the agricultural domain (crops, symptoms, diseases, soils, seasons), while rules derive new knowledge such as disease diagnosis and crop recommendations.

---

## 3. Functional Requirements

**FR1 — Crop Disease Diagnosis**
The system shall identify possible diseases affecting a crop based on the symptoms described by the farmer.

**FR2 — Treatment Recommendation**
The system shall recommend an appropriate treatment or remedy for a diagnosed crop disease.

**FR3 — Crop Recommendation**
The system shall suggest suitable crops for a farmer to grow based on their soil type and the current season.

**FR4 — Fertilizer Recommendation**
The system shall recommend an appropriate fertilizer type based on the crop being grown.

**FR5 — Pest Identification and Control**
The system shall identify the pest attacking a crop based on observed damage symptoms and suggest a control method.

**FR6 — Irrigation Advisory**
The system shall advise whether a crop requires irrigation based on the season in which it is grown.

**FR7 — Cash Crop Identification**
The system shall identify whether a given crop is a cash crop or a subsistence crop.

---

## 4. Knowledge Base (Prolog Implementation)

The knowledge base is written in SWI-Prolog. It contains **facts** (things that are unconditionally true) and **rules** (conditions that derive new knowledge). See the file `agri_chatbot_kb.pl` for the full implementation.

### Structure Overview

| Component | Description |
|-----------|-------------|
| Facts | Crops, symptoms, diseases, soils, seasons, pests, fertilizers |
| Rules | Diagnosis, treatment, crop recommendation, pest control, irrigation advice |

### Key Rules Explained

- `diagnose(Crop, Disease)` — Finds a disease by matching the crop's symptoms to known disease patterns.
- `recommend_treatment(Crop, Treatment)` — Chains diagnosis to treatment in one query.
- `recommend_crop(Soil, Season, Crop)` — Finds crops that grow in the given soil AND season.
- `recommend_fertilizer(Crop, Fertilizer)` — Looks up the fertilizer best suited for a crop.
- `identify_pest(Crop, Pest)` — Matches damage descriptions to known pests.
- `needs_irrigation(Crop)` — True if the crop is grown in the dry season.
- `is_cash_crop(Crop)` — True if the crop is classified as a cash crop.

---

## 5. Sample Interaction (Chatbot Session)

After loading the file, the farmer starts the chatbot by typing `input.` The system then asks about each symptom one by one. The farmer answers `yes.` or `no.` (with a period). At the end, the system prints its diagnosis and advice automatically.

```
?- consult('agri_chatbot_kb.pl').
true.

?- input.
Does your crop show: Yellowing leaves ? yes.
Does your crop show: Wilting of plant ? yes.
Does your crop show: Brown or dark spots on leaves ? yes.
Does your crop show: White powdery coating on leaves ? no.
Does your crop show: Stunted growth ? yes.
Does your crop show: Rotting at base of stem ? no.
Does your crop show: Holes in leaves ? no.
Does your crop show: Orange or rust colored spots ? no.
Does your crop show: Excessive pest presence on crop ? no.
Does your crop show: Dry and cracked soil around plant ? no.

============================================
   AGRICULTURAL ADVISORY CHATBOT REPORT
============================================

--- Possible Condition(s) Detected ---
>> Your crop may be affected by: leaf_blight
>> Your crop may be affected by: nitrogen_deficiency

--- Recommended Actions ---
* Apply nitrogen-rich fertilizer such as urea. Check soil pH and ensure adequate watering.
* Water the crop immediately. Check for root rot and improve field drainage.
* Apply copper-based fungicide. Remove and destroy infected leaves to prevent spread.
* Test soil nutrients and apply a balanced NPK fertilizer. Check for root-damaging pests.
```

---

## 6. How to Run the Project

1. Install **SWI-Prolog** from [https://www.swi-prolog.org](https://www.swi-prolog.org)
2. Open SWI-Prolog and load the knowledge base:
   ```prolog
   ?- consult('agri_chatbot_kb.pl').
   ```
3. Start the chatbot:
   ```prolog
   ?- input.
   ```
4. Answer each symptom question with `yes.` or `no.` (include the dot — it's required in Prolog)
5. The system will automatically print the diagnosis and treatment advice at the end.

---

*Project for AI Course | Up to 4 group members allowed*
