Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OaUKB-0005eO-2h
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 15:54:37 +0200
Received: by fxm12 with SMTP id 12so1787058fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=jBUG9EMegUjqvVt1Wq3ILokduUhCUKULkQreQTlNZKE=;
	b=FMi3ukaE4tFuXMfr4UXWyhvP5OeQrElHo6kxKxONOpJP9mRc+bao+KMvvgFmjK7Q/E
	+yrAOUbu+Y58Ei4HxUuTzJ9QAHzBDWvxwEl+8ar/FUx6IsODHH2AoKSyZ9CDcxkIP8jh
	tQ1JtHdHxmiQ1LL3U3YboCyghemRJgMD0LDJk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=puArerUVbOhRiUgqQu6qNx5DECg7Z5RMHsy4pATjQqqs1CQe1rmeA06uD58Uq+R2iC
	+wAf/1rSCOyxK5IM/IckaUSgOsg5q2QCoCAx0mA/P7a7ZC+kgSSVVz5eW89fosZzxsfz
	FXKD/HzUsByKkB6TXwd0vyMQATQvElzOKeblY=
MIME-Version: 1.0
Received: by 10.223.111.206 with SMTP id t14mr2586269fap.32.1279461267182; 
	Sun, 18 Jul 2010 06:54:27 -0700 (PDT)
Received: by 10.223.117.75 with HTTP; Sun, 18 Jul 2010 06:54:27 -0700 (PDT)
In-Reply-To: <1279383976.25205.0.camel@saphir>
References: <1279379004-15038-1-git-send-email-GNUtoo@no-log.org>
	<1279379004-15038-2-git-send-email-GNUtoo@no-log.org>
	<1279383976.25205.0.camel@saphir>
Date: Sun, 18 Jul 2010 15:54:27 +0200
Message-ID: <AANLkTimK3yG2qY11fmLkyVuTMhDOLuzokob7TxvNVR7C@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] keymaps: remove initscripts dependency
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
X-List-Received-Date: Sun, 18 Jul 2010 13:54:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 17, 2010 at 6:26 PM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> Acked-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


