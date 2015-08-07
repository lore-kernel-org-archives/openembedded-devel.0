Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 784F8767A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 16:19:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Aug 2015 09:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779786274"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 09:19:16 -0700
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 7 Aug 2015 09:19:15 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
	ORSMSX116.amr.corp.intel.com (10.22.240.14) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 7 Aug 2015 09:19:15 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.23]) by
	FMSMSX113.amr.corp.intel.com ([169.254.13.127]) with mapi id
	14.03.0224.002; Fri, 7 Aug 2015 09:19:14 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "<openembedded-devel@lists.openembedded.org>"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java]
	[Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
Thread-Index: AQHQ0LM/pIfQSRhkTEqSP5paxhNxMJ3/xmEAgAEoiwD//8lHdg==
Date: Fri, 7 Aug 2015 16:19:14 +0000
Message-ID: <AE507F60-A9A0-42FB-8040-F21719556A86@intel.com>
References: <B399646F8CA055479BEC55F6B065A04A3703F105@FMSMSX108.amr.corp.intel.com>
	<CAMKF1soC4=mMLfhgSXEhd318AiHuAj+YF+otJ6fGtgE4+jy7gw@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A3703F1FD@FMSMSX108.amr.corp.intel.com>,
	<CAP9ODKqTC3ohfvSS+=616CArZtTy=N=+D0XKnsr9putdLTaUCQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqTC3ohfvSS+=616CArZtTy=N=+D0XKnsr9putdLTaUCQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java]	[Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
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
X-List-Received-Date: Fri, 07 Aug 2015 16:19:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks. I will also add openjdk-8-jre to Java-test-image.bb

-Vinay=20
408-765-9407
415-770-3385 (cell)

> On Aug 7, 2015, at 5:35 AM, Otavio Salvador <otavio.salvador@ossystems.co=
m.br> wrote:
>=20
> On Thu, Aug 6, 2015 at 10:59 PM, Awasthi, Vinay K
> <vinay.k.awasthi@intel.com> wrote:
>> Hotspot build for arm is not stable... I see various error related  (see=
 below)
>=20
> Drop INC_PR
>=20
> We seem to have just one openjdk-8 recipe so squash the .inc files
>=20
> Please address the send-email as comment in the patch is critical.
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

