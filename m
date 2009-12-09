Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NIK3I-0007Aj-BE
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Dec 2009 11:45:51 +0100
Received: from homiemail-a25.g.dreamhost.com (caiajhbdcahe.dreamhost.com
	[208.97.132.74])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 75296179119
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 02:44:07 -0800 (PST)
Received: from [192.168.1.154] (unknown [84.55.206.192])
	by homiemail-a25.g.dreamhost.com (Postfix) with ESMTPA id 66BE0678071
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2009 02:44:05 -0800 (PST)
Message-ID: <4B1F7F73.1040409@SSpaeth.de>
Date: Wed, 09 Dec 2009 11:44:03 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: --disable-video-ps3 to libsdl-native OK?
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
X-List-Received-Date: Wed, 09 Dec 2009 10:45:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Will anyone complain if I add --disable-video-ps3 to EXTRA_OECONF
for libsdl-native? According to reports that makes builds fail on
powerpc and we might not need to support Playstations for everyone.

spaetz


