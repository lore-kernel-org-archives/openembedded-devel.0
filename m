Received: from smtprelay-b21.telenor.se ([195.54.99.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1SS7JP-0006Hh-Rg
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 15:52:15 +0200
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b21.telenor.se (Postfix) with ESMTP id 73DF5EBE77
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2012 15:09:22 +0200 (CEST)
X-SENDER-IP: [83.227.58.214]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ah0bAK5rqk9T4zrWPGdsb2JhbAANN7NtAQEBATeCQAEBAQECAQEBATc0CwULCxguIQYBGxQGE4gAAwYQsXcNiVOKIWuFL2MEk0+CLoERii2Hbg
X-IronPort-AV: E=Sophos;i="4.75,557,1330902000"; d="scan'208";a="331748821"
Received: from c-d63ae353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.232]) ([83.227.58.214])
	by ipb1.telenor.se with ESMTP; 09 May 2012 15:09:22 +0200
References: <0C757E680E33864AB113392C7E83F910BE52CF@GSX300A.mxchg.m.corp>
	<20120305225422.GD2030@denix.org>
	<0C757E680E33864AB113392C7E83F910BE52D2@GSX300A.mxchg.m.corp>
	<4FA98B43.3090200@emagii.com>
	<CAMKF1sod9Lrh1LL_JQDuLTB655Np4sTvKpHTYhfZnHgc7KuReA@mail.gmail.com>
In-Reply-To: <CAMKF1sod9Lrh1LL_JQDuLTB655Np4sTvKpHTYhfZnHgc7KuReA@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <0FE30F74-8F48-47AF-A0FF-0D9C589A0F91@emagii.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Ulf Samuelsson <openembedded@emagii.com>
Date: Wed, 9 May 2012 14:34:07 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Mailer: iPad Mail (9B176)
Subject: Re: Disable GNU Hash check ?
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
X-List-Received-Date: Wed, 09 May 2012 13:52:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Still using OE 2011.03 for this
Would like to migrate this to OE-core, but it is not my call..
.

Best Regards
Ulf Samuelsson
ulf@emagii.com
+46  (722) 427 437


9 maj 2012 kl. 02:46 skrev Khem Raj <raj.khem@gmail.com>:

> On Tue, May 8, 2012 at 2:08 PM, Ulf Samuelsson <openembedded@emagii.com> w=
rote:
>>=20
>> I'd rather fix the root cause than do the workaround,
>> but splitting up the build into two steps is really not supported by the
>> package.
>>=20
>> Would appreciate some comments.
>=20
> in OE-Core the default hash style is now gnu hash for toolchain on all
> except mips
> since mips can not support gnu hash. you should not need to add
> commandline parameters to indicate it.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


