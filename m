Received: from ausc60ps301.us.dell.com ([143.166.148.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1ORW2a-0001iN-9N
	for Openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 21:55:22 +0200
X-Loopcount0: from 10.166.72.158
From: <Sean_Hudson@Dell.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Jun 2010 14:50:31 -0500
Thread-Topic: Module development...
Thread-Index: AcsTDVZRwGdKNc3AS/uw91dIFgNDzg==
Message-ID: <113134CF306E8E4CACC27BE5937261B209315E0E1B@AUSX7MCPS303.AMER.DELL.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {966064B3-039D-4DF2-A6EF-6C972EDF574E}
x-cr-hashedpuzzle: AIJZ AkLx AvvN BhiX BqE6 CIt3 DChx Doi4 EcqL EvfK FQjr
	Ino/ JUFx JVpJ KAC9 KMiL; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {966064B3-039D-4DF2-A6EF-6C972EDF574E};
	cwBlAGEAbgBfAGgAdQBkAHMAbwBuAEAAZABlAGwAbAAuAGMAbwBtAA==; Wed,
	23 Jun 2010 19:50:31
	GMT;TQBvAGQAdQBsAGUAIABkAGUAdgBlAGwAbwBwAG0AZQBuAHQALgAuAC4A
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 23 Jun 2010 19:50:33.0696 (UTC)
	FILETIME=[57B1BE00:01CB130D]
X-SA-Exim-Connect-IP: 143.166.148.206
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Module development...
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
X-List-Received-Date: Wed, 23 Jun 2010 19:55:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Does anyone have any advice about how to integrate modules that are current=
ly under development with OE?

To accomplish this, we are trying to write recipes to do one or both of the=
 following:

1)      Prevent tarball/md5 generation

2)      Pull the latest revision from a VCS every time  the recipe is built

  Is this the best way to accomplish our goal, or are there better ways?

