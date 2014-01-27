
# =========================================================================== #
# Configuration and tasks for the beta deployment stage.
# =========================================================================== #

set :stage, :beta
set :deploy_via, :remote_cache
set :deploy_to, '{{BETA_DIRECTORY}}'

server '{{SERVER_NAME}}',
	user: '{{USERNAME}}', 
	roles: :all,
	ssh_options: {
		keys: %w({{PUBLICKEY_PATH)
	}

# ExpressionEngine cache and uploads directories tasks.
before 'deploy:cleanup', 'expressionengine:make_cache_writable'
before 'deploy:cleanup', 'expressionengine:symlink_uploads'
