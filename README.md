# 🕉️ Vadiraja Gurusarvabhouma - Sode Sri Vadiraja Matha Digital Platform
Vadiraja Gurusarvabhouma is a comprehensive digital platform for Sode Sri Vadiraja Matha built with Flutter and Spring Boot that streamlines temple operations and enhances devotee engagement. It features bilingual support (English/Kannada), role-based access control for Admin and User roles, comprehensive seva booking system with multiple payment modes, real-time content management for articles and announcements, event calendar with Tithinirnaya Panchanga, push notifications via Firebase Cloud Messaging, and powerful analytics dashboard for tracking bookings and user engagement. The application offers a responsive design optimized for both mobile and tablet views, includes features like gallery management, branch dictionary, contact management, and social media integration, maintaining complete operational transparency through comprehensive activity tracking.

<h2>Table of Contents</h2>
<ul>
  <li> <a href = "#About"> About </a></li>
  <ul>
   <li><a href="#wa"> What is Vadiraja Gurusarvabhouma? </a></li> 
   <li><a href="#features"> Features </a></li> 
   <li><a href="#why"> Why Vadiraja Gurusarvabhouma? </a></li>
  </ul>
  <li> <a href = "#getting_started"> Getting Started </a></li>
  <ul>
   <li><a href="#prerequisites"> Prerequisites </a></li> 
   <li><a href="#installation"> Installation </a></li> 
   <li><a href="#frontend_setup"> Building the App </a></li>
   <li><a href="#backend_setup"> Backend Setup </a></li>
  </ul>
  <li> <a href = "#tech_used"> TechStack Used </a></li>
  <li> <a href = "#architecture"> System Architecture </a></li>
  <li> <a href = "#app_demonstration"> App Demonstration & Testing </a></li>
  <li> <a href = "#conclusion"> Conclusion </a></li>
  <li> <a href = "#team"> Developed By </a></li>
</ul>

<section id = "About">
  <h2> About </h2>
  <h3 id = "wa"> What is Vadiraja Gurusarvabhouma? </h3>
    Vadiraja Gurusarvabhouma is a comprehensive digital platform designed to modernize and streamline temple operations for Sode Sri Vadiraja Matha. Built with Flutter and Spring Boot, it provides a complete ecosystem for managing temple content, processing seva bookings, tracking events and festivals, and engaging with devotees through a bilingual interface supporting English and Kannada languages.
The application serves two distinct user roles - Admin and User - each with tailored dashboards and functionalities. Vadiraja Gurusarvabhouma eliminates manual processes through features like digital seva booking with multiple payment modes, real-time content management for articles and announcements, event calendar with Tithinirnaya Panchanga integration, and automated push notifications. With its responsive design optimized for both mobile and tablet devices, Vadiraja Gurusarvabhouma transforms traditional temple management into a smart, digital, and efficient operation while providing powerful analytics to drive informed decisions and enhance devotee engagement.

  <h3 id="features">Features</h3>
<ul>
    <li><strong>Bilingual Support</strong>
        <ul>
            <li>Complete English and Kannada language support</li>
            <li>Dynamic language switching with instant UI updates</li>
            <li>Localized content for all features and screens</li>
            <li>Cultural context preservation in translations</li>
        </ul>
    </li>
    <br>
    <li><strong>Role-Based Access Control</strong>
        <ul>
            <li>Two distinct user roles: Admin and User</li>
            <li>Admin dashboard with comprehensive management tools</li>
            <li>User-friendly interface for devotees</li>
            <li>Secure authentication with Firebase OTP verification</li>
        </ul>
    </li>
    <br>
    <li><strong>Comprehensive Seva Booking System</strong>
        <ul>
            <li>Multiple seva types: Online Seva, Daily Seva, Gosevaa, E-Kanike</li>
            <li>Flexible payment modes: UPI, Card, Cash</li>
            <li>Seva calendar management with date selection</li>
            <li>Booking history and tracking for users</li>
            <li>Prasadam collection mode selection (Personal/Postal)</li>
            <li>Real-time booking status updates</li>
        </ul>
    </li>
    <br>
    <li><strong>Content Management System</strong>
        <ul>
            <li>Article management with bilingual support</li>
            <li>Announcements and flash alerts system</li>
            <li>Logo management with display ordering</li>
            <li>Gallery management for photos and media</li>
            <li>Darshana and Prasada timings management</li>
            <li>Social media links integration</li>
        </ul>
    </li>
    <br>
    <li><strong>Event Calendar & Panchanga</strong>
        <ul>
            <li>Interactive event calendar with date-wise information</li>
            <li>Tithinirnaya Panchanga integration</li>
            <li>Vishesha (special days) management</li>
            <li>Ekadashi Dwadashi details tracking</li>
            <li>Calendar data filtering by date range</li>
            <li>Bilingual calendar information display</li>
        </ul>
    </li>
    <br>
    <li><strong>Push Notifications</strong>
        <ul>
            <li>Firebase Cloud Messaging (FCM) integration</li>
            <li>Real-time notification delivery</li>
            <li>Consent-based notification preferences</li>
            <li>Flash alert notifications for urgent updates</li>
            <li>Seva booking confirmation notifications</li>
            <li>Custom notification icons and sounds</li>
        </ul>
    </li>
    <br>
    <li><strong>Admin Dashboard & Analytics</strong>
        <ul>
            <li>Comprehensive analytics dashboard</li>
            <li>Daily, weekly, and monthly booking reports</li>
            <li>Payment mode analytics and revenue tracking</li>
            <li>Seva-wise booking statistics</li>
            <li>Active users statistics</li>
            <li>Visual charts and data visualization</li>
        </ul>
    </li>
    <br>
    <li><strong>Contact & Location Management</strong>
        <ul>
            <li>Multiple contact location support</li>
            <li>Contact query submission system</li>
            <li>Query status tracking (Pending/Resolved/Closed)</li>
            <li>Location-based contact information</li>
            <li>Pro location highlighting</li>
        </ul>
    </li>
    <br>
    <li><strong>Feature Flags & Customization</strong>
        <ul>
            <li>Dynamic feature enable/disable functionality</li>
            <li>Event Calendar, Gallery, Room Booking, Artifacts</li>
            <li>Branch Dictionary, Youth Quiz, Tithinirnaya</li>
            <li>Contact Us and other customizable features</li>
            <li>Real-time feature visibility updates</li>
        </ul>
    </li>
    <br>
    <li><strong>Daily Seva Management</strong>
        <ul>
            <li>Temple-wise seva organization</li>
            <li>Time slot management for sevas</li>
            <li>Seva availability tracking</li>
            <li>Booking capacity management</li>
            <li>Admin control over seva schedules</li>
        </ul>
    </li>
    <br>
    <li><strong>Online Seva Items</strong>
        <ul>
            <li>Bilingual item catalog</li>
            <li>Price management and display ordering</li>
            <li>Item activation/deactivation</li>
            <li>Shopping cart functionality</li>
            <li>Seamless checkout process</li>
        </ul>
    </li>
    <br>
    <li><strong>Gosevaa & E-Kanike</strong>
        <ul>
            <li>Gosevaa information with video support</li>
            <li>E-Kanike donation management</li>
            <li>Bilingual content for seva information</li>
            <li>Media upload and management</li>
        </ul>
    </li>
    <br>
    <li><strong>User Profile Management</strong>
        <ul>
            <li>Complete devotee profile with personal details</li>
            <li>Astrological information (Rashi, Nakshatra, Gothra)</li>
            <li>Address and contact information management</li>
            <li>Consent management for notifications and data</li>
            <li>Profile image upload support</li>
        </ul>
    </li>
    <br>
    <li><strong>Responsive Design</strong>
        <ul>
            <li>Optimized for both mobile and tablet devices</li>
            <li>Consistent UI/UX across all screen sizes</li>
            <li>Flutter-based smooth animations and transitions</li>
            <li>Material Design 3 principles</li>
        </ul>
    </li>
