create_env_file() {
	build_dir=$1

	if [[ "${ANGULAR_ENVIRONMENT}" == "staging" ]]; then
		target_file="${build_dir}/src/environments/environment.staging.ts"
	elif [[ "${ANGULAR_ENVIRONMENT}" == "production"  ]]; then
		target_file="${build_dir}/src/environments/environment.prod.ts"
	fi

	> $target_file

	cat > $target_file  << EOL 
export const environment = {
	production: true,
	apiUrl: '${API_URL}',
	mainDomainUrl: '${MAIN_DOMAIN_URL}',
	mainUrl: '${MAIN_URL}',
	localeString: '${LOCALE_STRING}',
	SOCKET_ENDPOINT: '${SOCKET_ENDPOINT}',
	fx_app_id: '${FX_APP_ID}',
	stripe_public_key: '${STRIPE_PUBLIC_KEY}'
};
EOL

}