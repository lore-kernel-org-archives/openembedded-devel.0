Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PQ24h-0005LN-RT
	for Openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 19:15:40 +0100
Received: by gyh20 with SMTP id 20so173780gyh.6
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 07 Dec 2010 10:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=uwzjOtc9EsJtgHWjBkwfREnavHSxGhS2uYWTze/bi6s=;
	b=pjHbroyn6M/ACVyGTTHqqrqX46KhmW/XBqPmXTGGrqxEonhQwBQ653f+d9UAdlCzNF
	HEIfNqrN4RHupuV9p+eWlkuFECoPDv6LCsDtbDatBFSA06N+jM0YXgLkBDzJ8bvYs876
	GeY0vfUQyTBmy56MDAPGHKlqeo7s4XOHExD9A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=n2lkW3d99P/fcjs1oOpNr5awXqUZ/IVcnna5fN0Fx4Ob5kLzU9GCkGEejSssxhaWt9
	LGcQeVyudImMW+JiIgPD1XtVNTKJ6Cd4TBw5Cyb+BEpoSKHxe8v1CSOH2AdeB919M6P1
	x2bDdvvzaTYMOuLAGaJ8mmUq9ppPX7Xdp+f88=
Received: by 10.91.87.20 with SMTP id p20mr10096425agl.129.1291745646278; Tue,
	07 Dec 2010 10:14:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 7 Dec 2010 10:13:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Dec 2010 10:13:46 -0800
Message-ID: <AANLkTinb3AL5zchPtvqDfv7mRCi+eVO4_ESqr=AVd0Rw@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [ANNOUNCE] The new patchwork is here
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
X-List-Received-Date: Tue, 07 Dec 2010 18:15:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi

The patchwork has been setup newly. The url is live at
http://patches.openembedded.org
Please sign up for the new patchwork. The old patchwork data has not
been moved to this one.
Its still available on the usual old site. The
contrib/patchwork/pw-am.sh script has been modified to grok the
patches
from the new url.

Depending on available time I might be able to add the patches that
went in after the old patchwork stopped
working. However it has started to catch the patches from now on.

Let us know if there are any issues you encounter

Thank you

-Khem


