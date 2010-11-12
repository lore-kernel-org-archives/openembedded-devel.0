Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <anarsoul@gmail.com>) id 1PGyHl-0003dm-Ne
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 19:23:42 +0100
Received: by ewy24 with SMTP id 24so1750860ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 10:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:user-agent:cc:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=8sYYuVTPNfcHr1Z8LH5/5lG5SQBKh1ZuYiQfWJmRnic=;
	b=kkHurwDqpmjq26D8WZuqagEnxipsTVECpjGX3jUWr/bHJ/i3J7kLCWWVpOeha2kUxJ
	6dN8cLyRcFRkuTMkjTgkcCvW9T4zMohTrEoYujpfateqIiBpsiQVopVNU6EbB5sMf3PQ
	84dwW0jSH3hpNnIsRIpFOxa70Li2nYe390nfg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:user-agent:cc:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=Aeg6XHTZYBTA+8d2zXMJLXBxROEvh5EnlDM82vo868BaZLi5XylGv+eeglc5hnnpan
	B9Jh93Mi/+AlK4F2Z52jynuElsiMlv3ligquviwBVPeY+6AFs6kyf0vS+SL1fjSQt40k
	xSGEH9qNCxn8bpaz8Px/TGT33pAfnLUBHTsQw=
Received: by 10.14.47.66 with SMTP id s42mr1725725eeb.45.1289586159564;
	Fri, 12 Nov 2010 10:22:39 -0800 (PST)
Received: from anarsoul-laptop.localnet ([80.249.83.145])
	by mx.google.com with ESMTPS id x54sm3464884eeh.5.2010.11.12.10.22.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Nov 2010 10:22:38 -0800 (PST)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Nov 2010 20:21:55 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.36-gentoo-anarsoul; KDE/4.5.3; i686; ; )
References: <AANLkTikm572dcjPRTvF7nGnuVY3uuPryRRGbyyDBS+eg@mail.gmail.com>
In-Reply-To: <AANLkTikm572dcjPRTvF7nGnuVY3uuPryRRGbyyDBS+eg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201011122021.56362.anarsoul@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: anarsoul@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: multiple virtual/gail on reviving gtk+-directfb
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
X-List-Received-Date: Fri, 12 Nov 2010 18:23:42 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 12 November 2010 20:05:19 Luke Kenneth Casson Leighton wrote:
> [hi please cc me direct because i am subscribed with nomail, thx]
> 
> folks, hi,
> 
> i have a requirement to bring gtk+-directfb up-to-date [and also do
> python-pygtk-directfb, which is gonna be interesting on a 400mhz
> ARM9... :) have to see how that goes...]

Are you aware that gtk directfb backend is broken since 2.18.0? And that gtk 
developers will drop it in gtk3?

Regards
Vasily


