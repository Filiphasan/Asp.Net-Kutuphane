//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVCKutuphane.Models.EntityF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Hareketler
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Hareketler()
        {
            this.Cezalar = new HashSet<Cezalar>();
        }
    
        public int Id { get; set; }
        public Nullable<int> Kitap { get; set; }
        public Nullable<int> Uye { get; set; }
        public Nullable<byte> Personel { get; set; }
        public Nullable<System.DateTime> AlisTarihi { get; set; }
        public Nullable<System.DateTime> İadeTarih { get; set; }
        public Nullable<bool> IslemDurum { get; set; }
        public Nullable<System.DateTime> GeldigiTarih { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cezalar> Cezalar { get; set; }
        public virtual Kitaplar Kitaplar { get; set; }
        public virtual Personeller Personeller { get; set; }
        public virtual Uyeler Uyeler { get; set; }
    }
}
