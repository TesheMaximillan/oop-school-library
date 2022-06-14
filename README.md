![](https://img.shields.io/badge/Microverse-blueviolet)

# University Locator

> In this project, I started building school library app. In this initial step, I implemented the classes to represent students and teachers.

## Project Requirement I:

* I Created a Person class with the following parameters:

      -> Instance vars: @id, @name, and @age.
      -> Constructor with name, age, and parent_permission as parameter. name and parent_permission are optional and have default values of "Unknown" and true.
      -> Getters for @id, @name, and @age.
      Setters for @name and @age.
      -> Private method is_of_age? that returns true if @age is greater or equal to 18 and false otherwise.
      -> Public method can_use_services? that returns true if person is of age or if they have permission from parents.

* I Created a Student class with the following parameters:

      -> Inherits from Person.
      -> Constructor extends parent's constructor by adding @classroom and a parameter for it.
      -> Method play_hooky that returns "¯\(ツ)/¯".

* I Created a Teacher class with the following parameters:

      -> Inherits from Person.
      -> Constructor extends parent's constructor by adding @specialization and a parameter for it.
      -> Override can_use_services? so it always returns true.

* Each class has saved in a separate file.

## Authors

👤 **Teshome Kurabachew**

- GitHub: [@githubhandle](https://github.com/TesheMaximillan)
- Twitter: [@twitterhandle](https://twitter.com/TesheKura)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/teshome-kurabachew-aa8067180/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/TesheMaximillan/oop-school-library/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](./MIT.md) licensed.
