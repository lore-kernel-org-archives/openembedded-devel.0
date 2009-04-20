Received: from [71.156.96.205] (helo=skymoon.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ckamas@finesse.com>) id 1Lw0Ie-0001ue-L7
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 22:41:08 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Mon, 20 Apr 2009 13:38:41 -0700
Message-ID: <C62896630644CE43BF64B0FF0AC27F0E036714@mail.ad.skymv.com>
In-Reply-To: <gsbug1$b8b$1@ger.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Newbie: Minimal OE build
Thread-Index: Acm/9eRPY7Ii6ADySoG/Is6AFfxFqwB7ocJA
References: <C62896630644CE43BF64B0FF0AC27F0E0366CD@mail.ad.skymv.com>
	<gsbug1$b8b$1@ger.gmane.org>
From: "Chuck Kamas" <ckamas@finesse.com>
To: <openembedded-devel@openembedded.org>
Subject: Re: Newbie: Minimal OE build
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
X-List-Received-Date: Mon, 20 Apr 2009 20:41:08 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Koen,

Do you mean the recipe:
recipes/kexecboot/initramfs-kexecboot-image.bb

Chuck


-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org
[mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
Koen Kooi
Sent: Saturday, April 18, 2009 12:12 AM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] Newbie: Minimal OE build

On 18-04-09 01:57, Chuck Kamas wrote:
> Hi all,
>
> I would like to use OE to build a rootfs plus busybox and a few i2c=20
> tools and that is about it.  What Distribution should I use as my
base?
> Angstrom?

Yes.

> Angstrom seems to pull in lots of things that are not needed like=20
> Bluetooth.

That's not angstrom that's doing this, it's the image recipe. For
example the kexecboot-image binary in angstrom is 80kilobytes in size
for the armv5te architecture.

> Is there a better starting place?

No.

regards,

Koen


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


