//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StudentsAffairsDashboard.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class StudentsMain
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StudentsMain()
        {
            this.StudentGradesHistories = new HashSet<StudentGradesHistory>();
            this.StudentSubjectEnrolls = new HashSet<StudentSubjectEnroll>();
            this.invoice_payment = new HashSet<invoice_payment>();
            this.StudentClothes = new HashSet<StudentClothe>();
        }
    
        public int StdCode { get; set; }
        public string StdArabicFristName { get; set; }
        public string StdArabicMiddleName { get; set; }
        public string StdArabicLastName { get; set; }
        public string StdArabicFamilyName { get; set; }
        public string StdEnglishFristName { get; set; }
        public string StdEnglishMiddleName { get; set; }
        public string StdEnglishLastName { get; set; }
        public string StdEnglishFamilyName { get; set; }
        public string StdMotherArabicName { get; set; }
        public string StdMotherEnglishName { get; set; }
        public string StdFatherMobilePhone { get; set; }
        public string StdMotherMobilePhone { get; set; }
        public string StdFatherEmail { get; set; }
        public string StdMotherEmail { get; set; }
        public string StdFatherNationality { get; set; }
        public string StdMotherNationality { get; set; }
        public string StdFatherSpokenLanguage { get; set; }
        public string StdMotherSpokenLanguage { get; set; }
        public string StdFatherJob { get; set; }
        public string StdMotherJob { get; set; }
        public string StdFatherQualification { get; set; }
        public string StdMotherQualification { get; set; }
        public string StdStudentsAffairs1 { get; set; }
        public string StdStudentsAffairs2 { get; set; }
        public string StdBirthCode { get; set; }
        public string StdAddressGov { get; set; }
        public string StdEmergencyContact { get; set; }
        public string StdEmergencyPhone { get; set; }
        public Nullable<System.DateTime> StdBOD { get; set; }
        public string StdBirthPlace { get; set; }
        public string StdGender { get; set; }
        public string StdReligion { get; set; }
        public string StdFatherNID { get; set; }
        public string StdMotherNID { get; set; }
        public string StdCity { get; set; }
        public string StdAddress { get; set; }
        public string StdNID { get; set; }
        public int StdSchoolID { get; set; }
        public int StdClassID { get; set; }
        public string StdNationality { get; set; }
        public string StdStatus { get; set; }
        public Nullable<System.DateTime> StdJoinYear { get; set; }
        public string StdStaffSon { get; set; }
        public string StdLegalGuardianship { get; set; }
        public bool StdParentsSeparated { get; set; }
    
        public virtual Class Class { get; set; }
        public virtual NESSchool NESSchool { get; set; }
        public virtual StudentAccount StudentAccount { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentGradesHistory> StudentGradesHistories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentSubjectEnroll> StudentSubjectEnrolls { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<invoice_payment> invoice_payment { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StudentClothe> StudentClothes { get; set; }
    }
}
