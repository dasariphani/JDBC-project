-- Database Setup Script
CREATE DATABASE IF NOT EXISTS quiz_db;
USE quiz_db;

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL
);

INSERT INTO questions (question_text, option_a, option_b, option_c, option_d, correct_option) VALUES
('What is a package in Java?', 'A collection of variables only', 'A collection of related classes, interfaces, and other types', 'A type of loop', 'A method inside a class', 'B'),
('Which keyword is used to declare a package in Java?', 'import', 'include', 'package', 'class', 'C'),
('Where should the package declaration normally appear in a Java source file?', 'After the class declaration', 'As the first statement, before imports and type declarations', 'Inside the main() method', 'At the end of the file', 'B'),
('Which package is imported automatically in every Java source file?', 'java.util', 'java.io', 'java.lang', 'java.net', 'C'),
('Which keyword allows you to use classes from another package?', 'package', 'import', 'extends', 'implements', 'B'),
('Which statement correctly imports the Scanner class?', 'import java.util.Scanner;', 'include java.util.Scanner;', 'package java.util.Scanner;', 'import Scanner.java.util;', 'A'),
('What does the following statement do? import java.util.*;', 'Imports only the Scanner class', 'Imports all packages in Java', 'Makes types in java.util available by their simple names', 'Creates a new package', 'C'),
('Which statement is correct about import java.util.*;?', 'It imports subpackages of java.util automatically.', 'It imports the accessible types directly within java.util, not its subpackages.', 'It imports only interfaces.', 'It imports only classes that have a main() method.', 'B'),
('Which of the following is a valid package name?', 'my package', '123package', 'com.college.student', 'com-college', 'C'),
('If a class belongs to the package college, which declaration is correct?', 'import college;', 'package college;', 'class package college;', 'include college;', 'B'),
('Which access modifier allows a member to be accessed from any package, provided the class itself is accessible?', 'private', 'Default (package-private)', 'protected', 'public', 'D'),
('A class member with no access modifier is accessible from:', 'Every package', 'Only the same class', 'Classes in the same package', 'Only subclasses in other packages', 'C'),
('Which access modifier restricts access to within the declaring class?', 'public', 'protected', 'private', 'Default', 'C'),
('A protected member can be accessed outside its package by:', 'Any unrelated class', 'A subclass, subject to Java’s protected-access rules', 'Only the main() method', 'No class', 'B'),
('Two classes belong to the same package. Which statement is correct?', 'They can access each other’s private members directly.', 'They can access each other’s package-private members.', 'They must always use import.', 'They must be in the same source file.', 'B'),
('Consider the following code. What happens? package demo; import java.util.Scanner; public class Test { public static void main(String[] args) { Scanner sc = new Scanner(System.in); } }', 'Compilation error because the package is named demo', 'Compilation error because Scanner cannot be imported', 'The code compiles, assuming the file and directory are set up correctly', 'Runtime error because all packages require inheritance', 'C'),
('If a class named Student belongs to package college, which is its fully qualified name?', 'Student.college', 'college.Student', 'college/Student', 'Student::college', 'B'),
('Which command can compile Student.java when it declares package college;, creating the package directory structure if needed?', 'javac -d . Student.java', 'java -d . Student.java', 'import -d . Student.java', 'package Student.java', 'A'),
('Suppose college.Student contains a public static void main(String[] args) method. If its compiled class is in the appropriate directory structure, how can you run it from the classpath root?', 'java Student', 'java college.Student', 'java package.Student', 'javac college.Student', 'B'),
('Which statement about packages is true?', 'Packages help organize related classes and avoid naming conflicts.', 'Every class must explicitly import java.lang.', 'A package can contain only one class.', 'Packages cannot contain interfaces.', 'A'),
('Can two different packages contain classes with the same simple name?', 'No, Java prohibits this.', 'Yes, if their fully qualified names differ.', 'Only if both classes are abstract.', 'Only if both classes have the same methods.', 'B'),
('Which is the correct way to use ArrayList without an import statement?', 'ArrayList a = new ArrayList();', 'java.util.ArrayList a = new java.util.ArrayList();', 'package.ArrayList a = new package.ArrayList();', 'import.ArrayList a = new import.ArrayList();', 'B'),
('Can a Java source file contain multiple package declarations?', 'Yes, one for every class', 'Yes, if separated by imports', 'No, a source file can have at most one package declaration', 'Only when using interfaces', 'C'),
('What is the relationship between a subpackage and its parent package? For example, java.util and java.util.concurrent.', 'A subpackage automatically inherits all accessible types from its parent package.', 'A subpackage is treated as a separate package.', 'Both names refer to the same package.', 'Subpackages cannot contain classes.', 'B'),
('Which statement about the import statement is correct?', 'It copies a class into the current package.', 'It changes the package to which a class belongs.', 'It allows a type to be referred to by its simple name, when unambiguous and accessible.', 'It is mandatory for every class used in a program.', 'C');
