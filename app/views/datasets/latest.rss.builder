xml.instruct! :xml, :version =>"1.0"
xml.rss :version => "2.0" do
  xml.channel do 
    xml.title "Latest datasets | Warwickshire Open Data"
    xml.description "Latest datasets from Warwickshire County Council's Open Data project"
    xml.link datasets_url(:rss)
    for dataset in @datasets
      xml.item do
        xml.title dataset.name
        xml.description dataset.description
        xml.pubDate dataset.publish_date.to_s(:rfc822)
        xml.link dataset_url(dataset)
      end
    end 
    
  end
  
end