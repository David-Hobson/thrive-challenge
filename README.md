# Thrive Assessment!
Howdy folks! This repository contains the assessment code used for the [Full Stack Developer](https://thrivemycareer.applytojobs.ca/engineering/31322) position at Thrive.


# Quick Start
```
git clone https://github.com/David-Hobson/thrive-challenge.git
```

Challenge and input files are found in the `data/` directory. Parameters are defined at the top of the `challenge.rb` file and have the following defaults:
- Users: `/data/users.json`
- Companies: `/data/companies.json`
- Output: `/output.txt`

Run the challenge with the following command
```
ruby challenge.rb
```

# Structure
All source code lives in `/lib`. This was trying to follow [Ruby Gem Conventions]([https://](https://guides.rubygems.org/what-is-a-gem/)). Although this project is not setup to be a Gem, I think following it closely helps make the project easier for Ruby developers to understand.

### Models
The Thrive coding assessment is mainly powered by two models for generating token summaries. These models are the `User` and the `Company`. These two models represent the items of two files being imported. 

These two models have many advantages in terms of flexibility and reusability. Token reports can be generated for a single company or any single user without having to manipulate the models themselves. Furthermore, provided that the models are constructed properly they can still generate reports. If the importer were to be removed, or if the data were to change to .csv format you would only need to change the importer to interface with the existing models.

Potential improvements could be some data validation to check are make sure every parameter is set properly with the correct data, however this is something that would probably live at the database level in a real application.

### Utilities

Folder containing some utilities to help process the data. 

`importer.rb`: An importer that's used to read the JSON files and associate them to models. This importer is flexible if there were additional files to be read and new models to be created that follow a similar structure.

`associate_company_users.rb`: Used to essentially "JOIN" both of the models together in order to process data easier and keep things organized.

### Tests

There are a couple tests that can be found in `/test` which use [RSpec](https://rspec.info/). They mainly test the models that are used for generating the report and focus on testing happy path.

Tests can be ran with the following commands (NOTE RSpec will need to be installed):
```
rspec test/test_company.rb
rspec test/test_user.rb
```

### Misc
Also added some very light linting through [Rubocop](https://rubocop.org/) and configuration with `.rubocop.yml`. Mostly tried to follow the default conventions that Rubocop has with some minor exceptions to keep things simple.