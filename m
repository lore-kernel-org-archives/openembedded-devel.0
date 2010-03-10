Received: from mail-pz0-f196.google.com ([209.85.222.196])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NpU66-0002D8-3Z
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 23:09:46 +0100
Received: by pzk34 with SMTP id 34so2289285pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Mar 2010 14:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=N2VQrKU8OnXamWo72Gdzr1gT63fSnb1wubnR7vQ6jdE=;
	b=VVKxATkce32ZoCGjoH21E8jK1z2qK0EZekRQcSQcYgIYX0Q9nHaR/rzRJZP1FjQDDt
	V8isKQsxqM4Ap+r9KCURhhg3EBvdUWqUHW4s6VpcghltnnNXR/82tYGpQoJX2PfDk1G2
	1JSkmIFA8R7YwEOYrGj4GZVQsNH77NFREYFcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Wxzhf8VZJb4Thp9S/GcBAEtr34cffGQ4fTYzI8islbxBFxGOi6peJQyCQVcWGKTyLm
	75pIxivWJ5o72/y+U7Q0wUL9wcE3r2BPMnnYb7cJ5hRWC1/P5D9QvkMPqFehHIiLjhw/
	yxA2M2oJ4LVXBfuQL6g0AI/KnVpMh/hHRtf1c=
MIME-Version: 1.0
Received: by 10.142.196.5 with SMTP id t5mr813777wff.78.1268258807294; Wed, 10 
	Mar 2010 14:06:47 -0800 (PST)
In-Reply-To: <ac9c93b11003100744g5eee3250me7f0b668e8727060@mail.gmail.com>
References: <ac9c93b11002281201j44a861e1saa803be9f338ee10@mail.gmail.com>
	<20100228221056.GG30145@xora-desktop.xora.org.uk>
	<ac9c93b11002282328l61356cc1y188b47d0f974369e@mail.gmail.com>
	<ac9c93b11003100744g5eee3250me7f0b668e8727060@mail.gmail.com>
Date: Thu, 11 Mar 2010 08:36:47 +1030
Message-ID: <6ec4247d1003101406u2cb3a3b2wce02a7645dc26fe4@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.196
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] duplicate recipes
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
X-List-Received-Date: Wed, 10 Mar 2010 22:09:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 11 March 2010 02:14, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> I've ocunted graeme as neutral and graham as no opinion given.
>
> If you feel I misrepresented your position or if I missed your
> position, feel free to follow up.

I didn't give an opinion because I'm not a committer and it probably
doesn't count. But... I'm in favour of never seeing old recipes again
unless there is a good reason (e.g. specific versions needed for
specific boards).

-Graham


