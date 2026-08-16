# Ember & Oak — E-Commerce

A classic cafe-themed website for a coffee shop with a royal, elegant feel.

IMPORTANT PROJECT HIGHLIGHTS (what you need to know)

- Build system: Maven (project includes pom.xml and Maven wrapper: mvnw, mvnw.cmd, and .mvn). Use ./mvnw to build/run consistently across environments.
- Framework: Spring Boot (parent 4.1.0). Java version set to 17 in the build.
- Web stack: Spring MVC + JSP (tomcat-embed-jasper + JSTL) — server-side rendered views under src/main/webapp/WEB-INF.
- Persistence: Spring Data JPA with MySQL (mysql-connector-j runtime dependency). Check application properties for JDBC URL and credentials.
- Security: Spring Security is enabled; custom security configuration classes are present (MySecurityConfg, adminConfiguratuion). Review access rules before production.

Key files and locations (review these first)

- pom.xml — project dependencies, Java version, build plugins (Spring Boot Maven plugin, compiler settings for Lombok).
- src/main/java/com/example/E_commerce/ECommerceApplication.java — Spring Boot main class. Important: it auto-creates an admin user on startup (see notes below).
- src/main/java/com/example/E_commerce/* — entities and configuration classes (AdminEntity.java, Coffee.java, MyConfiguration.java, MySecurityConfg.java, adminConfiguratuion.java).
- src/main/webapp/
  - style.css — main CSS for the site
  - main.js — client-side JS
  - WEB-INF/ — JSP templates (server-rendered UI)
- src/main/resources/ — application configuration files (look here for application.properties or application.yml)
- LICENSE — license file at repo root
- README.md — this file (project overview and important notes)

Startup & runtime notes

- Default Java: The project specifies Java 17. Ensure your environment has JDK 17+.
- Build and run with Maven wrapper:

  - Build: ./mvnw clean package
  - Run (development): ./mvnw spring-boot:run

- Database: The app expects a MySQL database. Provide DB connection details via application.properties / application.yml or environment variables. If no DB is available, the app may fail to start or run in a limited state.

Security & sensitive initialization (action required)

- Admin auto-creation: On startup the application retrieves UserRepository and PasswordEncoder and attempts to create an admin user if none exists. The current logic does a findByUsername("admin") but then creates an AdminEntity with username "UserName" and password encoded from the literal "Password". This is:
  - Confusing/buggy (check the username mismatch), and
  - A security risk (hardcoded credentials in code). Replace this with one of the following:
    - Read initial admin credentials from environment variables or an external config (recommended), or
    - Use a secure setup script / migration to create initial admin during deployment, or
    - Remove default credentials entirely and use a one-time setup process.

- Review MySecurityConfg and adminConfiguratuion.java for roles and access control. Ensure password encoding, CSRF protection, and role checks meet your security requirements before deploying to production.

Frontend & UX

- The UI uses server-side JSP templates and static assets (style.css, main.js). The CSS is substantial and contains the visual theme — check style.css to tune visuals and responsive behavior.
- main.js contains client-side behavior; ensure any sensitive endpoints are protected on the server side (don’t rely on frontend-only checks).

Testing & CI

- Tests: src/test exists — run tests with mvn test or ./mvnw test.
- CI: No GitHub Actions workflows detected at the repository root. Consider adding a simple workflow to run build/tests on pull requests.

Immediate recommended actions

1. Fix the startup admin-creation logic: stop hardcoding credentials and correct the username check.
2. Add application.properties.example or .env.example documenting expected environment variables (DB URL, DB user/pass, server port, admin credentials source).
3. Add a CI workflow (.github/workflows/ci.yml) to run ./mvnw -q -DskipTests=false test and build on PRs.
4. Review security config (MySecurityConfg and adminConfiguratuion.java) for production safety (password encoding, CSRF, session management).
5. Add documentation snippets to this README with the exact run commands and any required environment variables once confirmed.

Contributing

- Fork -> branch -> PR. Include tests for new backend behavior. Follow existing Java and JSP conventions.

Contact

Repository owner: https://github.com/lazyskiddie

---

Notes

This README now focuses on the important, actionable details (build, runtime, security, and where to look). If you want, I can:
- Update README further to include exact configuration values extracted from src/main/resources if an application.properties/application.yml exists, or
- Open PRs that implement the recommended fixes (admin creation, example env file, CI workflow). Tell me which you'd like and I'll proceed.
