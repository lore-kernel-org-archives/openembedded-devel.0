Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric.colleu@gmail.com>) id 1PF34x-0001hf-Ma
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 12:06:32 +0100
Received: by qwd6 with SMTP id 6so3741343qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 03:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=mlcWxOFVVZw3dZgchYStjjJXC5YAA2M2MCrmoqGXJGo=;
	b=RZY078HnRcQ72UzjM6aQnhONEsGuDJrRrZVosfNoxRxVCrTicT0HSZHmwn8uXUYDHi
	KDqQIY3UFW3xx8CyAyNvk7M34/YAsOOTEBs0+TGdGd4+L7HtDWoEOIPnp1EC7bdEFFdc
	enrCOaraaNcMliM1ALip1/0djRZdKDnmCmi20=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DPaZUoOFfrlZPK+jiScnVU8F0unUro4v70h5/wf1XfHNHkhIoom57LJzReUhDTBKef
	9fJYO/3YzJ/SFcYxSutRFGgCzWO8SYGCbPsnjhosZ6jq/CNM+4OJGqHQH8FYU+GnwpWJ
	N8HOcIkkFdChluxSD79t2mBuKBzgQMDvMgYeE=
MIME-Version: 1.0
Received: by 10.224.204.72 with SMTP id fl8mr2832291qab.173.1289127935814;
	Sun, 07 Nov 2010 03:05:35 -0800 (PST)
Received: by 10.220.203.1 with HTTP; Sun, 7 Nov 2010 03:05:35 -0800 (PST)
In-Reply-To: <AANLkTin1z3p8B-nvSuP-UxRRuiQbqUqmeH9n=bXWBhsC@mail.gmail.com>
References: <AANLkTi=S8j1zwebV0fz=yUxbo0p_QzRUUpi37mwTO69A@mail.gmail.com>
	<4CD58F23.5060700@crhc.illinois.edu>
	<AANLkTin1z3p8B-nvSuP-UxRRuiQbqUqmeH9n=bXWBhsC@mail.gmail.com>
Date: Sun, 7 Nov 2010 12:05:35 +0100
Message-ID: <AANLkTimysO0atE+bPe3Raxcq9kEqS+7s9dwhTajwxT0O@mail.gmail.com>
From: Eric Colleu <eric.colleu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: eric.colleu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: problem building omap3-sgx-module
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
X-List-Received-Date: Sun, 07 Nov 2010 11:06:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thank you, I will have a look at this two kernels.

Eric

> Eric,
> >    The only recipe I know omap3-sgx-modules to work with is
> > linux-omap-psp_2.6.32.
> > -Matt
> >
>
>
> > Builds on linux-omap3-2.6.34 for me on the overo-branch.
>
>

