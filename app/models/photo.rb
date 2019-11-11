class Photo < ApplicationRecord

  has_attached_file :image,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "http://i.kinja-img.com/gawker-media/image/upload/s--iEV2_cUo--/c_fill,fl_progressive,g_north,h_77,q_80,w_137/akjmndys0n7jgpfmf41d.jpg"

  validates_attachment :image,
                       content_type: { content_type: %w(image/jpeg image/png)},
                       size: { in: 0..100.kilobytes }
end
