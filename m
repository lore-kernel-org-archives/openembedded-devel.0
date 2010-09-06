Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsieJ-000308-Bg
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 22:50:50 +0200
Received: by iwn2 with SMTP id 2so4498585iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 13:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oocQS4ZUn4Uh/jJb0538FQcXap5UF6K5F+huS2Q3vV8=;
	b=vEnAJUbTstxdmAsXRNjKFGGAX5LdxxbY2FuXnx0hZRKnvSElU61j4HlSy/xzsCh8GZ
	rimgJ4Khqron/YB59Xdde4lwQg0Qu9lWC9jU0SpT1sz/QmKxmlNUk1EUqMQWeTF+PuHH
	AGAk365OQ2pGNh5cfzG4uFE3Ax3j11Wt3fgBk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dKF928a4sq1VeR6Tq1G8mhc+k+RzNlLaVHxuX+q5iC1fyg4NF9qJ2SdQv4kVD6gPtw
	UphI73THuwLQJDtAphGpK+qgqZHKJsBitALHc8BOYBXIohdKHSIrc5Df2uRfGW0h7p6I
	5bLgXl0NZ6r3/6Ex3thjggCZqIhhJbdt6g3ds=
MIME-Version: 1.0
Received: by 10.231.17.11 with SMTP id q11mr6807668iba.63.1283806202610; Mon,
	06 Sep 2010 13:50:02 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 13:50:02 -0700 (PDT)
In-Reply-To: <4C85506E.5020708@gmail.com>
References: <AANLkTineLTCDtymfwbaAJXcrz0vB=V4++=HOwEA7wQHU@mail.gmail.com>
	<4C85506E.5020708@gmail.com>
Date: Mon, 6 Sep 2010 22:50:02 +0200
Message-ID: <AANLkTina_X+E_5rmCytJTK36RF-AV-vhpLQNiS4us+1R@mail.gmail.com>
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
Subject: Re: libtermcap (was: Re: Asterisk and termcap)
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
X-List-Received-Date: Mon, 06 Sep 2010 20:50:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/6 Arigead <captain.deadly@gmail.com>:

>
> thanks a million for that Frans. I'll keep my ears on here and see if an
> answer to this comes up.
>

You're welcome.
Actually you should thank Eric, he did the work.
The patch will be there soon I assume.
I already saw and tested it (that is: verified that asterisk builds).
Leaving it to Eric to post the patch. He should get the credit for
this.

Have fun, Frans.

PS: I appreciate it if you could share your experiences with running th program.
Actually perhaps we should try to upgrade the program to 1.6.2.11 (or
maybe even 1.8 beta 4)


