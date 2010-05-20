Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OF5rY-0002YB-12
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 15:32:36 +0200
Received: by gya1 with SMTP id 1so73805gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PFofe0xz8ve+4JmoM0JloZ1a0bpYa64n+zhvCg/D5ss=;
	b=Gvqmt/5ex7pwhU+ZPQ5MG9IM+wRi/O9zSXMFVOCWvpJhCmTRMH2tDNUlWE6Pg55Imf
	Z/UFvkdqW23b9fd6IZSxdEzd9nl+Wq6/xzZSWTVegBy2BYB3v7bX+ZZc5V5+N+eXWCN+
	6UqneXTcP5x8jwK7VbRERl8NEH0clKJ0q7kd8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=yEVO3B7X1d60jhTuYK5iBqPZYLO8XWql55T+CgkdWmbwvH6tm3OXUT/TXUFpn7D6EG
	mEoQ0+ON88bVqNkp21ZvUds1CfByEJ4XYb9slAUsxcm9zxcy79oRZOOKfQnPcK8DzTQZ
	SOKrcWBtEKKBGW31mncT8qGopkDRsb+v5IEf0=
MIME-Version: 1.0
Received: by 10.101.28.39 with SMTP id f39mr71389anj.69.1274362113207; Thu, 20 
	May 2010 06:28:33 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Thu, 20 May 2010 06:28:33 -0700 (PDT)
In-Reply-To: <4BF532DA.4080601@mlbassoc.com>
References: <4BF532DA.4080601@mlbassoc.com>
Date: Thu, 20 May 2010 15:28:33 +0200
Message-ID: <AANLkTimYRrV82uHzco2jxLhEXw-7YTBx7fBOJb5YV4ZY@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Why is OE so slow?
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
X-List-Received-Date: Thu, 20 May 2010 13:32:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I guess you're using bitbake_1.8.18.
Use bitbake_1.10.0.

Regards

Andrea

On Thu, May 20, 2010 at 3:02 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> I'm using OpenEmbedded to build Angstrom. =A0Recent trees
> in the org.openembedded.dev branch have some 8370 recipes.
> When I initiate a build, it takes *forever* just to get started.


