# -*- coding: utf-8 -*-
import shutil
import sys
import os

def copy_file(src, dst):
    """
    复制文件到指定路径
    :param src: 源文件路径
    :param dst: 目标路径（可以是目录或完整文件路径）
    """
    try:
        # 检查源文件是否存在
        if not os.path.isfile(src):
            raise FileNotFoundError(f"源文件 不存在")

        # 处理目标路径
        if os.path.isdir(dst):
            # 如果目标是目录，使用原文件名
            dst_dir = dst
            filename = os.path.basename(src)
            dst = os.path.join(dst_dir, filename)

        # 创建目标目录（如果不存在）
        os.makedirs(os.path.dirname(dst), exist_ok=True)

        # 执行复制（保留元数据）
        shutil.copy2(src, dst)
        print(f"成功复制文件到: {dst}")

    except Exception as e:
        print(f"错误: {str(e)}")
        sys.exit(1)

if __name__ == "__main__":
    # if len(sys.argv) != 3:
    #     print("使用方法: python copy_file.py <源文件路径> <目标路径>")
    #     print("示例: python copy_file.py /path/to/source.txt /path/to/destination/")
    #     sys.exit(1)

    # source = sys.argv[1]
    # destination = sys.argv[2]

    source = '/home/book/Project/buildroot-2024.02.9/output/images/sdcard.img'
    destination = '/mnt/hgfs/FZSFolder'

    copy_file(source, destination)