Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JPxSJ-0000kc-Gk
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 11:06:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FA5qpT025655
	for <openembedded-devel@openembedded.org>; Fri, 15 Feb 2008 10:05:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25620-01 for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 10:05:48 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FA5lZY025647
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Fri, 15 Feb 2008 10:05:47 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200802150907.35125.openembedded@haerwu.biz>
References: <E1JPidE-0008Rf-C1@linuxtogo.org>
	<200802150907.35125.openembedded@haerwu.biz>
Date: Fri, 15 Feb 2008 10:05:47 +0000
Message-Id: <1203069947.8636.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m1FA5qpT025655
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] org.oe.dev Added spitz_h_rewrite.patch with	better Spitz hardware documentation.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2008 10:06:16 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2008-02-15 at 09:07 +0100, Marcin Juszkiewicz wrote:
> Dnia Thursday, 14 of February 2008, utx commit napisa=C5=82:
> > Added spitz_h_rewrite.patch with better Spitz hardware documentation.
> >
> > Author: utx@openembedded.org
> > Branch: org.openembedded.dev
> > Revision: a74635b601bde68329566b8107d8a298996f1da8
> > ViewMTN:
> > http://monotone.openembedded.org/revision/info/a74635b601bde68329566b=
81
> >07d8a298996f1da8 Files:
> > 1
> > packages/linux/linux-rp-2.6.24/spitz_h_rewrite.patch
> > packages/linux/linux-rp_2.6.24.bb
>=20
> Why this was not consulted at all with Zaurus kernel maintainer? Nor se=
nt=20
> to LAKML?

It was sent to LKML and I was cc'd. Changes to linux-rp really should be
at least discussed with me though before they're committed, particularly
the clamshell devices. I've taken this up with Stanislav Brabec
directly.

Cheers,

Richard








