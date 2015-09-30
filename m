Return-Path: <vinay.k.awasthi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6415577070
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 21:30:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 30 Sep 2015 14:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,614,1437462000"; d="scan'208";a="655389533"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
	by orsmga003.jf.intel.com with ESMTP; 30 Sep 2015 14:30:43 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
	FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 30 Sep 2015 14:30:41 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.194]) by
	fmsmsx123.amr.corp.intel.com ([169.254.2.104]) with mapi id
	14.03.0248.002; Wed, 30 Sep 2015 14:30:41 -0700
From: "Awasthi, Vinay K" <vinay.k.awasthi@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM
Thread-Index: AQHQ2uLL0F9RpkJJK0Wyg4YeyoPAuJ5V08vAgAB3jwD//40wUA==
Date: Wed, 30 Sep 2015 21:30:40 +0000
Message-ID: <B399646F8CA055479BEC55F6B065A04A370ABC48@FMSMSX108.amr.corp.intel.com>
References: <1440032144-18482-1-git-send-email-vinay.k.awasthi@intel.com>
	<B399646F8CA055479BEC55F6B065A04A370ABB95@FMSMSX108.amr.corp.intel.com>
	<CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
In-Reply-To: <CAP9ODKrVXpZ-ZhZ=1SjAdqtrOpD=XO1DJaruGef4OyhT-uDd1w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
MIME-Version: 1.0
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java][PATCH] OpenJDK-8: For x86 and ARM
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
X-List-Received-Date: Wed, 30 Sep 2015 21:30:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sure... I will take a look at it today..
Thanks,
Vinay

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Otavio Salvador
Sent: Wednesday, September 30, 2015 2:21 PM
To: OpenEmbedded Devel List
Cc: Richard Purdie; Otavio Salvador; mario@ossystems.com.br
Subject: Re: [oe] [meta-java][PATCH] OpenJDK-8: For x86 and ARM

Hello Vinay,

On Wed, Sep 30, 2015 at 6:15 PM, Awasthi, Vinay K <vinay.k.awasthi@intel.co=
m> wrote:
> Any update on when openjdk-8 is going to be part of meta-java? It has bee=
n over a month..

Jens has prepared the patches and it has the ARM side fixed as well.

Is it possible for you to take a look at his changes and see if those work =
for you?

* https://github.com/rehsack/poky/tree/master
* https://github.com/rehsack/meta-openembedded/tree/master
* https://github.com/rehsack/meta-fsl-arm/tree/master
* https://github.com/rehsack/meta-java/tree/master

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

