from django.shortcuts import render,redirect
from mainapp.models import*
from userapp.models import*
from adminapp.models import *
from django.contrib import messages
from django.core.paginator import Paginator
import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from xgboost import XGBClassifier
from sklearn.ensemble import GradientBoostingClassifier
from sklearn.ensemble import AdaBoostClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.linear_model import LogisticRegression
# Create your views here.
def admin_dashboard(req):
    all_users_count =  UserModel.objects.all().count()
    pending_users_count = UserModel.objects.filter(User_Status = 'Pending').count()
    rejected_users_count = UserModel.objects.filter(User_Status = 'removed').count()
    accepted_users_count = UserModel.objects.filter(User_Status = 'accepted').count()
    Feedbacks_users_count= Feedback.objects.all().count()
    prediction_count = UserModel.objects.all().count()
    return render(req,'admin/dashboard.html',{'a' : all_users_count, 'b' : pending_users_count, 'c' : rejected_users_count, 'd' : accepted_users_count,'e':Feedbacks_users_count,'f' : prediction_count,})
def pending_users(req):
    pending =UserModel.objects.filter(User_Status = 'Pending')
    paginator = Paginator(pending, 5) 
    page_number = req.GET.get('page')
    post = paginator.get_page(page_number)
    return render(req,'admin/admin_pendingusers.html', { 'user' : post})
def all_users(req):
    all_users = UserModel.objects.all()
    paginator = Paginator(all_users, 5)
    page_number = req.GET.get('page')
    post = paginator.get_page(page_number)
    return render(req,'admin/admin_allusers.html', {"allu" : all_users, 'user' : post})
def delete_user(req, id):
    UserModel.objects.get(user_id = id).delete()
    messages.warning(req, 'User was Deleted..!')
    return redirect('all_users')

# Acept users button
def accept_user(req, id):
    status_update = UserModel.objects.get(user_id = id)
    status_update.User_Status = 'accepted'
    status_update.save()
    messages.success(req, 'User was accepted..!')
    return redirect('pending_users')

# Remove user button
def reject_user(req, id):
    status_update2 = UserModel.objects.get(user_id = id)
    status_update2.User_Status = 'removed'
    status_update2.save()
    messages.warning(req, 'User was Rejected..!')
    return redirect('pending_users')

def adminlogout(req):
    messages.info(req, 'You are logged out successfully.')
    return redirect('admin_login')



def upload_dataset(req):
    if req.method == 'POST':
        file = req.FILES['data_file']
        # print(file)
        file_size = str((file.size)/1024) +' kb'
        # print(file_size)
        Upload_dataset_model.objects.create(File_size = file_size, Dataset = file)
        messages.success(req, 'Your dataset was uploaded..')
    return render(req,'admin/admin_uploaddataset.html')

def viewdataset(req):
    dataset = Upload_dataset_model.objects.all()
    paginator = Paginator(dataset, 5)
    page_number = req.GET.get('page')
    post = paginator.get_page(page_number)
    return render(req,'admin/admin_viewdataset.html', {'data' : dataset, 'user' : post})

def delete_dataset(req, id):
    dataset = Upload_dataset_model.objects.get(User_id = id).delete()
    messages.warning(req, 'Dataset was deleted..!')
    return redirect('viewdataset')


def view_view(req):
    data = Upload_dataset_model.objects.last()
    print(data,type(data),'sssss')
    file = str(data.Dataset)
    df = pd.read_csv(f'./media/{file}')
    table = df.to_html(table_id='data_table')
    return render(req,'admin/admin_view_view.html', {'t':table})

def xgbalgm(req):
   return render(req,'admin/xg_boost.html' )

def XGBOOST_btn(req):
    dataset = Upload_dataset_model.objects.last()
    df=pd.read_csv(dataset.Dataset.path)
    df['Class'] = df['Class'].replace(2, 0)


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
    XGB = XGBClassifier()
    XGB.fit(X_train, y_train)

    # prediction
    train_prediction= XGB.predict(X_train)
    test_prediction= XGB.predict(X_test)
    print('*'*20)

    # evaluation
    from sklearn.metrics import accuracy_score
    print('test accuracy:',accuracy_score(y_test,test_prediction))
    print('train accuracy:',accuracy_score(y_train,train_prediction))

    print('*'*20)


    XGB_HSC = accuracy_score(test_prediction,y_test)
    print(f"{round(XGB_HSC*100,2)}% Accurate")
    # evaluation
    from sklearn.metrics import accuracy_score,precision_score,recall_score,recall_score
    accuracy = round(accuracy_score(y_test,test_prediction)*100, 2)
    precession = round(precision_score(test_prediction,y_test,average = 'macro')*100, 2)
    recall = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    f1_score = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    name = "XG Boost Algorithm"
    XG_ALGO.objects.create(Accuracy=accuracy,Precession=precession,F1_Score=f1_score,Recall=recall,Name=name)
    data =XG_ALGO.objects.last()
    messages.success(req, 'Algorithm executed Successfully')
    return render(req,'admin/xg_boost.html' ,{'i': data})
    
