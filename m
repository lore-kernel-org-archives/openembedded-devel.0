Received: from na3sys009aog104.obsmtp.com ([74.125.149.73])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bengardiner@nanometrics.ca>) id 1PLdHw-00021j-Uv
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 15:59:09 +0100
Received: from source ([209.85.216.182]) (using TLSv1) by
	na3sys009aob104.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTO55cjNFk3ZMSVJ5jEujevqXMzmrh1Pu@postini.com;
	Thu, 25 Nov 2010 06:57:56 PST
Received: by mail-qy0-f182.google.com with SMTP id 7so2558213qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 06:57:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.91.194 with SMTP id o2mr743559qcm.250.1290697074194; Thu,
	25 Nov 2010 06:57:54 -0800 (PST)
Received: by 10.220.194.74 with HTTP; Thu, 25 Nov 2010 06:57:54 -0800 (PST)
In-Reply-To: <20101125100046.GA32024@lit.local.igalia.com>
References: <20101123113706.GA3533@lit.local.igalia.com>
	<4CEBD252.7000502@mentor.com>
	<20101123145713.GA3032@lit.local.igalia.com>
	<4CEBDABB.1060607@mentor.com>
	<6EB1C564-9BA3-4833-B7F3-72EA4B2F8C51@dominion.thruhere.net>
	<20101123160525.GB3032@lit.local.igalia.com>
	<ich14q$f5b$2@dough.gmane.org> <4CEC15EF.3090906@mentor.com>
	<AANLkTi=r-WTGRKTOb_0W89fUyrq67W9u-S_uPQ14dSrX@mail.gmail.com>
	<20101125100046.GA32024@lit.local.igalia.com>
Date: Thu, 25 Nov 2010 09:57:54 -0500
Message-ID: <AANLkTinhdExMtL4QM4VMXu13iZgNawR4WpA_OJ43OFry@mail.gmail.com>
From: Ben Gardiner <bengardiner@nanometrics.ca>
To: =?ISO-8859-1?Q?V=EDctor_M=2E_J=E1quez_L=2E?= <vjaquez@igalia.com>
X-SA-Exim-Connect-IP: 74.125.149.73
X-SA-Exim-Mail-From: bengardiner@nanometrics.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>,
	openembedded-devel@lists.openembedded.org
Subject: Re: external-toolchain-csl-1.0-r6 fails
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Nov 2010 14:59:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi V=EDctor,

2010/11/25 V=EDctor M. J=E1quez L. <vjaquez@igalia.com>:
> On Wed, Nov 24, 2010 at 11:22:44PM -0500, Ben Gardiner wrote:
>> [...]
>> I think you'll find that you are able to build using CSL if you use
>> TOOLCHAIN_VENDOR instead of TARGET_VENDOR in your local.conf. I tested
>> with CSL's 2009q1 -- YMMV.
>
> It works! Thanks a lot for the clarification and sorry for the noise.

You're very welcome. I'm glad it works for you also.

Best Regards,
Ben Gardiner

---
Nanometrics Inc.
http://www.nanometrics.ca


