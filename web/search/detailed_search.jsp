<%-- 
    Document   : detailed_search
    Created on : Dec 11, 2014, 1:13:03 PM
    Author     : Tazbeea Tazakka
--%>
<%@page import="database.detailed_search.GetAccessType"%>
<%@page import="database.education.SearchEducationInfo"%>
<%@page import="database.bank.SearchBankInfo"%>
<%@page import="database.criminal.SearchCriminalInfo"%>
<%@page import="database.medical.SearchMedicalInfo"%>
<%@page import="database.job.SearchJobInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.*"%>
<!DOCTYPE html>
<!-- Search Result Handle -->
<%
String national_id = request.getParameter("national_id");
String type_id=session.getAttribute("type_id").toString();

ArrayList<String> accessSearchResult = new ArrayList<String>();
GetAccessType access= new GetAccessType();
accessSearchResult=access.get(type_id);

ArrayList<String> educationInfo = new ArrayList<String>();
ArrayList<String> bankInfo = new ArrayList<String>();
ArrayList<String> criminalInfo = new ArrayList<String>();
ArrayList<String> medicalInfo = new ArrayList<String>();
ArrayList<String> jobInfo = new ArrayList<String>();

educationInfo.clear();
bankInfo.clear();
criminalInfo.clear();
medicalInfo.clear();
jobInfo.clear();

SearchEducationInfo education = new SearchEducationInfo();
SearchBankInfo bank= new SearchBankInfo();
SearchCriminalInfo criminal =new SearchCriminalInfo();
SearchJobInfo job= new SearchJobInfo();
SearchMedicalInfo medical = new SearchMedicalInfo();



for(int i=0;i<accessSearchResult.size();i++){
    if(accessSearchResult.get(i).equals("1")){
        educationInfo=education.search(national_id);
    }
    else if(accessSearchResult.get(i).equals("2")){
        bankInfo=bank.search(national_id);
    }
    else if(accessSearchResult.get(i).equals("3")){
        criminalInfo=criminal.search(national_id);
    }
    else if(accessSearchResult.get(i).equals("4")){
        medicalInfo=medical.search(national_id);
    }
    else if(accessSearchResult.get(i).equals("5")){
        jobInfo=job.search(national_id);
    }
}

    if(educationInfo.size()>0){
        out.print("Education :  ");
        for(int i=0;i<educationInfo.size();i++){
            out.print(educationInfo.get(i)+"  ");
        }
    }
    if(bankInfo.size()>0){
        out.print("Bank :  ");
        for(int i=0;i<bankInfo.size();i++){
            out.print(bankInfo.get(i)+"  ");
        }
    }
    if(criminalInfo.size()>0){
        out.print("Criminal :  ");
        for(int i=0;i<criminalInfo.size();i++){
            out.print(criminalInfo.get(i)+"  ");
        }
    }
    if(jobInfo.size()>0){
        out.print("Job :  ");
        for(int i=0;i<jobInfo.size();i++){
            out.print(jobInfo.get(i)+"  ");
        }
    }
    if(medicalInfo.size()>0){
        out.print("Medical :  ");
        for(int i=0;i<medicalInfo.size();i++){
            out.print(medicalInfo.get(i)+"  ");
        }
    }

%>

