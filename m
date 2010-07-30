Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dangbinghoo@gmail.com>) id 1Oeg0L-0004zz-E6
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 05:11:26 +0200
Received: by gwb15 with SMTP id 15so465160gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 20:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=ZifZRXgSvVohH0zuHIITWFoR03zAr3rPXZY2YH7XEyA=;
	b=DNQIoZlSVKIywg/64SFOL1vt+AxA8SNJZCaAeR6kxVPJlVRjCl2291yyV4i/nFvmTa
	LNEt6vc0/efRT4h6OtShvW2+mLOshyJu15mA2Ew14xj0rxElq03i9PDxqBwx/ARQ6sYr
	qnpZ41T+lznLff3cZaoa8n/vHUYZ5k+svQ1F8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=KReniCBaI2+oh3HpkC+wNHsIic+Cx22BIDwqyDAY+O/R4RpMFGp+a/ofN0tN/yaCYg
	/w6I0mLncFfLaqKI4ydED5+EuzsycAj1isLUUniyb0zYYdq2ciQ2oceD5JMMAibrpdGW
	LeApKXHnL4cLHoNyudFJA1RQ39yg79l6mnU4M=
MIME-Version: 1.0
Received: by 10.150.59.17 with SMTP id h17mr2316026yba.137.1280459464871; Thu, 
	29 Jul 2010 20:11:04 -0700 (PDT)
Received: by 10.150.227.11 with HTTP; Thu, 29 Jul 2010 20:11:04 -0700 (PDT)
Date: Fri, 30 Jul 2010 11:11:04 +0800
Message-ID: <AANLkTin44WQ5mZwTbiWq5Gf1u3X3jMvOKk=fQ015Y4vS@mail.gmail.com>
From: Binghoo Dang <dangbinghoo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: dangbinghoo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: translating OE manual into Chinese
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
X-List-Received-Date: Fri, 30 Jul 2010 03:11:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm a Chinese, and now I'm working on translating OE manual into
Chinese. I almost done the work. Now I want to know will OE official
add a link to documents webpage .

My work is done in gedit, so in text format , I think I should commit
a xml docbook type format , but I could not find a nice opensource xml
docbook editor, what was the OE written with? And, I also put my
translate on my blog page, if docbook can not be accept ,may be OE can
add a link directly to my blog.

Thanks!
Binghoo Dang, dangbinghoo@gmail.com


