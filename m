Received: from [220.128.136.52] (helo=ns.kevlo.org ident=root)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kevlo@kevlo.org>) id 1Ll3SM-00040o-Fr
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 16:49:55 +0100
Received: from [127.0.0.1] (kevlo.org [220.128.136.52])
	by ns.kevlo.org (8.14.3/8.14.3) with ESMTP id n2LFpAeQ031670
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Mar 2009 23:51:14 +0800 (CST)
From: Kevin Lo <kevlo@kevlo.org>
To: openembedded-devel@openembedded.org
Date: Sat, 21 Mar 2009 23:48:29 +0800
Message-Id: <1237650509.6865.6.camel@nsl>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: [PATCH] Add checksum for mx21ads-2.6.19rc6-lg1.patch.bz2
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
X-List-Received-Date: Sat, 21 Mar 2009 15:49:55 -0000
X-Groupsio-MsgNum: 8595
Content-Type: multipart/mixed; boundary="=-J7CHDh7YGGfEnx+4JqS4"

--=-J7CHDh7YGGfEnx+4JqS4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

The attached patch addes checksum for mx21ads-2.6.19rc6-lg1.patch.bz2

	Kevin

--=-J7CHDh7YGGfEnx+4JqS4
Content-Disposition: attachment; filename="patch-checksums.ini"
Content-Type: text/x-patch; name="patch-checksums.ini"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

--- conf/checksums.ini.orig	2009-03-21 23:30:12.000000000 +0800
+++ conf/checksums.ini	2009-03-21 23:33:16.000000000 +0800
@@ -16446,6 +16446,10 @@
 md5=c5318eba3404ebd78a15c680fa1b6056
 sha256=d80142bfe7dd2c8ee9c2345c71fedded8b971267a9a29a853d48c562dd0605d4
 
+[http://opensource.wolfsonmicro.com/~lg/linux-2.6-mx21/mx21ads-2.6.19rc6-lg1.patch.bz2]
+md5=d459eeb5da1f0e35a2192de57aaa7241
+sha256=b013c87894112f7732c9bd693d9f875356ee45e3332701ece38d123a9f2d3e65
+
 [http://opensource.wolfsonmicro.com/~lg/linux-2.6-mx31/mx31ads-2.6.19rc6-lg1.patch.bz2]
 md5=f814fa7be7f81b26bcdf1d26901aefa8
 sha256=278f4e36a46b04a6355979fd2138e090823bd1a4bf1bbb1fe781497d576d8a07

--=-J7CHDh7YGGfEnx+4JqS4--
