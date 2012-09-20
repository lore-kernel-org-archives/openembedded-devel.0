Received: from mx194.callplus.net.nz ([202.180.66.194]
	helo=mxi2.callplus.net.nz) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roystonvasey@slingshot.co.nz>) id 1TEq1j-0004zk-RR
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Sep 2012 01:19:24 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuQEAHygW1DLYgoS/2dsb2JhbABFhSIjRrhHgicIAhkFXgUGHQImAhs/AQQeBYdymEWGUIdzkwMUgQ2NHYIOgRIDnxmGbIJ8
X-IronPort-AV: E=Sophos;i="4.80,457,1344168000"; d="scan'208";a="298204040"
Received: from smtp.connexionz.co.nz (HELO mikepad) ([203.98.10.18])
	by ismtp2.tranzpeer.net with ESMTP; 21 Sep 2012 11:05:36 +1200
From: "R U Local" <roystonvasey@slingshot.co.nz>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Sep 2012 11:05:29 +1200
Message-ID: <003f01cd9784$6dc9a060$495ce120$@slingshot.co.nz>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac2Xgrs7r/T+42xjQw+PjdBaOs2I5A==
Subject: Error: min. I/O unit was not specified (use -h for help) during do_rootfs
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
X-List-Received-Date: Thu, 20 Sep 2012 23:19:24 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-nz

Dear List,
I'm working on a Pandaboard using oe-core as my build system which was =
setup from Angstrom scripts.
The last full image build I made was a few months ago. Since then I've =
just been working on application code and building packages.

I'm now trying to rebuild an image and am getting an error that I need =
help with.
I've cleared out the build directory and re-built everything from =
scratch but still get the error during do_rootfs.

| ./boot/uImage
| Error: min. I/O unit was not specified (use -h for help)=20

I wound everything back to just build the console-image.
I get the same error regardless of which image I build.
I think something has changed during the one of the updates.

I'd appreciate any help or pointers to track down the problem.

Cheers Mike.