def adabalgm(req):
    return render(req,'admin/ada_boost.html')

def ADABoost_btn(req):
    dataset = Upload_dataset_model.objects.last()
    df=pd.read_csv(dataset.Dataset.path)
    df['Class'] = df['Class'].replace(2, 0)


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

    ada=AdaBoostClassifier(random_state=42)
    ada.fit(X_train,y_train)
    print('*'*20)

    # prediction
    train_prediction= ada.predict(X_train)
    test_prediction= ada.predict(X_test)
    print('*'*20)

    # evaluation
    from sklearn.metrics import accuracy_score
    print('test accuracy:',accuracy_score(y_test,test_prediction))
    print('train accuracy:',accuracy_score(y_train,train_prediction))
    print('*'*20)

    # cross validation score
    # from sklearn.model_selection import cross_val_score
    # score=cross_val_score(ada,X,Y,cv=5)
    # print(score.mean())
    print('*'*20)

    # Accuracy score
    ada_h = accuracy_score(test_prediction,y_test)
    print(f"{round(ada_h*100,2)}% Accurate")
    # evaluation
    from sklearn.metrics import accuracy_score,precision_score,recall_score,recall_score
    accuracy = round(accuracy_score(y_test,test_prediction)*100, 2)
    precession = round(precision_score(test_prediction,y_test,average = 'macro')*100, 2)
    recall = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    f1_score = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    name = "ADA Boost Algorithm"
    ADA_ALGO.objects.create(Accuracy=accuracy,Precession=precession,F1_Score=f1_score,Recall=recall,Name=name)
    data =ADA_ALGO.objects.last()
    messages.success(req, 'Algorithm executed Successfully')
    return render(req,'admin/ada_boost.html',{'i': data})

def knnalgm(req):
    return render(req,'admin/knn_algorithem.html')

def KNN_btn(req):
    dataset = Upload_dataset_model.objects.last()
    df=pd.read_csv(dataset.Dataset.path)
    df['Class'] = df['Class'].replace(2, 0)


    x = df.drop('Class', axis = 1)
    y = df['Class']
    from sklearn.neighbors import KNeighborsClassifier
    from sklearn.metrics import classification_report, confusion_matrix, accuracy_score

    import imblearn
    from imblearn.over_sampling import SMOTE

    ros = SMOTE()  # You need to add parentheses to create an instance
    X_oversample, y_oversample = ros.fit_resample(x, y)

    print(X_oversample.shape)
    print(y_oversample.shape)

    from sklearn.model_selection import train_test_split

    Xx_train,Xx_test,yy_train,yy_test = train_test_split(X_oversample,y_oversample,random_state=1,test_size=0.2)

    from sklearn.preprocessing import StandardScaler
    scaler = StandardScaler()
    Xx_train=scaler.fit_transform(Xx_train)
    Xx_test= scaler.transform(Xx_test)

    # model
    knn_model=KNeighborsClassifier()
    knn_model.fit(Xx_train,yy_train)

    # prediction

    test_prediction= knn_model.predict(Xx_test)

    # evaluation
    print('*'*20)
    from sklearn.metrics import accuracy_score
    print('Test accuracy:',accuracy_score(yy_test,test_prediction))
    

    print('*'*20)
    result = confusion_matrix(yy_test, test_prediction)
    print("Confusion Matrix:")
    print(result)


    print('*'*20)
    #  prediction Summary by species
    print(classification_report(yy_test, test_prediction))


    print('*'*20)
    # Accuracy score
    Knn_SC = accuracy_score(test_prediction,yy_test)
    print(f"{round(Knn_SC*100,2)}% Accurate")




    # evaluation
    from sklearn.metrics import accuracy_score,precision_score,recall_score,recall_score
    accuracy = round(accuracy_score(yy_test,test_prediction)*100, 2)
    precession = round(precision_score(test_prediction,yy_test,average = 'macro')*100, 2)
    recall = round(recall_score(test_prediction,yy_test,average = 'macro')*100, 2)
    f1_score = round(recall_score(test_prediction,yy_test,average = 'macro')*100, 2)
    name = "KNN Algorithm"
    KNN_ALGO.objects.create(Accuracy=accuracy,Precession=precession,F1_Score=f1_score,Recall=recall,Name=name)
    data =KNN_ALGO.objects.last()
    messages.success(req, 'Algorithm executed Successfully')
    return render(req,'admin/knn_algorithem.html',{'i': data})

