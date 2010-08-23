Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OndyM-00069s-PC
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 22:50:36 +0200
Received: by gwj15 with SMTP id 15so29002gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=X+2R9Ab23CrY7/K5jmzXgTGFBdp6Y9kv/2i7OYFq6zw=;
	b=kgDjBSB7Dq3OguulfiE27E3tSVpPCnbce48bcS5V6X8uYzGAd3bnYAXKYdaGq/jf8U
	AE8GzyQx+YLeeT0IW0uwLLVUW5fDHqoxkrIGp3iFh7YrVgT6OPOQx83/6hoW0rAatmo+
	Ry4/R1nCfCdd8tK8dhjPyrzwtqUY+dW8CPetk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=CdaRMJaFNIEowp/SEkrlvCdzbkGnCghzV0YtVa6k5pXBzal8FW6SyBdJ+td+kHKVu3
	Y+nleK893lrhS6MMvbgNcIQ5/DFZ1DR+n/fZ7s7WISwgdjUwUDBUv9TFnVLNAZh6U7rX
	34rdtuCjQ3U60EPaZ4xKXjPRa24Vw+9WrtdDA=
MIME-Version: 1.0
Received: by 10.151.5.12 with SMTP id h12mr6199040ybi.73.1282596595961; Mon,
	23 Aug 2010 13:49:55 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 23 Aug 2010 13:49:55 -0700 (PDT)
In-Reply-To: <AANLkTikVJFZcEO39CnBJfVBdVvjFohDM+E17kXZCmjrr@mail.gmail.com>
References: <1281459157-4103-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20100810171950.GA32300@jama>
	<AANLkTikVJFZcEO39CnBJfVBdVvjFohDM+E17kXZCmjrr@mail.gmail.com>
Date: Mon, 23 Aug 2010 22:49:55 +0200
Message-ID: <AANLkTi=9xFW0rcHUZ1tM9dV=Uw3sN8DVQgEpdWT7kQDc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] conf/distro/include: remove unused versions
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
X-List-Received-Date: Mon, 23 Aug 2010 20:50:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Summarizing and concluding this:
The proposed list was

conf/distro/include/freeze.inc
conf/distro/include/fso-autorev.inc
conf/distro/include/insane-srcrevs.inc
conf/distro/include/maemo-preferred.inc
conf/distro/include/preferred-gpe-versions-2.6.inc
conf/distro/include/preferred-gpe-versions-2.7.inc
conf/distro/include/preferred-om-2009-versions.inc
conf/distro/include/preferred-opie-cvs-versions.inc
conf/distro/include/preferred-opie-versions-1.2.3.inc
conf/distro/include/preferred-xorg-versions-X11R7.0.inc
conf/distro/include/preferred-xorg-versions-X11R7.1.inc
conf/distro/include/preferred-xorg-versions-X11R7.2.inc
conf/distro/include/preferred-xorg-versions-X11R7.3.inc
conf/distro/include/preferred-xorg-versions-X11R7.4-updates.inc
conf/distro/include/preferred-xorg-versions-X11R7.4.inc
conf/distro/include/preferred-xorg-versions-live.inc
conf/distro/include/preferred-xorg-versions.inc

Meanwhile the om version has been removed as openmoko has been removed.
Martin removed the unneeded xorg versions
Paul (bluelightning) confirmed that he is still using and maintaining
the opie versions (we also have the opie 1.2.3 recipes)
Martin stated fso-autorev.inc is still useful, and I think freeze.inc
is probably also worthwhile keeping.

That leaves 4 files which I will discuss below:

conf/distro/include/insane-srcrevs.inc
Last time file has been modified is aug 22, 2008. Not sure if it is
useful any more. Would like opinions

conf/distro/include/maemo-preferred.inc
last modification aug 29, 2006. Pins 10 recipes. Not all of them do
still exist (e.g. diet-X11 is in obsolete)
no distro is using this. suggestion: remove

conf/distro/include/preferred-gpe-versions-2.6.inc
last modification nov 11, 2006.
pins some 80 recipes, several of these to recipes that are gone for
quite a while.
Clearly not maintained, not used by any distro, suggestion: remove

conf/distro/include/preferred-gpe-versions-2.7.inc
last modification jan 12, 2007.
again pins some 80 recipes, several of these to recipes that are gone
for quite a while.
Clearly not maintained, not used by any distro, suggestion: remove

I feel keeping old inc files around that are not used by any distro in
the tree, that are not maintained and that contain several pinnings to
recipes that do not exist any more, is pretty useless.
If you feel otherwise, please respond to this message, preferably
indicating why we should keep them and what should be done to update
them.
If I get no objections I will remove the last 3 versions next week (30
aug or so, somewhere after 16.00 GMT) As I feel less certain on
insane-srcrevs.inc I will keep that one unless being told that it is
useless too.

Frans.