</ul>

<h3 id="why">Why Vadiraja Gurusarvabhouma?</h3>
<ul>
    <li><strong>Complete Digital Transformation</strong>: Eliminates paper-based processes with digital seva bookings, online payments, and paperless documentation for modern temple operations.</li>
    <li><strong>Enhanced Devotee Engagement</strong>: Provides convenient access to temple services, event information, and seva booking through a user-friendly mobile application.</li>
    <li><strong>Bilingual Accessibility</strong>: Supports both English and Kannada languages, making the platform accessible to a wider devotee base while preserving cultural context.</li>
    <li><strong>Real-Time Communication</strong>: Push notifications ensure devotees stay informed about important events, seva confirmations, and temple updates instantly.</li>
    <li><strong>Comprehensive Management</strong>: Admin dashboard provides complete control over content, bookings, analytics, and temple operations from a single platform.</li>
    <li><strong>Data-Driven Insights</strong>: Analytics dashboard empowers temple administration with comprehensive insights on bookings, revenue, and devotee engagement patterns.</li>
    <li><strong>Scalable & Flexible</strong>: Feature flags allow dynamic enablement/disablement of features, making the platform adaptable to changing requirements.</li>
    <li><strong>Secure & Reliable</strong>: Firebase authentication, PostgreSQL database, and Spring Boot backend ensure secure and reliable operations.</li>
</ul>
</section>

<section id="getting_started">
  <h2>Getting Started</h2>
  <h3 id="prerequisites">Prerequisites</h3>
  <p>Before you begin, ensure that you have the following prerequisites installed on your development environment:</p>

  <h4>For Frontend (Flutter):</h4>
  <ul>
    <li>
      <strong>Flutter SDK (3.5.4+)</strong>: To build and run the Vadiraja Gurusarvabhouma mobile application
      <ul>
        <li><a href="https://flutter.dev/docs/get-started/install">Flutter Installation Guide</a></li>
      </ul>
    </li>
    <li>
      <strong>Dart SDK</strong>: Comes bundled with Flutter SDK
      <ul>
        <li>Verify Dart installation: <code>dart --version</code></li>
      </ul>
    </li>
    <li>
      <strong>Android Studio or VS Code</strong>: IDE for Flutter development
      <ul>
        <li><a href="https://developer.android.com/studio">Android Studio</a></li>
        <li><a href="https://code.visualstudio.com/">VS Code</a> with Flutter and Dart extensions</li>
      </ul>
    </li>
    <li>
      <strong>Android SDK</strong>: Required for building Android applications
      <ul>
        <li>Ensure Android SDK paths are added to PATH environment variables</li>
      </ul>
    </li>
    <li>
      <strong>Firebase Project</strong>: Firebase project with Phone Authentication enabled
      <ul>
        <li>Configure Firebase for Android and iOS</li>
        <li>Download <code>google-services.json</code> (Android) and <code>GoogleService-Info.plist</code> (iOS)</li>
      </ul>
    </li>
  </ul>

  <h4>For Backend (Spring Boot):</h4>
  <ul>
    <li>
      <strong>JDK 17 or higher</strong>: Required for Spring Boot application
      <ul>
        <li>Verify Java installation: <code>java -version</code></li>
      </ul>
    </li>
    <li>
      <strong>Maven 3.6+</strong>: Build tool for Java projects
      <ul>
        <li>Verify Maven installation: <code>mvn -version</code></li>
      </ul>
    </li>
    <li>
      <strong>PostgreSQL 12+</strong>: Database server
      <ul>
        <li>Download from: <a href="https://www.postgresql.org/download/">PostgreSQL Downloads</a></li>
        <li>Ensure PostgreSQL service is running</li>
      </ul>
    </li>
  </ul>

  <p>After installing Flutter, run the following command to verify your setup:</p>
  <pre><code>flutter doctor</code></pre>

  <h3 id="installation">Installation</h3>

  <h4>1. Clone the Repository:</h4>
  <pre><code>git clone https://github.com/sodematha-hackathon-2026/sodematha-hackathon-2026-team-vadiraja-gurusarvabhouma.git</code></pre>

  <h3 id="backend_setup">Backend Setup</h3>
  <ol>
    <li>
      <p><strong>Create PostgreSQL Database</strong>: Open PostgreSQL command line or pgAdmin and create the database:</p>
      <pre><code>CREATE DATABASE vgs_db;</code></pre>
    </li>
    <li>
      <p><strong>Configure Database Connection</strong>: Edit <code>backend/src/main/resources/application.properties</code> and update database credentials:</p>
      <pre><code>spring.datasource.url=jdbc:postgresql://localhost:5432/vgs_db
