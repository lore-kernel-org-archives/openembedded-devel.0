Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B6A0B60D5A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:42:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Dec 2013 08:42:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,508,1384329600"; d="scan'208";a="452082851"
Received: from unknown (HELO helios.localnet) ([10.252.122.56])
	by fmsmga002.fm.intel.com with ESMTP; 18 Dec 2013 08:42:51 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Wed, 18 Dec 2013 16:42:50 +0000
Message-ID: <1921702.El3fv2RuWf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <2D278DF6-68CE-4D88-B356-E70750AE2FCC@dominion.thruhere.net>
References: <1387380021-20465-1-git-send-email-eric@eukrea.com>
	<20131218173603.40ac0c16@e6520eb>
	<2D278DF6-68CE-4D88-B356-E70750AE2FCC@dominion.thruhere.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] inetutils: fix compile error when PATH_PROCNET_DEV is undefined
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
X-List-Received-Date: Wed, 18 Dec 2013 16:42:52 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday 18 December 2013 17:37:24 Koen Kooi wrote:
> Op 18 dec. 2013, om 17:36 heeft Eric B=E9nard <eric@eukrea.com> het v=
olgende
> geschreven:
> > Le Wed, 18 Dec 2013 16:33:24 +0100,
> > Koen Kooi <koen@dominion.thruhere.net> a =E9crit :
> >> Eric B=E9nard schreef op 18-12-13 16:20:
> >>> patch taken from :
> >>> http://repository.timesys.com/buildsources/i/inetutils/inetutils-=
1.9/ine
> >>> tutils-1.9-PATH_PROCNET_DEV.patch>>=20
> >> Put that in the patch itself please and also add an Upstream-Statu=
s tag.
> >=20
> > I don't know which status to put there as it's not upstream : which=

> > one is appropriate ?
>=20
> I put in "Unknown" in that case, but that's not a valid option for OE=
-core
> recipes.=20

The valid list, as agreed by the TSC some time ago, is part of the docu=
ment we=20
have here:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

