Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDy4y-0005P9-Pc
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 12:34:19 +0100
Received: by gxk26 with SMTP id 26so1338577gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0ECg4wdxxzDo/QbB9UWrw37qbCPkn2KwtJumSgs6Ajo=;
	b=EhCgAgo0WKdEYcaWy1y2pHF7nm6yQDQwVrQ3vEpDkQmqTVuhK63GhvzP9X9ivN50lf
	gOWrdbGPRW4y5vqq5PX+CV2k41pwVU7gGYt5w2VvdLyqBaxSf6OKl+R16XGBcssYfitK
	Eth5lGge85WvxJrANCplo+Y3CnpZY4SpCHNtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=nKQrtM47OC5A1cEu8SgRW3UEbzIFqTnSyIvqM4jwJE952qXakhdH4T7nPMEOE8O8Za
	EncJ8237Zowzvk5R3jISOSFHJB5XOL3gGBbyhpO+H4imK3b3eRnEhm/kGIHQXvAgWnYv
	lWOvBhAhIPaodEodwH/+9nK/cYYblNpklEISQ=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr352863iba.1.1288870392277; Thu,
	04 Nov 2010 04:33:12 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 04:33:12 -0700 (PDT)
In-Reply-To: <20101104082759.GG19934@excalibur.local>
References: <20101104082759.GG19934@excalibur.local>
Date: Thu, 4 Nov 2010 12:33:12 +0100
Message-ID: <AANLkTinLp2jLhp1QCs8YdUXtSg7rXgq-TMK_8_vc8dSO@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patchwork cleanup weekend in two days
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
X-List-Received-Date: Thu, 04 Nov 2010 11:34:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/4 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> Its time for some house-keeping again. I know many people are working on
> patchwork on-going, thanks for that.
>
> Looking throught it during OEDEM did still show up way to many entries. S=
ome are
> still from 2009. Next Saturday and Sunday I would like to reduce our =A0c=
urrent
> count from 273 patches. 100 or less would be a nice goal imho.
>
> Steps to help out:
> 1) make sure you have a patchwork account and are added to the admin grou=
p to
> =A0 change patches
> 2) Hang out on IRC on saturday and sunday
> 3) Go through the patchwork and find all patches from yourself and up dat=
e them
> =A0 with a current status. e.g. mark them as superseeded if you send a ne=
w version
> =A0 or applied if they hit the tree.
> 4) After your own patches pick other ones and try to find out about their
> =A0 current staus. Usually git log, the ml or asking people on IRC helps =
here to
> =A0 find out stuff about the patch.
>
> If you cleaned up more then 10 patches a day you are allowed to drink a b=
eer in
> the evening. ;)

I would love to help out, but as it stands I'll be travelling on
saturday and won't have internet access on sat and sun (and probably
the rest of the week neither)
(but I'll drink the beer anyway :-) ).
Wish you all the best cleaning up!

Frans


