aws --profile bjacobel s3 sync . s3://talks.bjacobel.com/ --exclude ".git/*" --exclude "node_modules/*"
aws --profile bjacobel s3 sync ./node_modules/reveal.js s3://talks.bjacobel.com/node_modules/reveal.js
aws --profile bjacobel cloudfront create-invalidation --distribution-id E3CGZFRSLEY54L --paths /*
