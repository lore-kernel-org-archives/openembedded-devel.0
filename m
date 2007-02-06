Received: from [64.233.184.226] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HENs0-0001tx-Id
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Feb 2007 11:48:16 +0100
Received: by wr-out-0506.google.com with SMTP id i30so1671510wra
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Feb 2007 02:48:15 -0800 (PST)
Received: by 10.90.75.10 with SMTP id x10mr10199032aga.1170758895598;
	Tue, 06 Feb 2007 02:48:15 -0800 (PST)
Received: by 10.90.92.2 with HTTP; Tue, 6 Feb 2007 02:48:15 -0800 (PST)
Message-ID: <74d0deb30702060248p7d13b997w6d997f1d9b804721@mail.gmail.com>
Date: Tue, 6 Feb 2007 11:48:15 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45C85593.3060603@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <45BB64DC.1080601@dominion.kabel.utwente.nl>
	<45C85593.3060603@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: RFC: diet-x11, small-x11 and fat-x11
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
X-List-Received-Date: Tue, 06 Feb 2007 10:48:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Koen Kooi schreef:
> > Hi,
> >
> > I'd like to propose to split diet-x11 and libx11 into the following:
> >
> > diet-x11: as small as possible, without stuff like cms and xkb
> > small-x11: small, but with cms and xkb, usefull for highend palmtops and small settop-boxes
> > fat-x11: biggest version, usefull for big-bad-workstation images.
> >
> > what do you think about it?
>
> Nobody is thinking something?

I was thinking I don't like the diet/small/fat naming, you are mixing metaphors.
small/medium/big I'd understand,
or diet/light/supersize or
slender/chubby/fat...
I thought I'd better keep that to myself :) Oh well...

One thing I'd like to see would be a different package name for all
three of them, so we can actually have all versions in the feeds
(currently both libx11 and diet-x11 build packages with the same
name).

regards
Philipp


