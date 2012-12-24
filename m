Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Tn3bM-0003cF-Pf
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2012 09:41:38 +0100
Received: from mail436.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id B3F50DC05D2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Dec 2012 09:15:45 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 24 Dec 2012 10:07:26 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 24 Dec 2012 10:07:25 +0200
Date: Mon, 24 Dec 2012 09:06:54 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20121224090654.0b16f805@eb-e6520>
In-Reply-To: <657212B5-E6A0-45F8-AD05-3F99D7DB1B73@dominion.thruhere.net>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520> <kb40tq$84p$1@ger.gmane.org>
	<20121222120551.6916471a@eb-e6520>
	<20121223154736.3c151ef8@eb-e6520>
	<3DF8EBF7-61B4-4EBB-9C58-D1C63256FEF5@dominion.thruhere.net>
	<20121223195357.5fc91a73@eb-e6520>
	<B7FA4357-A7A1-408A-AF1F-89062AAACF8D@dominion.thruhere.net>
	<20121223222145.6785dca1@eb-e6520>
	<657212B5-E6A0-45F8-AD05-3F99D7DB1B73@dominion.thruhere.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 953918697134992713
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrudduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpegrnhhgshhtrhhomhdqughishhtrhhisghuthhiohhnrdhorhhgnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrudduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpegrnhhgshhtrhhomhdqughishhtrhhisghuthhiohhnrdhorhhgnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Cc: koen@dominion.thruhere.net
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Mon, 24 Dec 2012 08:41:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le Sun, 23 Dec 2012 23:16:31 +0100,
Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
> It does break angstrom since the autobuilder does have that change and th=
e updated systemd was pushed into the feeds already after meta-oe gained th=
e commit.
>=20
strange, I checked there and systemd is not at v189 :
http://www.angstrom-distribution.org/feeds/v2012.05/ipk/eglibc/armv5te/base/
may you please point me to the right feed ?

Thanks
Eric


