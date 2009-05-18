Received: from [209.172.120.180] (helo=skymoon.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ckamas@finesse.com>) id 1M6CId-00060Q-Va
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 May 2009 01:31:16 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 18 May 2009 16:23:56 -0700
Message-ID: <C62896630644CE43BF64B0FF0AC27F0E05AF89@mail.ad.skymv.com>
In-Reply-To: <gupktd$gr8$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Kernel modules
Thread-Index: AcnXHWaMTkeYyStEQCmEbp1SEi1gjwA8jETQ
References: <C62896630644CE43BF64B0FF0AC27F0E05AF1C@mail.ad.skymv.com>	<gulv2v$l9r$1@ger.gmane.org><C62896630644CE43BF64B0FF0AC27F0E01C6E5@mail.ad.skymv.com>
	<gupktd$gr8$1@ger.gmane.org>
From: "Chuck Kamas" <ckamas@finesse.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Kernel modules
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
X-List-Received-Date: Mon, 18 May 2009 23:31:16 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen,

Thanks, I'll give that a try.

Chuck


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Koen Kooi
Sent: Sunday, May 17, 2009 11:27 AM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] Kernel modules

On 17-05-09 20:13, Chuck Kamas wrote:
> Thanks,  I add a rrecommends for each kernel module I have in my
.config.
>
> BTW, is there a way to have OE scan the kernel .config and
automatically pull in all the kernel modules?

RRECOMMENDS =3D "kernel-modules"

regards,

Koen


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


