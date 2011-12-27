Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rfe0W-0002tX-G6
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Dec 2011 21:52:24 +0100
Received: by vbbfc21 with SMTP id fc21so9447678vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Dec 2011 12:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yi2jdCgq60MO3Dy0bS8F6nlarphleBsihPSPjbOO9zY=;
	b=BATHoAHKvyp/TA/dpvW406u5aEMs81/zG9jHyD0MDQOhr6EhjaDOIeTLBBdVLYmX2h
	gOiHc4EvK1MGt3EX/xwg3qg4TUz5qndx048Ml+0Vl37P9Xkru1a7lYOyexuZDGfUzqYa
	JvazaqT2/e8gfOcgPClssSFTSVWRRuAmOQoGA=
MIME-Version: 1.0
Received: by 10.52.17.139 with SMTP id o11mr15387474vdd.62.1325018711312; Tue,
	27 Dec 2011 12:45:11 -0800 (PST)
Received: by 10.52.160.137 with HTTP; Tue, 27 Dec 2011 12:45:11 -0800 (PST)
Date: Tue, 27 Dec 2011 21:45:11 +0100
Message-ID: <CACW_hTbMw7rssTV0ceidKR496jUbdcENRE6c23y46ds+xrSOow@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [2011.03-maintenance] u-boot 2011.03 recipe
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
X-List-Received-Date: Tue, 27 Dec 2011 20:52:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Just a snippet of info for the maintenance tree users.
I've modified 2011.03 in master to also build the latest version of the
tools (notably fw_printenv, fw_setenv).
These are useful if you want to modify the u-boot environment from user
space.

As the maintenance branch does not have this version, I'm not sure whether
it is desired or not to submit it. (not sure whether maintenance would want
a newer u-boot)
Anyone needing it (or wanting to move it to the maintenance branch): feel
free to copy.

Enjoy, Frans.