spring.datasource.username=postgres
spring.datasource.password=YOUR_POSTGRES_PASSWORD</code></pre>
    </li>
    <li>
      <p><strong>Create Database Schema</strong>: Execute the complete database schema script to create all required tables:</p>
      <pre><code>-- Navigate to the SQL scripts directory
cd backend/SQL_Query

-- Execute the database schema script using psql or pgAdmin
psql -U postgres -d vgs_db -f database_schema.sql</code></pre>
      <p><strong>Alternative:</strong> You can also open <code>backend/SQL_Query/database_schema.sql</code> in pgAdmin and execute it directly.</p>
      <p><strong>Note:</strong> The <code>database_schema.sql</code> file contains all CREATE TABLE statements, indexes, and initial data setup required for the application. This single script will create all necessary tables including:</p>
      <ul>
        <li>Admin and app features tables</li>
        <li>Home page tables (logos, articles, announcements, timings)</li>
        <li>Contact management tables</li>
        <li>Seva management and booking tables</li>
        <li>Calendar and Tithinirnaya tables</li>
        <li>Social media and other feature tables</li>
      </ul>
    </li>
    <li>
      <p><strong>Insert Admin Phone Numbers</strong>: After creating the schema, add admin phone numbers to the admins table (without +91 prefix):</p>
      <pre><code>INSERT INTO admins (phone_number, name, role) VALUES 
('8660743840', 'Admin Name', 'admin'),
('9876543210', 'Admin Name 2', 'admin');</code></pre>
      <p><strong>Important:</strong> Phone numbers should be stored WITHOUT the +91 prefix in the database.</p>
    </li>
    <li>
      <p><strong>Build and Run Backend</strong>: Navigate to backend directory and run:</p>
      <pre><code>cd backend
mvn clean install
mvn spring-boot:run</code></pre>
      <p>The backend will start on <code>http://localhost:8080</code></p>
    </li>
  </ol>

  <h3 id="frontend_setup">Building the App</h3>
  <ol>
    <li>
      <p><strong>Navigate to App Directory</strong>: Ensure you are in the <code>vgs_app</code> directory of the project.</p>
    </li>
    <li>
      <p><strong>Get Dependencies</strong>: Run the below command to fetch and install the necessary Flutter dependencies for the app:</p>
      <pre><code>flutter pub get</code></pre>
    </li>
    <li>
      <p><strong>Generate Localization Files</strong>: Generate localization files for English and Kannada:</p>
      <pre><code>flutter gen-l10n</code></pre>
    </li>
    <li>
      <p><strong>Configure Firebase</strong>: Ensure your Firebase configuration files are properly set up:</p>
      <ul>
        <li>Place <code>google-services.json</code> in <code>vgs_app/android/app/</code></li>
        <li>Place <code>GoogleService-Info.plist</code> in <code>vgs_app/ios/Runner/</code></li>
      </ul>
    </li>
    <li>
      <p><strong>Update API Base URL</strong>: Edit <code>vgs_app/lib/util/util.dart</code> and update the API base URL:</p>
      <pre><code>const String rootBaseUrl = 'http://YOUR_COMPUTER_IP:8080';</code></pre>
      <ul>
        <li><strong>Android Emulator</strong>: Use <code>http://10.0.2.2:8080</code></li>
        <li><strong>iOS Simulator</strong>: Use <code>http://localhost:8080</code></li>
        <li><strong>Physical Device</strong>: Use your computer's IP (e.g., <code>http://192.168.0.104:8080</code>)</li>
      </ul>
    </li>
    <li>
      <p><strong>Connect Android Device or Emulator</strong>: Ensure your Android device is connected via USB with USB debugging enabled, or use an Android emulator.</p>
      <p>Check connected devices:</p>
      <pre><code>flutter devices</code></pre>
    </li>
    <li>
      <p><strong>Launch the App</strong>: Run the below command after selecting the target device:</p>
      <pre><code>flutter run</code></pre>
    </li>
  </ol>

  <h4>Additional Commands:</h4>
  <ul>
    <li><strong>Build APK</strong>: <code>flutter build apk --release</code></li>
    <li><strong>Build for specific device</strong>: <code>flutter run -d &lt;device-id&gt;</code></li>
    <li><strong>Clean build</strong>: <code>flutter clean && flutter pub get && flutter gen-l10n</code></li>
  </ul>

  <h3 id="troubleshooting">Troubleshooting</h3>
  <ul>
    <li><strong>Build Errors</strong>: Run <code>flutter clean</code> and rebuild the project</li>
    <li><strong>Dependency Conflicts</strong>: Update Flutter SDK to the latest version: <code>flutter upgrade</code></li>
    <li><strong>Localization Issues</strong>: Run <code>flutter gen-l10n</code> after adding new strings</li>
    <li><strong>API Connection Failed</strong>: Verify backend is running and API URL is correct</li>
    <li><strong>Database Connection Failed</strong>: Check PostgreSQL service is running and credentials are correct</li>
    <li><strong>Firebase Authentication Issues</strong>: Verify Firebase configuration files are properly placed</li>
  </ul>
</section>


