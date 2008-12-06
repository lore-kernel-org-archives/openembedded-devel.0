Received: from [209.85.134.185] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1L95Pk-0006SW-6c
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Dec 2008 23:14:16 +0100
Received: by mu-out-0910.google.com with SMTP id w1so511484mue.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Dec 2008 14:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:in-reply-to:references:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=w6YC1zaggxko5N3POzGW5XfK9Anmtn7vhY6Frh2sBhM=;
	b=N4X6c7mwWcgI7+pVQgvtOWRtkIf5VqSxYAWyHOhdMFiG8BJAlsOc7BRuOGq9Uigplk
	HICrzwTYWeL4ZZQgwTxoWQ4ZQlFC23yUTS0HexMtARmEPwfRFZeqwdjh1Ql+6n5D0Xxu
	EV5hBFn55dPnpFXngQhBREdZbdAlF66heWBfM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:in-reply-to:references:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	b=q8XwgKxKx9qgiAgkQuoSc/+FNAGnsv8XC1xE/kNbvToGOMhRSC4ADEbTRBChh5iVyZ
	B5o822iO3P10sRGUWgB2JbcoSpwGv4u/5iQ/1bkGjl5owtg5Ogk/cCw92Xp+qjkOrzA4
	74wVaJR3MyJjqkvm126LHyBDDRoWZUj2VN6Zo=
Received: by 10.103.241.5 with SMTP id t5mr616787mur.127.1228601431405;
	Sat, 06 Dec 2008 14:10:31 -0800 (PST)
Received: from widy.localdomain (nat-users-50.is.ua [194.79.8.50])
	by mx.google.com with ESMTPS id y6sm18793036mug.32.2008.12.06.14.10.30
	(version=SSLv3 cipher=RC4-MD5); Sat, 06 Dec 2008 14:10:30 -0800 (PST)
Date: Sun, 7 Dec 2008 00:13:58 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081207001358.17e45205@widy.localdomain>
In-Reply-To: <ghe5v4$9hp$1@ger.gmane.org>
References: <1228574376.5375.6.camel@dax.rpnet.com>
	<ghe5v4$9hp$1@ger.gmane.org>
X-Mailer: Claws Mail 3.6.1 (GTK+ 2.12.11; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: Bitbake release
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
X-List-Received-Date: Sat, 06 Dec 2008 22:14:16 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Sat, 06 Dec 2008 16:32:52 +0100
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> On 06-12-08 15:39, Richard Purdie wrote:
> > Hi,
> >
> > As people have probably noticed I just synced up a number of useful
> > changes from Poky into bitbake and brought things pretty much back
> > into sync.
> >
> > The current plan is to let this stabilise for 1 week and the
> > providing no major bugs were introduced, make a new release
> > (finally!).
> 
> Not a bug, but something for people to note:
> 
> http://projects.linuxtogo.org/pipermail/openembedded-devel/2008-October/006289.html

I actually wonder why these (and few other) vars are not whitelisted by
default.

> 
> regards,
> 
> Koen
[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


