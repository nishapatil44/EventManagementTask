<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Side Menu with Data List</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        #sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100%;
            background-color: #333;
            color: #fff;
            padding-top: 20px;
        }
        #sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        #sidebar ul li {
            padding: 10px;
            border-bottom: 1px solid #555;
        }
        #sidebar ul li:hover {
            background-color: #555;
        }
        #content {
            margin-left: 250px;
            padding: 20px;
        }
        .data-list {
            margin-top: 20px;
        }
        .data-list table {
            width: 100%;
            border-collapse: collapse;
        }
        .data-list th, .data-list td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .data-list th {
            background-color: #f2f2f2;
        }
        .data-list td button {
            cursor: pointer;
            margin-right: 5px;
        }
        .white-text {
            color: white;
            text-decoration: none; /* Remove underline */
        }
        .white-text {
            color: white;
            text-decoration: none; /* Remove underline */
        }
    </style>
</head>

<body>

<div id="sidebar">
    <!-- <ul>
        <li><a href="{{ route('categories.show') }}" class="white-text">Category</a></li>
        <li><a href="{{ route('materials.show') }}" class="white-text">Material</a></li>
        <li><a href="{{ route('iomaster.show') }}" class="white-text">Inward/Outward Master</a></li>
    </ul> -->
</div>

<div id="content">
    <div class="data-list">
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Opening Balance</th>
                    <th>Updated at</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $count = 1;
                @endphp
                @foreach ($material_list as $material)
                <tr>
                    <td>{{ $count }}</td>
                    <td>{{ $material['material_name'] }}</td>
                    <td>{{ $material['category_name'] }}</td>
                    <td>{{ $material['opening_balance'] }}</td>
                    <td>{{ $material['updated_at'] }}</td>
                    <td>
                        <!-- <button onclick="viewItem()">View</button>
                        <button onclick="editItem()">Edit</button>
                        <button onclick="deleteItem()">Delete</button> -->
                        <a href="{{ route('materials.create') }}" title="View"><i class="fas fa-plus"></i></a>
                        <a href="{{ route('materials.edit', ['id' => $material['id']]) }}" title="Edit"><i class="fas fa-edit"></i></a>
                        <a href="{{ route('materials.delete', ['id' => $material['id']]) }}" title="Delete"><i class="fas fa-trash-alt"></i></a>
                    </td>
                </tr>
                @php
                    $count++;
                @endphp
                @endforeach
                <!-- Add more rows of data as needed -->
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
