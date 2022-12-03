class JobPositionRequirement
    @@last = 0

    def self.last
        return @@last
    end

    def self.generate
        data = {}
        data[:job_position] = JobPosition.one
        data[:required_experience] = rand(0.5..1.5).round(2)
        data[:required_title] = rand(0.0..1.0) > 0.7
        data[:companyName] = Faker::Company.name
        @@last = data
    end

end