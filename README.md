# Exam Seating Arrangement

This is a web application designed to manage exam seating arrangements for students. It provides functionalities for both students and administrators.

## Features

- **Student Login**: Students can log in to view their assigned room details.
- **Admin Login**: Administrators can log in to create new rooms, assign students, and manage seating arrangements.
- **Room Creation**: Admins can create new rooms and specify their capacity.
- **Student Assignment**: Admins can assign students to rooms, ensuring that no room exceeds its capacity.
- **Branch Allocation**: Students are assigned to rooms in a zigzag manner to ensure diversity, with no two students from the same branch sitting next to each other.

## Technologies Used

- **Java**: The core programming language used for backend development.
- **Maven**: Dependency management tool for Java projects.
- **Hibernate**: Object-relational mapping framework for database interaction.
- **Tomcat Server**: Servlet container used for hosting the application.
- **JSP (JavaServer Pages)**: Technology for creating dynamic web pages.
- **Bootstrap**: Frontend framework for designing responsive and visually appealing interfaces.
- **MVC Architecture**: Model-View-Controller architecture for organizing codebase.
- **Security Features**: Implemented security measures to prevent unauthorized access, including preventing multiple logins from the same student and restricting access to admin features.

## Setup Instructions

1. Clone the repository to your local machine.
2. Set up a local Tomcat server version 10 or above on your machine.
3. Import the project into your preferred IDE (e.g., NetBeans).
4. Ensure that Maven dependencies are resolved.
5. Configure the database connection settings in the `hibernate.cfg.xml` file.
6. Update your project's web application deployment descriptor (`web.xml`) to support Servlet 5.0, which is required for Tomcat 10.
7. Run the application on the local Tomcat server. Make sure to specify the correct Tomcat version in your IDE's run configurations.

These steps ensure compatibility with Tomcat version 10 and above. If you encounter any issues during setup or runtime, refer to the Tomcat documentation for version-specific guidance or consult the project's issue tracker on GitHub.

## Usage

1. Access the application through a web browser.
2. Students can log in using their credentials to view their assigned room details.
3. Admins can log in using their credentials to create rooms, assign students, and manage seating arrangements.

## Contributors

- [Soumik Maity](https://github.com/S0UMIK07)

## License

## License

This project is licensed under the MIT License. See the [LICENSE](https://opensource.org/licenses/MIT) for details.

## Acknowledgements

- Special thanks to [OpenAI](https://openai.com) for providing tools and resources for AI assistance.
- Acknowledge any libraries, frameworks, or resources used in the project.
- Special thanks to:
  - [YouTube](https://www.youtube.com) for tutorials and educational content.
  - [Stack Overflow](https://stackoverflow.com) for community-driven Q&A.
  - [Geeks for Geeks](https://www.geeksforgeeks.org) for coding tutorials and articles.
  - [JavaTPoint](https://www.javatpoint.com) for Java tutorials and learning resources.



