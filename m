Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OokXR-0002mT-Fv
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 00:03:14 +0200
Received: by eyb7 with SMTP id 7so1764298eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Aug 2010 15:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=lxmNUhpE2MAlHYivTa//IIJRMsfv2/DsvnInOTwG598=;
	b=isGpwnRR5hfSn1LbUKWr1vKInnDbj/OVuxwDqd+XFyh/XYxR4apjJeqdL4LvaUy94b
	6i/JP2u0ok+Kr0rVivEOQd2B3HfuxfUucFIC03g25Ewu1VJPpuiU17pwzEVpeXnbEn2W
	1+z+8UEO66llEqVOlg7MgqbWgcfUR9/8g2aok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=Z/VeK4t65EVEDcVgwNlORX4M72cXh74oHpg2A7wjDJfwckF4iWDew5l1/gFQmkyDO+
	C2zAmx3YYSGVKxoHv1t82fACiWlsQ637UoqQTDeNDggJGZM/tBQUiF2ZMpAdAh8FKUDe
	+7veRCGVbY4bz0Jscd68PlJCZq5+L/koB2wNw=
MIME-Version: 1.0
Received: by 10.216.10.77 with SMTP id 55mr9470251weu.17.1282853453658; Thu,
	26 Aug 2010 13:10:53 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Thu, 26 Aug 2010 13:10:53 -0700 (PDT)
In-Reply-To: <4C76C597.9050302@mlbassoc.com>
References: <AANLkTim6-d4krhcMuAZojQVNdy3W-m_ON-mOvK5y3tqn@mail.gmail.com>
	<4C76C597.9050302@mlbassoc.com>
Date: Thu, 26 Aug 2010 16:10:53 -0400
Message-ID: <AANLkTinnnfOCw3m_q6_d27o9Luyw4dWS-uVhJzYUTTbZ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2010-08-23
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
X-List-Received-Date: Thu, 26 Aug 2010 22:03:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 26, 2010 at 3:50 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 08/23/2010 05:49 PM, Cliff Brake wrote:
>>
>> Hello,
>>
>> As detailed in the following page, we are trying to get a testing
>> branch going where we try to verify OE builds for a number of
>> combinations of distro/machine/target/
>>
>> http://wiki.openembedded.net/index.php/Testing
>>
>> I have branched dev.oe.org to the testing-testing branch, and have
>> verified it builds the following.
>>
>> beagleboard =A0 =A0 angstrom-2008.1
>> beagleboard-linuxtag2010-demo-image
>> =A0 =A0 =A0 =A0Ubuntu 10.04 64-bit =A0 =A0 User:Cbrake
>> beagleboard =A0 =A0 angstrom-2008.1 =A0 =A0 =A0 =A0 console-image =A0 Ub=
untu 10.04
>> 64-bit =A0 =A0 User:Cbrake
>
> To be clear, a line with an entry in the 'last tested' column indicates a
> successful build of that combination?

Yes, that is my current idea.  I changed the name of the column to
"last successful build" to be a little more clear.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


