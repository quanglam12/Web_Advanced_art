<?php
require 'db_connect.php';
include 'auto_login.php';
$user = autoLogin($conn);

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['generate_image'])) {
    $prompt = $_POST['image_prompt'];
    $url = "https://api.openai.com/v1/images/generations";

    $apiKey = getenv('API_KEY');

    $data = [
        "model" => "dall-e-3",
        "prompt" => $prompt,
        "n" => 1,
        "size" => "1024x1024"
    ];

    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_HTTPHEADER, [
        "Content-Type: application/json",
        "Authorization: Bearer $apiKey"
    ]);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($data));

    $response = curl_exec($curl);

    if ($response === false) {
        echo "cURL Error: " . curl_error($curl);
    } else {
        $decodedResponse = json_decode($response, true);
        if (isset($decodedResponse['data'][0]['url'])) {
            $imageUrl = $decodedResponse['data'][0]['url'];
            
            echo "<img src='$imageUrl' alt='Generated Image'><br>";
            echo "
            <form method='post'>
                <input type='hidden' name='image_url' value='$imageUrl'>
                <button type='submit' name='save_image'>Lưu</button>
            </form>";
        } else {
            echo "No image URL found in the response.";
        }
    }

    curl_close($curl);
}

if (isset($_POST['save_image'])) {
    $imageUrl = $_POST['image_url'];
    $imageData = file_get_contents($imageUrl);
    $imageName = $user['user_id'] . '-' . uniqid('', true) . '.png';
    $imagePath = 'imgAI/' . $imageName;

    if (file_put_contents($imagePath, $imageData)) {
        echo "Image saved successfully: <img src='$imagePath' alt='Saved Image'>";
    } else {
        echo "Failed to save image.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Image Generation</title>
</head>
<body>
    <h1>Tạo Ảnh với DALL-E</h1>
    <form method="post">
        <label for="image_prompt">Nhập nội dung để tạo ảnh:</label>
        <input type="text" id="image_prompt" name="image_prompt" required>
        <button type="submit" name="generate_image">Tạo</button>
    </form>
</body>
</html>
