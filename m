Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PNRLq-00067M-BG
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 15:38:38 +0100
Received: by qwg5 with SMTP id 5so4468841qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 06:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=WevINoCTTVo9YM01/45RoYCBIqgmslLymH41CwKQpig=;
	b=qYwByNOsY0hhoM79oNhFq80UB7da0GnE+EwuMKiI/ponfY9jbIlhZyI2DTyykUvMTn
	V468WstZ3Uge0Tg0iYDxV6wYa3suuIcrNKChkiC582CDCuuVm4oDx6hBBc6xYEdLGuMv
	+LKtQbYZJfnM+Z62gjsKzYW1g1QmAhJZAlTGk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=nszMYdcplhPAZ8KJR4OVagyhk+L0aYGupxxgnmFtWd0I5zJ1B1gdgPi7cD0v/tGPKJ
	5umQyA36lW5ozHDjgJjdboElC4J03GKlLw571CAEqhEZpTWtQfKyg7zrxEhtR9+ZDgs6
	aaj7A5XC+TiDOUc5ngeZgrzZLPu/owjapmBx0=
Received: by 10.229.217.133 with SMTP id hm5mr6001827qcb.258.1291127836735;
	Tue, 30 Nov 2010 06:37:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Tue, 30 Nov 2010 06:36:55 -0800 (PST)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 30 Nov 2010 15:36:55 +0100
Message-ID: <AANLkTimx+osQLb0Km1pXgQuPEwx3r1-ovhD9um_9p8GV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: package request for Phonon-VLC backend
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
X-List-Received-Date: Tue, 30 Nov 2010 14:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I have a package request. If that interests somebody to make a receipe for
Phonon-VLC backend
at it seem to be the most stable backend for phononn according to Phonon's
dev.
Like this we could have Phonon-VLC backend additionnaly to Phonon-gstreamer
one.

I tried to make one myself but I can't manage to fix automoc-native
(dependence) to make it build.

Thanks by advance!

Regards,

Sylvain (aka GarthPS)

