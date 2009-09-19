Received: from [209.85.219.219] (helo=mail-ew0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Mp6vA-0005iP-Ea
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Sep 2009 22:52:43 +0200
Received: by ewy19 with SMTP id 19so5537291ewy.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2009 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=RAoqXGEfsU+zLGwtzaoMQJuam1BfnDwudXRQ0h4Xb00=;
	b=u8mJj9GjzeupINHbw9KrVX9EaL/tTON57giCx3FhP7JI/w2HmQR0sCClTdJ2PKO/Qw
	OOGHCxYZFLHmGFYuinKrVkrHlcs//EZ28StBnC0ymkubv3OMRhsFoHPq+VvsUhf4koo1
	hpmLVjTjJkM3BWy/+vHdn5qio1rs3F/QOzATQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=dOLoVK67H8OPVMPr2sKTuzl7qSKuvW1npzPQQp864q0uUw+cGLcA0PpIUrLyCobo8Q
	Bzy8I7q0heJLJ7eNIUeduwzFb786LMa1EUiZZkSNBnFKdUTplNzC1NTQntinukPtO1Ra
	oYBVaLbGiAZgZaU2PuEPTVVKvAE/g+IrbaKvU=
MIME-Version: 1.0
Received: by 10.216.87.83 with SMTP id x61mr839238wee.7.1253393524988; Sat, 19 
	Sep 2009 13:52:04 -0700 (PDT)
In-Reply-To: <20090919104154.b6458f69.ospite@studenti.unina.it>
References: <200909182050.32308.mickey@vanille-media.de>
	<1253314493-21330-1-git-send-email-ospite@studenti.unina.it>
	<200909190121.20611.mickey@vanille-media.de>
	<20090919104154.b6458f69.ospite@studenti.unina.it>
Date: Sat, 19 Sep 2009 22:52:04 +0200
Message-ID: <d1b08f940909191352l2b361edex79ab6a9385641a5e@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.219
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix files/device_table-ezx.txt
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
X-List-Received-Date: Sat, 19 Sep 2009 20:52:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was suggesting to mickey that some edits are needed.
I pointed specifically to dev/mmcblk0 which is supposed to populate
from p1 to p7 per specification.

Regards

Andrea


