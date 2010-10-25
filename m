Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PANkt-0002DG-2b
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 16:10:44 +0200
Received: by ywg8 with SMTP id 8so4903ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 07:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=4DfF4rxCB9nI/Ak+XLNlme8gADesrK+pYOHdQbUEZOg=;
	b=r/gqKu+WzKiBydRcwpLXgJSKYq+elehpKI7Q7BndIo9KbjxlzzQxEUwRBkl0S8HFge
	zCk4gQ6HZ2b6VVk7y8jKu+Qie5IHxLxZ/Ie/AqL+wN90W/0cz4piGY97EQzdW21CGYdY
	hA0L9TYXbmzmaLTR1TiCkI7fVfEdOTeSVVUq0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=FFuiy5X+yooAiPqQkk2zIacFOxj5q6VUdFKePzFxfDPR/2PTDJLTKC/zn2i85F8Jd7
	erPDKaI+hOCa1OFdMX5aeXC2+W5RChMLZkSYpg2FEnHKWph8eaEmq+/Cw/gW1pbTGy7E
	u8Oq/OKoWHKjBcfJN3/M13bTe40KyhoBVMo1E=
MIME-Version: 1.0
Received: by 10.42.170.133 with SMTP id f5mr2069806icz.147.1288015780481; Mon,
	25 Oct 2010 07:09:40 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 07:09:40 -0700 (PDT)
Date: Mon, 25 Oct 2010 16:09:40 +0200
Message-ID: <AANLkTimuTax_r2-eNzs3VnjQgDz+-SUxee9RUtSGPKm1@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: force build from mirror only ?
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
X-List-Received-Date: Mon, 25 Oct 2010 14:10:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was wondering if it is possible (and what needs to be done) to fore
a build from a mirror only (or without a mirror and only using
downloads) without disconnecting from the network.
Rationale: I want to make all sources for an image available on the
mirror (including git tarballs etc) so it can be used as a reference
on where to find the opensource components for this image.

Anyone a suggestion?

Thanks! Frans


