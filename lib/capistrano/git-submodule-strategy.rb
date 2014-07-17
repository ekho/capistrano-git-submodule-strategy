require 'capistrano/git'

class Capistrano::Git
  module SubmoduleStrategy
    # do all the things a normal capistrano git session would do
    include Capistrano::Git::DefaultStrategy

    def test
      test! " [ -d #{repo_path}/.git ] "
    end

    def check
      unless test!(:git, :'ls-remote', repo_url)
        context.error "Repo `#{repo_url}` does not exists"
        return false
      end

      if context.capture(:git, :'ls-remote', repo_url).split("\n").select{ |i| i.include?("refs/heads/#{fetch(:branch)}") }.empty?
        context.error "Branch `#{fetch(:branch)}` not found in repo `#{repo_url}`"
        return false
      end

      true
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
