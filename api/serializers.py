from rest_framework import serializers
from .models import tblUser, tblEntity, tblAddress, tblCompany, tblCountryCode, tblEmail, tblEntitySocialMedia, tblPerson, tblPhone, tblEntityPhone,  tblPhoto, tblSocialMedia, tblAllocation, tblPayment, tblBill, tblProject, tblComplaint, tblFeedback, tblSchedule, tblUpdateStatus, tblProfile, tblQuatation, stblUserType, stblEntityType, stblAddressType, stblCompanyType, stblCountryCodeType, stblEmailType, stblPersonType, stblPhoneType, stblPhotoType, stblSocialMediaType, stblSuffixType, stblIndustryType, tblInquiry, stblInquiryType, rtblEntityEmail, rtblEntity
from django.conf import settings
from drf_writable_nested.serializers import WritableNestedModelSerializer

from django.contrib.auth.models import User

from rest_framework import serializers
from django.core.files.base import ContentFile
import base64


class Base64ImageField(serializers.ImageField):
	def to_internal_value(self, data):
		from django.core.files.base import ContentFile
		import base64
		import six
		import uuid
		print("ininternal")
		# Check if this is a base64 string
		if isinstance(data, six.string_types):
			# Check if the base64 string is in the "data:" format
			print("ininstance")
			if 'data:' in data and ';base64,' in data:
				# Break out the header from the base64 content
				header, data = data.split(';base64,')

			# Try to decode the file. Return validation error if it fails.
			try:
				decoded_file = base64.b64decode(data)
			except TypeError:
				self.fail('invalid_image')

			# Generate file name:
			file_name = str(uuid.uuid4())[:12] # 12 characters are more than enough.
			# Get the file name extension:
			file_extension = self.get_file_extension(file_name, decoded_file)

			complete_file_name = "%s.%s" % (file_name, file_extension, )

			data = ContentFile(decoded_file, name=complete_file_name)

		return super(Base64ImageField, self).to_internal_value(data)

	def get_file_extension(self, file_name, decoded_file):
		import imghdr

		extension = imghdr.what(file_name, decoded_file)
		extension = "jpg" if extension == "jpeg" else extension

		return extension



class UserSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = User
		fields = ['id','first_name','last_name','username', 'email']


class tblUserSerializer(serializers.ModelSerializer):
    UserID = serializers.IntegerField()
    UserName = serializers.CharField()
    UserPassword = serializers.CharField()
    ConformPassword = serializers.CharField()


    class Meta:
        model = tblUser
        fields =['UserID','UserName','UserPassword','ConformPassword','UserTypeIDF']



class stblUserTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = stblUserType
        fields = ['UserTypeID','UserType']


class stblPhoneTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblPhoneType
		fields = ['PhoneTypeID','PhoneType']

class stblCountryCodeTypeSerializer(serializers.ModelSerializer):
	# CCType = tblCountryCodeSerializer(many=True,read_only=True)
	class Meta:
		model = stblCountryCodeType
		fields = ['CountryCodeID','CountryName']

class tblCountryCodeSerializer(WritableNestedModelSerializer):
	CountryCodeIDF = stblCountryCodeTypeSerializer()
	class Meta:
		model = tblCountryCode
		fields = ['CodeID','CountryCode','CountryCodeIDF']		


class tblPhoneSerializer(WritableNestedModelSerializer):
	PhoneTypeIDF = stblPhoneTypeSerializer()
	CodeIDF = tblCountryCodeSerializer()

	class Meta:
		model = tblPhone
		fields = ['PhoneID','CodeIDF','PhoneNo','PhoneTypeIDF']		


class stblEntityTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblEntityType
		fields = '__all__'		

class tblEntitySerializer(WritableNestedModelSerializer):
	EntityTypeIDF = stblEntityTypeSerializer()
	class Meta:
		model = tblEntity
		fields = ['EntityID','FullName','ShortName','EntityTypeIDF','CreatedAT','CreatedBY',]		


class stblAddressTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblAddressType
		fields = '__all__'		

class tblAddressSerializer(WritableNestedModelSerializer):
	AddressTypeIDF = stblAddressTypeSerializer()
	class Meta:
		model = tblAddress
		fields = '__all__'		
	


class stblEmailTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblEmailType
		fields = '__all__'	


class tblEmailSerializer(WritableNestedModelSerializer):
	EmailTypeIDF = stblEmailTypeSerializer( ) 
	class Meta:
		model = tblEmail
		fields = '__all__'		


class stblPhotoTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblPhotoType
		fields = '__all__'		


class tblPhotoSerializer(serializers.ModelSerializer):
	PhotoTypeIDF = stblPhotoTypeSerializer()
	Photo = serializers.SerializerMethodField()
	class Meta:
		model = tblPhoto
		fields = '__all__'	

	def get_Photo(self, tblPhoto):
		request = self.context.get('request')
		Photo_url = tblPhoto.Photo.url
		return request.build_absolute_uri(Photo_url)	


class stblSocialMediaTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblSocialMediaType
		fields = '__all__'		


class tblSocialMediaSerializer(serializers.ModelSerializer):
	SocialMediaTypeIDF = stblSocialMediaTypeSerializer()
	class Meta:
		model = tblSocialMedia
		fields = '__all__'	


class stblCompanyTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblCompanyType
		fields = '__all__'		


class stblIndustryTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblIndustryType
		fields = '__all__'		



class tblEntitySocialMediaSerializer(serializers.ModelSerializer):
	SocialMediaIDF = tblSocialMediaSerializer()
	class Meta:
		model = tblEntitySocialMedia
		fields = '__all__'		


class stblPersonTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblPersonType
		fields = '__all__'		


class stblSuffixTypeSerializer(serializers.ModelSerializer):
	class Meta:
		model = stblSuffixType
		fields = ['SuffixID','SuffixType']	



class tblCompanySerializer(WritableNestedModelSerializer):
	# HeadcountIDF = tblHeadCountSerializer()
	CompanyTypeIDF = stblCompanyTypeSerializer()
	IndustryIDF = stblIndustryTypeSerializer()
	EntityIDF = tblEntitySerializer()
	class Meta:
		model = tblCompany
		fields = '__all__'	


class tblEntityPhoneSerializer(serializers.ModelSerializer):
	PhoneIDF = tblPhoneSerializer()
	class Meta:
		model = tblEntityPhone
		fields = '__all__'	


class rtblEntityEmailSerializer(serializers.ModelSerializer):
	EmailIDF = tblEmailSerializer()
	class Meta:
		model = rtblEntityEmail
		fields = '__all__'	



class tblUpdateStatusSerializer(serializers.ModelSerializer):
	class Meta:
		model = tblUpdateStatus
		fields = '__all__'



class tblAllocationSerializer(serializers.ModelSerializer):
	EntityIDF = tblEntitySerializer(read_only=False)
	# PersonIDF = tblPersonSerializer(read_only=False)
	UserIDF = tblUserSerializer(read_only=False)
	class Meta:
		model = tblAllocation
		fields = '__all__'


class tblPaymentSerializer(serializers.ModelSerializer):
	BillIDF = tblEntitySerializer(read_only=False)
	# PersonIDF = tblPersonSerializer(read_only=False)
	UserIDF = tblUserSerializer(read_only=False)
	AllocationIDF = tblAllocationSerializer(read_only=False)
	class Meta:
		model = tblPayment
		fields = '__all__'		



class tblBillSerializer(serializers.ModelSerializer):
    class Meta:
        model = tblBill
        fields = '__all__'



class tblProjectSerializer(serializers.ModelSerializer):
    # PersonIDF = tblPersonSerializer(read_only=False)
    EmailIDF = tblEmailSerializer(read_only=False)
    CompanyIDF = tblCompanySerializer(read_only=False)
    AllocationIDF = tblAllocationSerializer(read_only=False)
    
    class Meta:
        model = tblProject
        fields = '__all__'



class tblComplaintSerializer(serializers.ModelSerializer):
    ProjectIDF = tblProjectSerializer(read_only=False)
    AllocationIDF = tblAllocationSerializer(read_only=False)
    UserIDF = tblUserSerializer(read_only=False)
    
    class Meta:
        model = tblComplaint
        fields = '__all__'



class tblFeedbackSerializer(serializers.ModelSerializer):
    UserIDF = tblUserSerializer(read_only=False)
    AllocationIDF = tblAllocationSerializer(read_only=False)
    ProjectIDF = tblProjectSerializer(read_only=False)
    
    class Meta:
        model = tblFeedback
        fields = '__all__'



class tblScheduleSerializer(serializers.ModelSerializer):
    UserIDF = tblUserSerializer(read_only=False)
    AllocationIDF = tblAllocationSerializer(read_only=False)
    ProjectIDF = tblProjectSerializer(read_only=False)
    
    class Meta:
        model = tblSchedule
        fields = '__all__'



class tblProfileSerializer(serializers.ModelSerializer):
    EntityIDF = tblEntitySerializer(read_only=False)
    UserIDF = tblUserSerializer(read_only=False)
    
    class Meta:
        model = tblProfile
        fields = '__all__'


class tblQuatationSerializer(serializers.ModelSerializer):
    ProjectIDF = tblProjectSerializer(read_only=False)
    AllocationIDF = tblAllocationSerializer(read_only=False)
    
    class Meta:
        model = tblQuatation
        fields = '__all__'



class stblInquiryTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = stblInquiryType
        fields = '__all__'



class tblInquirySerializer(serializers.ModelSerializer):
    UserIDF = tblUserSerializer(read_only=False)
    InquiryTypeIDF = stblInquiryTypeSerializer(read_only=False)
    
    class Meta:
        model = tblInquiry
        fields = '__all__'


class tblPersonSerializer(WritableNestedModelSerializer):
	SuffixIDF = stblSuffixTypeSerializer(read_only=False) 
	EntityIDF = tblEntitySerializer(read_only=False)
	PersonTypeIDF = stblPersonTypeSerializer(read_only=False)
	# StatusIDF = tblUpdateStatusSerializer()
	# UpdatedBy = tblUserSerializer()
	class Meta:
		model = tblPerson
		fields = '__all__'	

class rtblEntitySerializer(serializers.ModelSerializer):	
	EntityTypeIDF = stblEntityTypeSerializer()
	PersonIDF = tblPersonSerializer()
	CompanyIDF = tblCompanySerializer()
	AddressIDF = tblAddressSerializer()
	class Meta:
		model = rtblEntity
		fields = '__all__'	
