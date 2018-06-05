# How can we tell if a movie will be great?
Combining k-means clustering with decision tree on IMDb data

Ever wonder how great a movie will be before its release? Recently IMDb data of 5,000+ movies was scraped with Python and published on Kaggle.com by Chuan Sun: https://www.kaggle.com/tmdb/tmdb-movie-metadata/data

# Objective
Our objective is to find out what factors might contribute to great movies.

# Approach
1…Apply k-means clustering to assign movies into 5 classes

First we need to define what great movies are. One simple way is to use the IMDb scores; however, the approach we are using here is to combine the scores with box office (gross) in order to get a more balanced indicator on how great the movies are. Movies are being labeled into 5 different categories, as shown below. We can see that the majority of movies are in cluster 3, which generated low box offices and with high variations in IMDb scores; whereas movies in cluster 1 have relatively higher gross and scores compared to other clusters.


# Screenshot of the k-mean clustering result (number of clusters is 5 and simulated 20 times)
2…Construct a decision tree to classify movies based on different variables

Next we will input different factors and see which factors help classifying movies into the 5 clusters created most, by building a decision tree. According to the result, number of voted users, movie budget, R-rated content, and number of critic reviews are observed to have influences on greatness of the movies.


Result of the decision tree (going left indicates positive on the given condition; going right indicates negative)
Say we want to know if a movie will be great (cluster 1 in green), we will have to follow the path created from top to bottom in the decision tree:

The number of voted user has to be greater than or equal to 43,000
Movie budget has to be greater than $36M USD
The movie cannot be R-rated
The number of voted user actually has to be greater than or equal to 519,000
By fulfilling the conditions above, we will have close to 70% chance of knowing that the movie will be a great one before its release!

# Data Preperation
1…Some critical values are missing in the file, and thus rows are removed

2…Dummy variables created for categorical variables (language, country)

3…Training set and testing set are created with 4:1 ratio

# Results
Based on the confusion matrix, the overall accuracy is 0.6572 on 5 clusters (with cluster 1 accuracy close to 0.70).


Screenshot of the decision tree performance on 5 clusters
In order to improve the overall accuracy, we may want to include more variables from the file, as we have not included genres (action, adverture, thriller..etc), movie title (may require natural language processing) and keywords in plots (may require text mining).

In addition, we can explore further if the number of clusters can be improved. Let us first take a look at performance on 6 clusters. It is observed that the performance dropped by 5% in terms of accuracy.


Screenshot of the decision tree performance on 6 clusters
Next we will examine performance with only 4 clusters.


Screenshot of the decision tree performance on 4 clusters
The result is at 100% accuracy! It makes sense because as we reduce the outcome clusters, it is easier for the decision tree model to predict. For example, if there is only one outcome cluster, we will always have 100% accuracy too.
