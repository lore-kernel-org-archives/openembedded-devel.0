Received: from [209.85.160.53] (helo=mail-pw0-f53.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1N4jPR-0002Vf-QS
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Nov 2009 00:00:33 +0100
Received: by pwi18 with SMTP id 18so1609331pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Nov 2009 14:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=i8ONmzvUzc953/OIyOWDLEGZP5BvTeb/P6aYK+SHYWY=;
	b=Bi6Rp6RYzT6+CHP7EZQgdKB9V988RHc06YrF7qG5api0cEe2Xw4VJVbPsxUMCZoSwy
	RB0fOJoDq7/maVUy9hZ+oGf81vN6YgPJLoDnWn2IxJITcNQC3vH5Xjt1qAmTA0KsVuk8
	JFDVwavv4c9iZICqWf5kAaExqaVHgejX9qFUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=IrF+lFsJmpEpmwZ+s1upg6TCh0sqezuMdS+F1tQbeWPP2NCqnWKOeK0Od10zFNmBFI
	bYs/QbFm/bdPBWTJoJuxbq77DUc3WU8wL4Nb5v75lJGxxIqZr0043G1jl3qRKKWvbsIH
	GEl5wVL0KxgJI29OF1dv7/bDWiIU7InpcR00M=
MIME-Version: 1.0
Received: by 10.140.157.21 with SMTP id f21mr221340rve.48.1257116358934; Sun, 
	01 Nov 2009 14:59:18 -0800 (PST)
In-Reply-To: <c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
References: <200910291241.35265.marcin@juszkiewicz.com.pl>
	<c384c5ea0911011235j2a8e6920s43310cce1a3e8498@mail.gmail.com>
Date: Sun, 1 Nov 2009 23:59:18 +0100
Message-ID: <d1b08f940911011459i7e8403ees7e509843a0854e2@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Checksums.ini again - new format this time
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
X-List-Received-Date: Sun, 01 Nov 2009 23:00:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

And what about having a checksum file in each dir of  /recipes ?
If the checksum changes the PR should be changed too.

While Gentoo's guys started from the opposite situation (one checksum
each recipe), this could be an interesting read:
http://www.gentoo.org/news/20080204-digest-files-removed.xml

Specifically the bits about GLEP44.

My 2 (euro)cents

Andrea


