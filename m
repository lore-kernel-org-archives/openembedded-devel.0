Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O9OQH-0003sx-HT
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 22:08:55 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O9OMb-0004Kg-Ra from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 13:05:05 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 4 May 2010 13:05:05 -0700
Received: from 172.30.80.24 ([172.30.80.24]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  4 May 2010 20:05:04 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	04 May 2010 13:05:04 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <z2od1ded4381005041245j8e67e6e9z8790de994abb4e2c@mail.gmail.com>
References: <z2od1ded4381005041245j8e67e6e9z8790de994abb4e2c@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 04 May 2010 13:05:03 -0700
Message-ID: <1273003503.2533.32.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 04 May 2010 20:05:05.0504 (UTC)
	FILETIME=[16AD9600:01CAEBC5]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: GSoC participation
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
X-List-Received-Date: Tue, 04 May 2010 20:08:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-05-04 at 14:45 -0500, Adrian Alonso wrote:
> Hi All,
>=20
> Via the Linux Foundation and Grant L. mentoring help, I will be working o=
n
> OE to
> improve xilinx platforms support and adding Microblaze arch support;
>=20
> Our Gsoc work aims tree areas
> 1. Support most xilinx target platforms
> 2. Add microblaze arch support
> 3. Improve software/hardware co-design work flow
>=20
> Over the lasts moths I've been working on xilinx ml507 board support
> to the point that been able to run xfce46 in this platform, some patches
> are still queued in oe mailing list,  and we want to extend this
> improvements
> to other xilinx boards. Some descriptions of my work can be found at my b=
log
> [1].

Please take a look at
http://wiki.openembedded.org/index.php/Commit_log_example and rework the
first 5 patches please.  And you can incorproate Koen's comment (and
your subsequent patch) to bump PR into one commit.

And it's often helpful to pop into #oe on irc.freenode.net as there's
often someone around that can help out.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


