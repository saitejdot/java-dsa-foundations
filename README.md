# Java & DSA Foundations

A structured workspace for learning Core Java, Object-Oriented Programming, Spring Boot, and Data Structures and Algorithms (DSA).

## Repository Structure

```
java-dsa-foundations/
├── 01-syntax-and-loops/       # Data types, conditionals, loops, functions, Scanner I/O
├── 02-arrays-and-strings/     # 1D & 2D arrays, prefix sums, String & StringBuilder drills
├── 03-oop-fundamentals/       # Classes, inheritance, polymorphism, interfaces, console mini-projects
├── 04-collections-framework/  # ArrayList, HashMap, HashSet, ArrayDeque, PriorityQueue, Comparators
├── 05-recursion-and-sorting/  # Call stack tracing, base cases, custom sorting algorithms
├── 06-core-dsa-patterns/      # Two pointers, sliding window, binary search, stacks, linked lists
└── 07-springboot/              # Spring Core, REST APIs, JPA, validation, and Spring Boot projects
```

## Core Focus Areas

- **Java Fundamentals:** Writing clean, modular methods, understanding memory references vs. primitives, and avoiding $O(N^2)$ string concatenation bottlenecks.
- **Object-Oriented Design:** Applying encapsulation, abstraction, interfaces, and custom exception handling.
- **Java Collections Framework (JCF):** Leveraging built-in data structures with optimal time and space complexity.
- **Algorithmic Thinking:** Building problem-solving intuition and Big-O analysis prior to tackling advanced competitive and interview problems.
- **Spring Boot:** Building REST APIs and gradually integrating dependency injection, databases, security, and testing.

## Learning Path

1. **Java syntax and control flow** - Variables, operators, conditions, loops, methods, and input/output.
2. **Arrays and strings** - Indexing, traversal, multidimensional arrays, string manipulation, and common patterns.
3. **Object-Oriented Programming** - Encapsulation, inheritance, polymorphism, abstraction, interfaces, and exception handling.
4. **Collections and Java APIs** - Choosing the right JCF data structure and understanding complexity.
5. **Recursion and sorting** - Base cases, call stacks, divide-and-conquer, and sorting algorithms.
6. **DSA patterns** - Binary search, two pointers, sliding window, stacks, queues, linked lists, trees, and graphs.
7. **Spring Boot** - Dependency injection, configuration, REST controllers, service layers, JPA, and testing.

## Getting Started

### Prerequisites

- JDK 21
- Visual Studio Code
- Java Extension Pack for VS Code
- Git
- Maven or Gradle for Spring Boot projects

### Compile and Run a Java File

From the folder containing the source file:

```bash
javac Main.java
java Main
```

In VS Code, you can also open the Java file and use the **Run Java** action.

## Practice Workflow

- Create one folder for each topic or concept.
- Keep each exercise in a separate Java file or testable class.
- Start with a brute-force solution, then optimize for time and space.
- Record the problem, approach, complexity, and key edge cases near the solution.
- Add a `README.md` to larger mini-projects with setup and run instructions.
- Commit frequently with clear, focused messages.

## Commit Java Practice Changes

Run the automation script from the repository root:

```powershell
.\commit-java.ps1
```

To provide a custom commit message:

```powershell
.\commit-java.ps1 -Message "Add array practice problems"
```

The script commits and pushes only changed or added files with the `.java` extension.

## Automatic Git Backup

When this workspace is opened in VS Code, [autopush.ps1](./autopush.ps1) is launched through [.vscode/tasks.json](./.vscode/tasks.json). It checks for Git changes every 60 seconds and pushes them to `origin/main`.

The task is silent and does not reveal or focus the terminal. No commit is created when the workspace is unchanged.

## Tech Stack & Tools

- **Language:** Java (JDK 21)
- **Framework:** Spring Boot (added during the later learning stages)
- **IDE:** Visual Studio Code
- **Build Tools:** Maven or Gradle
- **Version Control:** Git and GitHub

## Related Repository

- **LeetCode Solutions:** [Data Structures and Algorithms](https://github.com/saitejdot/Data-Structures-Algorithms)