require 'capistrano/git'

class Capistrano::Git
  module SubmoduleStrategy
    # do all the things a normal capistrano git session would do
    include Capistrano::Git::DefaultStrategy

    def test
      test! " [ -d #{repo_path}/.git ] "
    end

    def check
      test! :git, :'ls-remote', repo_url
    end

    def clone
      git :clone, '-b', fetch(:branch), '--recursive', repo_url, repo_path
    end

    def update
      git :remote, :update
    end

    # put the working tree in a release-branch,
    # make sure the submodules are up-to-date
    # and copy everything to the release path
    def release
      git :checkout, fetch(:branch)
      git :reset, '--hard', "origin/#{fetch(:branch)}"
      git :submodule, :update, '--init', '--recursive'
      context.execute "rsync -ar --exclude=.git\* #{repo_path}/ #{release_path}"
    end
  end
end
