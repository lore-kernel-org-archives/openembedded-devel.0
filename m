Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Or5gJ-0006Zv-SM
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 11:02:04 +0200
Received: by iwn2 with SMTP id 2so301910iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=CzZK4amtmr2N5iFZcnykabB6ua2SkABxNYuwjsUcsU8=;
	b=dLy6Qa5RQLjbMngsFdR7pJOslNQegA3ivUg7lu5IIXER3pUygOPpwN3hmn0KVPRUAi
	5yIvVi3HQ+vdEvPKNWwrHnh4GjNOYyXu2MiAD4Gx5/Lyz1Q15qYz4PF8J/zyC1oLRKUH
	5/R12V+dTilSh5uZkBvGuDVkeEdaqlXHvUjQQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qGDgFsiP8FSbDkGZnvli28HbzaWx+F3IDHWPCOYqgY63iF8eV1FLy0HSgd93GNxd8Z
	AOMsjIS/APRTgR3La9sSQaJFu3rfQAkVMMIL4IM2zhiDjOPftgeF6bXjCvrz3n2X4jlC
	uk3ofGZB2+tdqN+evycC5v6tLqf/C/7PDpvZI=
MIME-Version: 1.0
Received: by 10.231.183.81 with SMTP id cf17mr10050596ibb.32.1283418089971;
	Thu, 02 Sep 2010 02:01:29 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 2 Sep 2010 02:01:29 -0700 (PDT)
In-Reply-To: <AANLkTimDF5zZ-F3-GDe_OUJv3nFKD+YGn4_7xWYuEatc@mail.gmail.com>
References: <AANLkTimDF5zZ-F3-GDe_OUJv3nFKD+YGn4_7xWYuEatc@mail.gmail.com>
Date: Thu, 2 Sep 2010 11:01:29 +0200
Message-ID: <AANLkTinbOUUS3vw+yoHqaMRELMGyC_Xikf-QH8CWsOLQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
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
X-List-Received-Date: Thu, 02 Sep 2010 09:02:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/6 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Hi, I bumped upon openocd-native_svn.bb and I was wondering why we have that.
> No-one seems to depend on it.
> Do we want our own openocd instead of the one that is on the host?
> Or should this be removed?
>
> Frans
>
Bump


