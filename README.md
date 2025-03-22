# Demo Rails App

This is a simple demo Rails app that integrates Rails 8 Authentication and [Madmin](https://github.com/excid3/madmin) for a streamlined and easy-to-use admin interface. This guide will help you get started with the app and walk you through the key features.

## Prerequisites

Make sure you have the following installed:

- **Ruby** (version >= 3.0.0)
- **Rails 8.x**

## Getting Started

Follow these steps to set up and run the demo app:

### 1. Clone and setup repository

Clone this repository to your local machine:

```bash
git clone https://github.com/ACPK/madmin-test
cd madmin-test
bundle install
bin/rails db:reset
```

### 2.  Start the Development Server
```bash
bin/dev
```


## Features

### sqlite3
No local database setup is required, as Rails 8 handles data storage seamlessly.

### Rails Encryption
he app uses [Rails encryption](https://guides.rubyonrails.org/active_record_encryption.html#action-text) to securely store sensitive data. For demo purposes, the encryption keys are hardcoded to allow users to quickly clone and run the app.

In all other cases, they should be managed via environment variables.

### Authentication with Rails 8  
The app uses Rails 8 Authentication for handling user authentication. It automatically logs you in as a demo user on your first visit.

### Admin Interface with Madmin  
Madmin provides an intuitive admin interface for managing resources like users and messages. Access the Madmin interface once you're logged in.

### Message Table Structure  
The Message model includes the following columns:
- **title**: The title of the message (string).  
- **content**: The content of the message (text).
- **encrypted_user_id**: The encrypted user ID associated with the message (text).  

This setup ensures messages are securely linked to users.