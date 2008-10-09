Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Kns46-0003Ou-Ej
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Oct 2008 11:44:14 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 4CD4216DF24
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2008 11:46:30 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id B27E92A420D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Oct 2008 11:47:32 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 9 Oct 2008 11:39:18 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E3CF43D@hiob.intern.dresearch.de>
In-Reply-To: <48ED467B.5080208@whitby.id.au>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: git and branches
Thread-Index: AckpoHVBGEEFLcodROmAZsTSngyz+wAUQYpg
References: <200810081757.57676.zecke@selfish.org>
	<48ED467B.5080208@whitby.id.au>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: git and branches
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
X-List-Received-Date: Thu, 09 Oct 2008 09:44:14 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

As an OE beginner I'm a bit confused with the different branches. Is =
there an overview about all the branches available in the new git =
system. I made some searches in wiki.openembedded.net but could not =
found really helpful info.

'git branch -r' lists these branches:

  origin/HEAD
  origin/master
  origin/org.openembedded.dev
  origin/org.openembedded.documentation
  origin/org.openembedded.dreambox
  origin/org.openembedded.entity
  origin/org.openembedded.stable
  origin/org.openmoko.april-update
  origin/org.openmoko.dev
  origin/org.openmoko.xora.qtopia
  origin/org.openmoko.zecke.april-update
  origin/org.openmoko.zecke.autotools-bustage
  origin/org.openmoko.zecke.random-breakage

<http://wiki.openembedded.net/index.php/DevelopmentBranches> lists these =
ones (without any description :( ):

  org.nslu2-linux.bitbake
  org.nslu2-linux.dev
  org.openembedded.dev
  org.openembedded.documentation
  org.openembedded.dreambox
  org.openembedded.oetest
  org.openembedded.oz354fam083
  org.openembedded.oz354x
  org.openembedded.packaged-staging
  org.openembedded.stable

'master' ist used as the default when getting the data with 'git clone =
git://git.openembedded.net/org.openembedded.dev' like described on =
<http://wiki.openembedded.net/index.php/Git#OpenEmbedded_Git_repository>.=
 But what branch is 'master'? And which branches should one use for =
which purposes?

Steffen


