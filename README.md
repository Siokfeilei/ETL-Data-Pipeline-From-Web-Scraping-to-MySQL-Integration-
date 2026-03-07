Gans E-Scooter Data Pipeline Project

Overview
As a Junior Data Engineer at **Gans**, I built an automated data pipeline to collect, transform, and store data that supports fleet management and operational decisions for e-scooter sharing in major cities.  
The primary goal was to ensure that scooters are **available where users need them**, accounting for user behavior, weather, tourism, and urban mobility patterns.

## Project Phases
### Phase 1: Local Pipeline
- **Data Collection:**  
  - **Web scraping** with Python’s BeautifulSoup to gather public data from city and mobility websites.  
  - **APIs** for structured, real-time data retrieval, including weather (OpenWeatherMap) and flight data (AeroDataBox).  
- **Data Cleaning & Transformation:**  
  - Python string operations, regex, and Pandas for parsing JSON and CSV data.  
  - Iterative processing via for-loops and list comprehensions.  
- **Data Storage:**  
  - Created and managed a **local MySQL database** with well-defined tables and relationships.  
  - Populated tables using Python scripts with INSERT queries.

### Phase 2: Cloud Pipeline (GCP)
- **Database Migration:**  
  - Set up a **MySQL instance on Google Cloud Platform (GCP)**.  
  - Connected local scripts to the cloud database.  
- **Automated Data Collection:**  
  - Converted Python scripts to **Cloud Functions** for automated execution.  
  - Scheduled daily updates using **Cloud Scheduler**.  
- **Data Flow:**  
  - Static tables (city & airport information) remain unchanged.  
  - Dynamic tables (weather & flights) updated daily from API endpoints.

## Key Achievements
- Built a **robust, automated data pipeline** for real-time operational data.  
- Centralized heterogeneous data sources into a **single SQL repository** for analysis.  
- Established cloud-based automation using **GCP Cloud Functions** and **Scheduler**.  
- Laid the foundation for **predictive modeling** of scooter movements and user demand.
- Journaling the lesson learnt on Medium

## Tools & Technologies
- **Python:** BeautifulSoup, Pandas, regex, JSON handling  
- **SQL / MySQL:** Table design, queries, constraints, relationships  
- **GCP:** MySQL instance, Cloud Functions, Cloud Scheduler  
- **APIs:** OpenWeatherMap, AeroDataBox  

## Next Steps
- Integrate predictive analytics models to forecast scooter demand.  
- Expand the pipeline to include more cities and additional external data sources.  
- Monitor and optimize pipeline performance, ensuring low latency and high reliability.
