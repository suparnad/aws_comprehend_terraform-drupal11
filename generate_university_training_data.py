import csv
import random

# Define labels and sample sentence templates
training_data = {
    "Admissions": [
        "Apply now for our {} programme starting this September.",
        "International students can submit applications by {}.",
        "Learn about scholarships and bursaries available for {}.",
        "Check entry requirements for {}.",
        "Explore admission deadlines for {} programmes."
    ],
    "Academics": [
        "{} is one of the most popular undergraduate degrees offered.",
        "View detailed course structures for {}.",
        "Discover modules and credits for {} programme.",
        "{} faculty maintains high academic standards.",
        "Research-led teaching is a hallmark of our {} department."
    ],
    "Research": [
        "{} research group focuses on cutting-edge developments in AI.",
        "Our university is part of a {} funded project.",
        "Recent publications highlight advances in {}.",
        "Faculty received research grants to explore {}.",
        "PhD students can work on {} innovation projects."
    ],
    "StudentLife": [
        "Join the {} club and meet students with similar interests.",
        "Student Union hosts weekly events like {}.",
        "Access wellbeing services and support through {}.",
        "Explore on-campus housing options at {} Halls.",
        "Take part in sports events like {} Championship."
    ],
    "Events": [
        "{} Open Day is scheduled for prospective students.",
        "Join our next {} webinar hosted by faculty.",
        "Attend the {} career fair this November.",
        "The {} conference will be held on campus this year.",
        "Don't miss our {} workshop next week."
    ],
    "News": [
        "University wins {} award for excellence.",
        "{} student group featured in national media.",
        "{} professor receives innovation funding.",
        "New partnership with {} announced in press release.",
        "{} research findings published in Nature journal."
    ]
}

# Fill-in options for placeholders
fillers = {
    "Admissions": ["Business", "Computer Science", "Engineering", "Medicine", "Law", "January 25", "Undergraduate", "Postgraduate Research", "Top-up Degree", "A-Level Entry"],
    "Academics": ["Computer Science", "Psychology", "Law", "Economics", "Design"],
    "Research": ["AI", "Cancer Therapy", "Green Energy", "Quantum Computing", "Climate Science", "public health", "renewable energy"],
    "StudentLife": ["Debate", "Film", "Hackathon", "Mindfulness", "City View"],
    "Events": ["Undergraduate", "Postgraduate", "Engineering", "Careers", "International Students"],
    "News": ["£5M Grant", "AI Society", "Professor Smith", "Imperial College", "Cancer Research"]
}

# Output file
filename = "modules/s3/training_data/university_training_data.csv"
rows_per_label = 50  # Minimum 50 recommended

with open(filename, "w", newline='', encoding="utf-8") as csvfile:
    writer = csv.writer(csvfile)
    for label, templates in training_data.items():
        for _ in range(rows_per_label):
            template = random.choice(templates)
            word = random.choice(fillers[label])
            sentence = template.format(word)
            writer.writerow([f"{label}", sentence])

print(f"Generated training data in {filename}")
