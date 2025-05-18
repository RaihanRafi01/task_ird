# Hadith App

## 📱 Overview

Hadith Explorer is a comprehensive mobile application that provides easy access to authenticated hadiths (sayings of Prophet Muhammad PBUH). The app offers an intuitive, user-friendly interface for exploring Islamic knowledge through a well-organized collection of hadiths categorized by books and chapters.

## ✨ Features

- **Book Browser**: Browse through different hadith books with information about hadith range and descriptions
- **Chapter Navigation**: Easily navigate through chapters within each book
- **Search Functionality**: Search chapters by name for quick access
- **Hadith Display**: Clean and organized display of hadiths with titles and detailed information
- **Offline Access**: Complete offline functionality with local database storage
- **Smooth Animations**: Enhanced user experience with elegant transitions and animations
- **Clean Architecture**: Well-structured codebase following clean architecture principles

## 🛠️ Tech Stack

- **Flutter**: UI framework for cross-platform mobile development
- **GetX**: State management, navigation, and dependency injection
- **Drift**: Local SQLite database for storing hadith collections
- **Clean Architecture**: Domain-driven design with separation of concerns
- **Animations**: Custom animations for enhanced user experience

## 📝 Database Structure

The app uses Drift (formerly Moor) as an SQLite wrapper with the following main tables:

- **Books**: Stores information about hadith books
- **Chapters**: Contains chapters for each book with searchable titles
- **Hadiths**: Contains the complete collection of hadiths with relevant metadata

## 🧩 Key Components

### Data Flow

```
User Interaction → Controller → UseCase → Repository → Local DataSource → Database
```

### State Management

The app uses GetX for:
- Reactive state management
- Navigation between screens
- Dependency injection
- Lifecycle management

### Clean Architecture Layers

- **Core Layer**: Cross-cutting concerns, utilities, constants, and shared components
- **Presentation Layer**: UI components and controllers
- **Domain Layer**: Business logic and use cases
- **Data Layer**: Data sources and repositories

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📷 Screen Shots

![Screenshot_20250518-101702 Hadith App](https://github.com/user-attachments/assets/92373cdb-bea7-4342-b503-f8a216dc292e)
![Screenshot_20250518-101710 Hadith App](https://github.com/user-attachments/assets/04de300e-623f-4697-9284-35e33669c9f2)
![Screenshot_20250518-101726 Hadith App](https://github.com/user-attachments/assets/ceebab80-df16-48c6-9c4f-17fef6651662)
![Screenshot_20250518-101743 Hadith App](https://github.com/user-attachments/assets/714902ba-a75a-4e9f-a6aa-66b296e55bff)
![Screenshot_20250518-101824 Hadith App](https://github.com/user-attachments/assets/767cfa76-4ce0-4f10-8985-9c345cd0bf1c)
![Screenshot_20250518-101926 Hadith App](https://github.com/user-attachments/assets/ba3d018d-82ce-4598-b99d-7ce5a1f2c2bb)

## 👨‍💻 Author

- Md. Raihanul Islam Rafi

--------------------------

If you found this project helpful or interesting, please consider giving it a star ⭐!
