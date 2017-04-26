Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA7416FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 07:53:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3Q7rB5O023187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 26 Apr 2017 00:53:11 -0700
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Wed, 26 Apr 2017 00:53:10 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-networking][PATCH 1/8] openhpi: add new recipe
Thread-Index: AQHSvl+FoKZ7o/oxE0yLaCFBDrqGwaHXRrXw
Date: Wed, 26 Apr 2017 07:53:09 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B72EFE9@ALA-MBC.corp.ad.wrs.com>
References: <cover.1493189113.git.jackie.huang@windriver.com>
	<961f0ad87d1db56db58b4e3f3196d6ba1ff8238d.1493189113.git.jackie.huang@windriver.com>
	<20170426073427.GA3258@jama>
In-Reply-To: <20170426073427.GA3258@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.117]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/8] openhpi: add new recipe
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
X-List-Received-Date: Wed, 26 Apr 2017 07:53:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> > +
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/openhpi/openhpi-${PV}.tar.gz \
>=20
> Use BPN and BP

Sure, fixed.

>=20
> > +S =3D "${WORKDIR}/openhpi-${PV}"
>=20
> Isn't this the default?

Yes, this line is removed.

And I will send v2 for these changes.

Thanks,
Jackie

> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

