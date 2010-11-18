Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PJ2GK-00026U-6j
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Nov 2010 12:02:44 +0100
Received: by wyb34 with SMTP id 34so3187223wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 03:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=QGrfEHYA5kxv2+EjlXBqTPfWNJw7XBLoXNVDgZ0qBuE=;
	b=TyR2Mmk/BdMocKRElTcfSOWElTds7Q9mgEVdiycQc6yEKolDGxvtfFf8NkgyOHLl7y
	MxjpWWMP/zVmaBAmrxFaMdw70B1IMLejgGdf4ej5Qr43TophOjaNPuGBWfX2Wgn638Rg
	laNNPFoaFckrTQBa1lX9ePmf6Oy4tNaqxgXu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Em4HpNnc2X5zuXEHM6yV2banBSYUe7FEtRQOT88eaWTEPsidcgGt2K35W3Pu0BTqUz
	Kcl25lw6VR42GbdT2mOY07rBkZ+xaAlhwexTTMQ/i2p44fY2IHstgP31dLAqvW8ntalk
	N9ZNMKO5sCPKjWGCF/Yb5BO40DqUiaCfd08N4=
MIME-Version: 1.0
Received: by 10.227.148.17 with SMTP id n17mr446444wbv.223.1290078093004; Thu,
	18 Nov 2010 03:01:33 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Thu, 18 Nov 2010 03:01:32 -0800 (PST)
In-Reply-To: <1290074903.3183.202.camel@mill.internal.reciva.com>
References: <AANLkTi=4sU4238+b8zyJJ35VCyJB2ysestx9N=_my697@mail.gmail.com>
	<ic06a8$uft$1@dough.gmane.org> <4CE3A6DE.2070203@xora.org.uk>
	<ic0aj2$hqc$1@dough.gmane.org>
	<AANLkTimdqZ1hdZNPN70LXd1WuJSn4pU2y=2C5tZs0-LT@mail.gmail.com>
	<1290074903.3183.202.camel@mill.internal.reciva.com>
Date: Thu, 18 Nov 2010 21:31:32 +1030
Message-ID: <AANLkTimnEoW_9i8T65WTsQsYXc2E2gcx+015o13cVsKF@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Preparing for release - Freeze on master
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
X-List-Received-Date: Thu, 18 Nov 2010 11:02:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

 Everyone is going to want to apply fixes to the release, so it makes
sense to have this as a new stable branch.

OE is in a relatively stable state right now with no major changes
causing large fallout recently. So, why not just branch it already and
apply the same commit policy as the existing stable branch.

More importantly are the logistics of handling what fixes go onto the
both branches or only the dev branch. Since the current stable branch
has been stale since I became involved in OE, I don't really know how
this works but I am very interested in submitting fixes for a stable
branch over the next few months.

-Graham


