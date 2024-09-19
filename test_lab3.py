import subprocess


def run_ruby(m):
    result = subprocess.run(['ruby', '-e', f"load 'lab3.rb'; puts count_ones({m})"],
                            capture_output=True, text=True)
    return int(result.stdout.strip())

def test_count_ones_case1():
    assert run_ruby(100) == 3

def test_count_ones_case2():
    assert run_ruby(1234567890) == 12

