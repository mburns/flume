# encoding: UTF-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

source 'https://supermarket.chef.io'

metadata

cookbook 'java'
cookbook 'maven'
cookbook 'thrift'
cookbook 'apt'
cookbook 'runit'
cookbook 'volumes'
cookbook 'silverware'
cookbook 'hadoop_cluster'

group :integration do
  cookbook 'test', path: 'test/fixtures/cookbooks/test'
end
