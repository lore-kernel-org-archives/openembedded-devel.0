Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OX9GK-0000a8-KP
	for Openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 10:48:49 +0200
Received: by iwn34 with SMTP id 34so1943283iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=7y90sLs8zpcSkCfcoe3CXcNxdqmzlr4PgSivMmQSvXk=;
	b=Zuev0NWAWSV7SYW2/vgRhhCb88c0M6JEYI4ZQjdUjzxwhUSLvjL0qkVYUfFV3yoTAS
	BW9KyYBK0c3z9Kqdtgv7wLwmRKWa/A94+WGhI/04j+ZPkVZ6dqqkyP7OZjiiZZPPnfAn
	0MgmoS7e/2a0NylIAZ1bRLj5Jl2SZcfvBv6pQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=ZGBcv2hZHPbwTW8pqsfhwBaxglSrAHsPHzr2dSPRS2DWrug54NHzEhQdjX8U03QB33
	lI5vuDjSzx8SBQahi9rkx3weFSb2CvfgGwp1w1+uwgcW82mTGhLYgS8wLSrPrrJS39aB
	49xjRKN/bvaaTS+FGN9e8+5lLC/QcyWbwiP1o=
Received: by 10.42.0.10 with SMTP id 10mr2804855ica.64.1278616418370; Thu, 08 
	Jul 2010 12:13:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 12:13:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 12:13:18 -0700
Message-ID: <AANLkTimnED3CXSCfqF-m26peBXe1dx7Ofex5rx8cL_uE@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_12_24,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: shadow: add more ARM serial ports commit
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
X-List-Received-Date: Fri, 09 Jul 2010 08:48:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Koen

FYI, While the patch is OK. shadow recipe has mechanism to emit the
serial ports mentioned in the SERIAL_CONSOLE
variable automatically into securetty.

Thanks

-Khem


