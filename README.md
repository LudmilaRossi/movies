# How can we tell if a movie will be great?
Combining k-means clustering with decision tree on IMDb data

Ever wonder how great a movie will be before its release? Recently IMDb data of 5,000+ movies was scraped with Python and published on Kaggle.com by Chuan Sun: https://www.kaggle.com/tmdb/tmdb-movie-metadata/data

## The objective is to find out what factors might contribute to great movies.

### Ap#ply k-means clustering to assign movies into 5 classes
<img src="https://drive.google.com/file/d/19MVk6gY89851kefOk2PUPPyC5kdK1WWv/view?usp=sharing" />

### Construct a decision tree to classify movies based on different variables

### Some critical values are missing in the file, and thus rows are removed

- Dummy variables created for categorical variables (language, country)
- Training set and testing set are created with 4:1 ratio

### Based on the confusion matrix, the overall accuracy is 0.6572 on 5 clusters (with cluster 1 accuracy close to 0.70).
