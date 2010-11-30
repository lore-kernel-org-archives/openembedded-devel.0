Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PNZvy-0001Uk-Uy
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 00:48:32 +0100
Received: by qwg5 with SMTP id 5so4999729qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 15:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=aTlunI9s+HRuBqnHYEpdWOVHYnNuZVS2BxW54IBweVQ=;
	b=o6yb+4mnd7eA3mPWdKynbc41mG6PntHJmcNDyMpElrM986XIF54HHNe4wJhVARaR9D
	3rqSplG0UzQYqcs6D1+AtkVyxj9MrSSj1ysl1Ng1mYgyvwRlal05+4ehwT7U8IWqmW6k
	lC9C0XkoEHxcLA06Fq94GemNvm8DdiFeD8kAs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=g/LDWEVUZdR6l65a4lEAJLNrrALRXLyjTvI4FBdnr3hsx4RZFDLVY15aG4PwIgTSFY
	ShdXqKgNpkZQS7a2VZOBY1XZreEulD/gnB2W5PGNpuyIhJNbjnNG8afEhzN7QaNgkY4y
	nS02qf5Jj3LUhfBefYvgGbUv9Cj3ClKmyGMik=
Received: by 10.229.232.205 with SMTP id jv13mr6657241qcb.68.1291160828765;
	Tue, 30 Nov 2010 15:47:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Tue, 30 Nov 2010 15:46:48 -0800 (PST)
In-Reply-To: <4CF56767.3050007@freyther.de>
References: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>
	<1291133947.3599.16.camel@mattotaupa>
	<AANLkTi=DUaiM6LhuWG6MVOntGBu7oikQm9QesD37zRj5@mail.gmail.com>
	<4CF56767.3050007@freyther.de>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 1 Dec 2010 00:46:48 +0100
Message-ID: <AANLkTinp2NUm-WqGA+3n4sufPhMM0mB=dcH+Y-uMZ6Wf@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: package request for Phonon-VLC backend
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
X-List-Received-Date: Tue, 30 Nov 2010 23:48:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Holger,
I tried with qt4-tools-native but Phonon-VLC backend trally needs automoc4
"Did not find automoc4"

2010/11/30 Holger Freyther <holger+oe@freyther.de <holger%2Boe@freyther.de>=
>

> On 11/30/2010 08:03 PM, Sylvain Par=E9 wrote:
> > Thanks for your interest!
> > here is my too recipes which are not soo valueable as it is mainly bump
> > version or so.
> > here my automoc-native :
> >
>
> sorry, I didn't completely follow the thread but qt4-tools-native install=
s
> moc4, rcc4 and all the other tools to build Qt applications.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

