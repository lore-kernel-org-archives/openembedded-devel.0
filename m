Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pzl1J-0007Ee-49
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 08:19:49 +0100
Received: by iyb26 with SMTP id 26so1405609iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Mar 2011 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=BW09j3RD2W+veoIAWdyBw8rt3Cd+Boin2JLfHUnZgpU=;
	b=CQ6ISjQtrIYTsxQL9wFhVWF02nLIo15R+2ME9M7jZ8HIS6gaMgnbgq7h/TC8bSrSwi
	tjP+6JCj0d+epBhzNOlBwYDmMUDpkBz8At2CdOhVcsoyD9ys4lOXBw+D9oqnwukw+cXk
	RuHPP3/n/LXRpVbxFQfdGrcMqiu+1Mg3u1ipY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NN673sgJ4pHMa3SjFjZg9Tx5aTQTEaVqrPkDDdh3o6L08gnl3FOdCEuSd5LBuO+rk8
	eSN/n89pGeYDbmxs9EpjHZrSl9cXD19iY7KssKi4v2jcon0ELyE4v3hMMHrDLHQ0LPRv
	bGUasPMxAdaA0x6/UNmGIlfOmYUSWYzkIZ+zA=
MIME-Version: 1.0
Received: by 10.43.61.138 with SMTP id ww10mr475705icb.390.1300259885950; Wed,
	16 Mar 2011 00:18:05 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Wed, 16 Mar 2011 00:18:05 -0700 (PDT)
In-Reply-To: <4D7F8912.7080608@mentor.com>
References: <4D7E3B34.5050100@mentor.com> <4D7E953E.2000706@balister.org>
	<4D7EA0FD.6090506@mentor.com> <4D7F6629.8030107@balister.org>
	<4D7F8912.7080608@mentor.com>
Date: Wed, 16 Mar 2011 08:18:05 +0100
Message-ID: <AANLkTikxJyY8GfNv8pGb1V_cSCy4vLUYm+HRT5tyZegn@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Wed, 16 Mar 2011 07:19:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/15 Tom Rini <tom_rini@mentor.com>:

>
> And, that brings us to [1]. =A0FC14 seems to show off a class of bugs tha=
t
> need squashing. =A0I'd love it if someone can point me at a VMware compat=
ible
> image (with functional tools) already installed. =A0That said, I think I =
meant
> to post to the ML and forgot, or no one saw the EXTRA_OECONF bug in the
> recipe that Koen fixed which I think fixes your problem.

There is a FC14  VM download at http://vmplanet.net/node/124
and there is probably also one or more torrents

e.g. found this: http://www.quotrader.org/vm/fedora14/

Haven't tried any of these, but will probably in a few days.

Frans


