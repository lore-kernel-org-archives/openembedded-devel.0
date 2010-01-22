Received: from scotty.acurana.de ([195.234.128.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christopher.lang@acurana.de>) id 1NYL44-0005r7-Pa
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 16:04:52 +0100
Received: from localhost (localhost.acurana.de [127.0.0.1])
	by scotty.acurana.de (Postfix) with ESMTP id 3FFD93BBD4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 15:32:40 +0100 (CET)
Received: from scotty.acurana.de ([127.0.0.1])
	by localhost (scotty.acurana.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31343-05 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 22 Jan 2010 15:32:39 +0100 (CET)
Received: from macbook.office2.acurana.de (unknown [192.168.1.2])
	by scotty.acurana.de (Postfix) with ESMTP id E37193BBCF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 15:32:38 +0100 (CET)
From: Christopher Lang <christopher.lang@acurana.de>
Organization: acurana GmbH
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 15:39:21 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <201001221539.21722.christopher.lang@acurana.de>
X-Virus-Scanned: amavisd-new at acurana.de
X-SA-Exim-Connect-IP: 195.234.128.72
X-SA-Exim-Mail-From: christopher.lang@acurana.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: New Recipe: xmlto-native
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
X-List-Received-Date: Fri, 22 Jan 2010 15:04:52 -0000
X-Groupsio-MsgNum: 16030
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ZibWLg2i3Gz1emo"

--Boundary-00=_ZibWLg2i3Gz1emo
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi,

please find enclosed a new recipe: xmlto.
Checksums attached too.

Tested with OE from Jan 11 on Opensuse 11 building for machine "x86", 
distro "minimal".

Checked with oe-stylize.py.

Chris

http://www.acurana.de/


--Boundary-00=_ZibWLg2i3Gz1emo
Content-Type: text/plain;
  charset="iso 8859-15";
  name="xmlto_checksums.ini"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="xmlto_checksums.ini"

[http://www.cyberelk.net/tim/data/xmlto/stable/xmlto-0.0.18.tar.bz2]
md5=1a06471b70eb27a6aca5d1b3a144f9b0
sha256=64db67e1a3b32fada20370792493c97fa9a37bc2dafc767603689036de9b344b

[https://fedorahosted.org/releases/x/m/xmlto/xmlto-0.0.23.tar.gz]
md5=849b72a7de59d6ba512c65015be88148
sha256=fe28cbf9390fd2d5c0d20acd972497622b0d32884cb7f2548e9e0f37e752c58f

--Boundary-00=_ZibWLg2i3Gz1emo
Content-Type: application/x-tgz;
  name="xmlto_oe_recipe.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="xmlto_oe_recipe.tar.gz"

H4sIAB66WUsAA+2W3U/bMBDA+5y/4hQqDTSaxGlCWbRNY2kH2Qqt0jK0J+Q2XhMtH5Xj8in+99lJ
C4wx9gJM2+730CR357uzzz73LEtFYTaeFEvScV31JB2XVN/EcarnkgYhbXur3XacjtWwCLFdpwHu
06ZVsygF5QCNacyT8kE7xh/S/6WcVfWvfls5FckJO7YMyyDbxmTyWDFUgbfqet9Xf1nszp36u5ZN
GmA9VgIP8Z/Xf01bAxjMWd7LJiyKWAQZEzSigsLXJGVapQeoNkj94XNGhbQrcg/Idmuf8pYt61vb
AewsRFxwD3y1nqKYx4xDn+azTXg9vREZqRS9o9MFpzk1IvZ2Ndwv5uc8mcUC1v0NUI5haQW72WRv
E2Ih5p5pnp6eGjfDzevoaQrV8BI4kxU7YZFRp93s01L4sQzLoq6cgCedE6tlkZZtA3E8h3iOCy+l
zIL1DzzZBCn/SPPKbAOalY+QnSRlombeeaVEdx2/P/egmuVK2WXllCdzUY0ZJxkc0cUsflFeL6im
dXsjPwyG42BwAG9A/8lI13YOx3uD8Aelru0N9nvDnd2eEqs1KeWifGVRwWlclLI+RsFn9bk2dW3U
81f+FyJJS10bhsEgDMZflKio8qOprvUDv3cwqnzuDvvKSr1yoss8R6F/fBgGq3gy3PR8wjhLvxk5
E6ZIMlNtm2VMeaomKVs2lubl8POVIc+ZMbmwK1/KS/PyaBB+6gbh1W0zpU5yuUUSAXVDAroQhSiK
tNS0P31c/jl+0f/t9nP2/627978r/zBg/38OsP9j//9t/7fu6f/3xpO3AaMlK80zMzNvt5abG2B2
gRcAgiAIgiAIgiAIgiAIgiAIgiAIgjwR3wGO5l/aACgAAA==

--Boundary-00=_ZibWLg2i3Gz1emo--