<section id="tech_used">
  <h2>TechStack - Built with
    <img src="https://cdn.icon-icons.com/icons2/2530/PNG/512/flutter_button_icon_151957.png" alt="Flutter" height="20" style="vertical-align: middle; filter: none;"/>
    <img src="https://cdn.icon-icons.com/icons2/2530/PNG/512/dart_colour_button_icon_151934.png" alt="Dart" height="20" style="vertical-align: middle; filter: none;"/>
    <img src="https://github.com/user-attachments/assets/deea2cf0-377f-4e47-b9fb-5290d8d108c0" alt="Firebase" height="20" style="vertical-align: middle; filter: none;"/>
    <img src="https://cdn.icon-icons.com/icons2/2415/PNG/512/java_original_wordmark_logo_icon_146459.png" alt="Java" height="20" style="vertical-align: middle; filter: none;"/>
    <img src="https://cdn.icon-icons.com/icons2/2415/PNG/512/postgresql_original_wordmark_logo_icon_146392.png" alt="PostgreSQL" height="20" style="vertical-align: middle; filter: none;"/>
  </h2>
 

  <h3>Frontend Framework</h3>
  <ul>
    <li><strong>Flutter</strong>: Google's UI toolkit for building natively compiled, cross-platform applications with a single codebase. Enables responsive design for both mobile and tablet devices with smooth animations and transitions.</li>
    <li><strong>Dart</strong>: A fast, modern, object-oriented programming language optimized for Flutter development, providing strong typing and excellent performance.</li>
  </ul>

  <h3>Backend & Database</h3>
  <ul>
    <li><strong>Spring Boot</strong>: Java-based framework for building RESTful APIs and microservices, providing robust backend infrastructure with dependency injection and auto-configuration.</li>
    <li><strong>PostgreSQL</strong>: Advanced open-source relational database for storing user data, seva bookings, content, calendar information, and analytics data.</li>
    <li><strong>Hibernate/JPA</strong>: Java Persistence API for database operations, providing object-relational mapping and automatic table creation.</li>
  </ul>

  <h3>Firebase Services</h3>
  <ul>
    <li><strong>Firebase Authentication</strong>: Secure phone number authentication with OTP verification for user registration and login.</li>
    <li><strong>Firebase Cloud Messaging (FCM)</strong>: Push notification service for real-time updates, booking confirmations, and flash alerts.</li>
    <li><strong>Firebase Storage</strong>: Cloud storage solution for storing and serving user-uploaded content including profile images, logos, and media files.</li>
  </ul>

  <h3>Key Flutter Packages & Dependencies</h3>
  <ul>
    <li><strong>firebase_core</strong>: Firebase initialization and configuration</li>
    <li><strong>firebase_auth</strong>: Firebase Authentication for secure user management</li>
    <li><strong>firebase_messaging</strong>: Firebase Cloud Messaging for push notifications</li>
    <li><strong>firebase_storage</strong>: Firebase Storage integration for media uploads</li>
    <li><strong>flutter_localizations</strong>: Internationalization support for bilingual app</li>
    <li><strong>intl</strong>: Internationalization and formatting for dates, currencies, and numbers</li>
    <li><strong>http</strong>: HTTP client for API communication with Spring Boot backend</li>
    <li><strong>shared_preferences</strong>: Local storage for user preferences and session data</li>
    <li><strong>cached_network_image</strong>: Efficient image loading and caching</li>
    <li><strong>flutter_local_notifications</strong>: Local notification handling for FCM</li>
    <li><strong>image_picker</strong>: Image selection from gallery or camera</li>
    <li><strong>url_launcher</strong>: Launch external URLs and social media links</li>
    <li><strong>video_player</strong>: Video playback for Gosevaa content</li>
    <li><strong>audioplayers</strong>: Audio playback for notification tones</li>
    <li><strong>pdf</strong>: PDF generation for reports and documents</li>
    <li><strong>printing</strong>: PDF printing functionality</li>
    <li><strong>fl_chart</strong>: Beautiful charts and graphs for analytics visualization</li>
    <li><strong>flutter_map</strong>: Interactive maps for location features</li>
  </ul>

  <h3>Development Tools</h3>
  <ul>
    <li><strong>Android Studio / VS Code</strong>: Primary IDEs for Flutter development with debugging and hot reload capabilities</li>
    <li><strong>IntelliJ IDEA / Eclipse</strong>: IDEs for Spring Boot backend development</li>
    <li><strong>PostgreSQL / pgAdmin</strong>: Database management and administration</li>
    <li><strong>Firebase Console</strong>: Web-based interface for managing Firebase services, authentication, and analytics</li>
    <li><strong>Maven</strong>: Build automation and dependency management for Java projects</li>
    <li><strong>Git & GitHub</strong>: Version control and collaborative development platform</li>
  </ul>
</section>

<section id = "architecture">
  <h2> System Architecture </h2>
  
<h3>🏗️ High-Level Architecture:</h3>

<pre>
┌────────────────────────────────────────────────────────────────────────────┐
│                    VADIRAJA GURUSARVABHOUMA APPLICATION                    │
│                                                                            │
│   ┌─────────────────┐    ┌──────────────────┐    ┌────────────────────┐    │
│   │ Landing Screen  │ →  │  Authentication  │ →  │  Role-Based Entry  │    │
│   │ • Welcome       │    │  • Phone Auth    │    │  • Admin Dashboard │    │
│   │ • Get Started   │    │  • OTP Verify    │    │  • User Dashboard  │    │
│   └─────────────────┘    └──────────────────┘    └────────────────────┘    │
│                                                                            │
│   ┌─────────────────────────────────────────────────────────────────────┐  │
│   │                        ROLE-BASED MODULES                           │  │
│   │                                                                     │  │
│   │  ┌───────────────┐                    ┌──────────────┐              │  │
│   │  │    ADMIN      │                    │     USER     │              │  │
│   │  ├───────────────┤                    ├──────────────┤              │  │
│   │  │• Dashboard    │                    │• Home Screen │              │  │
│   │  │• Content Mgmt │                    │• Seva Booking│              │  │
│   │  │• Seva Mgmt    │                    │• Bookings    │              │  │
│   │  │• Analytics    │                    │• Calendar    │              │  │
│   │  │• User Mgmt    │                    │• Gallery     │              │  │
│   │  │• Notifications│                    │• Profile     │              │  │
│   │  │• Feature Flags│                    │• Contact     │              │  │
│   │  ├───────────────┤                    ├──────────────┤              │  │
│   │  └──────────────────────────────────────────────────────────────────┘  │
│   │                                                                        │
│   │   ┌─────────────────────────────────────────────────────────────────┐  │
│   │   │                    CORE FEATURES                                │  │
│   │   │  ┌──────────────┐  ┌──────────────┐  ┌───────────────┐          │  │
│   │   │  │ Seva Booking │  │   Calendar   │  │   Content     │          │  │
│   │   │  │• Online Seva │  │• Events      │  │• Articles     │          │  │
│   │   │  │• Daily Seva  │  │• Panchanga   │  │• Announcements│          │  │
│   │   │  │• Gosevaa     │  │• Tithinirnaya│  │• Timings      │          │  │
│   │   │  │• E-Kanike    │  │• Vishesha    │  │• Gallery      │          │  │
│   │   │  └──────────────┘  └──────────────┘  └───────────────┘          │  │
│   │   │                                                                 │  │
│   │   │  ┌───────────────┐  ┌───────────────┐  ┌──────────────┐         │  │
│   │   │  │  Notifications│  │   Analytics   │  │   Contact    │         │  │
│   │   │  │• Push Notifs  │  │• Booking Stats│  │• Locations   │         │  │
│   │   │  │• Flash Alerts │  │• Revenue      │  │• Query Mgmt  │         │  │
│   │   │  │• FCM Service  │  │• User Stats   │  │• Social Media│         │  │
│   │   │  └───────────────┘  └───────────────┘  └──────────────┘         │  │
│   │   └─────────────────────────────────────────────────────────────────┘  │
│   │                                                                        │
│   │   ┌─────────────────────────────────────────────────────────────────┐  │
│   │   │                      STATE MANAGEMENT LAYER                     │  │
│   │   │   • User Session  • Feature Flags  • Language Preference        │  │
│   │   │   • Local Storage  • API Service  • Notification Service        │  │
│   │   └─────────────────────────────────────────────────────────────────┘  │
└─────────────────────────────────┬──────────────────────────────────────────┘
                                  │
                         ═════════╪═══════════
                          FLUTTER │   DART
                         ═════════╪═══════════
                                  │
