import sys
#sys.stdin=open("input.txt", "rt")
from collections import deque

# 주어진 입력값을 사용하여 톱니바퀴의 초기 상태를 생성합니다.
board = [deque(list(map(int, input().rstrip()))) for _ in range(4)]

n = int(input())  # 회전 횟수를 입력받습니다.

for _ in range(n):
    a, b = map(int, input().split())
    a -= 1  # 톱니바퀴 번호를 0부터 시작하도록 조정합니다.
    rr = [deque(gear) for gear in board]  # 톱니바퀴의 현재 상태를 복사합니다.

    # 톱니바퀴를 회전시키는 함수
    def rotate_gear(gear, direction):
        if direction == 1:  # 시계방향
            gear.appendleft(gear.pop())
        elif direction == -1:  # 반시계방향
            gear.append(gear.popleft())

    # 선택된 톱니바퀴를 회전시킵니다.
    rotate_gear(rr[a], b)

    # 왼쪽 톱니바퀴를 확인하면서 회전 여부를 결정합니다.
    left = a - 1
    left_direction = -b
    while left >= 0:
        if board[left][2] != board[left + 1][6]:
            rotate_gear(rr[left], left_direction)
            left_direction = -left_direction
            left -= 1
        else:
            break

    # 오른쪽 톱니바퀴를 확인하면서 회전 여부를 결정합니다.
    right = a + 1
    right_direction = -b
    while right < 4:
        if board[right][6] != board[right - 1][2]:
            rotate_gear(rr[right], right_direction)
            right_direction = -right_direction
            right += 1
        else:
            break

    # 회전 후의 톱니바퀴 상태를 board에 반영합니다.
    board = rr

# 점수 계산
score = 0
for i in range(4):
    if board[i][0] == 1:
        score += 2 ** i

print(score)
