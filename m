Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D542A77BB4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 14:04:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 04 May 2017 07:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,287,1491289200"; d="scan'208";a="1164549080"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2017 07:04:51 -0700
Received: from irsmsx103.ger.corp.intel.com ([169.254.3.241]) by
	irsmsx110.ger.corp.intel.com ([169.254.15.151]) with mapi id
	14.03.0319.002; Thu, 4 May 2017 15:04:40 +0100
From: "John, Maxin" <maxin.john@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] State of Java on OE
Thread-Index: AQHSuu5PobBJDeGiT0SQaMQUHokRj6HjIzkAgAEkSNA=
Date: Thu, 4 May 2017 14:04:39 +0000
Message-ID: <61C0517EAD808B429A1DE2DD9164D40030F8FE34@IRSMSX103.ger.corp.intel.com>
References: <CAA0Zw-x0XYPf4WS+KHj_90xkCuNaNZYysmaBZNryEq8genRUCA@mail.gmail.com>
	<4199013.DMSEEGMUmM@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <4199013.DMSEEGMUmM@peggleto-mobl.ger.corp.intel.com>
Accept-Language: fi-FI, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Steven Osborn <osborn.steven@gmail.com>
Subject: Re: State of Java on OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 May 2017 14:04:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Updated the morty branch today. Sorry for this mess-up.
=09
Thanks and Regards,
Maxin

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Thursday, May 4, 2017 12:34 AM
To: openembedded-devel@lists.openembedded.org
Cc: Steven Osborn <osborn.steven@gmail.com>; John, Maxin <maxin.john@intel.=
com>
Subject: Re: [oe] State of Java on OE

On Saturday, 22 April 2017 10:25:55 AM NZST Steven Osborn wrote:
> Is anyone using Java on OE devices right now?
>=20
> meta-java - no release branches.  Seems to only be focused on master.
> I've had trouble even finding a revision that will compile on Morty.

So it looks like there is a morty branch now, but it includes a commit that=
 only works with master due to inheriting relative_symlinks (as also noted =
by Koen).=20

Maxin (or someone else with push access), could you please fix the morty br=
anch?

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