┌─────────────────────────────────▼─────────────────────────────────────────┐
│                          FIREBASE SERVICES                                │
│                                                                           │
│  ┌──────────────────────┐  ┌──────────────────────┐  ┌─────────────────┐  │
│  │  AUTHENTICATION      │  │  CLOUD MESSAGING     │  │ FIREBASE STORAGE│  │
│  ├──────────────────────┤  ├──────────────────────┤  ├─────────────────┤  │
│  │ • Phone Auth         │  │ • Push Notifications │  │ • Profile Images│  │  
│  │ • OTP Verification   │  │ • Flash Alerts       │  │ • Logos         │  │
│  │ • User Management    │  │ • Booking Updates    │  │ • Media Files   │  │
│  │                      │  │ • FCM Token Mgmt     │  │                 │  │
│  └──────────────────────┘  └──────────────────────┘  └─────────────────┘  │
└───────────────────────────────────────────────────────────────────────────┘
                                  │
                         ═════════╪═══════════
                              API CALLS
                         ═════════╪═══════════
                                  │
┌─────────────────────────────────▼─────────────────────────────────────────┐
│                      SPRING BOOT BACKEND (REST API)                       │
│                                                                           │
│  ┌──────────────────────┐  ┌──────────────────────┐  ┌─────────────────┐  │
│  │  USER MANAGEMENT     │  │  SEVA MANAGEMENT     │  │ CONTENT MGMT    │  │
│  ├──────────────────────┤  ├──────────────────────┤  ├─────────────────┤  │
│  │ • Registration       │  │ • Seva Types         │  │ • Articles      │  │  
│  │ • Profile Update     │  │ • Seva Bookings      │  │ • Announcements │  │
│  │ • Role Assignment    │  │ • Payment Status     │  │ • Timings       │  │
│  │ • FCM Token          │  │ • Booking History    │  │ • Gallery       │  │
│  │                      │  │                      │  │ • Logos         │  │
│  └──────────────────────┘  └──────────────────────┘  └─────────────────┘  │
│                                                                           │
│  ┌──────────────────────┐  ┌──────────────────────┐  ┌─────────────────┐  │
│  │  CALENDAR MANAGEMENT │  │  ANALYTICS           │  │ FEATURE FLAGS   │  │
│  ├──────────────────────┤  ├──────────────────────┤  ├─────────────────┤  │
│  │ • Calendar Data      │  │ • Booking Analytics  │  │ • Feature Toggle│  │
│  │ • Tithinirnaya       │  │ • Revenue Reports    │  │ • Visibility    │  │
│  │ • Vishesha           │  │ • User Statistics    │  │ • Enable/Disable│  │
│  │ • Events             │  │ • Payment Analytics  │  │                 │  │
│  └──────────────────────┘  └──────────────────────┘  └─────────────────┘  │
│                                                                           │
│                    ┌────────────────────────────────┐                     │
│                    │   POSTGRESQL DATABASE          │                     │
│                    │   • Users, Admins              │                     │
│                    │   • Seva Bookings              │                     │
│                    │   • Content (Articles, etc.)   │                     │
│                    │   • Calendar Data              │                     │
│                    │   • Analytics Data             │                     │
│                    └────────────────────────────────┘                     │
└───────────────────────────────────────────────────────────────────────────┘
                                  │
                         ═════════╪═══════════
                              DATA FLOW
                         ═════════╪═══════════
                                  │
┌─────────────────────────────────▼───────────────────────────────────────────┐
│                            DEVICE DEPLOYMENT                                │
│                                                                             │
│     ┌─────────────────────────┐              ┌─────────────────────────┐    │
│     │   MOBILE DEVICES        │              │   TABLET DEVICES        │    │
│     │   • Portrait View       │              │   • Landscape View      │    │
│     │   • On-the-go Access    │              │   • Enhanced UI         │    │
│     │   • All Features        │              │   • Bigger Display      │    │
│     │   • Responsive Design   │              │   • Same Features       │    │
│     └─────────────────────────┘              └─────────────────────────┘    │
└─────────────────────────────────────────────────────────────────────────────┘

