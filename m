Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1O6lEo-000730-EZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 15:54:11 +0200
Received: by ewy3 with SMTP id 3so219851ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 06:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=NXC2eKm95tqmzjeZdUffYH9CbMQyORH3riDPAg5efkU=;
	b=NqdJGlAaWLxE0G3Gk6Tpv+ZVYAEJOY4VB5VhaFDgdE5cP3CEyxD1HFlA8eda5AIyk4
	YtyuNG+23ykGDPxMk5VGT8HZiQOjMy57x9ogUyavq1iJREMjd3AvjVutj+fPNe0w7U2F
	0tNhCVYeAY6E8W7dpyCOaiZ+RWNgGjbdH8RYs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=iJRv0vbdQ4xEK9O5C1kwI08kvlrt0xySyk4aTSA3Vm3i12jFSQ/bR9e1h+6Xm2Rbx2
	pkmH7v2eRT22+Lc4p8Kt2mB2pJq96xdrhlcqvUGgIOwCBVBNFmWuqaf3M8JJFMHhoGfR
	K7bZobTUtIM5FIM86A0t+AoFtnzQgVghA1uFI=
MIME-Version: 1.0
Received: by 10.213.56.75 with SMTP id x11mr2232347ebg.74.1272376227751; Tue, 
	27 Apr 2010 06:50:27 -0700 (PDT)
Received: by 10.213.13.137 with HTTP; Tue, 27 Apr 2010 06:50:26 -0700 (PDT)
In-Reply-To: <201004192032.30713.ml@vdm-design.de>
References: <201004192032.30713.ml@vdm-design.de>
Date: Tue, 27 Apr 2010 15:50:26 +0200
Message-ID: <w2s359c5481004270650p47d68c07r721a0ddfde21faa2@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: nicola.mfb@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: dbus-c++
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
X-List-Received-Date: Tue, 27 Apr 2010 13:54:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 19, 2010 at 8:32 PM, Thomas Zimmermann <ml@vdm-design.de> wrote:
> Hi,
> i need dbus-c++-native, but dev.openwengo.org is gone.
> I want to change the host to the unofficial git i found on
> http://www.freedesktop.org/wiki/Software/dbus-c%2B%2B because the official tells
> me that there is no such repo.
> Also i defined a PV for this package.
>
> Is this patch ok for everyone?

Some progress on that? would be possible to add dbusxx-introspect too?

Regards

     Niko


