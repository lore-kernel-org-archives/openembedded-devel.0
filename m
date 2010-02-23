Received: from mail-bw0-f213.google.com ([209.85.218.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1NjyaI-0003MS-Sc
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 18:30:13 +0100
Received: by bwz5 with SMTP id 5so2661313bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 09:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=y+lbtATxv4eIDNtv83vs+SnMdHIxPne4WJ0CLKbv7QE=;
	b=OqvumtXSr6plecBiRdBkg50p/aScgxF2UnGT2YInpWyNe7l6QxmpodqCtMTuXeBNvX
	bVZKmA9ijKpb7hUWs/x1iZh1ebr93tCMT+e+K7BGgoEAv2pUx7PP9HZbplLtXUoeGaUv
	lGu7BVvf69Y30cKU+npguyMmiZSeO0FMRw/AQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=yCOTgWNxHvaXOxD/pRFtiY6/J1/fa23nP39zyTXwS8cG+LF9BGpzLjW6n2po4X15jw
	OFAc/udycRAAbshDbowPkn6xdU7ZDS0TZta6yesWxDfjiNcwNnSxs1wh9Uos8tlngYkE
	h7Qu+OEwye6wM3+pDhA3p2iRA22YSIPkeqAWo=
MIME-Version: 1.0
Received: by 10.204.81.9 with SMTP id v9mr5218701bkk.129.1266946045815; Tue, 
	23 Feb 2010 09:27:25 -0800 (PST)
In-Reply-To: <hm12oi$dcl$1@dough.gmane.org>
References: <1266942855-10622-1-git-send-email-michael.lippautz@gmail.com>
	<hm12oi$dcl$1@dough.gmane.org>
Date: Tue, 23 Feb 2010 18:27:25 +0100
Message-ID: <fca63bcf1002230927w718a1250jf2359d54394efbf3@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.213
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 1/2] gpsd: Bump version to 2.90 and clean recipe
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
X-List-Received-Date: Tue, 23 Feb 2010 17:30:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/23 Koen Kooi <k.kooi@student.utwente.nl>:
> Is the '/lib/udev/gpsd.hotplug.wrapper' script part of the gpsd tarball?

gpsd.hotplug and gpsd.hotplug.wrapper are part of the gpsd tarball.
(root folder)

gpsd.rules would be too, but I did add another line for the u-blox 4 chipset.

Regards,
Michael


