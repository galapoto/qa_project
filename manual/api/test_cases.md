| **Test Case ID** | TC_API_001 |
|------------------|------------|
| **Title**        | Find Pets by Status - Available |
| **Description**  | Verify that the GET `/pet/findByStatus` endpoint returns a list of pets with status "available". |
| **Preconditions**| The Petstore API is running and accessible at https://petstore.swagger.io/v2. |
| **Test Steps**   | 1. Open Swagger Petstore UI.<br>2. Expand the GET `/pet/findByStatus` endpoint.<br>3. Enter `available` in the status field.<br>4. Click "Try it out" and then "Execute".<br>5. Observe the response. |
| **Expected Result** | The response status code is `200`. <br>The response body is a JSON array containing pets with `"status": "available"`. |
| **Actual Result**   | Response code: 200<br>First pet returned: <br>&nbsp;&nbsp;- name/type: fish <br>&nbsp;&nbsp;- status: available <br>&nbsp;&nbsp;- id: 9223372036854744000 |
| **Status**          | Pass |
| **Notes/Bug Reference** |  |



| **Test Case ID** | TC_API_002 |
|------------------|------------|
| **Title**        | Get Pet by ID - Existing Pet |
| **Description**  | Verify that the GET `/pet/{petId}` endpoint returns correct details for an existing pet. |
| **Preconditions**| The Petstore API is running and accessible.<br>There is a pet with ID `9223372036854744000`. |
| **Test Steps**   | 1. Open Swagger Petstore UI.<br>2. Expand GET `/pet/{petId}` endpoint.<br>3. Click "Try it out".<br>4. Enter petId as `9223372036854744000`.<br>5. Click "Execute".<br>6. Observe the response. |
| **Expected Result** | The response status code is `200`.<br>The response body shows details for the pet with id `9223372036854744000`. |
| **Actual Result**   | Response code: 200<br>Pet id: 9223372036854744000<br>Pet name: 5<br>Status: available |
| **Status**          | Pass |
| **Notes/Bug Reference** |  |


| **Test Case ID** | TC_API_003 |
|------------------|------------|
| **Title**        | Get Pet by ID - Non-Existing Pet (Negative Test) |
| **Description**  | Verify that the GET `/pet/{petId}` endpoint returns a 404 error for a pet that does not exist. |
| **Preconditions**| The Petstore API is running and accessible.<br>The pet ID `8744541522214` does not exist in the system. |
| **Test Steps**   | 1. Open Swagger Petstore UI.<br>2. Expand GET `/pet/{petId}` endpoint.<br>3. Click "Try it out".<br>4. Enter petId as `8744541522214`.<br>5. Click "Execute".<br>6. Observe the response. |
| **Expected Result** | The response status code is `404`.<br>The response body shows a message "Pet not found". |
| **Actual Result**   | Response code: 404<br>Body: {<br>&nbsp;&nbsp;"code": 1,<br>&nbsp;&nbsp;"type": "error",<br>&nbsp;&nbsp;"message": "Pet not found"<br>} |
| **Status**          | Pass |
| **Notes/Bug Reference** |  |


| **Test Case ID** | TC_API_004 |
|------------------|------------|
| **Title**        | Create a New Pet (POST) |
| **Description**  | Verify that a new pet can be added using the POST `/pet` endpoint. |
| **Preconditions**| The Petstore API is running and accessible. |
| **Test Steps**   | 1. Open Swagger Petstore UI.<br>2. Expand POST `/pet` endpoint.<br>3. Click "Try it out".<br>4. Enter the following JSON:<br>{<br>&nbsp;&nbsp;"id": 135790,<br>&nbsp;&nbsp;"category": {"id": 1, "name": "fish"},<br>&nbsp;&nbsp;"name": "beta",<br>&nbsp;&nbsp;"photoUrls": ["https://example.com/fish.jpg"],<br>&nbsp;&nbsp;"tags": [{"id": 1, "name": "pet"}],<br>&nbsp;&nbsp;"status": "available"<br>}<br>5. Click "Execute".<br>6. Observe the response. |
| **Expected Result** | The response status code is `200`.<br>The response body contains the pet details entered in the request. |
| **Actual Result**   | Response code: 200<br>Body:<br>{<br>&nbsp;&nbsp;"id": 135790,<br>&nbsp;&nbsp;"category": {"id": 1, "name": "fish"},<br>&nbsp;&nbsp;"name": "beta",<br>&nbsp;&nbsp;"photoUrls": ["https://example.com/fish.jpg"],<br>&nbsp;&nbsp;"tags": [{"id": 1, "name": "pet"}],<br>&nbsp;&nbsp;"status": "available"<br>} |
| **Status**          | Pass |
| **Notes/Bug Reference** |  |


| **Test Case ID** | TC_API_005 |
|------------------|------------|
| **Title**        | Delete an Existing Pet (DELETE) |
| **Description**  | Verify that a pet can be deleted using the DELETE `/pet/{petId}` endpoint. |
| **Preconditions**| The Petstore API is running and accessible.<br>There is a pet with ID `135790` to delete. |
| **Test Steps**   | 1. Open Swagger Petstore UI.<br>2. Expand DELETE `/pet/{petId}` endpoint.<br>3. Click "Try it out".<br>4. Enter petId as `135790`.<br>5. Click "Execute".<br>6. Observe the response. |
| **Expected Result** | The response status code is `200`.<br>The response body confirms the deleted pet ID in the message. |
| **Actual Result**   | Response code: 200<br>Body:<br>{<br>&nbsp;&nbsp;"code": 200,<br>&nbsp;&nbsp;"type": "unknown",<br>&nbsp;&nbsp;"message": "135790"<br>} |
| **Status**          | Pass |
| **Notes/Bug Reference** |  |


| **Test Case ID** | TC_API_006 |
|------------------|------------|
| **Title**        | Verify Deleted Pet Cannot Be Retrieved (GET after DELETE) |
| **Description**  | Confirm that after deleting a pet, a GET `/pet/{petId}` request for the same ID returns 404 and "Pet not found". |
| **Preconditions**| The Petstore API is running and accessible.<br>Pet with ID `135790` was previously deleted. |
| **Test Steps**   | 1. Open Swagger Petstore UI.<br>2. Expand GET `/pet/{petId}` endpoint.<br>3. Click "Try it out".<br>4. Enter petId as `135790`.<br>5. Click "Execute".<br>6. Observe the response. |
| **Expected Result** | The response status code is `404`.<br>The response body includes:<br>{<br>&nbsp;&nbsp;"code": 1,<br>&nbsp;&nbsp;"type": "error",<br>&nbsp;&nbsp;"message": "Pet not found"<br>} |
| **Actual Result**   | Response code: 404<br>Body:<br>{<br>&nbsp;&nbsp;"code": 1,<br>&nbsp;&nbsp;"type": "error",<br>&nbsp;&nbsp;"message": "Pet not found"<br>} |
| **Status**          | Pass |
| **Notes/Bug Reference** |  |


