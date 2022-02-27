from django.contrib import admin
from .models import tblInquiry, tblUser, tblEntity, tblAddress, tblCompany, tblCountryCode, tblEmail, tblEntitySocialMedia, tblPerson, tblPhone, tblEntityPhone, tblPhoto, tblSocialMedia, tblAllocation, tblPayment, tblBill, tblProject, tblComplaint, tblFeedback, tblSchedule, tblUpdateStatus, tblProfile, tblQuatation, stblUserType, stblEntityType, stblAddressType, stblCompanyType, stblCountryCodeType, stblEmailType, stblPersonType, stblPhoneType, stblPhotoType, stblSocialMediaType, stblSuffixType, stblIndustryType, stblInquiryType, rtblEntity, rtblEntityEmail

# Register your models here.

@admin.register(tblUpdateStatus)
class tblUpdateStatusAdmin(admin.ModelAdmin):
	list_display = ['UpdateStatusID','UpdateStatus', 'ProjectIDF']


@admin.register(stblCountryCodeType)
class stblCountryCodeTypeAdmin(admin.ModelAdmin):
	list_display = ['CountryCodeID','CountryName']


@admin.register(stblPhoneType)
class stblPhoneTypeAdmin(admin.ModelAdmin):
	list_display = ['PhoneTypeID','PhoneType']


@admin.register(tblCountryCode)
class tblCountryCodeAdmin(admin.ModelAdmin):
	list_display = ['CodeID','CountryCode','CountryCodeIDF']	


@admin.register(tblPhone)
class tblPhoneAdmin(admin.ModelAdmin):
	list_display = ['PhoneID','CodeIDF','PhoneNo','PhoneTypeIDF']


@admin.register(stblEntityType)
class stblEntityTypeAdmin(admin.ModelAdmin):
	list_display = ['EntityTypeID','EntityType']		


@admin.register(tblEntity)
class tblEntityAdmin(admin.ModelAdmin):
	list_display = ['EntityID','FullName','ShortName','EntityTypeIDF','CreatedAT','CreatedBY']


@admin.register(stblAddressType)
class stblAddressTypeAdmin(admin.ModelAdmin):
	list_display = ['AddressTypeID','AddressType']		


@admin.register(tblAddress)
class tblAddressAdmin(admin.ModelAdmin):
	list_display = ['AddressID','Address','City','District','State','PinCode','Country','AddressTypeIDF']



@admin.register(stblEmailType)
class stblEmailTypeAdmin(admin.ModelAdmin):
	list_display = ['EmailTypeID','EmailType']		


@admin.register(tblEmail)
class tblEmailAdmin(admin.ModelAdmin):
	list_display = ['EmailID','EmailAddress','EmailTypeIDF']	


@admin.register(stblPhotoType)
class stblPhotoTypeAdmin(admin.ModelAdmin):
	list_display = ['PhotoTypeID','PhotoType']		


@admin.register(tblPhoto)
class tblPhotoAdmin(admin.ModelAdmin):
	list_display = ['PhotoID','Photo','PhotoTypeIDF','EntityTypeIDF']	


@admin.register(stblSocialMediaType)
class stblSocialMediaTypeAdmin(admin.ModelAdmin):
	list_display = ['SocialMediaTypeID','SocialMediaType']		


@admin.register(tblSocialMedia)
class tblSocialMediaAdmin(admin.ModelAdmin):
	list_display = ['SocialmediaID','url','SocialMediaTypeIDF']	


@admin.register(stblCompanyType)
class stblCompanyTypeAdmin(admin.ModelAdmin):
	list_display = ['CompanyTypeID','CompanyType']		


@admin.register(stblIndustryType)
class tblSocialMediaAdmin(admin.ModelAdmin):
	list_display = ['IndustryID','IndustryType']


@admin.register(stblSuffixType)
class stblSuffixTypeAdmin(admin.ModelAdmin):
	list_display = ['SuffixID','SuffixType']


