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

### **Service 3: Control Service (Secured)**

1. Tap **"+ ADD SERVICE"** again  
2. **Service UUID**: `abcdef12-3456-7890-abcd-ef1234567890`  
3. **Service Name**: "Control Service"

#### **Characteristic 3.1: LED Control (Write \- Requires Authentication)**

* **UUID**: `abcdef12-3456-7890-abcd-ef1234567891`  
* **Properties**: Check **Write** (without response)  
* **Permissions**: Write (Encrypted) \- **Enable "Encrypted write"** if available  
* **Value Type**: Bytes (Hex)  
* **Initial Value**: `00` (LED off \- 0x00 \= off, 0x01 \= on)

#### **Characteristic 3.2: Command (Write \+ Indicate \- Requires Authentication)**

* **UUID**: `abcdef12-3456-7890-abcd-ef1234567892`  
* **Properties**: Check **Write** and **Indicate**  
* **Permissions**: Write (Encrypted) \- **Enable "Encrypted write"** if available  
* **Value Type**: Text  
* **Initial Value**: "ready"

#### **Characteristic 3.3: Status (Read \+ Write \+ Notify \- Requires Authentication)**

* **UUID**: `abcdef12-3456-7890-abcd-ef1234567893`  
* **Properties**: Check **Read**, **Write**, and **Notify**  
* **Permissions**: Read (Encrypted), Write (Encrypted) \- **Enable encryption options** if available  
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

* Tap the **"Subscribe"** button (📫) next to characteristics with Notify property  
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

## **Part 6: Setting Up Secure BLE Server (Pairing & Bonding)**

### **Understanding BLE Security Concepts**

**Pairing** is the process of establishing a secure connection between two BLE devices by exchanging cryptographic keys. **Bonding** stores these keys for future automatic reconnection without re-pairing.

**Just Works Pairing**: The simplest pairing method where devices automatically establish a secure connection without requiring user interaction (no PIN/passkey entry).

### **Step 1: Configure Security Settings in nRF Connect Server**

**Note**: nRF Connect for Mobile has limited security configuration options as a server. Most security enforcement happens at the Android system level.

1. When creating characteristics in **Service 3: Control Service**, ensure you've enabled encryption:  
   * Look for **"Encrypted"** options in permissions  
   * Some versions show **"Authentication required"** checkboxes  
   * If available, enable these for characteristics in the Control Service

### **Step 2: Testing Security from Client Side**

#### **Initial Connection (No Security)**

1. Connect to your BLE server using the client device  
2. Try accessing **Service 1** and **Service 2** characteristics  
3. These should work without any security requirements  
4. Note that these operations complete successfully

#### **Accessing Secured Characteristics**

1. Navigate to **Service 3: Control Service**  
2. Try to read/write to the secured characteristics  
3. You may see different behaviors:  
   * **Android 6.0+**: May automatically trigger pairing dialog  
   * **Older versions**: May show "Insufficient authentication" error

### **Step 3: Initiating Just Works Pairing**

#### **Method 1: Automatic Pairing (Recommended)**

1. In nRF Connect client, attempt to write to a secured characteristic in Service 3  
2. Android should automatically display a pairing dialog  
3. Both devices will show **"Bluetooth pairing request"**  
4. Tap **"PAIR"** on both devices  
5. No PIN/passkey entry required (Just Works)  
6. Connection should now be secured

#### **Method 2: Manual Bonding Initiation**

1. In nRF Connect client, tap the **"Options"** menu (three dots) while connected  
2. Look for **"Bond"** or **"Pair"** option  
3. Select it to initiate pairing process  
4. Follow the same pairing dialog process

### **Step 4: Testing Bonded Connection Behavior**

#### **Immediate Testing (Same Session)**

1. After pairing, retry accessing Service 3 characteristics  
2. Operations should now succeed without additional prompts  
3. Write different values to LED Control and Command characteristics  
4. Verify that previously blocked operations now work

#### **Testing Persistent Bonding**

