Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1Ojq9j-0001lx-0I
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 11:02:34 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Ojq9G-0007la-DP from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 02:01:58 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 13 Aug 2010 11:01:56 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A504270EAC@eu2-mail.mgc.mentorg.com>
In-Reply-To: <1281686825.3858.0.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH]Removing Legacy staging from genboot native recipe
Thread-Index: Acs6vvq1lagQ/F0HSWi6T7pG7qWPCAABx2Yg
References: <1281677993-19478-1-git-send-email-noor_ahsan@mentor.com>
	<1281686825.3858.0.camel@mattotaupa>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]Removing Legacy staging from genboot native recipe
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
X-List-Received-Date: Fri, 13 Aug 2010 09:02:50 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Actually both works with me with "g" and without "g".

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Paul Menzel
Sent: Friday, August 13, 2010 1:07 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH]Removing Legacy staging from genboot native
recipe

Am Freitag, den 13.08.2010, 11:39 +0600 schrieb noor_ahsan@mentor.com:
> genboot: Removing legacy staging
>=20
> * Replaced do_stage function with do_install and replaced
${STAGING_BINDIR} with ${D}${bindir}=20
> Signed-off-by: Noor Ahsan <noor_ahsan@mentorg.com>

A >g< slipped in your email address.

[...]


Thanks,

Paul


