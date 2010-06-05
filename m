Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OKk9n-00014F-BX
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 05:34:48 +0200
Received: by iwn9 with SMTP id 9so1756555iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 20:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=FczlrKX2tuPHg5ngXEmvGwAPU8SlW6gG3ygbOuXnGPw=;
	b=mR5EDOY/TcGezSUMjCArDtwHzyhlrqfNxEKVp9f/nI8nTNgMGa/AUbqTQL3gkjgiue
	focWeKnMODuHSd+vMXtSvUt0qmogcVI1SclDFuv/SG1mY5uJ/3fqc+uRFjt9HuwX4LU5
	Y5UbC2FZew5lSGlIwFZTBWcZc+ZwMi6ptZY3g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=f++onKRLt3Jt5qQPITeprnKYCrvK4th0C06NEyt1JmlE+UpPrwXCaynnAEuvPdRpy5
	0CFFPVY44VZ+ox7fE0/EyAoTGEiMJiApZDJ39d2kLRGWAnT5bJm3uRgJ7LKK1kHENiaS
	S5sILcxab++8mehOOC43WI7pxVGtja8KX+HrQ=
Received: by 10.231.213.71 with SMTP id gv7mr1736666ibb.192.1275708631181; 
	Fri, 04 Jun 2010 20:30:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.15.140 with HTTP; Fri, 4 Jun 2010 20:30:11 -0700 (PDT)
In-Reply-To: <AANLkTinzFcGTINenNR72-NtuZUijkAY55BVKYL9r0ea8@mail.gmail.com>
References: <AANLkTinzFcGTINenNR72-NtuZUijkAY55BVKYL9r0ea8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 20:30:11 -0700
Message-ID: <AANLkTimq1dViDpqTm-GTFbjaAtkJVeA7Yru3Fkusgbkb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Questions about openembedded stable branch
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
X-List-Received-Date: Sat, 05 Jun 2010 03:34:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 4, 2010 at 1:09 AM, Anand Sivaram <aspnair@gmail.com> wrote:
> As I was going through the stable documentation given at
> http://wiki.openembedded.net/index.php/Stable
> I had a couple of questions.
>
> * Seems like there should have been a release "stable/2010" some time aro=
und
> =A0March, but I could not find any mention about that release.

There is no 2010 release yet.

>
> * OE repository contains very few tags. =A0Also there is no
> =A0"year.month" tag as given by the stable branch documentation.
>

once release is panned out that will be tagged.

> * Is there any testing branch (like in Debian) where relatively "stable"
> =A0packages are moved and they eventually become stable?

.dev/master is the most active branch but there is no testing branch per sa=
y.

> =A0Or is it like mainline linux kernel where features are frozen, then
> =A0do RC releases and finally the stable release? =A0It looks like
> =A0origin/org.openembedded.dev is a rolling/floating place where
> =A0packages/features are constantly getting included.

thats right.

>
> * I would like to know how the stable/2010 branch is created.

Do you want to know how or when ?

>
> * My main objective is to find a branch/tag/version
> =A0newer than stable/2009 and more stable than the dev main branch.
>

you can use .dev of any day.

> Thanks and Regards
>
> Anand
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


