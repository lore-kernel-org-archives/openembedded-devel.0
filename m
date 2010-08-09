Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1OiPYd-0005mO-82 for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 12:26:23 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 09 Aug 2010 12:23:28 +0200
Received: from gateinet1.mail.ds.corp ([149.207.23.241]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Mon, 9 Aug 2010 12:25:54 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet1.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 9 Aug 2010 12:25:54 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 9 Aug 2010 12:25:53 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E4A@deimsg40.de.net.world>
In-Reply-To: <1281348153.3767.9.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH] busybox: fix defconfig handling problems triggered
	by "configure according to {MACHINE, DISTRO}_FEATURES";
	added inetd handling (resent)
Thread-Index: Acs3qjdDrbIK8m4ESOyJzFFekuAdBAAAl9Pg
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E17@deimsg40.de.net.world><1281346042.3767.6.camel@mattotaupa><0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5E3E@deimsg40.de.net.world>
	<1281348153.3767.9.camel@mattotaupa>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Aug 2010 10:25:54.0360 (UTC)
	FILETIME=[3F739380:01CB37AD]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: fix defconfig handling problems triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added inetd handling (resent)
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
X-List-Received-Date: Mon, 09 Aug 2010 10:26:26 -0000
X-List-Received-Date: Mon, 09 Aug 2010 10:26:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I would do it myself, but as I am a newbee in OE, git, patchwork and =
bitbake, I don't have the know how to create a real good HowTo.
That should be done by experts.

Regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Paul Menzel
Gesendet: Montag, 9. August 2010 12:03
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] [PATCH] busybox: fix defconfig handling problems =
triggered by "configure according to {MACHINE, DISTRO}_FEATURES"; added =
inetd handling (resent)

Am Montag, den 09.08.2010, 11:40 +0200 schrieb Hauser, Wolfgang =
(external):
> I'll try it again, it's not easy to send out something in a proper way =
from the "restricted area" here. (git-send-email is impossible for =
example)

Thanks.

> But by the way, it may be very useful for newbees like me to have an =
HowTo to create a patch in a proper way, including the necessary git =
commands and a complete example for subject and header data.

There is a Wiki link in [1] pointing to an example [3]. Do you have any
suggestions to improve this Wiki page? Since it is a Wiki you could also
do this yourself.


Thanks,

Paul


> [1] http://wiki.openembedded.net/index.php/Commit_Policy
> [2] http://wiki.openembedded.net/index.php/Patchwork
[3] http://wiki.openembedded.net/index.php/Commit_log_example


