Received: from [209.85.222.185] (helo=mail-pz0-f185.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MfTNz-0000QY-Dx
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 08:50:35 +0200
Received: by pzk15 with SMTP id 15so799124pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Aug 2009 23:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HGwyVXp5kBTT4Pyr1z1vVXxZIfSP1F/wa4rvvzuxySY=;
	b=GUiJJntdffxs4PXSPgwW14yeeCbWsu1i+D4/W6Y2hCsuik9PkPdRvKIugRxGAd2oH7
	ro6kTU9JL7DYk1+TF7+wlsw1quxilF3juOykyorsgk+4wAt+EfZvArq2q8IcpynopRZg
	KXyvPeBuPxUiTvHHueD5Tud278v9TI1i0hLDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BYqZ3hETa9Ed+HsYRBu3tu9VI1BVw95n9/FKosKvdJHLpvL+Asr4u6GbQNb4OCbR+H
	j/FmLxCdcpyfPYiZwiIuYDt6Kz392GCnyW9gruFGAMKKvRv7e1IAvhqgpghKH4Vhj/DK
	WcenZRS/9xGeBKhq6OBpqt2k1TwFVypBfRrLc=
Received: by 10.115.67.8 with SMTP id u8mr5453160wak.190.1251095571032;
	Sun, 23 Aug 2009 23:32:51 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id v9sm8559045wah.1.2009.08.23.23.32.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 23 Aug 2009 23:32:50 -0700 (PDT)
Date: Sun, 23 Aug 2009 23:32:43 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090824063243.GA23571@gmail.com>
References: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
	<200908240512.13451.holger+oe@freyther.de>
MIME-Version: 1.0
In-Reply-To: <200908240512.13451.holger+oe@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] base.bbclass: Replace os.system with subprocess call.
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
X-List-Received-Date: Mon, 24 Aug 2009 06:50:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/08/09 05:12), Holger Hans Peter Freyther wrote:
> On Monday 24 August 2009 04:31:41 Khem Raj wrote:
> 
> > This is based on the following python bug report.
> > http://bugs.python.org/issue1652
> 
> What about giving credit to the guy on irc that:

indeed. I should edit the git emails before sending them out.

> 	- Pointed you to the gzip faq
> 	- The launchpad ticket
> 	- The blogpost
> 	- And the above URL?

All of above Zecke's courtesy :) I can put this in git log too before
pushing.

> 
> z.
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


