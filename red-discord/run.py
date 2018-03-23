import json
from subprocess import call
from glob import iglob
import sys

interpreter = sys.executable
if interpreter is None:
	raise RuntimeError('Python interpreter not found')


def install(reqs):
	if not reqs:
		return

	cmd = [interpreter, '-m', 'pip', 'install']
	cmd.extend(reqs)
	exit_code = call(cmd)
	if exit_code != 0:
		raise OSError(f'install failed for {reqs}')


def main():
	for filename in iglob('/app/cogs/**/info.json', recursive=True):
		with open(filename) as f:
			data = json.load(f)
		req_list = data.get('REQUIREMENTS', [])
		install(req_list)


if __name__ == '__main__':
	print('Installing cog dependencies')
	main()

	red_cmd = [interpreter, './red.py', '--no-prompt']
	sys.exit(call(red_cmd))
