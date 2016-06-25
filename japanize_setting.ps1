########################################
# Japanese menu for Sublime Text 3 �̃t�@�C���u��������������
########################################

# $args[0] = Login Profile

$fromPath = "C:\Users\" + $args[0] + "\AppData\Roaming\Sublime Text 3\Packages\Japanize"
# Write-Output $fromPath + "\*.jp"

if (!(Test-Path $fromPath))
{
  Write-Output �����I��1
  return
}

# japanize�t�H���_�ֈړ�
cd $fromPath

$toPath = "C:\Users\" + $args[0] + "\AppData\Roaming\Sublime Text 3\Packages\Default"
if (!(Test-Path $toPath))
{
  $packagePath = "C:\Users\" + $args[0] + "\AppData\Roaming\Sublime Text 3\Packages"
  
  if (!(Test-Path $packagePath))
  {
    Write-Output �����I��2
    return
  }
  
  # Default�t�H���_���Ȃ���ΐV�K�쐬
  New-Item $toPath -ItemType Directory
}

# japanize�t�H���_��Default�t�H���_�� *.sublime-menu.jp ��S�ăR�s�[
Copy-Item .\* ..\Default -Include *.jp

# japanize�t�H���_��User�t�H���_�� Main.sublime-menu ���R�s�[

# ���Ƀt�@�C�������݂���ꍇ�̓��l�[��
if (Test-Path ..\User\Main.sublime-menu)
{  
  Rename-Item ..\User\Main.sublime-menu Main.sublime-menu.org
}
Copy-Item .\Main.sublime-menu ..\User

# Default�t�H���_�փR�s�[�����t�@�C���ɂ����āA������.jp���폜����
cd ..\Default
dir | Rename-Item -newname { $_.name -Replace '.sublime-menu.jp','.sublime-menu' } 
