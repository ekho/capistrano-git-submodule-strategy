load File.expand_path("../tasks/local.rake", __FILE__)

require 'capistrano/scm'

require 'zlib'
require 'archive/tar/minitar'
include Archive::Tar
require 'tmpdir'

class Capistrano::Local < Capistrano::SCM
  module DefaultStrategy
    def check
      test! " [ -d #{repo_url} ] "
    end

    def release
      on release_roles :all, in: :parallel do |host|
        file_list = Dir.glob(repo_url + '/*').concat(Dir.glob(repo_url + '/.[^.]*'))
        file_list.each { |r| upload! r, release_path, recursive: true }
      end
    end
  end

  module ArchiveStrategy
    def check
      test! " [ -d #{repo_url} ] "
    end

    def release
      archive = ''
      # preparing archive
      run_locally do
        archive = fetch(:tmp_dir, Dir::tmpdir()) + '/' + fetch(:application, 'distr') + "-#{release_timestamp}.tar.gz"
        unless File.exists?(archive)
          Dir.chdir(repo_url) do
            Minitar.pack('.', Zlib::GzipWriter.new(File.open(archive, 'wb')))
          end
        end
      end

      # uploading and unpacking
      on release_roles :all, in: :parallel do |host|
        upload! archive, repo_path, verbose: false
        remote_archive = File.join(repo_path, File.basename(archive))
        execute :tar, 'xzf', remote_archive, '-C', release_path
        execute :rm, '-f', remote_archive
      end

      # removing archive
      run_locally do
        execute :rm, '-f', archive
      end
    end
  end
end

set :capistrano_local_archive, Capistrano::Local::ArchiveStrategy