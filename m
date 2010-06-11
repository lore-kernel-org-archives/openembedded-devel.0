Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1ON6qM-0000l7-Rl
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 18:12:31 +0200
Received: by yxf34 with SMTP id 34so372142yxf.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 09:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=uPE13jlaV/ePvi8s1JcaZIFV1AIxVKsS5rMdW04MHMQ=;
	b=oRpbdgY2Fuu2NnvbEik0Tf4chGyR1rBkEo+T0khl/L2vUrT1o2GoD66R/4Mrt3Nns2
	4vkNkqaYAFEftjQ0WMLKWp3FGW3qXQiN3GpCZ5T0MLRWxt7mo9rC6xykn2jwb7MU+DwW
	UwNaR0bYGesr+ekF+waxVKujyNmxQuEc4nCH8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=I4wc+NmHYWExR4Ao16bF0oGSpvIuSlC+lwrnNU2ZgYZ7Mevbdb+Vfsob4RfaQlAvTk
	DNFGRSNhUpHeujnDIaEaiAzBqMW1GWhynuxGzYQCkAwB6mBl3o3bdYSO9cTUZK/MYhg5
	OQEzLssbvwYFBJsyBd0NvKGWyjIxwurs1JN6Q=
MIME-Version: 1.0
Received: by 10.216.170.70 with SMTP id o48mr1130410wel.71.1276272484438; Fri, 
	11 Jun 2010 09:08:04 -0700 (PDT)
Received: by 10.216.19.76 with HTTP; Fri, 11 Jun 2010 09:08:04 -0700 (PDT)
Date: Fri, 11 Jun 2010 12:08:04 -0400
Message-ID: <AANLkTilYeWyEXWXkCADH5OOzZwbUt0pkOL4TjE3GPelD@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: doc synchronization working again
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
X-List-Received-Date: Fri, 11 Jun 2010 16:12:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

The docs are the OE web site
(http://wiki.openembedded.net/index.php/Documentation) are now being
synchronized daily again.  The script had been broke for several
months.

Thanks,
Cliff


