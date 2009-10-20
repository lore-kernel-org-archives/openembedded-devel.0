Received: from [209.85.217.227] (helo=mail-gx0-f227.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N0Icj-0001CF-JE
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2009 19:35:56 +0200
Received: by gxk27 with SMTP id 27so5483199gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2009 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=NdSpoR2G2zubmpIoGKrmkVAT/yo9vi7ov2Kmr9HoNFw=;
	b=xtg1k043iQutAN/o16+6CoEkgjxT+XibX33pKkR89ULa7uY+jdEteX5IKNplqqVDn0
	og254LUxn778C+UgunMZy/tZBS/xKnU6UWakqV/pgIEvFAGKRHvyKyltywoPL54rlG4p
	hsdxAzsYVPrlgo/U60mi4B66uiauZAs1OvC8Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=CyCAlurLDt0mRNjOn9xl8s3bdJeTPUSe6Urt4kalvwp6nzhwDO28mfB1rAcbQoa215
	Fujgmxq7OQbTpjn2HeulFuN7U1KCzXoL2wWEipYj39zwnugfP+V554G7B6RKfavzuGWr
	4u+2hAvZJjpA6xikWKE+rM6m/Ets8uJ1dTpPw=
MIME-Version: 1.0
Received: by 10.101.28.5 with SMTP id f5mr4329535anj.97.1256060092504; Tue, 20 
	Oct 2009 10:34:52 -0700 (PDT)
Date: Tue, 20 Oct 2009 19:34:52 +0200
Message-ID: <ac9c93b10910201034ud6bbde7i1d0611150288bda3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: samba 3.3.9
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
X-List-Received-Date: Tue, 20 Oct 2009 17:35:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I noticed samba 3.3 is currently at 3.3.9 while the recipe is still for 3.3.0.
I have added a 3.3.9 recipe (did not want to delete the old one so no move)
3.3.0 already has DEFAULT_PREFERENCE -1 so I left that for 3.3.9

However distro's that use 3.3.0 (i think angstrom is one of them)
might want to move to 3.3.9.


Enjoy, Frans


