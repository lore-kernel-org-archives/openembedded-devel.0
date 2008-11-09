Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzApD-00027i-6T
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:59:35 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2047266fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Xyx+ALpIQ9a0F1zbP9UsLHUulg076UKPAyUSI2NjVLI=;
	b=EDDVZv0QYp/mSaDkoI5BZw62k2cxGnYrLKs9vmwcVf7c2S2wAfLdYcvSHTwBiMjmOu
	pVo8CilpaTNDpoQIwavkwoU/Ay5N/G57NF8eDWr9Ba12F4NGvWK5RE7CQVd1WpybKO6V
	65yed2Z6HpxlrhOKPMWLk7TmaUx144Y78kyKg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=k9HF3B8BIxULoLq6UROMY5/nzvXDuvhmAkEeM3Ix/OiW8bj9w3k1bfBa2fkixLA0yM
	4vi31u/eyXIYG5qhYJGZCN9a2Ylm2UYiHlhQhSNJo6ggzULBwPQfg128L3loe8kUj4NI
	vF9tCwdTydTQeq82fv0eRpDitUtV/R3sItd2w=
Received: by 10.187.210.10 with SMTP id m10mr1229747faq.13.1226237337762;
	Sun, 09 Nov 2008 05:28:57 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.28.55
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:28:56 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:01 +0300
Message-Id: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] checksums.ini: add few more checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Nov 2008 13:59:35 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 conf/checksums.ini |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/conf/checksums.ini b/conf/checksums.ini
index e72b1af..bf39454 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -4862,6 +4862,10 @@ sha256=972da0f1c35df459b99b24f5bbed5ddec150b714540e2254b6b37035117167ed
 md5=9054d072f5972d5e567c428531734ad5
 sha256=7f836c8189b55ef4ec8f3387673687d0a5c1a713abc9617144638b28e6857bd2
 
