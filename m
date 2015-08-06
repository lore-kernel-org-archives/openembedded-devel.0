Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8907E7648D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 16:35:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 06 Aug 2015 09:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,623,1432623600"; d="scan'208";a="620597910"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by orsmga003.jf.intel.com with ESMTP; 06 Aug 2015 09:35:47 -0700
Received: from orsmsx158.amr.corp.intel.com (10.22.240.20) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 6 Aug 2015 09:35:45 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
	ORSMSX158.amr.corp.intel.com (10.22.240.20) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 6 Aug 2015 09:35:45 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.23]) by
	FMSMSX112.amr.corp.intel.com ([169.254.5.210]) with mapi id
	14.03.0224.002; Thu, 6 Aug 2015 09:35:45 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "Maxin B. John" <maxin.john@enea.com>
Thread-Topic: [oe] [meta-java] [Openjdk-8 enabling patch]
Thread-Index: AdDPtJJ78SFW46/mR4+X5Gbzh47fDgA3Ou4AAArvYBA=
Date: Thu, 6 Aug 2015 16:35:44 +0000
Message-ID: <B399646F8CA055479BEC55F6B065A04A3703E855@FMSMSX108.amr.corp.intel.com>
References: <B399646F8CA055479BEC55F6B065A04A3703DA8B@FMSMSX108.amr.corp.intel.com>
	<20150806144729.GA20394@sestofb10.enea.se>
In-Reply-To: <20150806144729.GA20394@sestofb10.enea.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"'otavio@ossystems.com.br'" <otavio@ossystems.com.br>,
	"'mario@ossystems.com.br'" <mario@ossystems.com.br>
Subject: Re: [meta-java] [Openjdk-8 enabling patch]
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
X-List-Received-Date: Thu, 06 Aug 2015 16:35:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Maxin,
Thanks for the quick feedback...=20
I will resend it today..(going over guidelines etc..)
~Vinay

-----Original Message-----
From: Maxin B. John [mailto:maxin.john@enea.com]=20
Sent: Thursday, August 6, 2015 7:48 AM
To: Awasthi, Vinay K
Cc: openembedded-devel@lists.openembedded.org; 'mario@ossystems.com.br'; 'o=
tavio@ossystems.com.br'
Subject: Re: [oe] [meta-java] [Openjdk-8 enabling patch]

Hi,

On Wed, Aug 05, 2015 at 07:29:00PM +0000, Awasthi, Vinay K wrote:
> diff --git=20
> recipes-core/openjdk/openjdk-8-8u40b27/cacao-arm-ucontext.patch
>=20
> +        return "LIBFFI_LIBS=3D-lffi"
>=20
> +    else:
>=20
> +        return ""
>

Agree with Otavio and Paul here. Please re-do the patch as described in the=
 README with a reasonable commit message and we will be happy to review it =
:)

Best Regards,
Maxin

