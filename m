Received: from [209.85.160.83] (helo=mail-pw0-f83.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rk.raggit@gmail.com>) id 1N1IDu-00061d-Hv
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 13:22:25 +0200
Received: by pwi3 with SMTP id 3so594182pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 04:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=DwAgMiPttkUu7F2NX+P7kyK1UWqAHhliPBFUEftmk8Q=;
	b=fYQvCvMpG7De0fs7SUf5/YQuj05XbLvsK+sYYW6KlI7i1guzkeiC/w6lo/KLoSOLEp
	NWxo7pKiRCrp4D0rmfRTHEemP8Xl/XvaR2K3OpRF6m7JKMIlDIIDpSMBO7XaQ7tyNLMG
	eDOWBit5gKYVUFRkmUDWKPbIEivZo0arAnPWY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=Ux8iwELu/ezODPnkSTYC14PzRD1WwCwNEC/BmIargIHi8681iuBI8+BY2vRuoRpC0H
	IWvYn3gSIAeAWjAPnyuzuhkLFGdyhvvUOj7sSaOpjitMMUhXeyath9iOQSeA9Z69GLsZ
	fYjPOBGBqMr1rWH8TlX9sga6Px0hVkfeORV5U=
MIME-Version: 1.0
Received: by 10.140.132.9 with SMTP id f9mr1826900rvd.234.1256296878056; Fri, 
	23 Oct 2009 04:21:18 -0700 (PDT)
Date: Fri, 23 Oct 2009 16:51:18 +0530
Message-ID: <ec1f3d400910230421r4509e19amc899870bdd640ce5@mail.gmail.com>
From: RK Raggit <rk.raggit@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.83
X-SA-Exim-Mail-From: rk.raggit@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [help] openembedded tarball sources on HTTP
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
X-List-Received-Date: Fri, 23 Oct 2009 11:22:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi there,

I am building openembedded recipes but i am behind a proxy that only allows
http accesses and blocks cvs,svn ports.

I would like to know where i can obtain pristine OE package (tarball)
sources from a HTTP link. I tried

http://oesources.org/source/current

...but that link does not work. Could someone please guide me the correct
link ? I will update my CVS_TARBALL_STASH
variable with this link.

Thanks
RK