┌──────────────────────────────────────────────────────────────────────────────────┐
│                              KEY DATA FLOWS                                      │
│                                                                                  │
│  User Registration: Phone → Firebase OTP → Verify → Backend → Role Assign        │
│                                                                                  │
│  Seva Booking: User → Select Seva → Choose Date → Payment → Booking Confirmation │
│               → FCM Notification → Backend Storage                               │
│                                                                                  │  
│  Content Management: Admin → Create/Update Content → Backend → Database          │
│                     → Real-time Sync → User App                                  │
│                                                                                  │
│  Analytics: All Transactions → PostgreSQL → Analytics Engine →                   │
│            Visualizations (Daily/Weekly/Monthly Reports)                         │
│                                                                                  │
│  Notifications: Backend Event → FCM Service → Device Token → Push Notification   │
└──────────────────────────────────────────────────────────────────────────────────┘
</pre>

<h3>🗂️ Project Structure:</h3>
<pre>
Vadiraja_Gurusarvabhouma_PRB/
│
├── vgs_app/                          # Flutter Application Source Code
│   ├── lib/
│   │   ├── main.dart                 # App entry point & initialization
│   │   ├── firebase_options.dart     # Firebase configuration
│   │   │
│   │   ├── screens/                  # Application Screens
│   │   │   ├── core/                 # Core screens
│   │   │   │   ├── splash_screen.dart
│   │   │   │   ├── landing_screen.dart
│   │   │   │   ├── main_dashboard.dart
│   │   │   │   └── home_screen.dart
│   │   │   ├── auth/                 # Authentication screens
│   │   │   │   ├── auth_screen.dart
│   │   │   │   ├── phone_screen.dart
│   │   │   │   ├── otp_screen.dart
│   │   │   │   ├── login_screen.dart
│   │   │   │   └── register_screen.dart
│   │   │   ├── admin/                # Admin module
│   │   │   │   ├── admin_dashboard.dart
│   │   │   │   ├── admin_analytics_screen.dart
│   │   │   │   ├── daily_seva_management_screen.dart
│   │   │   │   ├── online_seva_admin_screen.dart
│   │   │   │   ├── seva_calendar_admin_screen.dart
│   │   │   │   └── social_media_management_screen.dart
│   │   │   ├── seva/                 # Seva booking screens
│   │   │   │   ├── sevas_screen.dart
│   │   │   │   ├── sevas_and_bookings_screen.dart
│   │   │   │   ├── online_seva_screen.dart
│   │   │   │   ├── online_seva_booking_screen.dart
│   │   │   │   ├── daily_seva_screen.dart
│   │   │   │   ├── gosevaa_screen.dart
│   │   │   │   └── ekanike_screen.dart
│   │   │   ├── features/             # Feature screens
│   │   │   │   ├── events_calendar_screen.dart
│   │   │   │   ├── gallery_screen.dart
│   │   │   │   ├── branch_dictionary_screen.dart
│   │   │   │   ├── tithinirnaya_panchanga_screen.dart
│   │   │   │   ├── history_parampara_screen.dart
│   │   │   │   ├── contact_us_screen.dart
│   │   │   │   └── announcement_detail_screen.dart
│   │   │   └── user/                 # User screens
│   │   │       ├── user_dashboard.dart
│   │   │       └── profile_screen.dart
│   │   │
│   │   ├── services/                 # Service layer
│   │   │   ├── api_service.dart      # API communication
│   │   │   ├── auth_service.dart     # Authentication service
│   │   │   ├── fcm_service.dart      # Push notifications
│   │   │   ├── locale_service.dart   # Language management
│   │   │   ├── user_session.dart     # Session management
│   │   │   ├── pdf_service.dart      # PDF generation
│   │   │   ├── firebase_storage_service.dart
│   │   │   └── feature_search_service.dart
│   │   │
│   │   ├── models/                   # Data models
│   │   │   ├── app_feature.dart
│   │   │   ├── seva.dart
│   │   │   ├── feature_search_item.dart
│   │   │   └── country.dart
│   │   │
│   │   ├── widgets/                  # Reusable widgets
│   │   │   ├── app_bar_with_drawer.dart
│   │   │   ├── shared_drawer.dart
│   │   │   ├── placeholder_screen.dart
│   │   │   ├── info_carousel.dart
│   │   │   ├── global_search_widget.dart
│   │   │   ├── country_selector.dart
│   │   │   ├── terms_dialog.dart
│   │   │   └── language_toggle.dart
│   │   │
│   │   ├── util/                     # Utility functions
│   │   │   ├── util.dart             # API URLs and constants
│   │   │   ├── error_handler.dart
│   │   │   ├── phone_util.dart
│   │   │   └── social_media_platform_helper.dart
│   │   │
│   │   ├── theme/                    # App theming
│   │   │   └── app_theme.dart
│   │   │
│   │   ├── constants/                # Constants
│   │   │   └── calendar_constants.dart
│   │   │
│   │   └── l10n/                     # Localization files
│   │       ├── app_en.arb            # English strings
│   │       └── app_kn.arb            # Kannada strings
│   │
│   ├── assets/                       # Static Assets
│   │   ├── images/                   # App images & icons
│   │   ├── tones/                    # Notification sounds
│   │   └── videos/                   # Video assets
│   │
│   ├── android/                      # Android Configuration
│   ├── ios/                          # iOS Configuration
│   ├── pubspec.yaml                  # Flutter dependencies
│   └── README.md                     # App documentation
│
├── backend/                          # Spring Boot Backend
│   ├── src/
│   │   └── main/
│   │       ├── java/
│   │       │   └── com/vgs/
│   │       │       ├── controller/    # REST Controllers (API endpoints)
│   │       │       │   ├── UserController.java
│   │       │       │   ├── SevaController.java
│   │       │       │   ├── SevaBookingController.java
│   │       │       │   ├── ArticleController.java
│   │       │       │   ├── AnnouncementController.java
│   │       │       │   ├── AnalyticsController.java
│   │       │       │   └── ... (other controllers)
│   │       │       ├── dto/          # Data Transfer Objects (Request/Response)
│   │       │       │   ├── UserRequest.java / UserResponse.java
│   │       │       │   ├── SevaBookingRequest.java / SevaBookingResponse.java
│   │       │       │   ├── ArticleRequest.java / ArticleResponse.java
│   │       │       │   └── ... (other DTOs)
│   │       │       ├── model/        # Entity Models (JPA entities)
│   │       │       │   ├── User.java
│   │       │       │   ├── Seva.java
│   │       │       │   ├── SevaBooking.java
│   │       │       │   ├── Article.java
│   │       │       │   └── ... (other entities)
│   │       │       ├── repository/   # Data Access Layer (JPA repositories)
│   │       │       │   ├── UserRepository.java
│   │       │       │   ├── SevaRepository.java
│   │       │       │   ├── SevaBookingRepository.java
│   │       │       │   └── ... (other repositories)
│   │       │       ├── service/      # Business Logic Layer
│   │       │       │   ├── UserService.java
│   │       │       │   ├── SevaService.java
│   │       │       │   ├── SevaBookingService.java
│   │       │       │   ├── AnalyticsService.java
│   │       │       │   └── ... (other services)
│   │       │       ├── exception/    # Exception handling
│   │       │       │   └── GlobalExceptionHandler.java
│   │       │       ├── config/       # Configuration classes
│   │       │       │   └── CorsConfig.java
│   │       │       ├── util/         # Utility classes
│   │       │       │   └── AdminUtil.java
│   │       │       └── VgsBackendApplication.java  # Main application class
│   │       └── resources/
│   │           └── application.properties  # Application configuration
│   │
│   ├── SQL_Query/                    # Database SQL Scripts
│   │   └── database_schema.sql       # Complete database schema (execute this)
│   │
│   ├── pom.xml                       # Maven dependencies
│   └── README.md                     # Backend documentation
│
├── Submissions/                      # Project submissions
│   ├── API_DOCUMENTATION.MD
│   └── DATABASE_SCHEMA.md
│
├── SETUP_INSTRUCTIONS.md             # Setup guide
├── QUICK_START.md                    # Quick start guide
└── README.md                         # Project documentation
</pre>

