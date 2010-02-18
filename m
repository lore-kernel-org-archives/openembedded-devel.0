Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ni2Z1-00067n-8p
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:20:54 +0100
Received: by yxe1 with SMTP id 1so539995yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=tZKCWo5UBhtMxT3PISIkXBaHrqEosvkJU6oA27BwCvA=;
	b=j6enC3zVjvDXI1nUwprs1vMexdhFd24/GoU8b2Yxtn4eegKm6I+qwzpuwSMMHncrhD
	iVw5HvHhbo44biUgjJCQllcQDuAT/OeRI/RxapaCIDZcjuUjtchL5+SF2TA/fa+IB9tQ
	mGjzZ2+wr5D8cZti0MK/R4YZPGrwjHhZuVZ6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J/50qylRFE/os7E4+gUS1YeAKx5QRp7ia0zr6d/cXZGuwAUypvPrJrkeCbo0vrRm6K
	wsTJnDpPcm//bjM65lQ9EAMHW3f71UoWnSp9jmqxXkCk/csQ8uetZ89UnZpoVEVoeTlC
	7GAGBAsrISizDo7m+e3+N6TQIimcbuFkHc0RU=
MIME-Version: 1.0
Received: by 10.100.27.37 with SMTP id a37mr5250296ana.163.1266484690481; Thu, 
	18 Feb 2010 01:18:10 -0800 (PST)
In-Reply-To: <hlhf2a$aei$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>
	<hk12nm$sdo$1@ger.gmane.org> <hlhc1p$t19$1@ger.gmane.org>
	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>
	<hlhf2a$aei$1@ger.gmane.org>
Date: Thu, 18 Feb 2010 10:18:10 +0100
Message-ID: <ac9c93b11002180118m1512bc71sa6eb91624e83263e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Thu, 18 Feb 2010 09:20:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:

>>> FYI: I popped a question three weeks ago.
>>> Today Rolf asked me about the status in #oe.
>>> As you can see above 4 people (Rolf, Mickey, Phil and me were in
>>> favour of the proposal. In irc mckoan also backed the proposal.
>>> There was one person opposed to it: you.
>
> And funnily enough I'm the maintainer, so I get the final say.

Still wondering what makes you the maintainer.

git log does not mention any changes for this file by you (apart from
yesterdays revert):
See http://cgit.openembedded.org/cgit.cgi/openembedded/log/recipes/images/console-base-image.bb

Btw in the commit message you write
"If you're touching a recipe at least make sure the creator/maintainer
agrees with your changes."

How come this "rule" suddenly appears. I have never heard about this
rule, and frankly speaking I have not seen this kind of respect from
you when changing other peoples' recipes.

Frans.


