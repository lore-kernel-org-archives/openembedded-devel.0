Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Osi9P-00045N-Rr
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 22:18:49 +0200
Received: by iwn2 with SMTP id 2so4472611iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=nsijEj3FgoH8lV6fdFmkA8+OM0wsXsfk6pIGlRtGCf8=;
	b=IoYU4v6c+Jn9onxdC4h/0YcxZXNcmE9ydAEiu9HOFk3cSIvAH7CjOmAFcQT6QYk6vA
	afuUICnewvi4oObAltyrIz8mi4GhPxbD1mHdLDZ07AsrXyQZuPPtl4Pvzvy/JzIQEYfU
	MkClS87jfpWY+A+P8FJ07e8TsiAHLUEHLdMGM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=aydE3odfv6wzoasUoJy9QG+HR/uQJH2MyGkMu7pLUHRUvPzVyY82XrSEFO2hi27TfD
	Yq2qbXrp+/AXGPfzBfjn03hG5cHftPEbNU4TFfehjp5/H+jewB/sRCyMh5w9UWBnNKfz
	8fHbhcU1rD/91AYLJrvyXrLMqOprQeUUt7yKc=
MIME-Version: 1.0
Received: by 10.231.149.140 with SMTP id t12mr6807904ibv.100.1283804286273;
	Mon, 06 Sep 2010 13:18:06 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 13:18:06 -0700 (PDT)
Date: Mon, 6 Sep 2010 22:18:06 +0200
Message-ID: <AANLkTi=9YbV7fVNDx44GKfe3_tcLS5pQ_D=MWTDgDv1d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: NOTE: Couldn't find shared library provider
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
X-List-Received-Date: Mon, 06 Sep 2010 20:18:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Anyone an idea on what this means and how to fix it:

NOTE: Couldn't find shared library provider for libstdc++.so.6
NOTE: Couldn't find shared library provider for libgcc_s.so.1

Today I've seen it with asterisk but I have seen it before.

Frans


