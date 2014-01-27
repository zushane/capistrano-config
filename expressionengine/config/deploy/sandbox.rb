
# =========================================================================== #
# Configuration and tasks for the sandbox deployment stage.
# =========================================================================== #

set :stage, :sandbox
set :deploy_via, :remote_cache
set :deploy_to, '{{SANDBOX_DIRECTORY}}'

server '{{SERVER_NAME}}',
	user: '{{USERNAME}}', 
	roles: :all,
	ssh_options: {
		keys: %w({{PUBLICKEY_PATH)
	}

# ExpressionEngine cache and uploads directories tasks.
before 'deploy:cleanup', 'expressionengine:make_cache_writable'
before 'deploy:cleanup', 'expressionengine:symlink_uploads'
