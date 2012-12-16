Received: from 19.mo1.mail-out.ovh.net ([178.32.97.206]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TkHpi-0004cD-Nh
	for openembedded-devel@lists.openembedded.org;
	Sun, 16 Dec 2012 18:16:58 +0100
Received: from mail189.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 9AD54FF9C19
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2012 11:08:45 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Dec 2012 11:56:14 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 16 Dec 2012 11:56:12 +0200
Date: Sun, 16 Dec 2012 10:56:11 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Koen Kooi <koen@dominion.thruhere.net>, Liu Ting-B28495
	<B28495@freescale.com>
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Message-ID: <20121216105611.7746c440@eb-e6520>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 11149786778414329109
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehjedrudefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkohfogggtgfesthejredtredtvd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehjedrudefucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkohfogggtgfesthejredtredtvd
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Denzil updates
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
X-List-Received-Date: Sun, 16 Dec 2012 17:16:58 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Koen, Hi Liu,

as per your requests the following patches were applied to
denzil-next :
35f92b4 systemd: use system variables instead of hardcoded paths
6e0ddd4 systemd: update to v189 66e169f gdm: do not rely on
dev-tty7.device
0f17a3f meta-systemd: systemd-systemctl-native: Also add support for
WantedBy=*.service
d6dd53c systemd-systemctl-native: handle ALIAS tag
e5b3091 systemd-systemctl-native: extend systemctl wrapper to support
mask action
f713db3 systemd-systemctl-native: Add additional messages for better
debugging

patchwork # : 36615 36613 36609 36611 36605 36607 36535 (with manual
rework for the last one).

Please don't forget to cc me for patches for denzil or danny.

Thanks
Eric