1. **Disconnect** the BLE connection (don't unpair)  
2. **Reconnect** to the same server device  
3. Try accessing Service 3 characteristics immediately  
4. If bonding worked: Operations should succeed without re-pairing  
5. If bonding failed: You'll need to pair again

### **Step 5: Managing Bonding States**

#### **Viewing Bonded Devices**

1. In Android **Settings** → **Bluetooth**  
2. Find your server device in the paired devices list  
3. It should show as "Paired" with your server device name

#### **Testing Both Bonded and Non-Bonded Scenarios**

**Scenario A: Bonded Connection**

1. Keep devices paired in Android settings  
2. Connect via nRF Connect  
3. Access Service 3 characteristics directly

**Scenario B: Non-Bonded Connection**

1. **Unpair** devices in Android Bluetooth settings  
2. Connect via nRF Connect (new pairing required)  
3. Try accessing Service 3 → should trigger new pairing dialog

#### **Clearing Bond Information**

1. In Android **Settings** → **Bluetooth**  
2. Find the paired device  
3. Tap the **gear/settings icon** next to device name  
4. Select **"Unpair"** or **"Forget"**  
5. This clears all bonding information

### **Step 6: Understanding Security Behaviors**

#### **Expected Security Flow**

1. **First Connection**: No security, can access Services 1 & 2  
2. **Access Service 3**: Triggers pairing dialog (Just Works)  
3. **After Pairing**: Full access to all characteristics  
4. **Reconnection**: Automatic security (if bonded) or re-pair if bond cleared

#### **Authentication vs. Encryption**

* **Authentication**: Verifies the identity of the connected device (requires pairing)  
* **Encryption**: Protects data in transit (automatic after pairing)  
* **Service 3 characteristics**: Require both for read/write operations

### **Step 7: Advanced Security Testing**

#### **Testing Different Error Conditions**

1. **Before Pairing**: Try writing to secured characteristics

   * Expected result: "Insufficient authentication" or automatic pairing prompt  
2. **Connection without Bonding**: Clear bonds, connect, don't pair

   * Expected result: Can read Services 1&2, blocked from Service 3  
3. **Partial Operations**: After pairing, test each secured characteristic

   * All Service 3 operations should work normally

#### **Monitoring Security Events**

1. In nRF Connect, watch for security-related log messages  
2. Look for indicators like:  
   * "Security request sent"  
   * "Pairing completed"  
   * "Bond saved"  
   * "Encryption enabled"

### **Step 8: Educational Security Concepts**

#### **Key Learning Points**

* **Service Separation**: Unsecured services (1&2) vs. secured service (3) demonstrate security boundaries  
* **Just Works Simplicity**: No user interaction required, suitable for IoT devices  
* **Bonding Benefits**: Eliminates repeated pairing for trusted devices  
* **Android Integration**: BLE security integrates with Android's Bluetooth management

#### **Real-World Applications**

* **Fitness Trackers**: Basic data (steps, heart rate) unsecured; personal settings secured  
* **Smart Locks**: Status information public; control commands require authentication  
* **Medical Devices**: General health data readable; configuration requires pairing

#### **Security Limitations in nRF Connect**

* **Server-side limitations**: nRF Connect for Mobile cannot enforce all security policies as a server  
* **Testing focus**: Better for understanding client-side security behavior  
* **Production deployment**: Real devices would have more granular security control

### **Troubleshooting Security Issues**

1. **Pairing Dialog Doesn't Appear**:

   * Ensure characteristics have proper encryption settings  
   * Try clearing Bluetooth cache: Settings → Apps → Bluetooth → Storage → Clear Cache  
   * Restart both devices  
2. **Bond Not Persistent**:

   * Check if devices remain in Android paired device list  
   * Some Android versions may not maintain bonds with non-standard devices  
   * Try the bonding process again  
3. **Still Getting Authentication Errors After Pairing**:

   * Verify the pairing completed successfully on both devices  
   * Check that encrypted permissions are properly set on characteristics  
   * Try disconnecting and reconnecting  
4. **Cannot Access Any Characteristics**:

   * Ensure Services 1 & 2 don't have encryption enabled (for comparison)  
   * Only Service 3 should require authentication  
   * Verify server is still running after pairing process

## **Part 7: Data Format Guidelines**

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
5. **Security Issues**:  
   * Clear Bluetooth cache if pairing dialogs don't appear  
   * Verify both devices completed the pairing process  
   * Check Android Bluetooth settings for paired device status  
   * Remember that only Service 3 characteristics should require authentication

