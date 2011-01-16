Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chris.spehn@gmail.com>) id 1PebNc-0005yX-FV
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Jan 2011 23:47:24 +0100
Received: by ewy28 with SMTP id 28so2087330ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jan 2011 14:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to
	:content-type; bh=SXS708TNM/xFVJxoL9tXLGLf2lfLTzbRsKUoigC0ZFI=;
	b=WvOQrbMCcvGUv6c1pe77CxY80mLdO8aLncpxs2LqsdKFCLDuA5/Sl5CDzVRZFNauQx
	y/QabYKm/c9fmpYEXO/HiGav1V9qhp5jyI0l0iz7ksRD1reLlnMiMYhEcwNybOgXWHRJ
	jwIMaFgYMw4VGnrs0AK6XLo65PwiUJevB4+6M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=PWefQ/4Dn+K/Y4lI2Q+PRjWlu9gshwfRyEWGxdJ/Vg//9KiZhc/lY4PW22Q/C7kkn4
	fNdSP6q2P5j2xkyC8Nh6ARmAy4s2r1F5PvIFmo1DkSeCB873SK91DE8OhsqAXOAxWoyf
	1Es22BrxUZyxHXD50i4J/J0Za99XamEBkLb9U=
MIME-Version: 1.0
Received: by 10.213.35.200 with SMTP id q8mr2961859ebd.83.1295218009852; Sun,
	16 Jan 2011 14:46:49 -0800 (PST)
Received: by 10.213.33.16 with HTTP; Sun, 16 Jan 2011 14:46:49 -0800 (PST)
Date: Sun, 16 Jan 2011 16:46:49 -0600
Message-ID: <AANLkTimZ8VJPJs3L0jn7Qtq=h_QspsW9E7Dr7FORfBWr@mail.gmail.com>
From: Chris Spehn <chris.spehn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: iPhone3G Compile Error
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
X-List-Received-Date: Sun, 16 Jan 2011 22:47:24 -0000
Content-Type: text/plain; charset=UTF-8

Having some trouble compiling SHR for the iPhone3G. Pidgin won't
compile properly. I tried cleaning and rebuilding separate, but no
luck. I'm not really sure what to do. Would someone mind taking a look
at my pastebin? http://pastebin.com/zxDuWJtS


