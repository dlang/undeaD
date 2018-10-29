project('undeaD', 'd')

project_version   = '1.0.9'
project_soversion = '0'

src_dir = include_directories('src/')
pkgc = import('pkgconfig')

undead_src = [
    'src/undead/bitarray.d',
    'src/undead/cstream.d',
    'src/undead/datebase.d',
    'src/undead/date.d',
    'src/undead/dateparse.d',
    'src/undead/doformat.d',
    'src/undead/metastrings.d',
    'src/undead/regexp.d',
    'src/undead/socketstream.d',
    'src/undead/stream.d',
    'src/undead/string.d',
    'src/undead/utf.d'
]

undead_internal_src = [
    'src/undead/internal/file.d',
]

install_headers(undead_src, subdir: 'd/undead')
install_headers(undead_internal_src, subdir: 'd/undead/internal')

# we only build a static library here
undead_lib = library('undead',
        [undead_src,
         undead_internal_src],
        include_directories: [src_dir],
        install: true,
        version: project_version,
        soversion: project_soversion
)
pkgc.generate(name: 'undead',
              libraries: undead_lib,
              subdirs: 'd/',
              version: project_version,
              description: 'Obsolete Phobos modules, back from the dead.'
)

# Tests
# We need to manually create a main () routine, since LDC will break with split compilation and -main flag
fake_main_src = meson.build_root() + '/umain.d'
r = run_command('sh', '-c', 'echo "void main () {}" > ' + fake_main_src)
if r.returncode() != 0
  error('Unable to write dummy main.d file: ' + r.stderr().strip())
endif

undead_test_exe = executable('undead_test',
    [undead_src, undead_internal_src, fake_main_src],
    include_directories: [src_dir],
    d_args: meson.get_compiler('d').unittest_args()
)
test('undead_tests', undead_test_exe)
