Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3k08-0001NZ-4e
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 08:30:48 +0200
Received: by iwn7 with SMTP id 7so13540iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 23:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=c4S/pcpf9afJvPNc+TyAY7gMIQmUUulaFCkFPnY3bTA=;
	b=PoReuZRjzzHF9dowMNjhbX2kKiAWRhWdO6nfGwNEMf3VQUYZjTomSY438xUinjJWPw
	Ks5xpsClQALJXE9OpLhkzizBzZXBx4zyEanZt2p016FlKOcXpMpy6pBHe+BtNZolfMkW
	0A+MlWZzVW/WHUowKy5kNNSmt/aGwbKu34u7I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Np3L4uFPwWF4331RDeFMtku7Dph13/4s8M9QQxly/50D/lQ9/NP9JK2r7/5qrH4OSw
	4ZbJoAtDOO2UqgqIg+CxHsWrprT59/k2IrUo4SyMS0PfNktDbh4O0si0My/1QIEdGKCO
	8uZ+TonXvMPOltvhOqXVO+Ge1j0eB4A9Li+x8=
MIME-Version: 1.0
Received: by 10.231.15.9 with SMTP id i9mr376309iba.58.1286433003004; Wed, 06
	Oct 2010 23:30:03 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 6 Oct 2010 23:30:02 -0700 (PDT)
In-Reply-To: <4CACF810.6030402@balister.org>
References: <1286399340-15927-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1286399340-15927-2-git-send-email-fransmeulenbroeks@gmail.com>
	<4CACF810.6030402@balister.org>
Date: Thu, 7 Oct 2010 08:30:02 +0200
Message-ID: <AANLkTin7gk9uWugcHOBUXPCFc0-QyYcn2MvucKt0Qsrb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] RDEPENDS -> RDEPENDS_${PN}
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
X-List-Received-Date: Thu, 07 Oct 2010 06:30:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/7 Philip Balister <philip@balister.org>:
> Next time, can you add the package name to the commit message?
>
>
> Philip

Actually there is no package name here as it is for .bbclass, but I
will add the bbclass filename to the commit message before pushing
this (need one more ack)
That also explains why gmail decided this was all the same thread.

Frans


