Return-Path: <nilesh.kokane@mindastoneridge.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 38DD265D53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 06:16:20 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so654582wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jul 2014 23:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=Mb1WKYqyQtjy1OlcAWOveaYdPiGQX/FesY39MOMtvkw=;
	b=N05eKc87e0IwYuaBVfuPmi+QNOI9uSnrA0QXzTDp24evuc+ALs0xGuLHXHHxQTD0Gs
	OH9yuFvVsfP58ey6K18U8crbpKalIkzkwUhV3OFvvfiORYlWXYhDPeqG7KmyGWwsLf3X
	apScDH2jA/3Q+HHUX2O6EQc5855DZszvuwtjGvfwuAGV6JebTK5qTCZNYkDT0LI4D3eY
	h2MIIN2TBmIO7hSrz1X1Ywzal06laLTsvLroA82Z4qb7qRqz+wIWTHtttdqCrgUHPJsp
	4gnjqV34bW0uwgqL9bJaSmae6jb1PQgwdyMFChXJQHCMJm7lwPCfZxKHB5GCdc9bl3Vi
	Hz0g==
X-Gm-Message-State: ALoCoQnM1kwd7qigcKQuypLLzvre5e/LpRqsjsRefEDyv92B+g0l7wjnGGAnHhlpR3l9ZDt7R1QHP7eSmDqQRqBdBltYWK3FuSLw6ScMC9W61484hu8c4g9SGSGt23iRSv1XeCcpsREB
MIME-Version: 1.0
X-Received: by 10.194.92.115 with SMTP id cl19mr2809380wjb.29.1406700981526;
	Tue, 29 Jul 2014 23:16:21 -0700 (PDT)
Received: by 10.217.38.72 with HTTP; Tue, 29 Jul 2014 23:16:21 -0700 (PDT)
Date: Wed, 30 Jul 2014 11:46:21 +0530
Message-ID: <CAHURY+30Z_tK7SMRs_vM55vB6gS+zmJiEP66DMegzhvVx3pn8Q@mail.gmail.com>
From: Nilesh Kokane <nilesh.kokane@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: bitbale meta-toolchain-qt5
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
X-List-Received-Date: Wed, 30 Jul 2014 06:16:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,


can anyone tell the steps to bitbake meta-toolchain-qt5.

As, after the /bin/fsl-community-bsp$ . ./setup-environment

i'm getting the options as
Welcome to Freescale Community BSP

The Yocto Project has extensive documentation about OE including a
reference manual which can be found at:
    http://yoctoproject.org/documentation

For more information about OpenEmbedded see their website:
    http://www.openembedded.org/

You can now run 'bitbake <target>'

Common targets are:




*    core-image-minimal    meta-toolchain    meta-toolchain-sdk
adt-installer    meta-ide-support*

Your configuration files at build have not been touched.

/bin/fsl-community-bsp/build$ bitbake meta-toolchain-qt5
Loading cache: 100%
|##########################################################################=
#######################|
ETA:  00:00:00
Loaded 1873 entries from dependency cache.
ERROR: Nothing PROVIDES 'meta-toolchain-qt5'. Close matches:
  meta-toolchain-qt
  meta-toolchain-qte
  meta-toolchain

Summary: There was 1 ERROR message shown, returning a non-zero exit code.




there is no meta-toolchain-qt5.




even in source i checked the /bin/fsl-community-bsp/sources there is no
,meta-toolchain-qt5



please assist.

--=20
Thanks
Nilesh Kokane

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

