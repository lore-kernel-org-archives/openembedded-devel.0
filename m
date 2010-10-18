Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P7dgE-0000Sa-A9
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 02:34:23 +0200
Received: by iwn2 with SMTP id 2so493701iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Oct 2010 17:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=+7T/I1ntMVJ4Broqa5RUvzVhWv5jP5EcbH5/GwDrlnk=;
	b=weAlvQtVhmDkfSCZKhvDD6W7RPaCAoH9+BokUqptkKHLVhDPSU8blk1f9IDhK0BGMz
	VVp30D4TvT6FHJydjSeOYd35crVsTRicakOOlDGi8XQ2ORG+KmSy9KaBpEaLYNEan3K4
	1OB4/hQBoCay84m+kgsk7W1yNqzDpsGkNrLsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=EHHlA3hEGo4PxlYFkPHXS2nvQpM0z0wDIXn/suhs12kyrbg/ZeaaGS6BM0ASkWgdmP
	996svOrkYesfcgAXggqnyTjt2OZ0ca1Im2auKJ/RVAcTOoqAk1eH035MqzMAUgAk+yEe
	mKG4XKekt+kepSuPP0GGjSKQY16UAnk7VOzzw=
MIME-Version: 1.0
Received: by 10.231.149.80 with SMTP id s16mr2695786ibv.81.1287362030111; Sun,
	17 Oct 2010 17:33:50 -0700 (PDT)
Received: by 10.231.158.148 with HTTP; Sun, 17 Oct 2010 17:33:50 -0700 (PDT)
Date: Mon, 18 Oct 2010 11:03:50 +1030
Message-ID: <AANLkTim=u-zVopYCjUxyv_ogxxxA3MU_FkUfh5u-LfAP@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: lirc_0.8.6+cvs20100613: do_package hangs
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
X-List-Received-Date: Mon, 18 Oct 2010 00:34:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

This is quite reproducible, but nothing has changed in the lirc recipe
recently (certainly not since it last built successfully for me).

I'm out of my depth with this one.

-Graham


