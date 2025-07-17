# require_relative '../../bin/app'

namespace :run_cli_tasks do
  desc 'Run all tasks'
  task all: %i[
    search_by_id
    search_by_name
    search_by_email
    invalid_search_key
    search_by_invalid_id
    search_by_non_existent_client_by_param
    search_by_invalid_email
    find_similar_emails
    skip_client_no_email
    found_no_similar_emails
    missing_query_error
    empty_input_data_error_search_query
    empty_input_data_error_find_similar_emails
    input_file_error
  ]

  desc 'Search clients by id'
  task :search_by_id do
    sh %(ruby bin/app.rb input_data/clients.json --search 'id=3')
  end

  desc 'Search clients by name'
  task :search_by_name do
    sh %(ruby bin/app.rb input_data/clients.json --search 'full_name=John Doe')
  end

  desc 'Search clients by email'
  task :search_by_email do
    sh %(ruby bin/app.rb input_data/clients.json --search 'email=william.davis@icloud.com')
  end

  desc 'Invalid search query key'
  task :invalid_search_key do
    sh %(ruby bin/app.rb input_data/clients.json --search 'url=https://youtube.com')
  end

  desc 'Search clients by invalid id'
  task :search_by_invalid_id do
    sh %(ruby bin/app.rb input_data/clients.json --search 'id=asd')
  end

  desc 'Search clients by non-existent email'
  task :search_by_non_existent_client_by_param do
    sh %(ruby bin/app.rb input_data/clients.json --search 'id=3000')
  end

  desc 'Search clients by invalid email'
  task :search_by_invalid_email do
    sh %(ruby bin/app.rb input_data/clients.json --search 'email=asd.com')
  end

  desc 'Find clients with similar emails'
  task :find_similar_emails do
    sh %(ruby bin/app.rb input_data/clients.json --findSimilarEmails)
  end

  desc 'Skips clients with no email'
  task :skip_client_no_email do
    sh %(ruby bin/app.rb input_data/clients_v3.json --findSimilarEmails)
  end

  desc 'Found no clients with similar emails'
  task :found_no_similar_emails do
    sh %(ruby bin/app.rb input_data/clients_v2.json --findSimilarEmails)
  end

  desc 'Missing query error'
  task :missing_query_error do
    sh %(ruby bin/app.rb input_data/clients.json)
  end

  desc 'Empty input data error for search query'
  task :empty_input_data_error_search_query do
    sh %(ruby bin/app.rb input_data/empty.json --search 'id=3')
  end

  desc 'Empty input data error for find similar emails'
  task :empty_input_data_error_find_similar_emails do
    sh %(ruby bin/app.rb input_data/empty.json --findSimilarEmails)
  end

  desc 'Input file not found'
  task :input_file_error do
    begin
      sh %(ruby bin/app.rb input_data/non_existent_data.json --findSimilarEmails)
    rescue RuntimeError => e
      puts "Expected failure captured: #{e.message}"
    end
  end
end