def logistic_regression(req):
    return render(req,'admin/linear_algorithem.html')
def logistic_regression_btn(req):
    dataset = Upload_dataset_model.objects.last()
    df=pd.read_csv(dataset.Dataset.path)
    df['Class'] = df['Class'].replace(2, 0)

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
    # evaluation
    from sklearn.metrics import accuracy_score,precision_score,recall_score,recall_score
    accuracy = round(accuracy_score(y_test,test_prediction)*100, 2)
    precession = round(precision_score(test_prediction,y_test,average = 'macro')*100, 2)
    recall = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    f1_score = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    name = "Logistic Algorithm"
    Logistic.objects.create(Accuracy=accuracy,Precession=precession,F1_Score=f1_score,Recall=recall,Name=name)
    data =Logistic.objects.last()
    messages.success(req, 'Algorithm executed Successfully')
    return render(req,'admin/linear_algorithem.html',{'i': data})

def random(req):
    return render(req,'admin/randomforest.html')

def randomforest_btn(req):
    dataset = Upload_dataset_model.objects.last()
    df=pd.read_csv(dataset.Dataset.path)
    df['Class'] = df['Class'].replace(2, 0)

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

    rfc=RandomForestClassifier(random_state=42)
    rfc.fit(X_train,y_train)
    print('*'*20)

    # prediction
    train_prediction= rfc.predict(X_train)
    test_prediction= rfc.predict(X_test)
    print('*'*20)

    # evaluation
    from sklearn.metrics import accuracy_score
    print('test accuracy:',accuracy_score(y_test,test_prediction))
    print('train accuracy:',accuracy_score(y_train,train_prediction))
    print('*'*20)

    # cross validation score
    from sklearn.model_selection import cross_val_score
    score=cross_val_score(rfc,x,y,cv=5)
    print(score.mean())
    print('*'*20)

    #  prediction Summary by species
    # print(classification_report(y_test, test_prediction))
    print('*'*20)

    # Accuracy score
    RF_SC = accuracy_score(test_prediction,y_test)
    print(f"{round(RF_SC*100,2)}% Accurate")
    # evaluation
    from sklearn.metrics import accuracy_score,precision_score,recall_score,recall_score
    accuracy = round(accuracy_score(y_test,test_prediction)*100, 2)
    precession = round(precision_score(test_prediction,y_test,average = 'macro')*100, 2)
    recall = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    f1_score = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    name = "Random Forest Algorithm"
    RandomForest.objects.create(Accuracy=accuracy,Precession=precession,F1_Score=f1_score,Recall=recall,Name=name)
    data =RandomForest.objects.last()
    messages.success(req, 'Algorithm executed Successfully')
    return render(req,'admin/randomforest.html',{'i': data})

def dtalgm(req):
    return render(req,'admin/dtalgm.html')


def Decisiontree_btn(req):
    # Load dataset
    dataset = Upload_dataset_model.objects.last()
    df = pd.read_csv(dataset.Dataset.path)
    df['Class'] = df['Class'].replace(2, 0)
    import imblearn
    from imblearn.over_sampling import SMOTE
    # Data preprocessing with SMOTE
    x = df.drop('Class', axis=1)
    y = df['Class']
    ros = SMOTE()
    X_oversample, y_oversample = ros.fit_resample(x, y)
    from sklearn.model_selection import train_test_split
    # Split the data
    X_train, X_test, y_train, y_test = train_test_split(X_oversample, y_oversample, random_state=1, test_size=0.2)

    # Decision Tree
    DT = DecisionTreeClassifier(random_state=42)
    DT.fit(X_train, y_train)
    
    # Prediction
    train_pred = DT.predict(X_train)
    test_pred = DT.predict(X_test)
    from sklearn.metrics import accuracy_score
    # Accuracy
    test_accuracy = accuracy_score(y_test, test_pred)
    print('*' * 20)
    print('Test accuracy:', test_accuracy)
    print('*' * 20)
    DT_SC = test_accuracy
    print(f"{round(DT_SC * 100, 2)}% Accurate")
    from sklearn.metrics import accuracy_score,precision_score,recall_score,f1_score
    # Evaluation
    accuracy = round(test_accuracy * 100, 2)
    precession = round(precision_score(y_test, test_pred, average='macro') * 100, 2)
    recall = round(recall_score(y_test, test_pred, average='macro') * 100, 2)
    f1 = round(f1_score(y_test, test_pred, average='macro') * 100, 2)
    name = "Decision Tree Algorithm"

    # Save results to database
    DT_ALGO.objects.create(Accuracy=accuracy, Precession=precession, F1_Score=f1, Recall=recall, Name=name)
    data = DT_ALGO.objects.last()
    
    messages.success(req, 'Algorithm executed Successfully')
    return render(req, 'admin/dtalgm.html', {'i': data})

