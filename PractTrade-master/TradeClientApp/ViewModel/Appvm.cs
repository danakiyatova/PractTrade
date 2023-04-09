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
        private ObservableCollection<Model.Database.Tovar> _products;
      
        public ObservableCollection<Model.Database.Tovar> Products
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
            using(TradeDBEntities db = new TradeDBEntities())
            {
                var productList = db.Tovar.ToList();
                foreach (var product in productList) { _products.Add(product); }

            }

        }
        private void Initilize()
        {
            Products = new
            ObservableCollection<Model.Database.Tovar>();
        }

        public Appvm()
        {
            Initilize();
            LoadData();
        }
    }
}
