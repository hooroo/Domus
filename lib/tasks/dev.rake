if Rails.env.development?
  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      Family.delete_all
      School.delete_all
      Trip.delete_all

      15.times do
        create(
          :family,
          last_name: FFaker::NameIT.last_name,
          first_name: FFaker::NameIT.first_name,
          address: ["San Cesareo", "Zagarolo", "Colonna"].sample,
          animals: ["2 dogs", "5 cats", "1 horse", "ducks"].sample,
          preferred_gender: ["Female", "Male"].sample,
          active: [true, false].sample,
        )
      end

      10.times do
        create(
          :school,
          name: FFaker::AddressFR.city,
          responsible_name: FFaker::NameFR.name,
          responsible_contact: FFaker::PhoneNumberFR.mobile_phone_number,
          notes: FFaker::Lorem.phrase,
        )
      end

      School.all.each do |school|
        create(:trip, school: school)
      end
    end
  end
end