<h3>🔐 Vadiraja Gurusarvabhouma Security Architecture</h3>
<ul>
  <li><strong>Firebase Authentication</strong>:
    <ul>
      <li>Secure phone number authentication with OTP verification</li>
      <li>Role-based access control (RBAC) for Admin and User roles</li>
      <li>Session management with secure token storage</li>
      <li>Phone number validation and verification</li>
    </ul>
  </li>
  
  <li><strong>Data Security</strong>:
    <ul>
      <li>End-to-end encryption for data transmission between app and backend</li>
      <li>PostgreSQL database with secure connection</li>
      <li>Role-based data access restrictions</li>
      <li>Input validation and sanitization</li>
      <li>Secure API endpoints with role verification</li>
    </ul>
  </li>
  
  <li><strong>Role-Based Access Control (RBAC)</strong>:
    <ul>
      <li><strong>Admin</strong>: Full access to all features, content management, analytics, and user management</li>
      <li><strong>User</strong>: Access to seva booking, calendar, gallery, and profile management</li>
      <li>Role assignment based on phone number verification in admins table</li>
      <li>Protected admin endpoints with header-based authentication</li>
    </ul>
  </li>
  
  <li><strong>API Security</strong>:
    <ul>
      <li>RESTful API with proper HTTP methods</li>
      <li>Admin endpoints require <code>X-User-Role: ADMIN</code> header</li>
      <li>CORS configuration for cross-origin requests</li>
      <li>Input validation on all API endpoints</li>
      <li>Error handling without exposing sensitive information</li>
    </ul>
  </li>
  
  <li><strong>Payment & Booking Security</strong>:
    <ul>
      <li>Secure payment status tracking</li>
      <li>Transaction ID validation</li>
      <li>Booking confirmation system</li>
      <li>No storage of sensitive payment credentials</li>
      <li>Payment mode tracking (UPI, Card, Cash)</li>
    </ul>
  </li>
  
  <li><strong>Data Privacy</strong>:
    <ul>
      <li>Consent management for notifications and data storage</li>
      <li>User data anonymization for analytics</li>
      <li>Optional profile information collection</li>
      <li>GDPR-compliant data handling practices</li>
    </ul>
  </li>
  
  <li><strong>Application Security</strong>:
    <ul>
      <li>Input validation and sanitization to prevent injection attacks</li>
      <li>Secure API calls with proper error handling</li>
      <li>Protected routes to prevent unauthorized access</li>
      <li>Regular security updates through dependency management</li>
    </ul>
  </li>
  
  <li><strong>Device Security</strong>:
    <ul>
      <li>Secure local storage for session tokens</li>
      <li>FCM token management for push notifications</li>
      <li>Encrypted communication between app and services</li>
      <li>Secure file uploads to Firebase Storage</li>
    </ul>
  </li>
</ul>

<section id="app_demonstration">
  <h2>📱 App Demonstration & Testing</h2>
  
  <h3>🎥 Video Demonstrations</h3>
  <p>
    <strong>Before testing the application, we highly recommend watching demonstration videos to understand the complete workflow and features of Vadiraja Gurusarvabhouma.</strong> These videos provide a comprehensive walkthrough of the system setup, user registration, seva booking process, and admin management features.
  </p>
  
  <h4>Demo Videos:</h4>
  <ol>
    <li>
      <strong>User Registration & Seva Booking Flow</strong>
      <ul>
        <li>Phone number authentication with OTP verification</li>
        <li>User registration and profile setup</li>
        <li>Seva booking process (Online Seva, Daily Seva, etc.)</li>
        <li>Payment processing and booking confirmation</li>
        <li>Booking history and tracking</li>
      </ul>
      <p>📹 <em>Video link to be added</em></p>
    </li>
    <br>
    <li>
      <strong>Admin Dashboard & Content Management</strong>
      <ul>
        <li>Admin login and dashboard overview</li>
        <li>Content management (Articles, Announcements, Timings)</li>
        <li>Seva management and booking oversight</li>
        <li>Analytics dashboard and reports</li>
        <li>Feature flag management</li>
        <li>Push notification management</li>
      </ul>
      <p>📹 <em>Video link to be added</em></p>
    </li>
  </ol>
<hr/>

  <h3>📲 Download & Install APK</h3>

<p>
  The application APK can be built using Flutter build commands. For testing purposes, you can build and install the APK on your Android device.
</p>

<p>
  📥 <strong>Build APK:</strong>
  <pre><code>cd vgs_app
