using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MVCKutuphane.Models.EntityF;

namespace MVCKutuphane.Models.Classes
{

    public class Vitrin
    {
        public IEnumerable<Kitaplar> kitaplars { get; set; }
        public IEnumerable<Hakkimizda> hakkimizdas { get; set; }
        
    }
}