Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1OoEQD-0001A2-HM
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Aug 2010 13:45:42 +0200
Received: by eyb7 with SMTP id 7so156537eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Aug 2010 04:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=6CZcLWUrmFjbqtZEIzGMHO/PCoj0zlR6r7GAwfIRqvE=;
	b=vaLfulETAHdEtjgPuklNwZqTULolb1dBQI7qH1VMQC9cEVIMJuYe3EO2PmE2nVjwjh
	E09RWWihtdZe7VPAfmKrSQZkQzu7ywaj69//Qe/Q76q+4RfRKQUSMtXXo/ZlScftVdOG
	Gjz1qKgsdsRFElY6tsFMxTzUJioJQa7GdzrX0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NslzlcePgKBIujLGLOej+G90PUR0tEh4c/2tDpAE39oGKOVBQvNFRh1PqMZOyBHPEC
	E+FK2jcmafZwrch1+GmH4EaNjetfsCKwga8W1aoYX8MyYEK5D8SjG93pxGxBX4mXRwBn
	9lAfFOXvMliCekwYG3u2svCBCTB9O6cLIRIck=
MIME-Version: 1.0
Received: by 10.213.29.83 with SMTP id p19mr4564590ebc.18.1282736707162; Wed,
	25 Aug 2010 04:45:07 -0700 (PDT)
Received: by 10.14.6.75 with HTTP; Wed, 25 Aug 2010 04:45:07 -0700 (PDT)
In-Reply-To: <1282731315.3880.8.camel@mattotaupa>
References: <AANLkTi=nsTUOndpz7duDncPmbto8vueL0axvEV2qRCBQ@mail.gmail.com>
	<1282731315.3880.8.camel@mattotaupa>
Date: Wed, 25 Aug 2010 17:45:07 +0600
Message-ID: <AANLkTi=ofXwz1kEQih4Yk0At8X0YDFmtQ2TwrWZTuwji@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: norguhtar@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Upstart sysvinit compat
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
X-List-Received-Date: Wed, 25 Aug 2010 11:45:42 -0000
Content-Type: text/plain; charset=UTF-8

> Please take a look at the commit policy [1], resend as v2 and please
> remember to update the patch queue.

I'm resend patch. Now all fine? Sorry for wrong second message.


