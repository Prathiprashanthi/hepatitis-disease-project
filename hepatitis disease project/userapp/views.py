from django.shortcuts import render,redirect
from django.contrib import messages
import time
from mainapp.models import *
from userapp.models import *
from adminapp.models import *
import pytz
from datetime import datetime
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
import pandas as pd

# Create your views here.
def user_dashboard(request):
    prediction_count = UserModel.objects.all().count()
    print(prediction_count)
    user_id = request.session["user_id"]
    user = UserModel.objects.get(user_id = user_id)
    Feedbacks_users_count= Feedback.objects.all().count()
    if user.Last_Login_Time is None:
        IST = pytz.timezone('Asia/Kolkata')
        current_time_ist = datetime.now(IST).time()
        user.Last_Login_Time = current_time_ist
        user.save()
    return render(request,'user/user-dashboard.html', {'predictions' : prediction_count, 'la' : user,'a':Feedbacks_users_count})

def user_profile(request):
    user_id = request.session["user_id"]
    user = UserModel.objects.get(user_id = user_id)
    if request.method == 'POST':
        user_name = request.POST.get('userName')
        user_age = request.POST.get('userAge')
        user_phone = request.POST.get('userPhNum')
        user_email = request.POST.get('userEmail')
        user_address = request.POST.get("userAddress")
        
        # user_img = request.POST.get("userimg")

        user.user_name = user_name
        user.user_age = user_age
        user.user_address = user_address
        user.user_contact = user_phone
        user.user_email=user_email
       

        if len(request.FILES) != 0:
            image = request.FILES['profilepic']
            user.user_image = image
            user.user_name = user_name
            user.user_age = user_age
            user.user_contact = user_phone
            user.user_email=user_email
            user.user_address = user_address
            user.save()
            messages.success(request, 'Updated SUccessfully...!')
        else:
            user.user_name = user_name
            user.user_age = user_age
            user.save()
            messages.success(request, 'Updated SUccessfully...!')
            
    context = {"i":user}
    return render(request,'user/user-profile.html',context)

def user_feedback(request):
    id=request.session["user_id"]
    uusser=UserModel.objects.get(user_id=id)
    if request.method == "POST":
        rating=request.POST.get("rating")
        review=request.POST.get("review")
        # print(sentiment)        
        # print(rating)
        sid=SentimentIntensityAnalyzer()
        score=sid.polarity_scores(review)
        sentiment=None
        if score['compound']>0 and score['compound']<=0.5:
            sentiment='positive'
        elif score['compound']>=0.5:
            sentiment='very positive'
        elif score['compound']<-0.5:
            sentiment='negative'
        elif score['compound']<0 and score['compound']>=-0.5:
            sentiment=' very negative'
        else :
            sentiment='neutral'
        Feedback.objects.create(Rating=rating,Review=review,Sentiment=sentiment,Reviewer=uusser)
        messages.success(request,'Feedback recorded')
        return redirect('user_feedback')
    return render(request,'user/user-feedback.html')
from sklearn.linear_model import LogisticRegression
def user_predict(request):
    if request.method == 'POST':
        Age = request.POST.get('age')
        Fatigue = request.POST.get('Fatigue')
        Malaise = request.POST.get('Malaise')
        SpleenPalpable = request.POST.get('SpleenPalpable')
        Spiders = request.POST.get('Spiders')
        Ascites =request.POST.get('Ascites')
        Varices= request.POST.get('Varices')
        Bilirubin = request.POST.get('Bilirubin')
        AlkPhosphate =request.POST.get('AlkPhosphate')
        Sgot=request.POST.get('Sgot')
        Albumin=request.POST.get('Albumin')
        Protime=request.POST.get('Protime')
        Age = float(Age)
       
        Bilirubin=float( Bilirubin)
        Albumin=float(Albumin)
       
            
       
        import pickle
        file_path = 'heptistis\Hepatitis.pkl'  # Path to the saved model file

        with open(file_path, 'rb') as file:
            loaded_model = pickle.load(file)
            res =loaded_model.predict([[SpleenPalpable,Fatigue,Varices,Sgot,AlkPhosphate,Age,Malaise,Spiders,Protime,Ascites,Bilirubin,Albumin]])
            #res=loaded_model.predict([[1,1,2,58,85,51,2,1,61,2,1,4 ]])

            dataset = Upload_dataset_model.objects.last()
            # print(dataset.Dataset)
            df=pd.read_csv(dataset.Dataset.path)
           
            x = df.drop('Class', axis = 1)
            y = df['Class']
            import imblearn
            from imblearn.over_sampling import SMOTE

            ros = SMOTE()  # You need to add parentheses to create an instance
            X_oversample, y_oversample = ros.fit_resample(x, y)

            print(X_oversample.shape)
            print(y_oversample.shape)

            from sklearn.model_selection import train_test_split

            X_train,X_test,y_train,y_test = train_test_split(X_oversample,y_oversample,random_state=1,test_size=0.2)
            from xgboost import XGBClassifier
          # logistic regression

            LR = LogisticRegression()
            LR.fit(X_train, y_train)


            # prediction
            train_prediction= LR.predict(X_train)
            test_prediction= LR.predict(X_test)
            print('*'*20)

            # evaluation
            from sklearn.metrics import accuracy_score
            print('test accuracy:',accuracy_score(y_test,test_prediction))
            print('train accuracy:',accuracy_score(y_train,train_prediction))
            print('*'*20)

            # cross validation score
            from sklearn.model_selection import cross_val_score
            score=cross_val_score(LR,x,y,cv=5)
            print(score.mean())
            print('*'*20)


            lr_HSC = accuracy_score(y_test,test_prediction)
            print(f"{round(lr_HSC*100,2)}% Accurate")

            from sklearn.metrics import accuracy_score,precision_score,recall_score
            accuracy = round(accuracy_score(y_test,test_prediction)*100, 2)
            precession = round(precision_score(test_prediction,y_test,average = 'macro')*100, 2)
            recall = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
            f1_score = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
            print(precession, accuracy,recall, f1_score,'uuuuuuuuuuuuuuuuuuuuuuuuuuu')
            x=0
            if res == 0:
                x = 0
                messages.success(request,"HEPATITIS DISEASE Is Not Detected")
            else:
                x=1
                messages.warning(request,"HEPATITIS DISEASE Is Detected")
            print(x)
            context = {'accc': accuracy,'pre': precession,'f1':f1_score,'call':recall,'res':x}
            print(type(res), 'ttttttttttttttttttttttttt')
            print(res)
            return render(request, 'user/user-result.html',context)
    return render(request,'user/user-predict.html')

def user_result(request):
    return render(request,'user/user-result.html')
def userlogout(request):
    user_id = request.session["user_id"]
    user =UserModel.objects.get(user_id = user_id)
    t = time.localtime()
    user.Last_Login_Time = t
    current_time = time.strftime('%H:%M:%S', t)
    user.Last_Login_Time = current_time
    current_date = time.strftime('%Y-%m-%d')
    user.Last_Login_Date = current_date
    user.save()
    messages.info(request, 'You are logged out..')
    return redirect('user_login')