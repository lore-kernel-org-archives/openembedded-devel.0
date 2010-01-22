Received: from scotty.acurana.de ([195.234.128.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <christopher.lang@acurana.de>) id 1NYKgC-0002py-A9
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 15:40:11 +0100
Received: from localhost (localhost.acurana.de [127.0.0.1])
	by scotty.acurana.de (Postfix) with ESMTP id B493F3BB58
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 15:37:49 +0100 (CET)
Received: from scotty.acurana.de ([127.0.0.1])
	by localhost (scotty.acurana.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31343-06 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 22 Jan 2010 15:37:48 +0100 (CET)
Received: from macbook.office2.acurana.de (unknown [192.168.1.2])
	by scotty.acurana.de (Postfix) with ESMTP id 6009D3BB53
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 15:37:48 +0100 (CET)
From: Christopher Lang <christopher.lang@acurana.de>
Organization: acurana GmbH
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 15:44:26 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <201001221544.26770.christopher.lang@acurana.de>
X-Virus-Scanned: amavisd-new at acurana.de
X-SA-Exim-Connect-IP: 195.234.128.72
X-SA-Exim-Mail-From: christopher.lang@acurana.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: New Recipe: svgalib
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
X-List-Received-Date: Fri, 22 Jan 2010 14:40:11 -0000
X-Groupsio-MsgNum: 16026
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_KnbWLFCuK/FMiSa"

--Boundary-00=_KnbWLFCuK/FMiSa
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi,

and another one, old but sometimes quite useful: svgalib
Checksums attached.

Tested with OE from Jan 11 on Opensuse 11 building for machine "x86", 
distro "minimal".

Checked with oe-stylize.py.

Chris

http://www.acurana.de/

--Boundary-00=_KnbWLFCuK/FMiSa
Content-Type: text/plain;
  charset="iso 8859-15";
  name="svgalib_checksums.ini"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="svgalib_checksums.ini"

[http://my.arava.co.il/~matan/svgalib/svgalib-1.9.24.tar.gz]
md5=3be376c08462caf88cfc150239481110
sha256=12f74fd44c13991ece0fb4bb0d4d95366ba1de2758c7eec10b59290bc6237ca1

[http://my.arava.co.il/~matan/svgalib/svgalib-1.9.25.tar.gz]
md5=4dda7e779e550b7404cfe118f1d74222
sha256=2ad5da713a6bd69622c483de4e4f448ed2b82f7b954db43dc477d5b6b12d8602

--Boundary-00=_KnbWLFCuK/FMiSa
Content-Type: application/x-tgz;
  name="svgalib_oe_recipe.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="svgalib_oe_recipe.tar.gz"

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

--Boundary-00=_KnbWLFCuK/FMiSa--
