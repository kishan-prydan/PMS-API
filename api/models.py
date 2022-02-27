from django.db import models
from django.utils.timezone import now
from django.contrib.auth.models import User
from datetime import date


class tblUser(models.Model):
    UserID = models.AutoField(primary_key=True)
    UserName = models.CharField(max_length=30)
    UserPassword = models.CharField(max_length=30)
    ConformPassword = models.CharField(max_length=30)
    UserTypeIDF = models.ForeignKey('stblUserType', on_delete=models.SET_NULL, null=True, related_name='UType')
    
    def __str__(self):
        return self.UserName
    
    class Meta:
        verbose_name_plural = "tbl User"
    

class stblUserType(models.Model):
    UserTypeID = models.AutoField(primary_key=True)
    UserType = models.CharField(max_length=30)
    
    
    class Meta:
        verbose_name_plural = "stbl User Type"



class stblCountryCodeType(models.Model):
    CountryCodeID = models.AutoField(primary_key=True)
    CountryName = models.CharField(max_length=30)

    def __str__(self):
        return self.CountryName

    class Meta:
        verbose_name_plural = "stbl Country Code Type"	


class stblPhoneType(models.Model):
    PhoneTypeID = models.AutoField(primary_key=True)
    PhoneType = models.CharField(max_length=30)

    def __str__(self):
        return self.PhoneType

    class Meta:
        verbose_name_plural = "stbl Phone Type"	

class tblCountryCode(models.Model):
    CodeID = models.AutoField(primary_key=True)
    CountryCode = models.CharField(max_length=5)	
    CountryCodeIDF = models.OneToOneField('stblCountryCodeType',on_delete=models.SET_NULL,null=True,related_name='CCType')	

    def __str__(self):
        return str(self.CountryCode)

    class Meta:
        verbose_name_plural = "tbl Country Code"


class tblPhone(models.Model):
    PhoneID = models.AutoField(primary_key=True)
    CodeIDF = models.ForeignKey('tblCountryCode',on_delete=models.SET_NULL,null=True,related_name='CC')		
    PhoneNo = models.BigIntegerField()	
    PhoneTypeIDF = models.ForeignKey('stblPhoneType',on_delete=models.SET_NULL,null=True,related_name='PT')	

    def __str__(self):
        return str(self.PhoneID	)	

    class Meta:
        verbose_name_plural = "tbl Phone"

class stblEntityType(models.Model):
    EntityTypeID = models.AutoField(primary_key=True)
    EntityType = models.CharField(max_length=30)

    def __str__(self):
        return self.EntityType

    class Meta:
        verbose_name_plural = "stbl Entity Type"


class tblEntity(models.Model):
    EntityID = models.AutoField(primary_key=True)
    FullName = models.CharField(max_length=256)	
    ShortName = models.CharField(max_length=16)
    EntityTypeIDF = models.ForeignKey('stblEntityType',on_delete=models.SET_NULL,null=True)	
    CreatedAT = models.DateField(auto_now_add=True)
    CreatedBY = models.ForeignKey(User,on_delete=models.SET_NULL,null=True)

    def __str__(self):
        return str(self.FullName)	

    class Meta:
        verbose_name_plural = "tbl Entity"


class stblAddressType(models.Model):
    AddressTypeID = models.AutoField(primary_key=True)
    AddressType = models.CharField(max_length=30)

    def __str__(self):
        return self.AddressType

    class Meta:
        verbose_name_plural = "stbl Address Type"



class tblAddress(models.Model):
    AddressID = models.AutoField(primary_key=True)
    Address = models.TextField()	
    City = models.CharField(max_length=30)
    District = models.CharField(max_length=30)
    State = models.CharField(max_length=30)
    PinCode = models.IntegerField()
    Country = models.CharField(max_length=30)
    AddressTypeIDF = models.ForeignKey('stblAddressType',on_delete=models.SET_NULL,null=True)	

    def __str__(self):
        return str(self.AddressID)		

    class Meta:
        verbose_name_plural = "tbl Address"



