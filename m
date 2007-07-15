Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <freyther@gmx.net>) id 1IA5UB-0003CZ-CK
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jul 2007 16:54:11 +0200
Received: (qmail invoked by alias); 15 Jul 2007 14:53:55 -0000
Received: from 88-134-98-145-dynip.superkabel.de (EHLO [192.168.10.100])
	[88.134.98.145]
	by mail.gmx.net (mp043) with SMTP; 15 Jul 2007 16:53:55 +0200
X-Authenticated: #1949623
X-Provags-ID: V01U2FsdGVkX19wlxty/tZwM8dJoGnERCrHWfI1tyctGwkPSWfXMp
	zhw76DnE90K43o
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <f7d7mi$v0p$1@sea.gmane.org>
References: <468C7B11.8050809@openhardware.net>	<200707091643.00611.openembedded@hrw.one.pl>
	<469A20F8.2040707@openhardware.net> <f7d7mi$v0p$1@sea.gmane.org>
X-Gpgmail-State: !signed
Message-Id: <8B59473E-58D3-4D0D-A9AB-29DEE14945BB@gmx.net>
From: Holger Freyther <freyther@gmx.net>
Date: Sun, 15 Jul 2007 16:53:50 +0200
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.752.3)
X-Y-GMX-Trusted: 0
Subject: Re: howto? Build something but not deploy in root image
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
X-List-Received-Date: Sun, 15 Jul 2007 14:54:11 -0000
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit


Am 15.07.2007 um 15:33 schrieb Koen Kooi:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Tom Walsh schreef:
>
>> Yes, that is what I was trying to avoid: building a custom image
>> recipe.  It just seemed that it should be possible to thwart the  
>> copy of
>> the kernel image into /boot from setting a variable or something.   
>> The
>> OE system changes quite frequently and I found myself in trouble  
>> with my
>> own image recipe where I was "away" for several months and  
>> "returned".
>
> You are highlighting the exact reason why not submitting your work  
> for inclusion into OE
> is bad.

And that a meaningful ChangeLog could help as well.

z.


