
def to_signed8(x):
    return x - 256 if x >= 128 else x


def golden_alu(a, b, op):
    a &= 0xFF
    b &= 0xFF
    op &= 0xF

    y = 0
    carry = 0
    overflow = 0

    if op == 0:  # ADD
        total = a + b
        y = total & 0xFF
        carry = 1 if total > 0xFF else 0

        sa = (a >> 7) & 1
        sb = (b >> 7) & 1
        sy = (y >> 7) & 1
        overflow = 1 if (sa == sb and sy != sa) else 0

    elif op == 1:  # SUB
        y = (a - b) & 0xFF
        carry = 1 if a >= b else 0

        sa = (a >> 7) & 1
        sb = (b >> 7) & 1
        sy = (y >> 7) & 1
        overflow = 1 if (sa != sb and sy != sa) else 0

    elif op == 2:  # AND
        y = a & b

    elif op == 3:  # OR
        y = a | b

    elif op == 4:  # XOR
        y = a ^ b

    elif op == 5:  # NOT
        y = (~a) & 0xFF

    elif op == 6:  # SLL
        y = (a << (b & 0x7)) & 0xFF

    elif op == 7:  # SRL
        y = (a >> (b & 0x7)) & 0xFF

    elif op == 8:  # SRA
        y = (to_signed8(a) >> (b & 0x7)) & 0xFF

    elif op == 9:  # signed SLT
        y = 1 if to_signed8(a) < to_signed8(b) else 0

    zero = 1 if y == 0 else 0
    negative = (y >> 7) & 1

    return {
        "y": y,
        "zero": zero,
        "negative": negative,
        "carry": carry,
        "overflow": overflow
    }
