Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PE640-0005Vd-HZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 21:05:37 +0100
Received: by qwd6 with SMTP id 6so1579036qwd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=fSOK5qTSEkq3CfeH3Sj5NjZxBg3UHM/kM/URFXzx/sk=;
	b=pxWpOpiuyzYWR++YnPXAxRQF8/DK8Pbod5lFYXCASWRc9RjhHjUawGPU9BjeH+kG7S
	Dt8roTzJAkP9K0CYTtApiP17dN85Ntnal6nFzlkQNeV+nzS+uZSN597qQB/ZBcl7JXtq
	2h2lXFeHXHyt7WK/dE0RkeeH+PGGsa0qAuRcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=CK334mRQorWr+m+IMHU0KXH1clKfw/ultO2oROrtdbjwnCGS0O+uqQ1PV9m8CDK3Fy
	pnM5jCCIKJBafrNJRxPTJgkdLCh1g6Qo2OT2JkRH2hrsGjm3YLJAKo6We/uxng35WlhI
	GXsQcmXMUrT0yX3OKaLbPDQG4e658HHMIVKF0=
MIME-Version: 1.0
Received: by 10.229.213.135 with SMTP id gw7mr1094333qcb.41.1288901083826;
	Thu, 04 Nov 2010 13:04:43 -0700 (PDT)
Received: by 10.229.228.147 with HTTP; Thu, 4 Nov 2010 13:04:43 -0700 (PDT)
Date: Thu, 4 Nov 2010 21:04:43 +0100
Message-ID: <AANLkTikEvXr_vz+_uy871SM1B5SS=e6kb62sPyt-4GaD@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: OpenEmbedded Release 2010.12 --- needs your help!
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
X-List-Received-Date: Thu, 04 Nov 2010 20:05:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

at OEDEM we discussed the need for OpenEmbedded releases.

- OpenEmbedded releases are planned in certain months, so that we can
plan stabilization efforts in the future.
- Each release is a point release in time.
- A release is a candidate branch point for a stable branch (which can
be maintained by those who use it).
- The next release is planned 2010.12, more specifically December 1st.
That's only four weeks from now.
- The 2010.12 release is hand-picked from a recent testing branch.

Now that our testing team has the process in place to gather test
results, please consider to build your
favorite set of distro/machine targets using tinderbox, and report your results.

One requirement is to use bitbake 1.10, as the minimal requirement
will soon be 1.10 for the OpenEmbedded metadata.


Regards,
-- 
Leon


