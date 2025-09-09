## **Prerequisites**

* Two Android devices  
* nRF Connect for Mobile app installed on both devices  
* Bluetooth enabled on both devices

## **Part 1: Setting Up the BLE Server (Device 1\)**

### **Step 1: Open nRF Connect and Access Advertiser**

1. Launch **nRF Connect for Mobile**  
2. Tap the **hamburger menu** (three lines) in the top-left corner  
3. Select **Advertiser**  
4. Tap the **"+" button** to create a new advertiser configuration

### **Step 2: Configure Basic Advertising**

1. **Name your configuration**: "Test BLE Server"  
2. **Device name**: Enter "TestDevice"  
3. **Select Advertising data records** (Flags, Tx Power Level, Complete Local Name)  
4. **Advertising interval**: Leave default (100ms) or set to 1000ms for slower advertising  
5. **TX Power**: Leave default (0 dBm)  
6. **Connectable**: Make sure this is **enabled**  
7. Tap **OK** to save

### **Step 3: Create GATT Server Configuration**

1. Go back to the main screen  
2. Tap the **hamburger menu** again  
3. Select **Server**  
4. You'll see an empty server configuration

## **Part 2: Creating Custom Services and Characteristics**

### **Service 1: Device Information Service**

1. Tap **"+ ADD SERVICE"**  
2. Select **"Custom Service"**  
3. **Service UUID**: `12345678-1234-1234-1234-123456789abc`  
4. **Service Name**: "Device Info Service"  
5. Tap **"ADD CHARACTERISTIC"**

#### **Characteristic 1.1: Device Name (Read Only)**

* **UUID**: `12345678-1234-1234-1234-123456789ab1`  
* **Properties**: Check **Read** only  
* **Permissions**: Read  
* **Value Type**: Text  
* **Initial Value**: "My Test Device"

#### **Characteristic 1.2: Firmware Version (Read Only)**

* **UUID**: `12345678-1234-1234-1234-123456789ab2`  
* **Properties**: Check **Read** only  
* **Permissions**: Read  
* **Value Type**: Text  
* **Initial Value**: "v1.0.0"

### **Service 2: Sensor Data Service**

1. Tap **"+ ADD SERVICE"** again  
2. **Service UUID**: `87654321-4321-4321-4321-cba987654321`  
3. **Service Name**: "Sensor Data Service"

#### **Characteristic 2.1: Temperature (Read \+ Notify)**

* **UUID**: `87654321-4321-4321-4321-cba987654322`  
* **Properties**: Check **Read** and **Notify**  
* **Permissions**: Read  
* **Value Type**: Bytes (Hex)  
* **Initial Value**: `1628` (represents 22.4°C \- bytes can be interpreted as temperature data)

#### **Characteristic 2.2: Humidity (Read Only)**

* **UUID**: `87654321-4321-4321-4321-cba987654323`  
* **Properties**: Check **Read** only  
* **Permissions**: Read  
* **Value Type**: Bytes (Hex)  
* **Initial Value**: `3C` (represents 60% humidity \- single byte value)

#### **Characteristic 2.3: Battery Level (Read \+ Notify)**

* **UUID**: `87654321-4321-4321-4321-cba987654324`  
* **Properties**: Check **Read** and **Notify**  
* **Permissions**: Read  
* **Value Type**: Bytes (Hex)  
* **Initial Value**: `55` (represents 85% battery \- single byte where 0x55 \= 85 in decimal)

### **Service 3: Control Service**

1. Tap **"+ ADD SERVICE"** again  
2. **Service UUID**: `abcdef12-3456-7890-abcd-ef1234567890`  
3. **Service Name**: "Control Service"

#### **Characteristic 3.1: LED Control (Write)**

* **UUID**: `abcdef12-3456-7890-abcd-ef1234567891`  
* **Properties**: Check **Write** (without response)  
* **Permissions**: Write  
* **Value Type**: Bytes (Hex)  
* **Initial Value**: `00` (LED off \- 0x00 \= off, 0x01 \= on)

#### **Characteristic 3.2: Command (Write \+ Indicate)**

* **UUID**: `abcdef12-3456-7890-abcd-ef1234567892`  
* **Properties**: Check **Write** and **Indicate**  
* **Permissions**: Write  
* **Value Type**: Text  
* **Initial Value**: "ready"

#### **Characteristic 3.3: Status (Read \+ Write \+ Notify)**

