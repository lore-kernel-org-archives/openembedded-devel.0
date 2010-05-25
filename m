Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OGr41-0000f3-KY
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 12:08:46 +0200
Received: by fxm9 with SMTP id 9so882743fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 03:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=xw0Ij+wxRRsiGFOoEO/93TSfmI9GbWB7CYt9syMNS+Y=;
	b=fFdmQw1D3jHjIbpFGP6fZgmm+tWlIjsZHZacrbCBgywWtAmCc0P3hb66JAU8HFskcL
	vcJ2auE2+6VzHr0WqYq3IpqrP95plYPF78RylZ3yQMYMt8/9w1n0iWBjROhwBPm4hB4t
	uLBX1w5htX7+JnS8YcpsYDAA7XQ3TtuE48cB4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pnpnTYzc064NVOKMRVPSVxGeqWZHt/SnFdo4U5bkz7ltda7nsXtzFzjoCwDdXyZoBG
	NUiHdLguVrGcvZjKErqTMxZz7cjgD8X4t9HNHldKHoGd3p6hIK98g/V6fZzpFJrNWsAp
	qzkINDYg1DgmdWWpVZrBZb94rfydRu4eaSJlg=
MIME-Version: 1.0
Received: by 10.204.126.84 with SMTP id b20mr2419248bks.61.1274781878816; Tue, 
	25 May 2010 03:04:38 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Tue, 25 May 2010 03:04:38 -0700 (PDT)
In-Reply-To: <htg51v$c96$1@dough.gmane.org>
References: <1274770197-13394-1-git-send-email-raj.khem@gmail.com>
	<htftsf$ilt$1@dough.gmane.org>
	<AANLkTin5VBoB7K2n6JakiKoN2kfIF9JFgB4_3Ut3-z5n@mail.gmail.com>
	<htg51v$c96$1@dough.gmane.org>
Date: Tue, 25 May 2010 12:04:38 +0200
Message-ID: <AANLkTilswAm96y9pDx-xlEMKbi1-arvsTJgL0pk7kVMK@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] udev: Use udev.inc and add udevadm to udev pacakge instead of udev-utils
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
X-List-Received-Date: Tue, 25 May 2010 10:08:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
>
> >
> '/home/grzesiek/tele/tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/pkgconfig/glib-2.0.pc'
> > appears to be empty
>
> That seems to be the problem, does rebuilding glib-2.0 help?
>
> regards,
>
> Koen
>

No, it doesn't. Still the same error.

Kind Regards,
Grzegorz

