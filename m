Received: from ausc60pc101.us.dell.com ([143.166.85.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OYRmj-0004pB-P3
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 00:47:53 +0200
X-Loopcount0: from 10.166.62.177
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 Jul 2010 17:42:17 -0500
Thread-Topic: SSH configuration question.
Thread-Index: AcsiE3tIy8VpAAlrQiyyzbOb0c/t7w==
Message-ID: <113134CF306E8E4CACC27BE5937261B20931BF14A7@AUSX7MCPS303.AMER.DELL.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 12 Jul 2010 22:42:19.0313 (UTC)
	FILETIME=[7C2B5A10:01CB2213]
X-SA-Exim-Connect-IP: 143.166.85.206
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	MIME_HTML_MOSTLY autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: SSH configuration question.
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
X-List-Received-Date: Mon, 12 Jul 2010 22:47:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

  What is the best way to update the configuration used to build SSH?

  Specifically, I'd like to build SSH with pam enabled, however, the config=
uration in the recipes/openssh/openssh.inc specifies "-without-pam".

Regards,
     -Sean