def gdalgm(req):
    return render(req,'admin/svc_algorithem.html')

def GD_btn(req):
    dataset = Upload_dataset_model.objects.last()
    df = pd.read_csv(dataset.Dataset.path)
    df['Class'] = df['Class'].replace(2, 0)


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
    from sklearn.ensemble import GradientBoostingClassifier
    

    gbc=GradientBoostingClassifier(random_state=42)
    gbc.fit(X_train,y_train)
    print('*'*20)

    # prediction
    train_prediction= gbc.predict(X_train)
    test_prediction= gbc.predict(X_test)
    print('*'*20)

    # evaluation
    from sklearn.metrics import accuracy_score
    print('test accuracy:',accuracy_score(y_test,test_prediction))
    print('train accuracy:',accuracy_score(y_train,train_prediction))
    print('*'*20)

    # cross validation score
    # from sklearn.model_selection import cross_val_score
    # score=cross_val_score(gbc,X,Y,cv=5)
    # print(score.mean())
    print('*'*20)



    # Accuracy score
    gbc_h = accuracy_score(test_prediction,y_test)
    print(f"{round(gbc_h*100,2)}% Accurate")
    # evaluation
    from sklearn.metrics import accuracy_score,precision_score,recall_score,recall_score
    accuracy = round(accuracy_score(y_test,test_prediction)*100, 2)
    precession = round(precision_score(test_prediction,y_test,average = 'macro')*100, 2)
    recall = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    f1_score = round(recall_score(test_prediction,y_test,average = 'macro')*100, 2)
    name = "Gr Boost Algorithm"
    GD_ALGO.objects.create(Accuracy=accuracy,Precession=precession,F1_Score=f1_score,Recall=recall,Name=name)
    data =GD_ALGO.objects.last()
    messages.success(req, 'Algorithm executed Successfully')
    
    return render(req,'admin/svc_algorithem.html', {'i': data})

def admin_graph(request):
    details = XG_ALGO.objects.last()
    a = details.Accuracy
    deatails1 = ADA_ALGO.objects.last()
    b = deatails1.Accuracy
    details2 = KNN_ALGO.objects.last()
    c = details2.Accuracy
    details4 = DT_ALGO.objects.last()
    d = details4.Accuracy
    details5 = GD_ALGO.objects.last()
    e = details5.Accuracy
    details6 = Logistic.objects.last()
    f = details6.Accuracy
    details7 = RandomForest.objects.last()
    g = details7.Accuracy
    return render(request, 'admin/admin_graph_analysis.html', {'xg':a,'ada':b,'knn':c,'dt':d,'gr':e,'log':f, 'ran':g})
def user_feedbacks(req):
    feed =Feedback.objects.all()
    return render(req,'admin/admin_user_feedbacks.html',{'back':feed})

def user_sentiment(req):
    fee = Feedback.objects.all()
    return render(req,'admin/admin_user_sentiment.html', {'cat':fee})

def user_graph(req):
    positive = Feedback.objects.filter(Sentiment = 'positive').count()
    very_positive = Feedback.objects.filter(Sentiment = 'very positive').count()
    negative = Feedback.objects.filter(Sentiment = 'negative').count()
    very_negative = Feedback.objects.filter(Sentiment = 'very negative').count()
    neutral = Feedback.objects.filter(Sentiment = 'neutral').count()
    context ={
        'vp': very_positive, 'p':positive, 'neg':negative, 'vn':very_negative, 'ne':neutral
    }
    return render(req,'admin/admin_feedback_graph.html',context)