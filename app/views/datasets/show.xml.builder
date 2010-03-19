xml.instruct! :xml, :version =>"1.0"
  xml.dataset do 
    xml.title @dataset.name
    xml.short_description @dataset.short_description
    xml.description @dataset.description
    xml.version @dataset.version
    xml.language @dataset.language.name
    xml.geo_extent @dataset.geo_extent 
    xml.maintainer @dataset.maintainer
    xml.contact_email @dataset.contact_email
    xml.info_url @dataset.info_url

    xml.formats do
      for format_url in @dataset.format_urls
        xml.format do
          xml.title format_url.format_type.name
          xml.url format_url.url
        end
      end
    end 
    
    xml.date_range_start @dataset.date_range_start.xmlschema
    xml.data_range_end @dataset.date_range_end.xmlschema
    xml.publish_date @dataset.publish_date.xmlschema
    xml.metadata_date @dataset.metadata_date.xmlschema
    xml.licence_name @dataset.licence.name
    xml.category @dataset.category.name
  
    xml.tags do
      for tag in @dataset.tags
          xml.tag tag.name
      end
    end

end
