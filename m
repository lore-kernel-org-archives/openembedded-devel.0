Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1PTEK6-0003jg-To
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 14:56:47 +0100
Received: by wyb40 with SMTP id 40so2618563wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 05:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=AKjJrNd6uA8p4u2TAw7fvRTonRVxHi1pOXN5xjGRbgM=;
	b=HxLR8GS+X8kWwDWBrgn586QdY15JAmR82JhB8AkIEgnqhH5YtMYo2ccY4S5uZVoqrz
	iV6EfPPXPA4uWELgliZOvrH1/e+MYJ3xu5OgCMjpmDPxO8WsCiDOk9N19lb7cK/cUCU5
	/GLv7YRcQdbsqxEc5ymg57KkSez/2BdBKmRxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PNbGRnqY33ZsngPGf13ITxf9np02U1f37INmgsXlwm97s88xeDfcWyP+4F8qRoT25n
	ED+3d7n1kh8zodak/46nQBsTcMmNSSlDlhoo6o1hUhpmJSi05StdB8BaOfYtHVqUkMKg
	mXWX4MVROwZlVV0QXmOw0h35dTAdAF9MZg3ng=
MIME-Version: 1.0
Received: by 10.216.169.71 with SMTP id m49mr9289279wel.4.1292507703044; Thu,
	16 Dec 2010 05:55:03 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Thu, 16 Dec 2010 05:55:02 -0800 (PST)
In-Reply-To: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>
References: <AANLkTinBFLqKJci1P1UZFx6FrrzK5gpm7unsjxEpZ8qk@mail.gmail.com>
Date: Thu, 16 Dec 2010 08:55:02 -0500
Message-ID: <AANLkTikXVCmv0phk5OLOMciBOpC296Z2XtF9jO=Bn1Jn@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-12-10
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
X-List-Received-Date: Thu, 16 Dec 2010 13:56:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

beagleboard beagleboard-linuxtag2010-demo-image is failing with:

http://tinderbox.openembedded.net/packages/1321155/

ti-c6accel

Linking c6accel_app from appMain.o c6accel_testfxns.o
../c6accelw/lib/c6accelw_omap3530.a470MV
c6accel_app_config/linker.cmd..
/lib/libgcc_s.so.1: file not recognized: File format not recognized

Thanks,
Cliff


On Fri, Dec 10, 2010 at 11:05 AM, Cliff Brake <cliff.brake@gmail.com> wrote=
:
> Hello,
>
> We are resuming our weekly testing now that the 2010.12 release is
> finished. =A0The testing-next branch has been synced with the master,
> and is ready for builds. =A0Please update:
>
> http://wiki.openembedded.org/index.php/Testing
>
> with results.
>
> Please do not push to the testing-next branch.
>
> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


