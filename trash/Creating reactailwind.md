# Install Tailwind CSS with Create React App

Setting up Tailwind CSS in a Create React App project.

Create React App does not support custom PostCSS configurations and is incompatible with many important tools in the PostCSS ecosystem, like `postcss-import`.

We highly recommend using Vite, Parcel, Next.js, or Remix instead of Create React App. They provide an equivalent or better developer experience but with more flexibility, giving you more control over how Tailwind and PostCSS are configured.

## Create your project

Start by creating a new React project with Create React App v5.0+ if you don't have one already set up.

```bash
npx create-react-app my-project
cd my-project
```

## Install Tailwind CSS

Install tailwindcss via npm, and then run the init command to generate your `tailwind.config.js` file.

```bash
npm install -D tailwindcss@3
npx tailwindcss init
```

## Configure your template paths

Add the paths to all of your template files in your `tailwind.config.js` file.

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        "./src/**/*.{js,jsx,ts,tsx}",
    ],
    theme: {
        extend: {},
    },
    plugins: [],
}
```

## Add the Tailwind directives to your CSS

Add the `@tailwind` directives for each of Tailwind’s layers to your `./src/index.css` file.

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

## Start your build process

Run your build process with `npm run start`.

```bash
npm run start
```

## Start using Tailwind in your project

Start using Tailwind’s utility classes to style your content.

```javascript
export default function App() {
    return (
        <h1 className="text-3xl font-bold underline">
            Hello world!
        </h1>
    )
}
```