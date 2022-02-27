# Generated by Django 3.0 on 2022-02-12 22:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='stblAddressType',
            fields=[
                ('AddressTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('AddressType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblCompanyType',
            fields=[
                ('CompanyTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('CompanyType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblCountryCodeType',
            fields=[
                ('CountryCodeID', models.AutoField(primary_key=True, serialize=False)),
                ('CountryName', models.CharField(max_length=30)),
            ],
            options={
                'verbose_name_plural': 'stbl Country Code Type',
            },
        ),
        migrations.CreateModel(
            name='stblEmailType',
            fields=[
                ('EmailTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('EmailType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblEntityType',
            fields=[
                ('EntityTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('EntityType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblIndustryType',
            fields=[
                ('IndustryID', models.AutoField(primary_key=True, serialize=False)),
                ('IndustryType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblInquiryType',
            fields=[
                ('InquiryTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('InquiryType', models.CharField(max_length=30)),
            ],
            options={
                'verbose_name_plural': 'stbl Inquiry Type',
            },
        ),
        migrations.CreateModel(
            name='stblPersonType',
            fields=[
                ('PersonTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('PersonType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblPhoneType',
            fields=[
                ('PhoneTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('PhoneType', models.CharField(max_length=30)),
            ],
            options={
                'verbose_name_plural': 'stbl Phone Type',
            },
        ),
        migrations.CreateModel(
            name='stblPhotoType',
            fields=[
                ('PhotoTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('PhotoType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblSocialMediaType',
            fields=[
                ('SocialMediaTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('SocialMediaType', models.CharField(max_length=30)),
            ],
        ),
        migrations.CreateModel(
            name='stblSuffixType',
            fields=[
                ('SuffixID', models.AutoField(primary_key=True, serialize=False)),
                ('SuffixType', models.CharField(max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='stblUserType',
            fields=[
                ('UserTypeID', models.AutoField(primary_key=True, serialize=False)),
                ('UserType', models.CharField(max_length=30)),
            ],
            options={
                'verbose_name_plural': 'stbl User Type',
            },
        ),
        migrations.CreateModel(
            name='tblAllocation',
            fields=[
                ('AllocationID', models.AutoField(primary_key=True, serialize=False)),
                ('LanguageName', models.CharField(max_length=30)),
                ('Location', models.CharField(max_length=30)),
                ('Experiance', models.IntegerField()),
                ('AllocationDescription', models.TextField()),
            ],
        ),
        migrations.CreateModel(
            name='tblBill',
            fields=[
                ('BillID', models.AutoField(primary_key=True, serialize=False)),
                ('CGST', models.CharField(max_length=6)),
                ('SGST', models.CharField(max_length=6)),
                ('AdvancePayment', models.CharField(max_length=6)),
                ('RemainPayment', models.CharField(max_length=6)),
            ],
        ),
        migrations.CreateModel(
            name='tblCompany',
            fields=[
                ('CompanyID', models.AutoField(primary_key=True, serialize=False)),
                ('CompanyName', models.CharField(max_length=50)),
                ('GSTINNo', models.CharField(max_length=15)),
                ('Headquarter', models.CharField(max_length=30)),
                ('WebsiteURL', models.TextField()),
                ('About', models.TextField()),
                ('Founded', models.DateField()),
                ('Specialities', models.TextField()),
                ('AnnualRevenue', models.IntegerField()),
                ('CompanyTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblCompanyType')),
            ],
        ),
        migrations.CreateModel(
            name='tblCountryCode',
            fields=[
                ('CodeID', models.AutoField(primary_key=True, serialize=False)),
                ('CountryCode', models.CharField(max_length=5)),
                ('CountryCodeIDF', models.OneToOneField(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='CCType', to='api.stblCountryCodeType')),
            ],
        ),
        migrations.CreateModel(
            name='tblEmail',
            fields=[
                ('EmailID', models.AutoField(primary_key=True, serialize=False)),
                ('EmailAddress', models.EmailField(max_length=50)),
                ('EmailTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblEmailType')),
            ],
        ),
        migrations.CreateModel(
            name='tblEntity',
            fields=[
                ('EntityID', models.AutoField(primary_key=True, serialize=False)),
                ('FullName', models.CharField(max_length=256)),
                ('ShortName', models.CharField(max_length=16)),
                ('CreatedAT', models.DateField(auto_now_add=True)),
                ('CreatedBY', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
                ('EntityTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblEntityType')),
            ],
        ),
        migrations.CreateModel(
            name='tblPerson',
            fields=[
                ('PersonID', models.AutoField(primary_key=True, serialize=False)),
                ('FirstName', models.CharField(max_length=30)),
                ('MiddleName', models.CharField(max_length=30)),
                ('LastName', models.CharField(max_length=30)),
                ('Gender', models.CharField(max_length=2)),
                ('DOB', models.DateField()),
                ('EntityIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblEntity')),
                ('PersonTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblPersonType')),
                ('SuffixIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='SuffixBy', to='api.stblSuffixType')),
            ],
        ),
        migrations.CreateModel(
            name='tblProject',
            fields=[
                ('ProjectID', models.AutoField(primary_key=True, serialize=False)),
                ('ProjectName', models.CharField(max_length=30)),
                ('Description', models.TextField(blank=True, null=True)),
                ('Department', models.CharField(max_length=30)),
                ('DeadLine', models.DateTimeField()),
                ('AllocationIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblAllocation')),
                ('CompanyIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblCompany')),
                ('EmailIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblEmail')),
                ('PersonIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblPerson')),
            ],
            options={
                'verbose_name_plural': 'tbl Project',
            },
        ),
        migrations.CreateModel(
            name='tblUser',
            fields=[
                ('UserID', models.AutoField(primary_key=True, serialize=False)),
                ('UserName', models.CharField(max_length=30)),
                ('UserPassword', models.CharField(max_length=30)),
                ('ConformPassword', models.CharField(max_length=30)),
                ('UserTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='UType', to='api.stblUserType')),
            ],
            options={
                'verbose_name_plural': 'tbl User',
            },
        ),
        migrations.CreateModel(
            name='tblUpdateStatus',
            fields=[
                ('UpdateStatusID', models.AutoField(primary_key=True, serialize=False)),
                ('UpdateStatus', models.CharField(max_length=30)),
                ('ProjectIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblProject')),
            ],
            options={
                'verbose_name_plural': 'tbl Update Status',
            },
        ),
        migrations.CreateModel(
            name='tblSocialMedia',
            fields=[
                ('SocialmediaID', models.AutoField(primary_key=True, serialize=False)),
                ('url', models.TextField()),
                ('SocialMediaTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblSocialMediaType')),
            ],
        ),
        migrations.CreateModel(
            name='tblSchedule',
            fields=[
                ('ScheduleID', models.AutoField(primary_key=True, serialize=False)),
                ('Description', models.TextField(blank=True, null=True)),
                ('ScheduleDate', models.DateTimeField()),
                ('AllocationIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblAllocation')),
                ('ProjectIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblProject')),
                ('UserIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblUser')),
            ],
            options={
                'verbose_name_plural': 'tbl Schedule',
            },
        ),
        migrations.CreateModel(
            name='tblQuatation',
            fields=[
                ('QuatationID', models.AutoField(primary_key=True, serialize=False)),
                ('Quotation', models.TextField(blank=True, null=True)),
                ('AllocationIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblAllocation')),
                ('ProjectIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblProject')),
            ],
            options={
                'verbose_name_plural': 'tbl Quatation',
            },
        ),
        migrations.CreateModel(
            name='tblProfile',
            fields=[
                ('ProfileID', models.AutoField(primary_key=True, serialize=False)),
                ('ProfileDescription', models.TextField(blank=True, null=True)),
                ('EntityIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblEntity')),
                ('UserIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblUser')),
            ],
            options={
                'verbose_name_plural': 'tbl Profile',
            },
        ),
        migrations.CreateModel(
            name='tblPhoto',
            fields=[
                ('PhotoID', models.AutoField(primary_key=True, serialize=False)),
                ('Photo', models.ImageField(default='../Static/avatar.jpg', upload_to='images')),
                ('EntityTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblEntityType')),
                ('PhotoTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblPhotoType')),
            ],
        ),
        migrations.CreateModel(
            name='tblPhone',
            fields=[
                ('PhoneID', models.AutoField(primary_key=True, serialize=False)),
                ('PhoneNo', models.BigIntegerField()),
                ('CodeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='CC', to='api.tblCountryCode')),
                ('PhoneTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='PT', to='api.stblPhoneType')),
            ],
        ),
        migrations.CreateModel(
            name='tblPayment',
            fields=[
                ('PaymentID', models.AutoField(primary_key=True, serialize=False)),
                ('PaymentDate', models.DateField()),
                ('PaymentMode', models.CharField(max_length=30)),
                ('ChequeNo', models.CharField(max_length=12)),
                ('BankName', models.CharField(max_length=30)),
                ('BankIFSCCode', models.CharField(max_length=30)),
                ('AllocationIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblAllocation')),
                ('BillIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblBill')),
                ('ProjectIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblProject')),
                ('UserIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblUser')),
            ],
        ),
        migrations.CreateModel(
            name='tblInquiry',
            fields=[
                ('InquiryID', models.AutoField(primary_key=True, serialize=False)),
                ('Description', models.TextField(blank=True, null=True)),
                ('AllocationIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblAllocation')),
                ('InquiryTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblInquiryType')),
                ('ProjectIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblProject')),
                ('UserIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblUser')),
            ],
            options={
                'verbose_name_plural': 'tbl Inquiry',
            },
        ),
        migrations.CreateModel(
            name='tblFeedback',
            fields=[
                ('FeedbackID', models.AutoField(primary_key=True, serialize=False)),
                ('Feedback', models.TextField(blank=True, null=True)),
                ('Date', models.DateTimeField()),
                ('AllocationIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblAllocation')),
                ('ProjectIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblProject')),
                ('UserIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblUser')),
            ],
            options={
                'verbose_name_plural': 'tbl Feedback',
            },
        ),
        migrations.CreateModel(
            name='tblEntitySocialMedia',
            fields=[
                ('EntitySocialMediaID', models.AutoField(primary_key=True, serialize=False)),
                ('EntityIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblEntity')),
                ('SocialMediaIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblSocialMedia')),
            ],
        ),
        migrations.CreateModel(
            name='tblEntityPhone',
            fields=[
                ('EntityPhoneID', models.AutoField(primary_key=True, serialize=False)),
                ('EntityIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblEntity')),
                ('PhoneIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblPhone')),
            ],
        ),
        migrations.CreateModel(
            name='tblComplaint',
            fields=[
                ('ComplaintID', models.AutoField(primary_key=True, serialize=False)),
                ('Description', models.TextField(blank=True, null=True)),
                ('Date', models.DateTimeField()),
                ('AllocationIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblAllocation')),
                ('ProjectIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblProject')),
                ('UserIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblUser')),
            ],
            options={
                'verbose_name_plural': 'tbl Complaint',
            },
        ),
        migrations.AddField(
            model_name='tblcompany',
            name='EntityIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblEntity'),
        ),
        migrations.AddField(
            model_name='tblcompany',
            name='IndustryIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblIndustryType'),
        ),
        migrations.AddField(
            model_name='tblallocation',
            name='EntityIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblEntity'),
        ),
        migrations.AddField(
            model_name='tblallocation',
            name='PersonIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblPerson'),
        ),
        migrations.AddField(
            model_name='tblallocation',
            name='UserIDF',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.tblUser'),
        ),
        migrations.CreateModel(
            name='tblAddress',
            fields=[
                ('AddressID', models.AutoField(primary_key=True, serialize=False)),
                ('Address', models.TextField()),
                ('City', models.CharField(max_length=30)),
                ('District', models.CharField(max_length=30)),
                ('State', models.CharField(max_length=30)),
                ('PinCode', models.IntegerField()),
                ('Country', models.CharField(max_length=30)),
                ('AddressTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblAddressType')),
            ],
        ),
        migrations.CreateModel(
            name='rtblEntityEmail',
            fields=[
                ('EntityEmailID', models.AutoField(primary_key=True, serialize=False)),
                ('EmailIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblEmail')),
                ('EntityIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblEntity')),
            ],
        ),
        migrations.CreateModel(
            name='rtblEntity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('Designation', models.CharField(max_length=30, null=True)),
                ('AddressIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblAddress')),
                ('CompanyIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblCompany')),
                ('EntityTypeIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.stblEntityType')),
                ('PersonIDF', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.tblPerson')),
            ],
        ),
    ]