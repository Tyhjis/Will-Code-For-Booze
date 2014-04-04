module ScandGenerator
    def generate_scands(strparam)
        strparam.gsub(/[äöåÄÖÅ]/, 'ä' => '\"{a}', 'ö' => '\"{o}', 'å' => '\"aa', 'Ä' => '\"{A}', 'Ö' => '\"{O}', 'Å' => '\"AA')
    end
end