* **UUID**: `abcdef12-3456-7890-abcd-ef1234567893`  
* **Properties**: Check **Read**, **Write**, and **Notify**  
* **Permissions**: Read, Write  
* **Value Type**: Text  
* **Initial Value**: "idle"

## **Part 3: Starting the BLE Server**

### **Step 1: Save Server Configuration**

1. After creating all services and characteristics, tap **"SAVE"**  
2. Name your server configuration: "Test GATT Server"

### **Step 2: Start Advertising**

1. Go back to **Advertiser** tab  
2. Find your "Test BLE Server" configuration  
3. Tap the **"START"** button  
4. Your device is now advertising and ready to accept connections

### **Step 3: Start GATT Server**

1. Go to **Server** tab  
2. Tap **"START SERVER"**  
3. The server is now running and ready to handle GATT operations

## **Part 4: Connecting with Client Device (Device 2\)**

### **Step 1: Scan for Devices**

1. On the second device, open **nRF Connect**  
2. Tap **"SCAN"** button  
3. Look for "TestDevice" in the scan results  
4. Tap **"CONNECT"** next to your device

### **Step 2: Explore Services**

1. After connection, you'll see all your custom services listed  
2. Tap on each service to expand and see characteristics  
3. Each characteristic will show its properties (Read, Write, Notify, etc.)

### **Step 3: Test Different Operations**

#### **Testing Read Operations:**

* Tap the **"Read"** button (📖) next to readable characteristics  
* Observe the values you set

#### **Testing Write Operations:**

* Tap the **"Write"** button (✏️) next to writable characteristics  
* For **Text** characteristics: Choose "Text" format and enter readable text  
* For **Bytes (Hex)** characteristics: Choose "Hex" format and enter hex values (e.g., `FF`, `01`, `A5`)  
* Send the new values

#### **Testing Notifications:**

* Tap the **"Subscribe"** button (🔔) next to characteristics with Notify property  
* Go back to the server device and update values manually  
* Observe notifications on the client device

## **Part 5: Dynamic Testing and Value Updates**

### **Updating Values on Server:**

1. On the server device, go to **Server** tab  
2. Tap on any characteristic  
3. Modify the value:  
   * **Text values**: Enter new text directly  
   * **Hex values**: Enter new hex bytes (e.g., change battery from `55` to `50` for 80%)  
4. If clients are subscribed to notifications, they'll receive updates automatically

### **Testing Scenarios:**

1. **Sensor Simulation**:  
   * Update temperature: `1640` (22.8°C), `1590` (21.6°C)  
   * Update humidity: `46` (70%), `32` (50%)  
2. **Command Testing**: Write text commands like "start", "stop", "reset" and update Status to "running", "stopped", "ready"  
3. **LED Control**: Write hex values `00` (off) or `01` (on) to LED Control characteristic  
4. **Battery Monitoring**: Gradually decrease battery level hex values: `55` (85%) → `4B` (75%) → `41` (65%)

## **Part 6: Data Format Guidelines**

### **Working with Hex Values:**

* **Single byte values**: `00` to `FF` (0-255 in decimal)  
* **Multi-byte values**: `1628` (2 bytes), `A1B2C3` (3 bytes)  
* **Common conversions**:  
  * Percentage: 85% \= `55` in hex  
  * Temperature: 22.4°C \= `1628` (custom encoding)  
  * Boolean: OFF \= `00`, ON \= `01`

### **Working with Text Values:**

* Use for human-readable data: status messages, commands, device names  
* Examples: "ready", "error", "start", "v1.0.0"  
* No length restrictions in nRF Connect

## **Troubleshooting Tips**

1. **Connection Issues**:  
   * Ensure both devices have Bluetooth enabled  
   * Try restarting the advertiser if connection fails  
   * Check that the server is running  
2. **Characteristic Issues**:  
   * Verify UUIDs are unique within each service  
   * Ensure properties match permissions  
   * For hex values, use valid hex characters (0-9, A-F)  
3. **Notification Problems**:  
   * Client must subscribe before notifications work  
   * Server must have notification property enabled  
   * Update values on server to trigger notifications  
4. **Value Format Issues**:  
   * Use only Text or Bytes (Hex) \- no other data types available  
   * For numeric data, encode as hex bytes and document the conversion  
   * Test hex values are properly formatted before sending

