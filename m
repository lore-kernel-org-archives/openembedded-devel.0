Received: from [66.46.182.51] (helo=relay.ihostexchange.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <uris@activenas.com>) id 1KGbnm-0001bh-FW
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jul 2008 17:41:54 +0200
Received: from VMBX107.ihostexchange.net ([192.168.3.7]) by
	HUB101.ihostexchange.net ([192.168.4.1]) with mapi;
	Wed, 9 Jul 2008 11:44:09 -0400
From: Uri Simchoni <uris@activenas.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Jul 2008 11:41:19 -0400
Thread-Topic: VPATH-like compilation
Thread-Index: Acjh2jubu/HwBurvStuzNxe6albeiA==
Message-ID: <D9011746E8D15B469C92543CC523C9AF1AE22D4C4C@VMBX107.ihostexchange.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: ABI/ ACzN At5r BIOC Bckr BjQ/ B3N6 Chml CpCF C1Qx DCKK
	D6Vk FDed FTHL GW92 Gd+g; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {9B904B57-6B0A-4E54-BB47-C3869B741470};
	dQByAGkAcwBAAGEAYwB0AGkAdgBlAG4AYQBzAC4AYwBvAG0A; Wed,
	09 Jul 2008 15:41:20
	GMT;VgBQAEEAVABIAC0AbABpAGsAZQAgAGMAbwBtAHAAaQBsAGEAdABpAG8AbgA=
x-cr-puzzleid: {9B904B57-6B0A-4E54-BB47-C3869B741470}
acceptlanguage: en-US
MIME-Version: 1.0
Subject: VPATH-like compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 09 Jul 2008 15:41:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Is it possible to create an autotools-based package where the sources sit o=
utside WORKDIR, and are not copied? (but the makefiles and objects are in W=
ORKDIR)

Likewise, is it possible to use the devshell package or a modification of i=
t to create a build environment in which the sources are separated from the=
 makefiles and objects?

Thanks,
Uri.


