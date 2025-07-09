# 🤝 Contributing to Auralys - Mental Wellness Tracking App

Thank you for your interest in contributing to Auralys!  
We welcome all improvements, bug fixes, documentation, and ideas for this mental wellness tracking React Native app.

---

## 📝 How to Contribute

1. **Fork the repository**  
   Click the "Fork" button at the top right of this page.

2. **Clone your fork**
   ```bash
   git clone https://github.com/Alwil17/auralys.git
   cd auralys
   ```

3. **Create a new branch**
   ```bash
   git checkout -b my-feature
   ```

4. **Install dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

5. **Make your changes**
   - Add features, fix bugs, or improve documentation.
   - Follow React Native and Expo best practices.
   - Ensure changes align with mental wellness tracking objectives.

6. **Test your changes**
   ```bash
   npm run lint
   npx expo start
   ```

7. **Commit and push**
   ```bash
   git add .
   git commit -m "Describe your change"
   git push origin my-feature
   ```

8. **Open a Pull Request**
   - Go to your fork on GitHub.
   - Click "Compare & pull request".
   - Describe your changes and submit.

---

## 🌱 Branch Naming & Pull Request Rules

- **Branch naming convention:**
  - For new features: `feat/short-description`
  - For bug fixes: `bugfix/short-description`
  - For maintenance or chores: `chore/short-description`
  - For documentation: `docs/short-description`
  - Example:  
    ```
    git checkout -b feat/mood-tracking-screen
    git checkout -b bugfix/fix-navigation-issue
    git checkout -b feat/wellness-analytics
    ```

- **Pull Request Guidelines:**
  - Use a clear and descriptive title (e.g. `feat: add mood tracking screen`)
  - In the PR description, explain **what** you changed and **why**
  - Reference related issues by number if applicable (e.g. `Closes #42`)
  - Make sure your branch is up to date with the target branch (usually `main`)
  - Ensure the app builds and runs without errors before requesting a review
  - Assign reviewers if possible

---

## 🧑‍💻 Code Style

- Use TypeScript for type safety and better development experience.
- Follow React Native and Expo conventions.
- Use functional components with React hooks.
- Follow consistent naming conventions (camelCase for variables, PascalCase for components).
- Use meaningful component and variable names.
- Keep components small and focused on a single responsibility.
- Use proper TypeScript interfaces and types for props and state.

---

## 🏗️ Project Structure

When adding new features, follow the established architecture:

- `app/` - Main application screens and routes (using Expo Router)
- `app/_layout.tsx` - Root layout and navigation configuration
- `app/auth/` - Authentication screens (login, register)
- `app/intro/` - Onboarding and introduction screens
- `app/welcome/` - Welcome screens
- `components/` - Reusable UI components
- `constants/` - App constants and configuration
- `hooks/` - Custom React hooks
- `utils/` - Utility functions and helpers
- `assets/` - Images, fonts, and other static assets
- `types/` - TypeScript type definitions

---

## 🧪 Testing

- Test your changes by running the app on different platforms (iOS, Android, Web).
- Use `npx expo start` to test in development mode.
- Test on both light and dark themes if applicable.
- Ensure responsive design works across different screen sizes.
- Test navigation flows and user interactions.
- Check for accessibility compliance where applicable.

---

## 📚 Documentation

- Update the `README.md` if your change affects setup or usage.
- Add comments to complex components or logic.
- Document new screens and navigation flows.
- Update TypeScript interfaces when adding new props or data structures.
- Add JSDoc comments for utility functions and custom hooks.

---

## 🔒 Security & Privacy Considerations

- Follow GDPR compliance requirements for user data.
- Ensure proper handling of sensitive mental health data.
- Be mindful of data privacy in logs and error messages.
- Use secure storage for sensitive information.
- Implement proper authentication and authorization flows.

---

## 💡 Suggestions & Issues

- For feature requests or bug reports, please [open an issue](https://github.com/Alwil17/auralys/issues).
- Be clear and provide context, especially for mental wellness features.
- Consider user privacy and data sensitivity in all suggestions.
- Include screenshots or recordings for UI-related issues.

---

## 🛡️ Code of Conduct

Be respectful and constructive, especially given the sensitive nature of mental health applications.  
See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) if available.

---

Thank you for helping make Auralys a better mental wellness platform! 🚀💚