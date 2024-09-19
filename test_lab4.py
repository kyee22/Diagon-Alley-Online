import subprocess


def run_ruby(m):
    result = subprocess.run(['ruby', '-e', f"load 'lab4.rb'; puts decode_ways({m})"],
                            capture_output=True, text=True)
    return int(result.stdout.strip())

''' Test Cases from Statement '''
def test_decode_ways_case1():
    assert run_ruby(12) == 2

def test_decode_ways_case2():
    assert run_ruby(121212) == 13

def test_decode_ways_case3():
    assert run_ruby(0) == 0

''' Test Cases from LeetCode<https://leetcode.cn/problems/decode-ways> '''
def test_decode_ways_case4():
    assert run_ruby(226) == 3

def test_decode_ways_case5():
    assert run_ruby(2101) == 1

def test_decode_ways_case6():
    assert run_ruby(1201234) == 3

def test_decode_ways_case7():
    assert run_ruby(1123) == 5

def test_decode_ways_case8():
    assert run_ruby(2201) == 1

def test_decode_ways_case9():
    assert run_ruby(123123) == 9

def test_decode_ways_case10():
    assert run_ruby(1202) == 1

def test_decode_ways_case11():
    assert run_ruby(2611055971756562) == 4

def test_decode_ways_case12():
    assert run_ruby(111111111111111111111111111111111111111111111) == 1836311903

def test_decode_ways_case13():
    assert run_ruby(1010) == 1

def test_decode_ways_case14():
    assert run_ruby(1029) == 1

def test_decode_ways_case15():
    assert run_ruby(12120) == 3

def test_decode_ways_case16():
    assert run_ruby(7733) == 1
