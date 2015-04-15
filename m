Return-Path: <eric@eukrea.com>
X-Greylist: delayed 28798 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Apr 2015 00:42:53 UTC
Received: from 13.mo1.mail-out.ovh.net (13.mo1.mail-out.ovh.net
	[178.33.253.128])
	by mail.openembedded.org (Postfix) with ESMTP id 728C16AC1E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 00:42:53 +0000 (UTC)
Received: from mail183.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id ED2FBFFA97E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2015 18:24:16 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Apr 2015 18:24:16 +0200
Received: from pac33-3-88-170-243-169.fbx.proxad.net (HELO
	e6520eb.localdomain) (eric%eukrea.com@88.170.243.169)
	by ns0.ovh.net with SMTP; 15 Apr 2015 18:24:14 +0200
Date: Wed, 15 Apr 2015 18:24:13 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: martin.jansa@gmail.com, koen@dominion.thruhere.net
Message-ID: <20150415182413.4eb934a3@e6520eb.localdomain>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.27; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10424988712885202249
X-Ovh-Remote: 88.170.243.169 (pac33-3-88-170-243-169.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeektddrgeehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeektddrgeehucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecu
Cc: openembedded-devel@lists.openembedded.org
Subject: [dora] request to cherry-pick
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 00:42:59 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Martin and Koen,

is it please possible to cherry-pick
9c762b824cbf7ecd9ce7f7859d22ff89c59fa28d
"evtest: Stop using Cgit based archive"
into dora to fix evtest fetch issue ?

Thanks
Eric

