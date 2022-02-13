[TOC]
# About project
***This project is a crud of products whit next.js, tailwindcss and mysql***



# Run project
## First, install dependendencies
	npm install



## Second, run the development server:
	npm run dev
Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.




# Tutorial

## First step, create a next.js project 
### Create a next.js project
	npx create-next-app crud-mysql


## Second step, install dependencies 
### Dependencies for mysql
#### Install dependencies mysql
	npm i mysql2 axios
### Dependencies and config tailwind.css
#### Install dependencies tailwind css
	npm install -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p
#### Config tailwind css
*tailwind.config.js
*

    module.exports = {
    content: [
        "./pages/**/*.{js,ts,jsx,tsx}",
        "./components/**/*.{js,ts,jsx,tsx}",
    ],
    theme: {
        extend: {},
    },
    plugins: [],
    }

*globals.css
*

	@tailwind base;
    @tailwind components;
    @tailwind utilities;


## Third step, create directories
### Create directories in pages and api
Create directories for products in pages/products and pages/api/products

	pages/
         api/products/index.js
         api/products/[id].js
         products/index.js
### Return status in api 
api/products/[id].js

	export default(req,res)=>{
		return res.status(200).json('getting a product ' + req.query.id)
	}

api/products/index.js

	export default(req,res)=>{
		return res.status(200).json('getting a products')
	}


## Four step, database
### Create a database in mysql

	CREATE DATABASE productsnextjs;
	
	use productsnextjs;
	
	CREATE TABLE product (
		id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
		description VARCHAR(500) NOT NULL,
		price DECIMAL,
		createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
	
	describe product;

### Connect to mysql
in config/db.js

	import { createPool } from 'mysql2/promise'

	const pool = createPool({
		host:'localhost',
		user:'root',
		password:'',
		port:3306,
		database: 'productsnextjs'
	});

	export { pool };

#### Test connection
in pages/api/hello.js

	import { pool } from '../../config/db';

	export default async function handler(req,res){
	  const [rows] = await pool.query('SELECT NOW()');
	  return res.status(200).json(rows[0]['NOW()'])
	}

