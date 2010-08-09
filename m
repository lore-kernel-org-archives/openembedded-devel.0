Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OiMB1-0003Oj-0k
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 08:49:39 +0200
Received: by fxm12 with SMTP id 12so5033849fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Aug 2010 23:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=eKUF+i1b2GijVEp/nlh78Xp+ZNcHd2uz993eKah85iE=;
	b=YBNY9XrAqAynhL3yulyi9vM6HCZ2lVwButIOM+O988z/oFWYlkwHh+c271Gi64egrJ
	2PZgddX38sGtbQzkFH7VAt5/t1T1Tb0x7E2o+Gke47sRQarPuucLNPnPvDOlGmIZu6V2
	4PbmOlMwu5pncxbSYmpCBut8Jn5JSXo/BUdfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AIWwx+0Qa4bgg1IyQ20sxwqhifJOPW20KI7uXrF6PcAcC3ldRj1v5UB8z3vgoWtGai
	pvpVvfbguHYUQX7y2ioZUeKeHk0fTPlf1wbfECZG4UBzMZ8EoubD2IJa94oqS9lMqzVV
	Rk7eVWGAJbXxF+pADz7n+ct36Ps1KLdWXkePg=
MIME-Version: 1.0
Received: by 10.223.111.78 with SMTP id r14mr16184830fap.29.1281336569829; 
	Sun, 08 Aug 2010 23:49:29 -0700 (PDT)
Received: by 10.223.164.79 with HTTP; Sun, 8 Aug 2010 23:49:29 -0700 (PDT)
In-Reply-To: <1281160882-3811-1-git-send-email-raj.khem@gmail.com>
References: <1281160882-3811-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 9 Aug 2010 08:49:29 +0200
Message-ID: <AANLkTikv7YSdNe=Z5kcZD04B8b-+Be2UMOjACVWAy--C@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] preferred-om-2008-versions.inc: Update PREFERRED_VERSION for libftdi confuse and ftdi_eeprom
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
X-List-Received-Date: Mon, 09 Aug 2010 06:49:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 7, 2010 at 8:01 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0conf/distro/include/preferred-om-2008-versions.inc | =A0 12 ++++++----=
--
> =A01 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>


