# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seeds for the STore table
Store.create(name: 'ST KATHARINES WAY EXPRESS',address:'ST KATHARINES WAY EXPRESS52ce9bad42632be6e1e8c992',lat:'51.506826',long:'-0.072624',location_id:'52ce9bad42632be6e1e8c992',store_distance:'0.3083144404782735',store_type:'Express')
Store.create(name: 'MANSELL STREET EXPRESS',address:'MANSELL STREET EXPRESS52ce9bad42632be6e1e8d03b',lat:'51.51201268',long:'-0.073404789',location_id:'52ce9bad42632be6e1e8d03b',store_distance:'0.43127890942798386',store_type:'Express')
Store.create(name: 'TOOLEY STREET METRO',address:'TOOLEY STREET METRO52ce9bad42632be6e1e8d1e3',lat:'51.50416048',long:'-0.081531428',location_id:'52ce9bad42632be6e1e8d1e3',store_distance:'0.6136432287768385',store_type:'Metro')
Store.create(name: 'MONUMENT METRO',address:'MONUMENT METRO52ce9bad42632be6e1e8cd98',lat:'51.51058405',long:'-0.085008521',location_id:'52ce9bad42632be6e1e8cd98',store_distance:'0.6561243089876169',store_type:'Metro')
Store.create(name: 'LONDON ST. BOTOLPHS EXPRESS',address:'LONDON ST. BOTOLPHS EXPRESS52ce9bad42632be6e1e8d176',lat:'51.51442573',long:'-0.076877281',location_id:'52ce9bad42632be6e1e8d176',store_distance:'0.6583359778213261',store_type:'Express')

# Seeds for the Products

Product.create(name:'Weetabix Chocolate',description:'[\"Hot Oat Cereal with Chocolate, fortified with vitamins, iron and calcium.\"]',price:'0.444',tpnb:'61717183')
Product.create(name:'Bread',description:'[\"Original Oat Cereal Fortified with Vitamins, Iron & Calcium.\"]',price:'0.444',tpnb:'50061542')
Product.create(name:'Bread Rolls',description:'[\"Seasoned pork sausage meat wrapped in puff pastry.\", \"Everyday Value 8 Sausage Rolls\"]',price:'0.208',tpnb:'55537485')
Product.create(name:'Weetabix Milk',description:'[\"Mixed Cereal Bar Drizzled with a Milk Chocolate Coating.\"]',price:'1.47',tpnb:'64252462')
Product.create(name:'Banana MilkDrink',description:'[\"Banana milk drink (UHT)\", \"A varied, balanced diet and healthy lifestyle are important.\", \"Facebook/yazoo\", \"Twitter@YazooDrinks\"]',price:'0.25',tpnb:'64935426')
Product.create(name:'Milk',description:'[\"Milk.\"]',price:'1.14',tpnb:'54924823')
Product.create(name:'Woodwards GripeWater',description:'[\"Gripe Water Dual Action\"]',price:'2.0',tpnb:'50085963')
Product.create(name:'Carrs Biscuits',description:'[\"Crackers.\"]',price:'0.495',tpnb:'50737711')
Product.create(name:'Spring Water',description:'[\"Carbonated spring water.\", \"Bottled at source\"]',price:'0.013',tpnb:'63130026')
Product.create(name:'Carrots',description:'[\"Sliced carrots in water.\", \"100% British Carrots\"]',price:'1.88',tpnb:'53467927')
Product.create(name:'Banana Biscuits',description:'[\"Bite-sized crunchy slices of real banana\", \"Did you know...? A bunch of bananas is known as a hand.\", \"For more info and find us on Facebook to hear what other mums & dads think about our products.\"]',price:'40.0',tpnb:'63719235')
Product.create(name:'White Wine',description:'[\"White Wine\", \"British Wine\"]',price:'3.99',tpnb:'54972889')
Product.create(name:'Mulled Wine',description:'[\"Mulled Wine\", \"British Wine\"]',price:'3.99',tpnb:'54972886')
Product.create(name:'Red Wine',description:'[\"Red wine vinegar\", \"Ideal for dressings, sauces & marinades\"]',price:'0.229',tpnb:'50342734')
Product.create(name:'Ginger Beer',description:'[\"Premium Ginger Beer\"]',price:'0.338',tpnb:'64009436')
Product.create(name:'Milkybar Chocolate',description:'[\"White chocolate.\", \"www.facebook.com/milkybar\", \"Good to rememb r\", \"Enjoying chocolate as part of a varied, balanced diet and a healthy lifestyle, is one of lifes little pleasures.\"]',price:'1.75',tpnb:'60664044')



