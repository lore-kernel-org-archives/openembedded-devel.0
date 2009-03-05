Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1LfFFi-0006MW-5g
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 16:12:50 +0100
Received: (qmail 7630 invoked by uid 813007); 5 Mar 2009 15:08:28 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 5 Mar 2009 15:08:28 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 5 Mar 2009 16:08:27 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc6-00216-g778ef1e; KDE/4.2.0; x86_64; ;
	)
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<20090305044711.GE26343@smtp.west.cox.net>
	<49AFC6A3.9070406@dls.net>
In-Reply-To: <49AFC6A3.9070406@dls.net>
MIME-Version: 1.0
Message-Id: <200903051608.28012.marcin@juszkiewicz.com.pl>
Subject: Re: I got the point - did everyone one else? [was: Re:	[PATCH 70/70]...]
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
X-List-Received-Date: Thu, 05 Mar 2009 15:12:50 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thursday 05 of March 2009 13:33:39 Mike (mwester) wrote:

> Yes, in the NORMAL case that would be true. =A0Seven patches - fine,
> that would work. =A010x more than that? - that's clearly a case where
> clear thinking would put the changes on a branch and have it reviewed
> there.=20

I sent hrw/poky-rpm branch for review on 19 November 2008. It contained=20
nearly same set of patches but needed some work. **No one** (except=20
Koen) looked at it. Thats why I sent whole branch as patchset to ML.=20
During first hours it got at least 3 persons who read patches and gave=20
ideas how to improve their quality. Tom Rini even started builds to=20
check does everything works on his build machine.

And yes - patchset should be squashed but I am tired of that branch=20
because I work on it since start of November.

> 70 patches? =A0Come on, who's going to extract and apply 70 patches
> from email? =A0Not likely!

And no one has to - whole patchset is available as GIT branch and I=20
wrote about it in first mail.

The good thing is that I do not plan any such big merges in near future.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




