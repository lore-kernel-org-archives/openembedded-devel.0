Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.alalousi@gmail.com>) id 1OQf4M-00037E-1S
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 13:21:38 +0200
Received: by fxm18 with SMTP id 18so1797096fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jun 2010 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=vmNIF9Y8dKEn9zCJkakCbaX9O5nxS7rPb5BKO+U8x4M=;
	b=ulphLixMuuIj1x1sqT8FSM4nB2Z2gNrwbL/j83NcAr/5aZE8i7cvFStCTpNqpEB9Ah
	vK1hsoGo83tUM3tlWkzClVj8khdLjCVHTlDWRFLsLD1J6WZ5NaN/3s1va2kI95uM79FX
	1XJzhELlZtLn9CVtnrQl8CxLiY6jYAyLUmnT8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bKjEKJHt8LNf9FmJSyjv4pWa5EYaqClGqMZQw21OTgixweacFvzI+5aefjC3WFU/J0
	tbdLawXYOynO4HKwJiQKBio5Siqvyd3m74W92DrUonE/rUbEgqs+5uTJPt+/c1pJ4pj+
	reNBXGDXPw7GpiHuCMcQMHrTvU2Fe6GV34Ffs=
MIME-Version: 1.0
Received: by 10.204.81.17 with SMTP id v17mr2831664bkk.49.1277119023774; Mon, 
	21 Jun 2010 04:17:03 -0700 (PDT)
Received: by 10.204.58.134 with HTTP; Mon, 21 Jun 2010 04:17:03 -0700 (PDT)
Date: Mon, 21 Jun 2010 12:17:03 +0100
Message-ID: <AANLkTilowvawMUeG_uqEzSyvsM2HwSFiKYxu5g5izYXt@mail.gmail.com>
From: "Dr. Ahmed Al-Alousi" <a.alalousi@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: a.alalousi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Bitbaking for i.MX27
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
X-List-Received-Date: Mon, 21 Jun 2010 11:21:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Guys,

I'm trying to get an image compiled for my Armadeus APF27 board, which is
i.MX27-based.

Can anyone give me any hints along the route ? Has anyone actually done this
?

Thanks in advance,

Ahmed.

