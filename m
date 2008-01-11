Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <thommycheck@gmx.de>) id 1JDTd4-0001Tp-0v
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jan 2008 00:49:38 +0100
Received: (qmail invoked by alias); 11 Jan 2008 23:22:41 -0000
Received: from BAA2af5.baa.pppool.de (EHLO [192.168.178.21]) [77.128.42.245]
	by mail.gmx.net (mp019) with SMTP; 12 Jan 2008 00:22:41 +0100
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1+sO7km1NOsxxfTZRHJJXsr6b7XqCxrkf2JgyX8oM
	PPv/up1aIn6H0H
From: Thomas Kunze <thommycheck@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fm8g7r$r27$1@ger.gmane.org>
References: <47871C71.5020800@student.utwente.nl>
	<fm79ef$hak$1@ger.gmane.org>	<47872B1A.9010400@student.utwente.nl>
	<fm86uh$qa8$1@ger.gmane.org>	<fm8dm0$ikl$1@ger.gmane.org>
	<4787C194.4060907@student.utwente.nl>  <fm8g7r$r27$1@ger.gmane.org>
Date: Sat, 12 Jan 2008 00:22:40 +0100
Message-Id: <1200093760.6074.2.camel@HD>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Y-GMX-Trusted: 0
Subject: Re: mtn disapprove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2008 23:49:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> I will then move above line out of zaurus-2.6.inc and into poodle.conf,
> zaurus-clamshell.inc and tosa.conf and everything should be alright, or
> did I forget an Xscale non-clamshell modell?

I would also move the PACKAGE_ARCH stuff.

Regards,
Thomas



