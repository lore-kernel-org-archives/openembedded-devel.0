Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1NwFOB-0003CF-Qa
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 15:52:24 +0200
Received: by ewy3 with SMTP id 3so422937ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 06:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=t+93gDpbBJxIZdP4kPiyGFaq/5PeeQZskf/Z6unGuTU=;
	b=WT/I32LWeKZHC959H5J9wf/8t/DQolqVkmaj1924r+5g/f13zhvJesO3HXG5sX8BZn
	Fg2G4cwUKRK/8Bh8Pq5DDFL0NkwPohmR6DENOQOcaC67c4tGsRrmKtBisDDMkJl5vXTY
	sCAfLdW408YGIXbdrb5JqoD8l3bosAL4daoec=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pHDQfRaZmmLiSQO0P7VBkNudwDCk3h0A3tP3ZGKV0Lv/C3wZ9SrpcR3wh8OpFJdJfv
	zEZ06Imse/YwAyi+Yc1zniXCxAFjw1/fUWWNTWY/+B7UQ+KPcoIFxLS5o5ILDmh+m02w
	wwJY1AQOJCDhzgQXhpCB7y4MjBW0nh6yGKgb8=
MIME-Version: 1.0
Received: by 10.213.4.70 with HTTP; Mon, 29 Mar 2010 06:49:09 -0700 (PDT)
In-Reply-To: <201003291421.21206.marcin@juszkiewicz.com.pl>
References: <1269864930-2633-1-git-send-email-mchazaux@adeneo-embedded.com>
	<201003291421.21206.marcin@juszkiewicz.com.pl>
Date: Mon, 29 Mar 2010 15:49:09 +0200
Received: by 10.213.1.215 with SMTP id 23mr2481702ebg.49.1269870549709; Mon, 
	29 Mar 2010 06:49:09 -0700 (PDT)
Message-ID: <bc36f8ed1003290649x281f4769u136cef773ee80655@mail.gmail.com>
From: Mickael Chazaux <mickael.chazaux@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Mon, 29 Mar 2010 13:52:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

> Do we have virtual/bootloader? First heard of it.

BB>> build virtual/bootloader
SHELL: Building virtual/bootloader
NOTE: multiple providers are available for virtual/bootloader
(u-boot-omap3beagleboard, u-boot-omap2430sdp, ezx-gen-blob, qi-ubi,
u-boot-openmoko, u-boot-omap3, u-boot, lowlevel-topas910, barebox,
qi);
NOTE: consider defining PREFERRED_PROVIDER_virtual/bootloader

The answer appears to be yes... Shall I leave it this way?

Regards,
--
Mickael CHAZAUX

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


