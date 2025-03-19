# FanSwoon - Product Specification

## Overview

FanSwoon is a platform that connects fans with their favorite creators, allowing them to request and receive personalized audio messages. The platform enables content creators to monetize their audience by offering custom audio recordings for various occasions, while fans can request personalized messages from creators they admire.

## Product Vision

FanSwoon aims to bridge the gap between creators and their fans by providing a seamless platform for personalized audio interactions. Whether it's a birthday message, words of encouragement, or a custom greeting, FanSwoon enables meaningful connections through the power of voice.

## Target Audience

### Creators
- Content creators, influencers, podcasters, musicians, and celebrities
- Individuals with established audiences looking to monetize their following
- Creators seeking additional revenue streams beyond traditional platforms

### Fans
- Followers and admirers of content creators
- People looking for unique, personalized gifts
- Individuals seeking personalized messages for special occasions

## Core Features

### User Management

#### Authentication & Authorization
- Email/password registration and login
- Google OAuth integration
- JWT-based authentication
- Role-based access control (regular users, creators, admins)

#### User Profiles
- Customizable profiles with bio, profile picture, and display name
- Location and profession information
- Customizable profile themes and colors
- Media links to other platforms (social media, websites, etc.)
- Profile visibility settings

### Creator Features

#### Profile Customization
- Custom profile themes (default, dark, light, colorful)
- Personalized color schemes
- Media links to other platforms
- Professional information display

#### Pricing Options
- Multiple pricing tiers for different types of requests
- Customizable pricing options with titles, descriptions, and delivery times
- Option to activate/deactivate specific pricing tiers
- Reordering of pricing options for display purposes

#### Request Management
- Accept or reject incoming requests
- Manage pending, accepted, and completed requests
- Upload audio responses to requests
- Set availability status for new requests

#### Payment Integration
- Integration with Stripe and PayPal
- Customizable payment settings
- Revenue tracking and analytics

### Fan Features

#### Creator Discovery
- Browse featured creators
- View creator profiles and available services
- Filter creators by various criteria

#### Request Submission
- Select from available pricing options
- Provide details for personalized messages
- Specify occasions, recipients, and special instructions
- Payment processing for requests

#### Message Management
- View request status (pending, accepted, rejected, completed)
- Access completed audio messages
- Download and share received messages

### Messaging System

#### Direct Messaging
- Send and receive messages between users
- Inbox for received messages
- Sent messages tracking
- Message read status tracking

#### Request-Related Communication
- Notifications for request status changes
- Communication about request details
- Delivery notifications

### Audio Management

#### Recording Upload
- Upload audio recordings
- Add title, description, and artwork
- Set privacy settings for recordings

#### Audio History
- View history of uploaded recordings
- Manage recording visibility and sharing options
- Track recording statistics

### Admin Features

#### User Management
- View and manage user accounts
- Monitor creator activities
- Handle user reports and issues

#### Platform Analytics
- Track platform usage metrics
- Monitor payment transactions
- Generate reports on platform performance

## Technical Architecture

### Frontend (Client)

#### Technology Stack
- React.js for UI components and state management
- React Router for navigation and routing
- Bootstrap and styled-components for styling
- Chart.js for analytics visualization
- Axios for API communication

#### Key Components
- Authentication components (Login, Register)
- Profile management components
- Request submission and management interfaces
- Audio playback and management components
- Messaging interfaces
- Admin dashboard

### Backend (Server)

#### Technology Stack
- Node.js with Express.js for API endpoints
- MongoDB with Mongoose for data storage
- JWT for authentication
- Multer for file uploads
- Stripe and PayPal SDKs for payment processing

#### API Endpoints

##### User Management
- `/users/profile` - Get and update user profile
- `/users/featured` - Get featured users
- `/users/:userId` - Get specific user profile
- `/users/profile/media-links` - Manage profile media links
- `/users/profile/pricing-options` - Manage pricing options

##### Authentication
- `/auth/register` - User registration
- `/auth/login` - User login
- `/auth/google` - Google OAuth authentication

##### Recordings
- `/recordings` - Upload and manage recordings
- `/recordings/history` - View recording history
- `/recordings/:id` - Manage specific recordings

##### Requests
- `/requests` - Submit and manage requests
- `/requests/:id` - Handle specific requests
- `/requests/inbox` - View received requests

##### Messages
- `/messages` - Send and receive messages
- `/messages/inbox` - View received messages
- `/messages/sent` - View sent messages

##### Payments
- `/payments/create` - Create payment intents
- `/payments/process` - Process payments
- `/payments/history` - View payment history

### Database Models

#### User
- Authentication details (email, password, googleId)
- Profile information (name, bio, picture, location, profession)
- Creator settings (pricing options, request settings)
- Payment settings (Stripe/PayPal integration)
- Profile customization (theme, colors, media links)

#### Recording
- Audio file information (title, description, URL)
- Creator reference
- Visibility settings
- Metadata (creation date, size, duration)

#### Request
- Requester and creator references
- Request details and specifications
- Payment information
- Status tracking
- Delivery information

#### AudioRequest
- Detailed request information
- Pricing and payment details
- Status tracking
- Delivery expectations and completion data

#### Message
- Sender and recipient references
- Message content
- Read status
- Request references (if applicable)

#### Payment
- Transaction details
- Amount and fee information
- Creator and customer references
- Payment method and status
- Completion tracking

## User Flows

### Creator Registration and Setup
1. Creator registers with email or Google account
2. Completes profile with professional information
3. Sets up payment methods (Stripe/PayPal)
4. Creates pricing options for audio requests
5. Customizes profile appearance and information

### Fan Request Process
1. Fan browses creators or visits specific creator profile
2. Selects desired pricing option
3. Fills out request details (occasion, recipient, instructions)
4. Completes payment
5. Receives confirmation and awaits creator response

### Request Fulfillment
1. Creator receives notification of new request
2. Reviews request details
3. Accepts or rejects the request
4. Records and uploads personalized audio message
5. Marks request as completed
6. Fan receives notification of completed request

### Messaging Interaction
1. User navigates to another user's profile
2. Initiates a new message
3. Composes and sends message
4. Recipient receives notification
5. Conversation continues with back-and-forth messages

## Non-Functional Requirements

### Performance
- Fast page load times (<3 seconds)
- Responsive design for all device sizes
- Efficient audio streaming and download

### Security
- Secure authentication with JWT
- Password encryption
- HTTPS for all communications
- Secure payment processing

### Scalability
- Horizontal scaling capabilities
- Efficient database queries
- Optimized file storage for audio files

### Accessibility
- WCAG 2.1 AA compliance
- Screen reader compatibility
- Keyboard navigation support

## Future Enhancements

### Potential Features
- Live audio sessions between creators and fans
- Subscription models for recurring content
- Group requests for shared experiences
- Video message capabilities
- Mobile applications for iOS and Android
- Advanced analytics for creators
- Marketplace for creator discovery

## Conclusion

FanSwoon provides a comprehensive platform for creators to monetize their audience through personalized audio messages while giving fans a unique way to connect with their favorite creators. The platform's robust feature set, intuitive user interface, and secure payment processing make it an ideal solution for creating meaningful connections between creators and their audiences.
