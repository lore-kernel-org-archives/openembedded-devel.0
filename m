Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <freyther@gmx.net>) id 1IDdDq-0000U1-0J
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2007 11:32:01 +0200
Received: (qmail invoked by alias); 25 Jul 2007 09:30:43 -0000
Received: from rosine235.inf.fu-berlin.de (EHLO [160.45.116.235])
	[160.45.116.235]
	by mail.gmx.net (mp052) with SMTP; 25 Jul 2007 11:30:43 +0200
X-Authenticated: #1949623
X-Provags-ID: V01U2FsdGVkX1+wjb1VPoOwqWyhewz+VQTJUCEYen2Ela64UAU7jL
	f1EZa+OVrfg0Du
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <46A711DB.6000205@dominion.kabel.utwente.nl>
References: <46A711DB.6000205@dominion.kabel.utwente.nl>
X-Gpgmail-State: !signed
Message-Id: <AD0B1F77-712E-4268-83C6-03CDAC55EB44@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Wed, 25 Jul 2007 11:30:19 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: Activating autotools updates
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
X-List-Received-Date: Wed, 25 Jul 2007 09:32:09 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 25.07.2007 um 11:03 schrieb Koen Kooi:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> At guadec we discussed activating autoconf-native 2.61, pkgconfig- 
> native 0.22 and
> m4-native 1.4.8. The test builds we did didn't show any errors but  
> we'd like more people
> to try to build their favourite target and report back.

Hi Koen,

I would propose to use ipkg-diff. Do a old build, do a new build and  
compare the resulting packages using ipkg-diff which is in oe contrib.

z.