+[http://camaya.net/download/gloox-0.8.9.tar.bz2]
+md5=dc590e34107de5cb296c238afa8e843b
+sha256=9d9ef356cc4478499442573556787125dc76c8acd1e55e5001fb11f1e224d27f
+
 [http://xorg.freedesktop.org/releases/individual/proto/glproto-1.4.8.tar.bz2]
 md5=3dfbd17203c0c88b94b6f579f24c11cc
 sha256=2f5d84413853b688b7bb46c66fee108a499190e1f7810afffb775910778f053c
@@ -5082,6 +5086,10 @@ sha256=7ad66f99a1bad1ae0bbb02bd7a7cf8ed17fdc3fd104fa5c68e04961459ad5c50
 md5=edd7f02e30683054b94a89aa62c74d1e
 sha256=cf2f96f3c91749fdcec39d3eb89273f6d3a47cc7bc0c5faa0915808409c9d563
 
+[http://ftp.gnome.org/pub/GNOME/sources/gnome-themes/2.24/gnome-themes-2.24.0.tar.bz2]
+md5=0dd3fc0d034d7f51379ea6f335d1d257
+sha256=7a7fd49793c790c508cebce5e4ff99c83ddcaa6fd57266ce46ff9ac4cc3b9063
+
 [http://ftp.gnome.org/pub/GNOME/sources/gnome-themes/2.6/gnome-themes-2.6.2.tar.bz2]
 md5=4aae39232d77e1497f3180202b501adf
 sha256=471191e942fdd1d691095c71fb22c0a645b3644c3b2b1c58a6d6f1a2435fb818
@@ -8182,6 +8190,10 @@ sha256=694ea8352edf845b0a7dc0c2e0e990bcb8507f64e405edc048ad115c6578e5f7
 md5=49fe67302fd76543a7574a73c01395ba
 sha256=512674419ac2013d11eccf4f106d6cfc719c9c2b49215a8f0e89c5327d176a84
 
+[http://gpephone.linuxtogo.org/download/gpephone/libabenabler-1.0/libabenabler-1.0.tar.bz2]
+md5=1264bd213c631d29d1b4bc04696de66a
+sha256=0f34656e262d7c41c1499dbe1aa3bc91c1fe8dc230ab79d5cf027ab6d141ee56
+
 [http://www.ngolde.de/download/libacpi-0.2.tar.gz]
 md5=05b53dd7bead66dda35fec502b91066c
 sha256=13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29
@@ -8410,6 +8422,10 @@ sha256=c2c6ee274cbd5759715a786b949df8ac3e848ffc771173c4f006b88c665346d0
 md5=329401b84ad0b00aaccaad58f2fc393c
 sha256=509503979441e078866d75a628d8a6483e67737454feaa5366f609ecf2a0f5cf
 
+[http://download.savannah.nongnu.org/releases/exosip/libeXosip2-3.1.0.tar.gz]
+md5=ed6005a146501a5f9308e28108ae7bca
+sha256=eed72871201e2c1deae3d7c0b618bf16f306d91fc7ebcb53956ab7468663514f
+
 [http://www.mr511.de/software/libelf-0.8.3.tar.gz]
 md5=f85d6dc4b4ef1c126080d86cf0ce63fd
 sha256=644262514d0f6c3572f66935921a5290383a15e804e9b085e293ab78102d3513
@@ -8582,6 +8598,10 @@ sha256=7562042a6210947363bd6a9bbcdd03f8d02470c0347970b507f689d25a907844
 md5=95d269ad7e7cb7d3032498ad2e47643b
 sha256=b8a1da871aa34362caf0c76dcbd3df42aef7313a4ed08f38eddcb159b80302c5
 
+[http://gpephone.linuxtogo.org/download/gpephone/libgemwidget-1.0/libgemwidget-1.0.tar.bz2]
+md5=37916e6f12bff470fb457ad2d382789b
+sha256=b178c610fbbf2613ed1edeba2a11ed9c1ea042274465b2f3cd0a29cf1c7ebd9c
+
 [http://ftp.belnet.be/packages/ggzgamingzone/ggz/0.0.14.1/libggz-0.0.14.1.tar.gz]
 md5=603739504648833779aa13b0327a1c3d
 sha256=54301052a327f2ff3f2d684c5b1d7920e8601e13f4f8d5f1d170e5a7c9585e85
@@ -8726,6 +8746,10 @@ sha256=23425f74f304072f48d295e9d7168a6ecfb44c049074b34b71cfbf1f4d19ec85
 md5=009af2f3554caaf547bbc282da0e83c6
 sha256=c40ea6d2282503ede882efe85ad526358683c311ea4592d41eaab0725ca75934
 
+[http://gpephone.linuxtogo.org/download/gpephone/libgpephone-0.4/libgpephone-0.4.tar.bz2]
+md5=fae122bd44d6da9a006f65aedbd6461e
+sha256=cd84dc0e4b903871339e5e097a51d09a76ee9e1495783a47bb5ba81d633810da
+
 [http://gpe.linuxtogo.org/download/source/libgpepimc-0.2.tar.gz]
 md5=74e36fd1c34dc668801366d5aa11e93e
 sha256=19556cc4d3469f61c7b50db7a9979a669af0b03c0c2243441e34a8a5f737fa9d
@@ -9302,6 +9326,10 @@ sha256=b67c0218b7cd2d521783bf055b13c598bd04b623cbf4adbb3cc76bd3ac57dc5d
 md5=40ee3ec89030f0d6dfdb2cf6100e6685
 sha256=4e13febd65a2f8f18cb55151cd10f5f0888bf1e7dc2a4c0d54f39f170255de1c
 
+[ftp://ftp.gnu.org/gnu/osip/libosip2-3.1.0.tar.gz]
+md5=7eb305608256ac2a7a27b66ce52627c8
+sha256=245911a9a48bbe868c4518faf86191f6568fb99d9967d368164a17a83671e8fb
+
 [http://repository.maemo.org/pool/bora/free/source/libosso-gsf_1.11.10.4-1.tar.gz]
 md5=4c5b31154943108ba0fecf00c8af9f3c
 sha256=687f46d5d5eb5ced18534f3cfcfdd82db6b25679437602f1519cae48d019b55d
@@ -9414,6 +9442,10 @@ sha256=004dae11e11598584939d66d26a5ab9b48d08a00ca2d00ae8d38ee3ac7a15d65
 md5=a9e90187c1dc183f497bcae34718e415
 sha256=6fb70d0b8f410f05988e1f3a3e8c86990c3e84c9958041803e6d0658faae91ea
 
+[http://gpephone.linuxtogo.org/download/gpephone/librecord-1.0/librecord-1.0.tar.bz2]
+md5=a487a98a40d64b9f6ee118b10b9cb97a
+sha256=7cadb398c106ba8df3b297e345ab1db750ad058c6c2e78b184f18a7f685bf8ef
+
 [http://gpe.linuxtogo.org/download/source/librewrite-0.1.tar.bz2]
 md5=f25a9f8aefde5e2bf0dc5c8318020a00
 sha256=3a892543df587f645911289af7fead594bb161913ce04619360f25cb3adeefad
-- 
1.5.6.5



