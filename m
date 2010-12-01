Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNif8-0004U1-Uk
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 10:07:43 +0100
Received: by iwn8 with SMTP id 8so5590295iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 01:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ZPLG2CdbweE2gdPAR8pDDv8stQ3Yva80H6kECgKXrcw=;
	b=HGHf34bl1nU47p0EerUY6Fi2Cfy17Y5MlMKiOx58pYyYtpJlTMHrguhDtdcolOUnTv
	YaU34VknMNV5jB6CADPHbaS68duQ+e5QvgT0OsGHOdu6UEj0FRObv/II+c+C9pj7p/fz
	ZMJSIlWeEPEYuAhlNrTuu2CiFMxu/wD+oukas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=sN5DyoItwIxaYpuE8WU4KcthF1vkMVrak6miCQ3zaQYUfX3pzJwbFLVpTmfyB59h77
	djXt5vvhgcKwofMSrsesdlvT2i+kirC7s4D44A6zVX78cIpBfjJCZPXa9uCoffKiTFHH
	ToKfcjLFHUf38bHnKRUTduShzvptnseASr8l8=
MIME-Version: 1.0
Received: by 10.231.13.203 with SMTP id d11mr8686451iba.157.1291194382674;
	Wed, 01 Dec 2010 01:06:22 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 1 Dec 2010 01:06:22 -0800 (PST)
Date: Wed, 1 Dec 2010 10:06:22 +0100
Message-ID: <AANLkTi=yLLv7wx_M6fBkZV7+_RJaTqmDRbY995-xpb2P@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: release-2010: when & what to do
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
X-List-Received-Date: Wed, 01 Dec 2010 09:07:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

I wanted to raise the issue of when to do the release. I seem to
recall dec 1 was coined in the past (which is today in most of the
timezones at the time of writing).
It seems to me that we still some areas needing attention (uclibc, the
multiple provides for a few packages and probably some more things).
What about if we try to get these resolved this week, plan an
additional testing session over the weekend and decide early next week
on how to proceed?

Best regards, Fr


