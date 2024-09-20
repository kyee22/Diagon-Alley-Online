import subprocess


def run_ruby(m):
    result = subprocess.run(['ruby', '-e', f"load 'lab1.rb'; puts mfp({m})"],
                            capture_output=True, text=True)
    return int(result.stdout.strip())

def test_mfp_case1():
    assert run_ruby(1) == 1

def test_mfp_case2():
    assert run_ruby(9999) == 73

def test_mfp_case3():
    assert run_ruby(10000) == 23

def test_mfp_case4():
    assert run_ruby(2) == 3  # 可以添加更多的测试用例

def test_mfp_case5():
    assert run_ruby(999) == 103  # 可以添加更多的测试用例

