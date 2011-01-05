Received: from mail-yi0-f65.google.com ([209.85.218.65])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PaZFw-00005O-V2
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 20:42:49 +0100
Received: by yib12 with SMTP id 12so2474687yib.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 11:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=cXDv34NjYmJciAMn5PtyCBpwmF63PGhEO397AJSQCFE=;
	b=AOW0bImT7SQrY+bX4yoALJDteqYksYdEjBbQTqbVORJ19BMB7CmQKVOBapzaML3nQH
	oUYNeL33MQCdFQagNviQc0Md14T32Ry6Iv9YGnYvkPWceKqnQ0rmydsFXzIUpQ6osasf
	6uPhgYggcZFlDdEIGSk1qgy1IzBswbQus6fqQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=fRuSANV3SFNO8QuE8I3pK7CTyogKGf6FEAUNQOXQEQVman27cX4koKgNtMfcNN2H+Y
	7AR4qbqcQyGuC0jvJFKfhlFw/ByxlZsLexZ3VvkYWtt3xY4j84l8SKB7gy6kYj5klaGc
	4Slvug47BQPe/GlCSHdONttAOFJEzJ7vwPgg0=
Received: by 10.90.104.20 with SMTP id b20mr1092082agc.193.1294256541042; Wed,
	05 Jan 2011 11:42:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Wed, 5 Jan 2011 11:42:00 -0800 (PST)
In-Reply-To: <4D24BB76.30300@mentor.com>
References: <1294249787-6035-1-git-send-email-raj.khem@gmail.com>
	<4D24BB76.30300@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Jan 2011 11:42:00 -0800
Message-ID: <AANLkTinYDoX7WbNEfHdYEVAPV6wRW3zvoyA8VpSWj3Y5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] distro/slugos: Upgrade to use gcc 4.5 and libtool 2.4
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
X-List-Received-Date: Wed, 05 Jan 2011 19:42:49 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 5, 2011 at 10:41 AM, Tom Rini <tom_rini@mentor.com> wrote:
> On 01/05/2011 10:49 AM, Khem Raj wrote:
>>
>> * Depend on sane-toolchain
>> * Upgrade few old pinned versions
>> * Inherit own-mirrors to define slug src mirror
>
> Nuke slugos-mirrors while you're at it?
>

yes will do that once Mike is ok with the change.

> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


