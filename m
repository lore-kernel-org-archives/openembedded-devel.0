Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PKJuZ-000646-6o
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 01:05:35 +0100
Received: by wyb34 with SMTP id 34so1965630wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 16:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=vOR5wwwlFtnT8ul6H+Gh0NsfwpJhzifOPopei6n15Ds=;
	b=Qcuq/m0hknnsjULKTzQqB7dOrFgGG1YN3P9KyoBxmnx8sYr93j0n2LtfmGpGdc/t5b
	wWB3zqPZwroverGCURHbrdfh5ilDQNDFZA9eO48vdocY2rx99T/l4u0mtY4OiEk4t3db
	iYoBsD98S/vHcVxAsnskMVqOml+CeiCU4vzpo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=OFxswcIEblXm2yZxLxz2Xcw7yrThZbV4+0QGDkP8Yhw6aqYHfRokB3fFfLTWw1Atrw
	QsZypUZo1DrLnTx+g33IPwnkTmlQNDbIrXN2x+ScRkO748N2K/6t/O21xqDuqJ4RaG+U
	8C28R1gIjatiy0qQQ2k5xlF3Q9LnmNl+uL+6w=
MIME-Version: 1.0
Received: by 10.216.173.194 with SMTP id v44mr4155948wel.100.1290384260377;
	Sun, 21 Nov 2010 16:04:20 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Sun, 21 Nov 2010 16:04:20 -0800 (PST)
In-Reply-To: <AANLkTi=dxxtk=ajzU2a4ZrGZU0DMqgB-+RmrNabJYycH@mail.gmail.com>
References: <AANLkTi=dxxtk=ajzU2a4ZrGZU0DMqgB-+RmrNabJYycH@mail.gmail.com>
Date: Mon, 22 Nov 2010 01:04:20 +0100
Message-ID: <AANLkTinOx7oAkLH4aupy+9Z0+z_wWEEqFovoAACqKE8P@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: klcc-cross packaging issues
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
X-List-Received-Date: Mon, 22 Nov 2010 00:05:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

>The issue raises now: the klcc-cross ipk is not created because it's
>empty (nothing to install for target here).

Fix has been committed by Tom Rini.

Commit: 1fcb9e0956a057cd7120d7fc334c2505e46da19c
URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=1fcb9e0956a057cd7120d7fc334c2505e46da19c

Thanks!

Andrea


