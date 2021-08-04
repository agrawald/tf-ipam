from setuptools import find_packages, setup

setup(
    name='netbox_api_token_generator',
    version='0.1',
    description='NetBox plugin to generate API token for a user',
    url='https://github.com/agrawald/netbox_api_token_generator.git',
    author='Dheeraj Agrawal',
    license='Apache 2.0',
    install_requires=[],
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
)