Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PLYXR-000849-Cr
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 10:54:50 +0100
Received: by qyk7 with SMTP id 7so2004714qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 01:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=7GpHBkI3kmUAuZssKmT51GEXISh51en8JGh4aYrzyM0=;
	b=mkhmEz+BAnsh4alGDC2UuGD8c+xU94PoJmzi8ffxaAU3BNgb7Az7aZ8OaulAOYhE/C
	c55Wjw375tTlPI1VUZtnGXSVMOYLPaL9HO6tlMUiEP+La+uTjZTi+6ueBTzrum4rkiTj
	Vngsyfg96DAmmmYqMBY5IFMELPtz/0qQULabg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=HXiTW1iT30xWCpneHiFGfpoc1/pYVJA6gkfQnNN/AmT44uy23m/OTsaW1k4g9DoOAn
	PCKl4oht8eWjn6Z1xrlN6r8hEgaic5Z9bmu3mBTg6Z++faiiPxX/0Y6QLXo7kcobuBPI
	5766dzelR60JkctVtr4XVdMcV6q8vmK/SV20I=
Received: by 10.229.189.4 with SMTP id dc4mr508728qcb.106.1290678813119; Thu,
	25 Nov 2010 01:53:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Thu, 25 Nov 2010 01:53:12 -0800 (PST)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Thu, 25 Nov 2010 10:53:12 +0100
Message-ID: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: qwt 5.2.1 failed to build here (om-gta02 , SHR, X11)
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
X-List-Received-Date: Thu, 25 Nov 2010 09:54:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

http://tinderbox.openembedded.org/packages/1087355/

Does some one else has already succeded to build qwt 5.2.1 for X11 ?

Any hint, thanks.

Sylvain (aka GarthPS)

