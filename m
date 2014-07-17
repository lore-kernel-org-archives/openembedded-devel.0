Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 81BE1701C0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 01:41:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6H1fxDC002070
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jul 2014 18:41:59 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.241]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Wed, 16 Jul 2014 18:41:59 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 2/2 v2] syslog-ng: uprev to 3.5.4.1
Thread-Index: AQHPoC6weE8rtBwKDU+dh+PrkZimb5ujf5DQ
Date: Thu, 17 Jul 2014 01:41:59 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCA8850F@ALA-MBB.corp.ad.wrs.com>
References: <1405072509-8901-1-git-send-email-jackie.huang@windriver.com>
	<1405072509-8901-2-git-send-email-jackie.huang@windriver.com>
	<20140715131342.GL2433@jama>
In-Reply-To: <20140715131342.GL2433@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.132]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2 v2] syslog-ng: uprev to 3.5.4.1
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
X-List-Received-Date: Thu, 17 Jul 2014 01:42:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, July 15, 2014 9:14 PM
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 2/2 v2] syslog-ng: uprev to 3.5.4.1
>=20
> On Fri, Jul 11, 2014 at 05:55:09AM -0400, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > - initscript: add status, PIDFILE and xconsole
> > - syslog-ng.conf: dump the version
> > - Fix some memory leak problems we found
> > - Some backport patches
> > - scl: fix wrong ownership issue
> > - libnet: add libnet enable option and add it in PACKAGECONFIG
> > - add HOMEPAGE
> > - remove INC_PR
> > - change some config into PACKAGECONFIG
> > - add PACKAGE syslog-ng-tools
> > - use volatiles
> > - inherit update-rc.d and update-alternative
>=20
> syslog-ng.inc changes don't apply in current master, maybe it got broken =
by patchwork, can you
> rebase and push it to some repo?


Sure, and I found a QA issue, so I will fix that first then rebase and push=
 it to some repo, and send a v3 for this.

Thanks,
Jackie

