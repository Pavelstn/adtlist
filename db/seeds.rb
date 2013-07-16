# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Adtadmin::Type.create(name: 'Продажа', alias: 'sale', isactive: 1, isdelete:0)
Adtadmin::Type.create(name: 'Аренда', alias: 'rent', isactive: 1, isdelete:0)

Adtadmin::Category.create(name: '1к квартира', alias: '1kk_sale', isactive: 1, isdelete:0, type_id:1, private_name:'Продажа: 1к квартира', full_name:'Продается однокомнатная квартира')
Adtadmin::Category.create(name: '2к квартира', alias: '2kk_sale', isactive: 1, isdelete:0, type_id:1, private_name:'Продажа: 2к квартира', full_name:'Продается двухкомнатная квартира')
Adtadmin::Category.create(name: '1к квартира', alias: '1kk_rent', isactive: 1, isdelete:0, type_id:2, private_name:'Аренда: 1к квартира', full_name:'Сдается однокомнатная квартира')
Adtadmin::Category.create(name: '2к квартира', alias: '2kk_rent', isactive: 1, isdelete:0, type_id:2, private_name:'Аренда: 2к квартира', full_name:'Сдается двухкомнатная квартира')

Adtadmin::Region.create(name: 'Краснодар', alias: 'krd', isactive: 1, isdelete:0)
Adtadmin::Region.create(name: 'Сочи', alias: 'sochi', isactive: 1, isdelete:0)

Adtadmin::Partner.create(name: '****************', aliasname: 'gnrealty', isactive: 1, isdelete:0)

Adtadmin::Agentprofile.create(region_id: 1,name: 'Павел П.', phone: '+7 962 85 37 555', description:'Это Я', isactive: 1, isdelete:0)



