Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8D661EEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 09:44:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jul 2013 02:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,726,1367996400"; d="scan'208";a="369585090"
Received: from unknown (HELO helios.localnet) ([10.252.122.115])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2013 02:44:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Tue, 23 Jul 2013 10:44 +0100
Message-ID: <3799962.PMtSgBuqpH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <10175102.kSY1axEz5R@helios>
References: <1373043676-5621-1-git-send-email-otavio@ossystems.com.br>
	<20130705194525.667209b0@e6520eb> <10175102.kSY1axEz5R@helios>
MIME-Version: 1.0
Subject: Re: [meta-oe PATCH] busybox: Follow OE-Core update to 1.12.1 version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jul 2013 09:44:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Monday 08 July 2013 13:35:21 Paul Eggleton wrote:
> On Friday 05 July 2013 19:45:25 Eric B=E9nard wrote:
> > Le Fri, 05 Jul 2013 18:29:04 +0100,
> >=20
> > Paul Eggleton <paul.eggleton@linux.intel.com> a =E9crit :
> > > Could someone *please* figure out what this bbappend is needed fo=
r and
> > > get
> > > it into OE-Core if it is still needed so we can drop it here?
> >=20
> > it's only here to install /etc/default/busybox-syslog which contain=
s
> > only one line : OPTIONS=3D"-C64" which sets the size of the logbuff=
er.
> > So obviously this could go into OE-Core.
>=20
> Yes but why is this needed? If we are to merge this into OE-Core we'l=
l need
> to say why this change is needed in the commit message.

ping...

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

