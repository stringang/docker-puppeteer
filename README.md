# docker-puppeteer

## Feature
- Support Chinese fonts(use Source Han Sans)

## Usage

```javascript
const browser = await puppeteer.launch({
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
});
```

```css
body {
  font-family: 'Source Han Sans CN', sans-serif;
  font-weight: 400;
}
```

- https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight#common_weight_name_mapping