Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Oc4H9-0002ND-VK
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 00:30:00 +0200
Received: by fxm12 with SMTP id 12so4737240fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Jul 2010 15:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mVsA+ESMvTW4utjjHsoWcfHMEyHZQ57eOgHuIbanYCY=;
	b=vgjmcXk7T+AoA2LGhIPnUzcMOg4ZwU0BJ3MQfVIKjZ/vErR2175vsFj6nQYb5FUU/T
	6qMeqPU+Jz9hYfUdDNnDcwheCm5Flj+QSTCQM351+Mld+u4qTjLwe4QCkLjJjn5t0rsY
	DAV580soJzRBPsT5Jc0/l08J8L/aKJhHwNLyE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Jy4QZ4KPZRGIW/iaCHRCHEFfVnqSpCTfO+9nsZCX+7H/D9QC4ykFuMc6JwhMt9PLMk
	pTrv8WwxMTxzLoAfnUy9JNaiyJT0oDKuzSCwnOrOfRvXQyyFpWbM56gnj0zIZXjVIO3j
	bOXCZjranpOroy5dFS1E68WGotL1SynyHhIeg=
MIME-Version: 1.0
Received: by 10.103.181.10 with SMTP id i10mr744992mup.99.1279837776909; Thu, 
	22 Jul 2010 15:29:36 -0700 (PDT)
Received: by 10.102.59.17 with HTTP; Thu, 22 Jul 2010 15:29:36 -0700 (PDT)
In-Reply-To: <AANLkTilGhDF1e72pQezHYZ5kRFb4jYVXOMI8sMp_Z4RB@mail.gmail.com>
References: <1279235521.6792.11.camel@utx.lan>
	<AANLkTilGiE94LywDaFnLI2pYxkhnrImeJNsvM-ZQsv_z@mail.gmail.com>
	<1279236550.6792.22.camel@utx.lan>
	<AANLkTilGhDF1e72pQezHYZ5kRFb4jYVXOMI8sMp_Z4RB@mail.gmail.com>
Date: Fri, 23 Jul 2010 00:29:36 +0200
Message-ID: <AANLkTiky0rTxx5tC4y5DNpzhS978uKeC0gqFj-a3M9wd@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [Angstrom-devel] [PATCH 2/3] udev: add udev-compat support to udev
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
X-List-Received-Date: Thu, 22 Jul 2010 22:30:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> =A0 udev: Added support for udev-compat.

Tested on c7x0 with kernel 2.6.26.
Acked-by: Andrea Adami <andrea.adami@gmail.com>


