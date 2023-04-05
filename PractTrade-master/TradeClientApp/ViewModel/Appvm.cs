using Microsoft.Build.Tasks.Deployment.Bootstrapper;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TradeClientApp.Model.Database;

namespace TradeClientApp.ViewModel
{
    internal class Appvm : BaseViewModel
    {
        private ObservableCollection<Model.Database.Product> _products;

        public ObservableCollection<Model.Database.Product> Products
        {

            get => _products;

            set
            {
                _products = value;
                OnPropertyChanged(nameof(Products));
            }

        }

       
        private void LoadData()
        {
            using(TradeDBEntities1 db = new TradeDBEntities1())
            {
                var userList = db.Product.ToList();
            }
            

        }
        private void Initilize()
        {
            Products = new
            ObservableCollection<Model.Database.Product>();
        }

        public Appvm()
        {
            Initilize();
            LoadData();
        }
    }
}
