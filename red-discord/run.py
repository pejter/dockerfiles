import json
import os
import sys
from subprocess import call

repos_file = os.path.join('data', 'downloader', 'repos.json')
interpreter = sys.executable
if interpreter is None:
	raise RuntimeError('Python interpreter not found')


def install(reqs):
	if not reqs:
		return

	print(f'Installing {reqs}')
	cmd = [interpreter, '-m', 'pip', 'install', '--upgrade', '--target', 'lib']
	cmd.extend(reqs)
	exit_code = call(cmd)
	if exit_code != 0:
		raise OSError(f'install failed for {reqs}')


def main():
	try:
		with open(repos_file) as f:
			repos = json.load(f)
	except OSError:
		repos = {}
	for repo in repos.values():
		for cog in repo.values():
			if cog['INSTALLED']:
				info_file = os.path.join(cog['folder'], 'info.json')
				try:
					with open(info_file) as f:
						cog_info = json.load(f)
				except OSError:
					cog_info = {}
				reqs = cog_info.get('REQUIREMENTS')
				install(reqs)


if __name__ == '__main__':
	print('Installing cog dependencies...')
	main()

	red_cmd = [interpreter, './red.py', '--no-prompt']
	sys.exit(call(red_cmd))
