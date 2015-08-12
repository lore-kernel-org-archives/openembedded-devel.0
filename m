Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C15A0605F1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 11:10:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 04:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,660,1432623600"; d="scan'208";a="767150112"
Received: from menright-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.21.215])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2015 04:10:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Rongqing Li <rongqing.li@windriver.com>
Date: Wed, 12 Aug 2015 12:10:54 +0100
Message-ID: <27160670.K3UU4rQsOm@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.3-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55CA9F60.4020602@windriver.com>
References: <1436171379-32162-1-git-send-email-rongqing.li@windriver.com>
	<mqcpsd$esk$1@ger.gmane.org> <55CA9F60.4020602@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ypbind-yocto.init: add status command
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
X-List-Received-Date: Wed, 12 Aug 2015 11:10:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Roy,

On Wednesday 12 August 2015 09:20:32 Rongqing Li wrote:
> On 2015=E5=B9=B408=E6=9C=8811=E6=97=A5 20:30, Koen Kooi wrote:
> > While you're there, can you please fix the name of this file? Eithe=
r
> > change it to 'yoctoproject' or rename it to something sensible, but=
 the
> > current situation is just wrong.
>=20
> I will change the title of this patch, and not rename
> ypbind-yocto.init, since ypbind-yocto.init will be rename
> to ypbind when it is installed into system

Yes, that's clear - it's just not the right name in the metadata either=
. Would=20
you mind simply renaming it to ypbind.init to be at least similar to ot=
her=20
recipes?

Thanks,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

