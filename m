Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PA9wx-0001Pm-1s
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 01:26:04 +0200
Received: by qwd6 with SMTP id 6so962375qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=hMlhY+04HeFAaAJhN7FB3n5pnO2wGs6bwnWnDA7hvFo=;
	b=SV3dwe1p4p9bqdCJvL+OviAcAuvFf2bMaITIP2+ZEalZ2yIM74FsMAqBd1I/hvFfCw
	F/PQsyTbmJZmv0INSkvfTEBOjswbOuf9VyZX3VRF/kUsPERWS94UYm2ivAlPoRksSCY8
	gvwIZ6vQ+J/YoVDlmETB8gIAR2szVPoxUJVts=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Xvp2mAOx6wRdIGBeL+o7YQqzjet6Fvb93Pv3ZQOFpGMnodb+P2sIuqOA0101z70/K3
	oacoJs6DZvVybMXWPEJg8Va88cDYI7ePjjnbzo+J2BiX623ET1nB4zuZN4MnG/oxVAhp
	0XHCZfcZzL64RSGZm2pncVJyj8xnc8+OytuNQ=
MIME-Version: 1.0
Received: by 10.229.229.9 with SMTP id jg9mr5551109qcb.272.1287962721682; Sun,
	24 Oct 2010 16:25:21 -0700 (PDT)
Received: by 10.229.18.197 with HTTP; Sun, 24 Oct 2010 16:25:21 -0700 (PDT)
In-Reply-To: <E1P9vMs-0005rH-M1@melo.openembedded.org>
References: <E1P9vMs-0005rH-M1@melo.openembedded.org>
Date: Mon, 25 Oct 2010 01:25:21 +0200
Message-ID: <AANLkTi=YvWcm7rdeZB8b32sqG-VaL1F5+VU59x-=rYDO@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Frans Meulenbroeks : lsof/lsof_4.83.bb: removed unneeded EXTRA_OEMAKE
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
X-List-Received-Date: Sun, 24 Oct 2010 23:26:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

build breaks on do_compile after that commit

Needs investigation

Andrea


