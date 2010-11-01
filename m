Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PCyzW-00045B-LG
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 19:20:23 +0100
Received: by wwb39 with SMTP id 39so142360wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=kVgJzfBKSLCDgIy+6hnEooVtYEOThe6Bw/kj3LK8onQ=;
	b=BvPFLEDrSGlnlMtvz2/3oZsoni20MCmrrgfO25kcnhKWFgsYx3fDkisUawjEn3ooaV
	7QJoMCmDCCR7NH4AmlLf13n1SucJ4lyE2kh2/3s13J8IjUEWG9Lyo2QLAzSu7Tz0KVF+
	fKJzve/VtW2fgJT2EnPB0cdYwhfvT6L9tI8h4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=M9DaUwaXHqGt5unomie+Agr+don6476Al9KsJwZdbqbEZNd8p/Z/JONF9fEX8RkLBa
	8+lHtN5UAsyVmGpCitWt74V7LbX1FCDVpCWndCUS6RXoMgwsqJIl5SGB0NJk0shDTBhi
	Az3SXlEvNdxKvJifdijkEwxX1U0fxy3UZt1z0=
MIME-Version: 1.0
Received: by 10.216.60.203 with SMTP id u53mr15928996wec.36.1288635573405;
	Mon, 01 Nov 2010 11:19:33 -0700 (PDT)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Mon, 1 Nov 2010 11:19:33 -0700 (PDT)
In-Reply-To: <AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
References: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
	<AANLkTinCa9E0F3FOm6TXg6NLc48pSgmijeUfqgmhtRuw@mail.gmail.com>
Date: Mon, 1 Nov 2010 14:19:33 -0400
X-Google-Sender-Auth: -hTJZNYC1JZdit1uDyrqdsLvcz0
Message-ID: <AANLkTimE05gQ2pSmkYouZMW1=rAg=-5S_sGu0nTgjpzh@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Trouble compiling system-tools-backends
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
X-List-Received-Date: Mon, 01 Nov 2010 18:20:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 1, 2010 at 1:35 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Nov 1, 2010 at 10:03 AM, Zach Frey <zach@znfrey.com> wrote:
> > Hi everyone,
> >
> > I'm trying to build angstrom-gnome-image with latest for omapzoom2 (on
> > Ubuntu 8.04) and I'm getting the following error:
>
> Are you using angstrom-2010 ? in that case you might want to
> regenerate configure
> as well as libtool scripts.
>
>
Actually, I'm using

DISTRO = "angstrom-2008.1"

Should I try "angstrom-2010.x" ?


Thanks,
Zach

