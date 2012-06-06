Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ScIBP-0003nE-UX
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jun 2012 17:30:09 +0200
Received: by eekd49 with SMTP id d49so2327708eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2012 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=YZJXf/xKhatToODZ/LqwyEkVgG2j0ldSxzDyati3JsU=;
	b=bZmm9xORFm66D20/fSwKNf1TLb96ODEvp9JfaCIu5ezFkSo5j1ocqLSPNGelBniyV5
	nhu3/G6xYClmfmv5F9rOQtNocHtZA4YNBbMJYyoWIm+tlHzrpuHjcGAPb/LYLnIUkyzA
	n7MEphEqrkqvSXz9JCUAOT/L0bIyJl3rlw9CN3dcyWHd+CzBMBpSm62PhpCWV+5E7Pvw
	3srAiJ26rAPiRvSoH8/dSkzuqnee6iazILi8adR03BS8C4BObvcmqYyWiFiONMbQB4kw
	U8Vl0/U3bbmVN2WIPrxpztyFzO+BbEzhkGNkYzT/JKKYsvm7Smqh40tfG44ZFGlBvCOF
	b9+w==
Received: by 10.14.97.135 with SMTP id t7mr9395411eef.177.1338995976516; Wed,
	06 Jun 2012 08:19:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 6 Jun 2012 08:19:06 -0700 (PDT)
In-Reply-To: <0A3F8C22-BFEA-4496-BC09-D86717640DE7@gmail.com>
References: <0A3F8C22-BFEA-4496-BC09-D86717640DE7@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jun 2012 08:19:06 -0700
Message-ID: <CAMKF1spA0Jovt75MLNAh62jPCbrxWPOR1bia4iuTv0UxsndJkg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [poky] Updating qemu recipes
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
X-List-Received-Date: Wed, 06 Jun 2012 15:30:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 5, 2012 at 12:31 PM, Elvis Dowson <elvis.dowson@gmail.com> wrot=
e:
> Hi,
> =C2=A0 =C2=A0 =C2=A0The qemu recipes are a bit old at 0.15.1. The latest =
release appears to be at v1.1.0.
>
> I notice that there are a bunch of patches inside the qemu-0.15.1 recipe =
folder. Would it be safe to assume that all these patches have made it's wa=
y to the latest v1.1.0 release?

there is a desire to keep these patches afloat for qemu especially the
gl ones but they need major facelift to apply on 1.x

>
> Perhaps I could just update the qemu_git.bb recipe, since that is behind =
at 0.14.


yes I have patches which has not been accepted in OE-Core yet.
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/misc=
&id=3D3b394f50a6ed10f2e3eaf5e0f8d98d3b369671cb

>
> Best regards,
>
> Elvis Dowson
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