# Seeds for the Store Products
StoreProduct.create(product_id: 1, store_id: 1, quantity: 0, available: false)
StoreProduct.create(product_id: 1, store_id: 2, quantity: 5, available: true)
StoreProduct.create(product_id: 1, store_id: 3, quantity: 10, available: true)
StoreProduct.create(product_id: 1, store_id: 4, quantity: 20, available: true)
StoreProduct.create(product_id: 1, store_id: 5, quantity: 30, available: true)
StoreProduct.create(product_id: 2, store_id: 1, quantity: 10, available: true)
StoreProduct.create(product_id: 2, store_id: 2, quantity: 0, available: false)
StoreProduct.create(product_id: 2, store_id: 3, quantity: 0, available: false)
StoreProduct.create(product_id: 2, store_id: 4, quantity: 0, available: false)
StoreProduct.create(product_id: 2, store_id: 5, quantity: 0, available: false)
StoreProduct.create(product_id: 3, store_id: 1, quantity: 10, available: true)
StoreProduct.create(product_id: 3, store_id: 2, quantity: 5, available: true)
StoreProduct.create(product_id: 3, store_id: 3, quantity: 0, available: false)
StoreProduct.create(product_id: 3, store_id: 4, quantity: 10, available: true)
StoreProduct.create(product_id: 3, store_id: 5, quantity: 10, available: true)
StoreProduct.create(product_id: 4, store_id: 1, quantity: 10, available: true)
StoreProduct.create(product_id: 4, store_id: 2, quantity: 20, available: true)
StoreProduct.create(product_id: 4, store_id: 3, quantity: 10, available: true)
StoreProduct.create(product_id: 4, store_id: 4, quantity: 0, available: false)
StoreProduct.create(product_id: 4, store_id: 5, quantity: 40, available: true)
StoreProduct.create(product_id: 5, store_id: 1, quantity: 10, available: true)
StoreProduct.create(product_id: 5, store_id: 2, quantity: 20, available: true)
StoreProduct.create(product_id: 5, store_id: 3, quantity: 30, available: true)
StoreProduct.create(product_id: 5, store_id: 4, quantity: 10, available: true)
StoreProduct.create(product_id: 5, store_id: 5, quantity: 0, available: false)
StoreProduct.create(product_id: 6, store_id: 1, quantity: 10, available: true)
StoreProduct.create(product_id: 6, store_id: 2, quantity: 20, available: true)
StoreProduct.create(product_id: 6, store_id: 3, quantity: 30, available: true)
StoreProduct.create(product_id: 6, store_id: 4, quantity: 40, available: true)
StoreProduct.create(product_id: 6, store_id: 5, quantity: 50, available: true)
StoreProduct.create(product_id: 7, store_id: 2, quantity: 10, available: true)
StoreProduct.create(product_id: 8, store_id: 3, quantity: 50, available: true)
StoreProduct.create(product_id: 9, store_id: 4, quantity: 60, available: true)
StoreProduct.create(product_id: 10, store_id: 5, quantity: 50, available: false)
StoreProduct.create(product_id: 11, store_id: 1, quantity: 10, available: true)
StoreProduct.create(product_id: 12, store_id: 2, quantity: 10, available: true)
StoreProduct.create(product_id: 13, store_id: 3, quantity: 10, available: true)
StoreProduct.create(product_id: 14, store_id: 4, quantity: 10, available: true)
StoreProduct.create(product_id: 15, store_id: 5, quantity: 10, available: true)