--SET ROWCOUNT 1;
DECLARE @tmpTestReport table(
Patient_ID nvarchar(50), 
PatTest_ID nvarchar(50),
RecCode nvarchar(50),
DoctorName nvarchar(50),
DoctorFamily nvarchar(50),
PatientName nvarchar(50),
PatientFamily nvarchar(50),
InsuranceName nvarchar(50), 
CenterName nvarchar(50), 
NationalCode nvarchar(50),
Sexfarsi nvarchar(50),
TestName nvarchar(50), 
TestNameT nvarchar(50),
ParentTestName nvarchar(50),
checkTest nvarchar(50),
Answer nvarchar(50), 
AnsDate nvarchar(50), 
Range nvarchar(50),
UnitName nvarchar(50), 
TestDescription nvarchar(50),
GrpDescription nvarchar(50), 
COLNO nvarchar(50),
LabGroup nvarchar(50),
Method nvarchar(50),
checkTest22 nvarchar(50),
Answer22 nvarchar(50),
ID INT IDENTITY(1,1)
)
insert into @tmpTestReport SELECT * FROM testWithoutCol22()

SELECT * FROM @tmpTestReport

DECLARE @NCol22 int;

SELECT @NCol22=count(*) FROM testWithCol22() 
SELECT @NCol22;

DECLARE @tmpDiff table(
id int IDENTITY(1,1),
testname nvarchar(50),
Answer nvarchar(50)
);
insert into @tmpDiff(testname,Answer) select TestName,Answer FROM testWithCol22()
SELECT * FROM @tmpDiff



UPDATE a  SET checkTest22=(SELECT testName from @tmpDiff b WHERE b.id=a.id )
FROM @tmpTestReport a
UPDATE a  SET answer22=(SELECT Answer from @tmpDiff b WHERE b.id=a.id )
FROM @tmpTestReport a
SELECT * FROM @tmpTestReport





SELECT * FROM testFunc1()