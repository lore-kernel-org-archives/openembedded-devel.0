Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PJ2OB-0002FD-4Z
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 12:10:51 +0100
Received: by gxk2 with SMTP id 2so1806454gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 03:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Q+Oy/FHadeeHDUTxgAOMXd3BN7r4RH+7xYJvGOGHJqk=;
	b=PJ8bxuDCerMs5mJerhY7YZA6Fpds7QczQ5zZDPZuxiXTvCRjjEj0JuGsgUQFdPzOM+
	AhRbtqlgY9XtJqP1ViBvY5G83uLJzQIWbAyva1HYV0feFd+U/KrM7W7H8A6RBP4GQ35M
	ladFuoHK5GDxfG5f9b+iUhI1lqnbFILU4pgN8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kW3i0WN40m2om2qyQSWoRudiVOi9YX5rC/jDxNB64v9Q8lu0gSTNhvxE6W6mvTmP7J
	lt+CV+mwpZIbzJ9ZNF2frC0oxKP/N7bnbH1aGCyNAGEgqh2jLdXDvS8reJhATpkkbRzB
	UoClbeOKP9PHMHUM2niA6M0zJDyHh1OsBtwRg=
MIME-Version: 1.0
Received: by 10.42.167.202 with SMTP id t10mr26502icy.201.1290078581402; Thu,
	18 Nov 2010 03:09:41 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 18 Nov 2010 03:09:41 -0800 (PST)
In-Reply-To: <1290074903.3183.202.camel@mill.internal.reciva.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
	<ic0aj2$hqc$1@dough.gmane.org>
	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
	<1290074903.3183.202.camel@mill.internal.reciva.com>
Date: Thu, 18 Nov 2010 12:09:41 +0100
Message-ID: <AANLkTin4uoJzqtd0G5Z+gS_Y+-kxpgojKm92jkJ8jnLy@mail.gmail.com>
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
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Thu, 18 Nov 2010 11:10:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/18 Phil Blundell <philb@gnu.org>:

>
> 1. make a stabilisation branch from some semi-arbitrary point, maybe one
> of the existing weekly test versions.

Seems fine with me. I suggest to start with the testing branch that is
to be made today.
that avoids having to pick the changes that are done for the release
on the master branch last week.

Frans


