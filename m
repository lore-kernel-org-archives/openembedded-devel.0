Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <thoughtmonster@gmail.com>) id 1NBSNE-00029k-20
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 13:14:03 +0100
Received: by fxm1 with SMTP id 1so3404146fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 04:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=xq29TuJmG0hShdGmhrMvBpcNhsG6HnYqwGhKj4KWb6o=;
	b=T+lmJAp48RekMC10EWKQDI66W7+seYzvqcC9hhY9hy5yAZX9nTSZXqMLMaTXi34FZj
	6Km0YmIMJEPzg2xt76z16URnIk9k5izgBOxuc9i1k1hhR3C41QB/S1YkIUJO+2ckfmF0
	CRxK3aY6Yu0n93571YXSzPq1COA2GK+ETl/ps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=C1jHiYiuhgLbkxrDUf77tl4Kzenk2Ca2mfdEsVUfNEqZmk+vdzZP9hI8nE8xVile2E
	i/fM9fBdTmYezopTcWSevzQaJLT05K5gS0hjTRVoHSTMvVTyMOIUu1ArTUs/jcf9v4VJ
	XVWMKPjf8YHQ1O3fXiPC3NOYyXfgTk49ZCYkw=
MIME-Version: 1.0
Received: by 10.239.139.196 with SMTP id u4mr146490hbu.114.1258719154000; Fri, 
	20 Nov 2009 04:12:34 -0800 (PST)
In-Reply-To: <he5tf8$91o$1@ger.gmane.org>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>
	<he5n72$ltj$1@ger.gmane.org>
	<992df8520911200151q57520791n6395642f5bc18e@mail.gmail.com>
	<he5tf8$91o$1@ger.gmane.org>
Date: Fri, 20 Nov 2009 14:12:33 +0200
Message-ID: <992df8520911200412l6d79d15dg58a2e88a6e50197c@mail.gmail.com>
From: Alex Ferguson <thoughtmonster@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: thoughtmonster@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Fri, 20 Nov 2009 12:14:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 20, 2009 at 1:10 PM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

>
> We stopped hardcoding event numbers in OE years ago, even the opie people
> saw the light, so I wonder what's the matter with the omnia to go backwards
> a few years :(


I see where you're getting at, and I'll add that to my FIXME list. As I
said, it's not a bug yet, but as you said, it might become one later.
There's still a lot of things to be done.

Thanks for the feedback. :)

