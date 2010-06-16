Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raseelbhagat@gmail.com>) id 1OOsUZ-00070E-Do
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 15:17:20 +0200
Received: by pwi2 with SMTP id 2so3977581pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 06:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=FPeItPvnwd7YHQFkwrtz5b3oRSkLf5FxRV+Cut0+8lE=;
	b=LqnX5z2WY6kEWdV9jCkt1vdYyF1YGS8TmPXgQyGIZaC1C3buhQqDmCLgb7fYnMM4xH
	ZsMHHE9q8P/dqz+8iK3hOb/9z4q3M008dmT1tbOwrIOxcAmEW+ws38RJeroxRcJuUMi6
	KpA2q9UfWVyZSskAKk8vePGw+NzsIfFsAO2aA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=IZoYOr6hA8VD9FojKTEqlFWtaeTRXtIwgzGlFifw3UpMfJxhKgYMvza1cNtoeyP7h3
	yfS6PSTeh+L/+w4GF/2HeZ/V/xl1YQj3KBDyiEhF3zM6VOFVTFp+tG43IVyc2IsGbkKH
	NH8XqqHo4+758ApSA/WMZzWyiO6qP3dDsu1Vg=
MIME-Version: 1.0
Received: by 10.142.1.34 with SMTP id 34mr1556984wfa.132.1276693969409; Wed, 
	16 Jun 2010 06:12:49 -0700 (PDT)
Received: by 10.142.76.16 with HTTP; Wed, 16 Jun 2010 06:12:49 -0700 (PDT)
Date: Wed, 16 Jun 2010 18:42:49 +0530
Message-ID: <AANLkTil99t7nC8GYAqysbXybTApi_2QF9lg7mWTXulHu@mail.gmail.com>
From: Raseel Bhagat <raseelbhagat@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raseelbhagat@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Building Angstrom for Beagleboard
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
X-List-Received-Date: Wed, 16 Jun 2010 13:17:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I'm trying to build Angstrom from scratch for the BeagleBoard.

Now, I've already faced a lot of issues , local as well as related to the
build and managed to go past various stages in multiple attempt :-)

Currently, I am bitbaking nano and I see that more than 7 GB space is being
utilised and its been over an hour and the build  is still going on.

Can someone give me a ballpark figure on how much time and space will it
take to build a console-image ?
Also, any particular heads-up for building this, as already mentioned , for
Beagleboard on Ubuntu 10.04 ?

My ultimate goal is to cross-compile packages like telepathy-sofiasip,
empathy with support for SIP/VoIP.

--
Raseel

