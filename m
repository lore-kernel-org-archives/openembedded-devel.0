Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fabio.mauri@gmail.com>) id 1OgZLL-0007Mc-Lq
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 10:28:56 +0200
Received: by wwb22 with SMTP id 22so481302wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=PVQbzSQfaaPww43E/C9YznpbxlE0NpNz6JF+yts7nOc=;
	b=Tenik/i67d510a48YnLT2jbvg6xo+gTU8zJf0iCIP0Q6SupZXfg/dgEtDMNWRf7KbY
	X9RR/edeoZo/tr0nvgKszA5iDmPAYOc8vcbBrTycVwvcbXIj+zY/ZM/3zPBfTSWGOSeX
	IF92939vClO1oAWjE/tE3i2KI3mz1uuko/hPo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=xDVQctAaZ7Jn9QdIVCvw/wGcsQkjdtcyoYCf05xydG+OQmxmrjlCUg5bfyJhJ0KgSt
	9sRQRuqbxFO/Wk2uvlWdXWc6AteLswY6zofBNXcxMbxDy3nf45YX0wqJKFI9m8blA6Le
	5khmJ2nsRl+TqoydyVgw7SZ2X0/YP6RwOzf8A=
MIME-Version: 1.0
Received: by 10.227.12.164 with SMTP id x36mr7382927wbx.97.1280910531574; Wed, 
	04 Aug 2010 01:28:51 -0700 (PDT)
Received: by 10.216.188.138 with HTTP; Wed, 4 Aug 2010 01:28:51 -0700 (PDT)
Date: Wed, 4 Aug 2010 10:28:51 +0200
Message-ID: <AANLkTinN+Yopob5DS5eGWJJj=06VKHP=Vd2tPEjsJDPm@mail.gmail.com>
From: Fabio Mauri <fabio.mauri@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: fabio.mauri@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Angstrom benchmark
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
X-List-Received-Date: Wed, 04 Aug 2010 08:28:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

   I'm building Angstrom in order to get a rootfs for a Ti DM365 device.
In the last three months I was building an overlay over the commit
d9264a5e565906ccf75f695dbecd251e21407fdf (11/05/2010).
There isn't a particular reason for the choice of this commit, it
simply was the head of branch org.openembedded.dev when I started
working.
My question is: is there a commit or tag considered "stable" for
Angstrom, or at least considered as a benchmark for such an
application?

Best Regards.

-- 
Fabio Mauri


