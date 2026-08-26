# Weather_Reporting

### Objective:
 To create an automated Extract, Transform, Load (ETL) process to extract daily weather forecast and observed weather data and load it into a live report.

 As a proof-of-concept (POC), you are only required to do this for a single station and one source to begin with. For each day at noon (local time), you will gather both the actual temperature and the temperature forecasted for noon on the following day for Casablanca, Morocco.

 ### Data Source:
For this practice project, you'll use the weather data package provided by the open source project: https://wttr.in/
a web service that provides weather forecast information in a simple and text-based format. For further information, you can read more about the service on its repo: https://github.com/chubin/wttr.in#readme

### Actionable Items:
- Download raw weather data

- Extract data of interest from the raw data

- Transform the data as required

- Load the data into a log file using a tabular format

- Schedule the entire process to run automatically at a set time daily

### Weather reporting tasks:
You must extract and store the following data every day at noon, local time, for Casablanca, Morocco:

The actual temperature (in degrees Celsius)

The forecasted temperature (in degrees Celsius) for the following day at noon
