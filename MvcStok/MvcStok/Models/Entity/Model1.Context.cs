﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MvcStok.Models.Entity
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MvcDbStokEntities1 : DbContext
    {
        public MvcDbStokEntities1()
            : base("name=MvcDbStokEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TblKategoriler> TblKategoriler { get; set; }
        public virtual DbSet<TblSatislar> TblSatislar { get; set; }
        public virtual DbSet<TblUrunler> TblUrunler { get; set; }
        public virtual DbSet<TblMusteri> TblMusteri { get; set; }
    }
}