flutter build apk --release</code></pre>
</p>

<p>
  The APK will be generated at: <code>vgs_app/build/app/outputs/flutter-apk/app-release.apk</code>
</p>

<p>
  <em>Note: Enable "Install from Unknown Sources" in your Android settings to install the APK.</em> <br>
  <em>Suggestion: Optimized for both Mobile and Tablet devices.</em>
</p>

<hr/>

  <h3>🔑 Test Credentials</h3>
  <p>
    For quick evaluation and testing, you can use the following setup. Create admin accounts by adding phone numbers to the admins table:
  </p>

  <h4>Admin Setup:</h4>
  <ol>
    <li>Add phone numbers to the <code>admins</code> table in PostgreSQL (without +91 prefix)</li>
    <li>Register using those phone numbers through the app</li>
    <li>Users with phone numbers in admins table will automatically get ADMIN role</li>
    <li>Other users will get USER role by default</li>
  </ol>

  <h4>Example Admin Phone Numbers:</h4>
  <ul>
    <li><code>8660743840</code> (stored without +91 prefix)</li>
    <li><code>9876543210</code> (stored without +91 prefix)</li>
  </ul>

  <p><strong>Note:</strong> Phone numbers in the admins table should be stored WITHOUT the +91 prefix, but the app will send them WITH the +91 prefix during authentication.</p>

<hr/>
  <h3>🆕 Create Your Own Account</h3>
  <p>
    You can register your own account and experience the complete setup process:
  </p>
  <ol>
    <li>Download and install the Vadiraja Gurusarvabhouma APK</li>
    <li>Open the application and navigate to the Registration screen</li>
    <li>Enter your phone number and verify OTP</li>
    <li>Fill in your devotee details (name, email, address, date of birth, etc.)</li>
    <li>Complete registration</li>
    <li>If your phone number is in the admins table, you'll get ADMIN role; otherwise USER role</li>
    <li>Start exploring features based on your role</li>
  </ol>

  <h3>📸 Screenshots</h3>
  <p>Below are screenshots showcasing Vadiraja Gurusarvabhouma features across different roles and devices (Mobile & Tablet):</p>
  
  <p>The screenshots include:</p>
  <ul>
    <li>Landing & Authentication screens</li>
    <li>User Dashboard & Home Screen</li>
    <li>Seva Booking (Online Seva, Daily Seva, Gosevaa, E-Kanike)</li>
    <li>Event Calendar & Tithinirnaya Panchanga</li>
    <li>Gallery & Branch Dictionary</li>
    <li>Admin Dashboard & Analytics</li>
    <li>Content Management</li>
    <li>Bilingual interface (English/Kannada)</li>
    <li>Push notifications and flash alerts</li>
  </ul>
  
  <p>📹 <strong>Screenshot Gallery:</strong> <a href="YOUR_SCREENSHOT_LINK_HERE">View Screenshots</a></p>
<hr/>
  <h3>💡 Testing Tips</h3>
  <ul>
    <li><strong>Start with Registration:</strong> Register a new account to understand the complete user onboarding process</li>
    <li><strong>Test Seva Booking:</strong> Try booking different types of sevas (Online Seva, Daily Seva, etc.) to experience the booking flow</li>
    <li><strong>Explore Admin Features:</strong> If you have admin access, explore content management, analytics, and feature flag management</li>
    <li><strong>Test Bilingual Support:</strong> Switch between English and Kannada to see the bilingual interface</li>
    <li><strong>Check Notifications:</strong> Test push notifications by creating announcements or flash alerts (admin feature)</li>
    <li><strong>Explore Calendar:</strong> Check the event calendar and Tithinirnaya Panchanga features</li>
  </ul>

  <h3>⚠️ Important Notes</h3>
  <ul>
    <li>Ensure backend is running before testing the app</li>
    <li>Verify Firebase configuration is properly set up</li>
    <li>Check database connection and ensure all tables are created</li>
    <li>For isolated testing, create your own admin account</li>
    <li>Ensure stable internet connection for real-time synchronization</li>
    <li>All features work best on Android 8.0 (API level 26) or higher</li>
    <li>Phone numbers in admins table should be stored WITHOUT +91 prefix</li>
  </ul>
</section>


<section id="conclusion">
  <h2>Conclusion</h2>
  <p>
    Vadiraja Gurusarvabhouma represents a comprehensive, practical solution for modern temple management, designed to streamline operations and enhance devotee engagement across all levels of service. By integrating Flutter's cross-platform capabilities with Spring Boot's robust backend infrastructure and Firebase's real-time services, the system provides essential features such as bilingual support, digital seva booking, content management, event calendar integration, and powerful analytics without the complexity of traditional temple management systems. Its role-based modular design, responsive UI for mobile and tablet devices, and paperless operations make it both accessible and scalable for temples of any size. The inclusion of features like push notifications, Tithinirnaya Panchanga, and comprehensive analytics bridges the gap between temple operations and devotee satisfaction. Ultimately, Vadiraja Gurusarvabhouma demonstrates how thoughtful software architecture, user-centric design, and cloud-based technology can work together to digitally transform temple operations, reduce manual processes, and improve both administrative efficiency and devotee experience in the modern digital age.
  </p>
</section>



<section id = "team">
  <h2> Developed By: </h2>
  <h3> Pannaga R Bhat </h3>
<p align="left">
  <a href="https://github.com/pannaga-rj" style="text-decoration: none;" target="_blank" rel="nofollow">
    <img src="https://img.shields.io/badge/GitHub-black?style=flat&logo=github" alt="GitHub" style="max-width: 100%;">
  </a>
  <a href="https://mail.google.com/mail/?view=cm&fs=1&to=pannaga.rj@gmail.com" target="_blank">
    <img src="https://img.shields.io/badge/Gmail-D14836?style=flat&logo=gmail&logoColor=white" alt="Gmail">
  </a>

  <!-- <a href="https://www.linkedin.com/in/pannaga-r-bhat-ba8bb6289/" style="text-decoration: none;" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-blue?style=flat&logo=linkedin" alt="LinkedIn" />
  </a> -->
</p>
</section>