class tblPayment(models.Model):
    PaymentID = models.AutoField(primary_key=True)
    PaymentDate = models.DateField()
    PaymentMode = models.CharField(max_length=30)
    ChequeNo = models.CharField(max_length=12)
    BankName = models.CharField(max_length=30)
    BankIFSCCode = models.CharField(max_length=30)
    BillIDF = models.ForeignKey('tblBill',on_delete=models.SET_NULL,null=True)
    ProjectIDF = models.ForeignKey('tblProject',on_delete=models.SET_NULL,null=True)
    AllocationIDF = models.ForeignKey('tblAllocation',on_delete=models.SET_NULL,null=True)
    UserIDF = models.ForeignKey('tblUser',on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return str(self.PaymentID)

    class Meta:
        verbose_name_plural = "tbl Payment"




class tblAllocation(models.Model):
    AllocationID = models.AutoField(primary_key=True)
    LanguageName = models.CharField(max_length=30)
    Location = models.CharField(max_length=30)
    Experiance = models.IntegerField()
    AllocationDescription = models.TextField()
    EntityIDF = models.ForeignKey('tblEntity',on_delete=models.SET_NULL,null=True)
    PersonIDF = models.ForeignKey('tblPerson',on_delete=models.SET_NULL,null=True)
    UserIDF = models.ForeignKey('tblUser',on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return str(self.LanguageName)	

    class Meta:
        verbose_name_plural = "tbl Allocation"



class stblEmailType(models.Model):
    EmailTypeID = models.AutoField(primary_key=True)
    EmailType = models.CharField(max_length=30)

    def __str__(self):
        return self.EmailType

    class Meta:
        verbose_name_plural = "stbl Email Type"



class tblEmail(models.Model):
    EmailID = models.AutoField(primary_key=True)
    EmailAddress = models.EmailField(max_length = 50)	
    EmailTypeIDF = models.ForeignKey('stblEmailType',on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return str(self.EmailID)				

    class Meta:
        verbose_name_plural = "tbl Email"



class stblPhotoType(models.Model):
    PhotoTypeID = models.AutoField(primary_key=True)
    PhotoType = models.CharField(max_length=30)

    def __str__(self):
        return self.PhotoType

    class Meta:
        verbose_name_plural = "stbl Photo Type"


class tblPhoto(models.Model):
    PhotoID = models.AutoField(primary_key=True)
    Photo = models.ImageField(upload_to="images",default='../Static/avatar.jpg')	
    PhotoTypeIDF = models.ForeignKey('stblPhotoType',on_delete=models.SET_NULL,null=True)
    EntityTypeIDF = models.ForeignKey('stblEntityType',on_delete=models.SET_NULL,null=True)
    # EntityIDF = models.ForeignKey('tblEntity',on_delete=models.CASCADE,null=True)
    
    def __str__(self):
        return str(self.PhotoID)

    class Meta:
        verbose_name_plural = "tbl Photo"



class stblSocialMediaType(models.Model):
    SocialMediaTypeID = models.AutoField(primary_key=True)
    SocialMediaType = models.CharField(max_length=30)

    def __str__(self):
        return self.SocialMediaType

    class Meta:
        verbose_name_plural = "stbl Social Media Type"


class tblSocialMedia(models.Model):
    SocialmediaID = models.AutoField(primary_key=True)
    url = models.TextField()	
    SocialMediaTypeIDF = models.ForeignKey('stblSocialMediaType',on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return str(self.SocialmediaID)										

    class Meta:
        verbose_name_plural = "tbl Social Media"



class stblCompanyType(models.Model):
    CompanyTypeID = models.AutoField(primary_key=True)
    CompanyType = models.CharField(max_length=30)

    def __str__(self):
        return self.CompanyType

    class Meta:
        verbose_name_plural = "stbl Company Type"



class stblIndustryType(models.Model):
    IndustryID = models.AutoField(primary_key=True)
    IndustryType = models.CharField(max_length=30)

    def __str__(self):
        return self.IndustryType	

    class Meta:
        verbose_name_plural = "stbl Industry Type"


class stblSuffixType(models.Model):
    SuffixID = models.AutoField(primary_key=True)
    SuffixType = models.CharField(max_length=20)

    def __str__(self):
        return self.SuffixType

    class Meta:
        verbose_name_plural = "stbl Suffix Type"



class tblEntitySocialMedia(models.Model):
    EntitySocialMediaID = models.AutoField(primary_key=True)
    EntityIDF = models.ForeignKey('tblEntity',on_delete=models.CASCADE,null=True)
    SocialMediaIDF = models.ForeignKey('tblSocialMedia',on_delete=models.CASCADE,null=True)
    
    def __str__(self):
        return str(self.EntitySocialMediaID)														

    class Meta:
        verbose_name_plural = "tbl Entity Social Media"



class stblPersonType(models.Model):
    PersonTypeID = models.AutoField(primary_key=True)
    PersonType = models.CharField(max_length=30)

    def __str__(self):
        return self.PersonType		

    class Meta:
        verbose_name_plural = "stbl Person Type"



class tblCompany(models.Model):
    CompanyID = models.AutoField(primary_key=True)
    CompanyName = models.CharField(max_length=50)
    GSTINNo = models.CharField(max_length=15)
    Headquarter = models.CharField(max_length=30)
    WebsiteURL = models.TextField()
    About = models.TextField()
    Founded = models.DateField()
    Specialities = models.TextField()
    AnnualRevenue = models.IntegerField()
    EntityIDF = models.ForeignKey('tblEntity',on_delete=models.CASCADE,null=True)
    CompanyTypeIDF = models.ForeignKey('stblCompanyType',on_delete=models.SET_NULL,null=True)
    IndustryIDF = models.ForeignKey('stblIndustryType',on_delete=models.SET_NULL,null=True)

    def __str__(self):
        return str(self.CompanyName)

    class Meta:
        verbose_name_plural = "tbl Company"



class tblBill(models.Model):
    BillID = models.AutoField(primary_key=True)
    CGST = models.CharField(max_length=6)
    SGST = models.CharField(max_length=6)
    AdvancePayment = models.CharField(max_length=6)
    RemainPayment = models.CharField(max_length=6)

    def __str__(self):
        return str(self.BillID)

    class Meta:
        verbose_name_plural = "tbl Bill"



class tblUpdateStatus(models.Model):
    UpdateStatusID = models.AutoField(primary_key=True)
    UpdateStatus = models.CharField(max_length=30)
    ProjectIDF = models.ForeignKey('tblProject',on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return str(self.UpdateStatus)

    class Meta:
        verbose_name_plural = "tbl Update Status"		


class tblProject(models.Model):
    ProjectID = models.AutoField(primary_key=True)
    ProjectName = models.CharField(max_length=30)
    Description = models.TextField(null=True,blank=True)
    Department = models.CharField(max_length=30)
    DeadLine = models.DateTimeField()
    PersonIDF = models.ForeignKey('tblPerson',on_delete=models.SET_NULL,null=True)
    EmailIDF = models.ForeignKey('tblEmail',on_delete=models.SET_NULL,null=True)
    CompanyIDF = models.ForeignKey('tblCompany',on_delete=models.SET_NULL,null=True)
    AllocationIDF = models.ForeignKey('tblAllocation',on_delete=models.SET_NULL,null=True)

    def __str__(self):
        return str(self.ProjectName)

    class Meta:
        verbose_name_plural = "tbl Project"	


class tblComplaint(models.Model):
    ComplaintID = models.AutoField(primary_key=True)
    Description = models.TextField(null=True,blank=True)
    Date = models.DateTimeField()
    ProjectIDF = models.ForeignKey('tblProject',on_delete=models.SET_NULL,null=True)
    AllocationIDF = models.ForeignKey('tblAllocation',on_delete=models.SET_NULL,null=True)
    UserIDF = models.ForeignKey('tblUser',on_delete=models.SET_NULL,null=True)


    class Meta:
        verbose_name_plural = "tbl Complaint"


class tblFeedback(models.Model):
    FeedbackID = models.AutoField(primary_key=True)
    Feedback = models.TextField(null=True,blank=True)
    Date = models.DateTimeField()
    ProjectIDF = models.ForeignKey('tblProject',on_delete=models.SET_NULL,null=True)
    AllocationIDF = models.ForeignKey('tblAllocation',on_delete=models.SET_NULL,null=True)
    UserIDF = models.ForeignKey('tblUser',on_delete=models.SET_NULL,null=True)


    class Meta:
        verbose_name_plural = "tbl Feedback"



class tblSchedule(models.Model):
    ScheduleID = models.AutoField(primary_key=True)
    Description = models.TextField(null=True,blank=True)
    ScheduleDate = models.DateTimeField()
    ProjectIDF = models.ForeignKey('tblProject',on_delete=models.SET_NULL,null=True)
    AllocationIDF = models.ForeignKey('tblAllocation',on_delete=models.SET_NULL,null=True)
    UserIDF = models.ForeignKey('tblUser',on_delete=models.SET_NULL,null=True)


    class Meta:
        verbose_name_plural = "tbl Schedule"


class tblProfile(models.Model):
    ProfileID = models.AutoField(primary_key=True)
    ProfileDescription = models.TextField(null=True,blank=True)
    EntityIDF = models.ForeignKey('tblEntity',on_delete=models.SET_NULL,null=True)
    UserIDF = models.ForeignKey('tblUser',on_delete=models.SET_NULL,null=True)


    class Meta:
        verbose_name_plural = "tbl Profile"


class tblQuatation(models.Model):
    QuatationID = models.AutoField(primary_key=True)
    Quotation = models.TextField(null=True,blank=True)
    ProjectIDF = models.ForeignKey('tblProject',on_delete=models.SET_NULL,null=True)
    AllocationIDF = models.ForeignKey('tblAllocation',on_delete=models.SET_NULL,null=True)


    class Meta:
        verbose_name_plural = "tbl Quatation"



class tblPerson(models.Model):
    PersonID = models.AutoField(primary_key=True)
    FirstName = models.CharField(max_length=30)
    MiddleName = models.CharField(max_length=30)
    LastName = models.CharField(max_length=30)
    Gender = models.CharField(max_length=2)
    DOB = models.DateField()
    SuffixIDF = models.ForeignKey('stblSuffixType',on_delete=models.SET_NULL,null=True,related_name='SuffixBy')
    EntityIDF = models.ForeignKey('tblEntity',on_delete=models.CASCADE,null=True)
    PersonTypeIDF = models.ForeignKey('stblPersonType',on_delete=models.SET_NULL,null=True)
    # PhoneIDF = models.ForeignKey('tblPhone',on_delete=models.SET_NULL,null=True)
    # EmailIDF = models.ForeignKey('tblEmail',on_delete=models.SET_NULL,null=True)
    # AddressIDF = models.ForeignKey('tblAddress',on_delete=models.SET_NULL,null=True)
    # CompanyIDF = models.ForeignKey('tblCompany',on_delete=models.SET_NULL,null=True)
    # CreatedAT = models.DateTimeField(auto_now_add=True)
    # CreatedBY = models.ForeignKey(User,on_delete=models.SET_NULL,null=True)
    # Experiance = models.CharField(max_length=30)
    # AboutPerson = models.TextField(null=True,blank=True)
    # StatusIDF = models.ForeignKey('stblStatus',on_delete=models.SET_NULL,null=True)
    # UpdatedBy = models.ForeignKey(User,on_delete=models.SET_NULL,null=True)
    
    def __str__(self):
        return self.FirstName																

    class Meta:
        verbose_name_plural = "tbl Person"



class tblEntityPhone(models.Model):
    EntityPhoneID = models.AutoField(primary_key=True)
    EntityIDF = models.ForeignKey('tblEntity',on_delete=models.CASCADE,null=True)
    PhoneIDF = models.ForeignKey('tblPhone',on_delete=models.CASCADE,null=True)
    
    def __str__(self):
        return str(self.EntityPhoneID)																

    class Meta:
        verbose_name_plural = "tbl Entity Phone"



class rtblEntityEmail(models.Model):
    EntityEmailID = models.AutoField(primary_key=True)
    EmailIDF = models.ForeignKey('tblEmail',on_delete=models.CASCADE,null=True)
    EntityIDF = models.ForeignKey('tblEntity',on_delete=models.CASCADE,null=True)
    
    def __str__(self):
        return str(self.EntityEmailID)							

    class Meta:
        verbose_name_plural = "rtbl Entity Email"



class rtblEntity(models.Model):
    EntityTypeIDF = models.ForeignKey('stblEntityType',on_delete=models.SET_NULL,null=True)
    PersonIDF = models.ForeignKey('tblPerson',on_delete=models.CASCADE,null=True)
    CompanyIDF = models.ForeignKey('tblCompany',on_delete=models.CASCADE,null=True)
    AddressIDF = models.ForeignKey('tblAddress',on_delete=models.CASCADE,null=True)
    Designation = models.CharField(max_length=30,null=True)
    
    def __str__(self):
        return self.Designation				

    class Meta:
        verbose_name_plural = "rtbl Entity"


class  stblInquiryType(models.Model):
    InquiryTypeID = models.AutoField(primary_key=True) 
    InquiryType = models.CharField(max_length=30)
    
    class Meta:
        verbose_name_plural = "stbl Inquiry Type"

    def __str__(self):
        return str(self.InquiryType)



class tblInquiry(models.Model):
    InquiryID = models.AutoField(primary_key=True)
    Description = models.TextField(null=True,blank=True)
    ProjectIDF = models.ForeignKey('tblProject',on_delete=models.SET_NULL,null=True)
    AllocationIDF = models.ForeignKey('tblAllocation',on_delete=models.SET_NULL,null=True)
    UserIDF = models.ForeignKey('tblUser',on_delete=models.SET_NULL,null=True)
    InquiryTypeIDF = models.ForeignKey('stblInquiryType',on_delete=models.SET_NULL,null=True)
    
    class Meta:
        verbose_name_plural = "tbl Inquiry"