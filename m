Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HEX5q-0001Dn-Sw
	for openembedded-devel@openembedded.org; Tue, 06 Feb 2007 21:39:11 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l16Kd6ox009250 for <openembedded-devel@openembedded.org>;
	Tue, 6 Feb 2007 21:39:06 +0100
Message-ID: <45C8E767.9000506@dominion.kabel.utwente.nl>
Date: Tue, 06 Feb 2007 21:39:03 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <d46153c40702060903l5dab58b4ha7a237730d51da66@mail.gmail.com>	<45C8B9C8.3010706@dominion.kabel.utwente.nl>
	<d46153c40702061222r3567dcecr2f1166ec6ac17128@mail.gmail.com>
In-Reply-To: <d46153c40702061222r3567dcecr2f1166ec6ac17128@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: GNU Classpath, gconf-dbus inconsistency
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
X-List-Received-Date: Tue, 06 Feb 2007 20:39:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Paulsen schreef:
> On 2/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>> Andrew Paulsen schreef:
>>> Which is somewhat interesting since
>>> $ bitbake gconf -crebuild
>>> ...
>>> NOTE: package gconf-dbus-2.10.0+svn20060719: started
>>> ...
>>> NOTE: package gconf-dbus-2.10.0+svn20060719: completed
>>>
>>> Which actually builds version 2.6.4.14, not 2.10 as the recipe
>>> suggests.  I don't know if there is a reason for this or how to fix
>>> this if it is a bug, so I submitted bug 1851.
>> Right, I made that (somewhat stupid) change to work around a bitbake bug a while back. I
>> have tried to find a newer gconf-dbus, but I can't seem to find it. Any hints on that?
> 
> Unfortunately, no.  The latest version I see on http://svn.gnome.org/
> is 23 months old.  

It's located here: http://developer.imendio.com/projects/misc/gconf-dbus, but still 2.6.x.x

regards,

Koen

> Apparently it never caught on.  Any ideas on
> satisfying Classpath's (gconf >= 2.11.2) requirement?
> 
> Andrew
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFyOdnMkyGM64RGpERAq4wAKCWs+i2iw+HZDxLaR4gWMypIqqdiQCeNI9z
acu6IesTzhpA1rEaARjBxqM=
=hweW
-----END PGP SIGNATURE-----


