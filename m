Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PVsiK-0001WG-FT
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 22:28:44 +0100
Received: by wyb40 with SMTP id 40so6658808wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 13:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=0q2pBlI9waYl4ZfWPtZ8HVKlNlNGlzhuT8Q9+F+frvU=;
	b=tVcqrVampja9Mj6PFZsJNE3I/io3mLYIIyxQ9qMHoZrw0DRE5A2goGKrUW9Ba/APkg
	Opf8QMaKklyp4elTrTxl/aaZr2NfNaVRdBjZscdH1bEigwDXPyYiWwmQ2QFs2eBCPoyx
	zyHI7IACftilIF3antOnhq46222qKDUFEQMHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Nsz8BOZlZziWW7zHAuMKFS4JmwHNtUHH3Qm1jOMH56mG6lnt6i62EgmXffLA0WWFst
	xTATNCA4njRos/66gppv5xwM5dZa3i1e0/4YXtSpV46Y6C9yXkZSVCGYYraGBmF5Sdhj
	h8olF20yW4leBa5PyAmTEhV3ucxtRH7qMTVU0=
Received: by 10.216.155.75 with SMTP id i53mr3161685wek.27.1293139712350; Thu,
	23 Dec 2010 13:28:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.67.67 with HTTP; Thu, 23 Dec 2010 13:28:12 -0800 (PST)
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 23 Dec 2010 14:28:12 -0700
Message-ID: <AANLkTi=CKX1KAuzfjSs2=d5FYrRMjtPoXpS4u-yxihfW@mail.gmail.com>
To: bitbake-dev <bitbake-dev@lists.berlios.de>, 
	Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: [ANNOUNCE] BitBake 1.8.19
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
X-List-Received-Date: Thu, 23 Dec 2010 21:28:44 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

There is a new 1.8 bugfix release available: 1.8.19.
As usual, there is a tag in the git repository, as well as
pristine-tar metadata.  The tarball isn't on berlios yet, but will be.

Changes in BitBake 1.8.19:
       lib/bb/fetch/hg: fix fetching from a mercurial repository
       Fix bb.plain and bb.warn function

Thanks,
-- 
Christopher Larson
clarson at kergoth dot com
Senior Software Engineer, Mentor Graphics


