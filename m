Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Oob5X-0006Ws-7I for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 13:57:50 +0200
Received: from unknown (HELO de-gate1.mailhub.intra.corp) ([53.154.243.33])
	by mail-dotnet2.eads.net with ESMTP; 26 Aug 2010 13:53:05 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate1.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.6713); 
	Thu, 26 Aug 2010 13:56:53 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 26 Aug 2010 13:56:53 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 26 Aug 2010 13:56:51 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4575@deimsg40.de.net.world>
In-Reply-To: <AANLkTinFzZ=eTH0yvg=8Dp=-+J_1N9U0gKcOQm8QSV+h@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Patch procedure for dummies
thread-index: ActFFOocT1Qb4jFiR5mwWUCyHUZOWgAAD2pQ
References: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com><AANLkTikXMR7j0r20XWCdMpDa69P92m6wbPLZVNH_Nob_@mail.gmail.com><0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4563@deimsg40.de.net.world>
	<AANLkTinFzZ=eTH0yvg=8Dp=-+J_1N9U0gKcOQm8QSV+h@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 26 Aug 2010 11:56:53.0317 (UTC)
	FILETIME=[C6440F50:01CB4515]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patch procedure for dummies
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
X-List-Received-Date: Thu, 26 Aug 2010 11:57:51 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In an earlier mail, I was told that it doesn't matter for patchwork if a =
patch is sent as an attachment.

We are pinned on Outlook here and webmailers are filtered out by the =
proxy, so I need to send patches via Outlook.
Easiest way in Outlook is an attachment.

Regards=20
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von Frans Meulenbroeks
Gesendet: Donnerstag, 26. August 2010 13:50
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Patch procedure for dummies

2010/8/26 Hauser, Wolfgang (external) =
<Wolfgang.Hauser.external@eads.com>:
> Thanks from me too, but for me it would be helpful to add the =
necessary steps for people which don't have
> snmp access for git and have to send patches through the allowed mail =
client as an attachment.

Patches should not be set as attachment but inline.
If you do not have snmp access to your email account you have two =
options:
1. use a different account (e.g. gmail). you can make one especially
for this. Note that the account may differ from the one in signed-off
(although that is inconvenient)
2. just include the patch in the body of your email. Make sure you use
an email client that does not touch the message (turn spaces in tabs,
wrap lines etc etc).
In the past I did this. A good mail client to do so is pine (or alpine)

Frans

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


