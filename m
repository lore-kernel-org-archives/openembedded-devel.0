Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M2ari-0000Uf-83
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 May 2009 02:56:34 +0200
Received: by an-out-0708.google.com with SMTP id b6so1008390ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=11OOWUMr9ZktI6V8usOh+CR1LMMcjCqy5XjQMto3OM4=;
	b=dyEHziCGYnphJZE+eUWB9OjQIUog3mkr+VCPHFqwe2AU/Lc4sjBjJ4O4kczCdbit0y
	xeLqahFyEiwGcDYJPaivpSV7rCe8d3s/5P+w4iJeRvRUovYK6Sp34aq7gv7DjzfH1Okt
	8xxuJbY1qo215OC9Hd2/i1DAG3TDdIgPb2Vuo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=WWzwKA9jMI8tb3/TmbMb3LpHUzKJCEzCX0jktXIJpHi0bv0FT58g3zXfkZxyCobxBV
	V6Ck+N3lExBcJ+DdKDIStNjz03OQ/7uOpI8hm1b7SXv1B5HTo+Sv6yjF7NMLMGra3B6R
	ObksWTMOyeLD8xXNGcGqrouWbrsLOt3bGeVQ0=
Received: by 10.100.153.9 with SMTP id a9mr9916063ane.139.1241830218508;
	Fri, 08 May 2009 17:50:18 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm1674566ywn.7.2009.05.08.17.50.16
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 May 2009 17:50:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id CA71961019D; Fri,  8 May 2009 21:50:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 May 2009 21:50:20 -0300
Message-Id: <1241830239-5594-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.rc1.51.gea0b7
In-Reply-To: <1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
References: <1241830239-5594-1-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-2-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-3-git-send-email-otavio@ossystems.com.br>
	<1241830239-5594-4-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 04/23] hal-info: add 20080414
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
X-List-Received-Date: Sat, 09 May 2009 00:56:34 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini               |    4 ++++
 recipes/hal/hal-info_20090414.bb |    1 +
 2 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 recipes/hal/hal-info_20090414.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index ec15afd..51f6f04 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -10070,6 +10070,10 @@ sha256=120e6b8019b5d608038d8f9a5a14bb97c4162b803118bb8530d9735d65b553a9
 md5=6fc99d15d38945c17a291ea93e664664
 sha256=80655b3531ea56a5d64085e572dfb8d3ecabffd28af482cd130f72dfdd6254b0
 
+[http://hal.freedesktop.org/releases/hal-info-20090414.tar.gz]
+md5=ae7177ab8f0163d3ef2df71f0de2b357
+sha256=33dd87dc9452227375b8b9cdad940581714a55d55ff18ae2990905ac2f81fa0f
+
 [http://www.soft.uni-linz.ac.at/~vogl/bluez/handsfree-040326.tar.gz]
 md5=488b0f2f346361bba7996b459c5d7b6f
 sha256=dbd0c389a160c9f6dcd9eac81b6c4d5a02866968a33f06201556d6860012f6c3
diff --git a/recipes/hal/hal-info_20090414.bb b/recipes/hal/hal-info_20090414.bb
new file mode 100644
index 0000000..e6d50e3
--- /dev/null
+++ b/recipes/hal/hal-info_20090414.bb
@@ -0,0 +1 @@
+require hal-info.inc
-- 
1.6.3.rc1.51.gea0b7



