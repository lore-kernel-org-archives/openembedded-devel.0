Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Or5u5-0000hr-LA
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 11:16:30 +0200
Received: by gxk2 with SMTP id 2so100730gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=1RoGsjozE2DUE3756WOc0waaSqN581rBK0+3DXWaFm4=;
	b=KqAzVLi/14gHUWQi/+IREfhTALj+ehKZn8NAH6Gr76emab2W+5tFurUVL/SWwiL5jS
	0mIekyTMOa18kr6bNlqjQIGQgpLSTMdIyWgzEhVJmYOQyz7EzuKtRQXdaNzLQS7Md+Uc
	fN/d+ws9m3xqNsihLDmJkt4K4e0lWuMFXukuc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DTnQQ5b8bUpglsYurACeywPDb2E+/zbo1JnTWE2spXkpC7D3CKDlOzqqkBzAGyilqh
	P0d51kwSg8umyranMKI+kWL9WqIsRUwwSiIASIPyVLe9l/BMGAWFaUvpkbwQxHUmjbGT
	YGYEUZRYFha64/SdvR8fmzFNSSsus+q5NOHZM=
MIME-Version: 1.0
Received: by 10.150.138.4 with SMTP id l4mr5378126ybd.237.1283418941988; Thu,
	02 Sep 2010 02:15:41 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 2 Sep 2010 02:15:41 -0700 (PDT)
In-Reply-To: <6A0959E7-8C24-4F4B-BD61-73E4EF0AB687@vanille-media.de>
References: <AANLkTimDF5zZ-F3-GDe_OUJv3nFKD+YGn4_7xWYuEatc@mail.gmail.com>
	<AANLkTinbOUUS3vw+yoHqaMRELMGyC_Xikf-QH8CWsOLQ@mail.gmail.com>
	<6A0959E7-8C24-4F4B-BD61-73E4EF0AB687@vanille-media.de>
Date: Thu, 2 Sep 2010 11:15:41 +0200
Message-ID: <AANLkTikckP7bNgyffDP=u002kT30Ds_pgDiQ26vfR9=S@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] openocd-native_svn.bb
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
X-List-Received-Date: Thu, 02 Sep 2010 09:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/2 Dr. Michael Lauer <mickey@vanille-media.de>:
> Am 02.09.2010 um 11:01 schrieb Frans Meulenbroeks:
>> 2010/8/6 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>>> Hi, I bumped upon openocd-native_svn.bb and I was wondering why we have that.
>>> No-one seems to depend on it.
>>> Do we want our own openocd instead of the one that is on the host?
>>> Or should this be removed?
>
> IIRC I have added this recipe when I worked with the
> Openmoko devices which needed a custom version of openocd-native
> (built out of the OM SVN) to debug.
>
> Until we have verified that the specifics have moved upstream,
> I'd like to keep this.
>
> Cheers,
>
> Mickey.

Ah ok.
Thanks for the explanation.

Frans