@admin.register(tblEntitySocialMedia)
class tblEntitySocialMediaAdmin(admin.ModelAdmin):
	list_display = ['EntitySocialMediaID','EntityIDF','SocialMediaIDF']



@admin.register(stblPersonType)
class stblPersonTypeAdmin(admin.ModelAdmin):
	list_display = ['PersonTypeID','PersonType']


@admin.register(tblPerson)
class tblPersonAdmin(admin.ModelAdmin):
	list_display = ['PersonID','FirstName','MiddleName','Gender','DOB','SuffixIDF','EntityIDF','PersonTypeIDF']


@admin.register(tblCompany)
class tblCompanyAdmin(admin.ModelAdmin):
	list_display = ['CompanyID','CompanyName','GSTINNo','Headquarter','WebsiteURL','About','Founded','Specialities','AnnualRevenue','EntityIDF','CompanyTypeIDF','IndustryIDF']


@admin.register(tblEntityPhone)
class tblEntityPhoneAdmin(admin.ModelAdmin):
	list_display = ['EntityPhoneID','EntityIDF','PhoneIDF']


@admin.register(rtblEntityEmail)
class rtblEntityEmailAdmin(admin.ModelAdmin):
	list_display = ['EntityEmailID','EmailIDF','EntityIDF']


@admin.register(rtblEntity)
class rtblEntityAdmin(admin.ModelAdmin):
	list_display = ['EntityTypeIDF','PersonIDF','CompanyIDF','AddressIDF','Designation']


@admin.register(stblUserType)
class stblUserTypeAdmin(admin.ModelAdmin):
    list_display = ['UserTypeID','UserType']


@admin.register(tblUser)
class tblUserAdmin(admin.ModelAdmin):
    list_display = ['UserID','UserName','UserPassword','ConformPassword','UserTypeIDF']


@admin.register(tblAllocation)
class tblAllocationAdmin(admin.ModelAdmin):
    list_display = ['AllocationID','LanguageName','Location','Experiance','AllocationDescription','EntityIDF','PersonIDF','UserIDF']


@admin.register(tblPayment)
class tblPaymentAdmin(admin.ModelAdmin):
    list_display = ['PaymentID','PaymentDate','PaymentMode','ChequeNo','BankName','BankIFSCCode','BillIDF','UserIDF','ProjectIDF','AllocationIDF']


@admin.register(tblBill)
class tblBillAdmin(admin.ModelAdmin):
    list_display = ['BillID','CGST','SGST','AdvancePayment','RemainPayment']


@admin.register(tblProject)
class tblProjectAdmin(admin.ModelAdmin):
    list_display = ['ProjectID','ProjectName','Description','Department','DeadLine','PersonIDF','EmailIDF','CompanyIDF','AllocationIDF']


@admin.register(tblComplaint)
class tblComplaintAdmin(admin.ModelAdmin):
    list_display = ['ComplaintID','Description','Date','ProjectIDF','AllocationIDF','UserIDF']


@admin.register(tblFeedback)
class tblFeedbackAdmin(admin.ModelAdmin):
    list_display = ['FeedbackID','Feedback','Date','ProjectIDF','AllocationIDF','UserIDF']


@admin.register(tblSchedule)
class tblScheduleAdmin(admin.ModelAdmin):
    list_display = ['ScheduleID','ScheduleDate','Description','ProjectIDF','AllocationIDF','UserIDF']


@admin.register(tblProfile)
class tblProfileAdmin(admin.ModelAdmin):
    list_display = ['ProfileID','ProfileDescription','EntityIDF','UserIDF']


@admin.register(tblQuatation)
class tblQuatationAdmin(admin.ModelAdmin):
    list_display = ['QuatationID','Quotation','ProjectIDF','AllocationIDF']


@admin.register(tblInquiry)
class tblInquiryAdmin(admin.ModelAdmin):
    list_display = ['InquiryID','ProjectIDF','AllocationIDF','Description','UserIDF','InquiryTypeIDF']


@admin.register(stblInquiryType)
class stblInquiryTypeAdmin(admin.ModelAdmin):
    list_display = ['InquiryTypeID','InquiryType']