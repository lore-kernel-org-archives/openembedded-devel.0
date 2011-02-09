Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PnALj-00084L-EJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 14:44:51 +0100
Received: by qyk36 with SMTP id 36so115069qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=/VsOfNLFzOh69WOM4GP5pTB9Wb2xm+U/7FEK1jbOTqc=;
	b=MXfG51pZfBoTH/sxnj4meoKg8aO4+UTAIeekpg25xU4P3reP6kAd9baHQY+KeuovJs
	+XelpmS8hrYwjF6iZbzS1vMzszElCMnL2yDU9qTV4+WhoZ+s40w9VVNv/u9uPJ7NsO5q
	JMpJVTDdvR1CBcMTpDvIyrINkOsrWxekE1XEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Acv9f0UPCdqhQt//srbWFcH/hNT5wLsT64l5x6ByxJeEzuI6kZlMh64w+c//3AYe/w
	KrRLJ4J3uZ/cuSb+4nir71/zFef1BR4EB82/wEWltLZXz7+dp0hlXSgVzyUED4oefO06
	AeB6wuH99AN4eXyFKyFcgB6ZHCTFRPjzM5t8c=
MIME-Version: 1.0
Received: by 10.229.6.207 with SMTP id a15mr14872080qca.298.1297259027540;
	Wed, 09 Feb 2011 05:43:47 -0800 (PST)
Received: by 10.229.193.10 with HTTP; Wed, 9 Feb 2011 05:43:47 -0800 (PST)
In-Reply-To: <iiu4qb$8st$1@dough.gmane.org>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<201102091039.27832.marcin@juszkiewicz.com.pl>
	<AANLkTikDHBWTnf2S3j-P9_rpscdRQ7GZHVxrNLbLCXZW@mail.gmail.com>
	<iiu4qb$8st$1@dough.gmane.org>
Date: Wed, 9 Feb 2011 14:43:47 +0100
Message-ID: <AANLkTimFD+VWpjv4vatsaFOWZFRN1DKDM5Wg07RvDKE9@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Wed, 09 Feb 2011 13:44:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/9/11, Koen Kooi <k.kooi@student.utwente.nl> wrote:

> That's the whole point of task-base, to get things built. You can then
> use machine_features to install them by default or not.
>
> Again, noone is forcing you to use task-base, so no need to break it for
> everyone else like your patch is doing.

Ok, thanks for the discussion. I still do not agree with the outcome,
but it is not a big problem - I think we will just keep building the
bigger
set to avoid messing stuff up.

Should I mark the patch on patchwork as rejected?

bye,
Filip Zyzniewski


