Received: from [209.172.120.180] (helo=skymoon.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ckamas@finesse.com>) id 1M56oQ-0003WH-I6
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 May 2009 01:27:34 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 15 May 2009 16:22:46 -0700
Message-ID: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Kernel modules
thread-index: AcnVtA5cS5u1VsM/QX6hsd3N2pu/Mg==
From: "Chuck Kamas" <ckamas@finesse.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Kernel modules
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
X-List-Received-Date: Fri, 15 May 2009 23:27:34 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am trying to compile a very small kernel.  To do this I have a few
kernel modules I would like in the root file system.  But when I load OE
I see that there are no kernel modules in the fs.  I found a way to
include them by adding a RDEPENDS line with kernel-module-i2c-core.
This places it in the rootfs.  My question is there a better, automatic
way, to have all kernel modules included in the rootfs?

Chuck



