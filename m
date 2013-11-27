Return-Path: <cjb.sw.nospam@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE806DE3E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 20:26:38 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id x13so7306513wgg.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2013 12:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:from:content-type:message-id:date:to
	:content-transfer-encoding:mime-version;
	bh=qWve8YORv8YJ/dqQLz5Q6T0vdgfqURx2JS3ZpvxE2VA=;
	b=0dddTXkseQK+rGqD+55ot2mL6o5Y+dSt/kPrGnNSiq87RizreuXiyUPHsIWdCnUlRi
	2AczTb2b1t6HZ0Op8cywKkFzHk0vHXRW5EenF4tNtNEZJFhwf156F88Ve25Zuuop6iEC
	9wm383fVcfkACLc16kHeJWfvV1UfLUMGD4hE7L9hEeFRCtaGNSzzxRr6BgvTQlRlYlzn
	XEriiCvyyUKdMt98dfmtjEKDSugVORkN8SBhS+42D8ZnTa+3DyT8S9kdXpNZFiOaunB8
	RIMB1ysbMKl+MPM+h7BF0PFD5Gj/z7HCB9VAr52A6ZaztfHKH4Hx5nYu+4y52STIrFz0
	TMyQ==
X-Received: by 10.180.160.239 with SMTP id xn15mr24220801wib.17.1385583997826; 
	Wed, 27 Nov 2013 12:26:37 -0800 (PST)
Received: from [10.12.214.143] (to-18-93-73.service.infuturo.it.
	[151.18.93.73]) by mx.google.com with ESMTPSA id
	bk7sm74711949wib.10.2013.11.27.12.26.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 12:26:36 -0800 (PST)
From: Simone <cjb.sw.nospam@gmail.com>
X-Mailer: iPad Mail (11A501)
Message-Id: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
Date: Wed, 27 Nov 2013 21:26:37 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (1.0)
Subject: Meta-qt5 sdk
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
X-List-Received-Date: Wed, 27 Nov 2013 20:26:39 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello to all,
I'm new to this mailing list.

I'm writing because i want to ask the actual status of meta-qt5 layer.
Actuallly, we are able to build qt5 with examples for our fsl based platform=
.
The problem is that, compared to qt4, there is no meta-toolchain-qt5 availab=
le.
The problem is how to configure host system (development pc with qtcreator) f=
or cross compiling application and deploy/debugging them to remote ARM targe=
t.

As for qt4, it would be necessary the famous toolchain that contain all libr=
aries, paths and links for qt5, to cross develop application for arm target.=


Is this job planned to do by someone?
If not, there is an alternative solution (maybe documented) to configure qtc=
reator manually?

I think it would be very useful also for a lot of other people.

Any suggestion?
Regards
Thanks=20
Simone



