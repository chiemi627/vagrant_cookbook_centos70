## 概要

* 筑波大enPiTでrailsアプリを作る人の用の開発環境を自動作成するVagrantファイルです。
* 産技大enPiTのレポジトリ [github:ychubachi/vagrant_enpit](https://github.com/ychubachi/vagrant_enpit) を元に作っています。
  * vm.boxに CentOS 7.0 を使っています。
	* cloudstack on idcf cloud へ同じ環境をデプロイすることを想定しており、idcf cloudのvagrant用テンプレートにubuntuがないのでCentOSを使っています。
  * CentOS 6.5 用のvagrant+cookbookも [github:chiemi627/vagrant_cookbook_centos65](https://github.com/chiemi627/vagrant_cookbook_centos65.git)にあります。

## 準備

* Vagrant
* VirtualBox
* Chef DK

## Vagrantのプラグイン
* VagrantにChef，Berkshelfのプラグインを入れる．

```bash
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-berkshelf
vagrant plugin install vagrant-cloudstack
vagrant plugin install dotenv
```

## VirtualBox上に仮想マシンを作成する場合

### 起動

* レシピのインストール．

```bash
% berks install
```

* 起動する．

```bash
vagrant up --provider=virtualbox
```

## cloudstack上に仮想マシンを作成する場合

### 準備
1. .envファイルを用意する
```bash
% cp dot.env.sample .env
```
2. .envファイルを開き、接続先について必要項目を埋める
3. Vagrantfileを開き89行目をコメントアウトする
```
 #chef.add_recipe "gems"
```

### 起動

```bash
% berks install
% vagrant up --provider=cloudstack
```

* 途中で以下のメッセージが表示されて止まってしまった場合には下記の対応をしてください。
```
==> default: sudo を実行するには tty がなければいけません。すみません
```

```bash
% vagrant ssh
vagrant@guestos> sudo visudo
```
viエディタで設定ファイルが開くので

```
 Defaults: requiretty
 ```
となっているところを

```
 Defaults: !requiretty
```
に変更して保存してログアウト。そのあと以下を実行。

```bash
% vagrant provision
```
