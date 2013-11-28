Return-Path: <cjb.sw.nospam@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7DB6D4FC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 21:00:36 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g15so6189756eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 13:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:from:content-type:in-reply-to:message-id:date:to
	:content-transfer-encoding:mime-version;
	bh=YPeeYLz9VcOoa6UqQAGV/rMKFiQ+I0M68MgWkFAmniU=;
	b=e0DJ2IfilCGgOvsurT4sO6WDF+sYiyyqJqAGnwDP44j3kmTFWNVX/nQDBOxBingAo7
	Zj30Ww83aQiFvBfSNmbbMC5pBcSFsFQFOqRbTsiN2SCsmIhvR4fIfYqJJ8U3RJRLWyt8
	ZrhjLUaGgJnbWIS01oxiY9mh7XTV7Con1RJyU0Z/q+lVR0IcJ73hcE9Jq8PJ3wooD85l
	AA2H588BbyZEAAWh602DdbG+ccUelr2hOe5PuDQAFqoiZL2mYnzATWZFjMGbGJ3XUR5+
	aVaR303/YkL/t8u04vI/vZCs9BI6BKYyMGjDR1Ndy7DPxyBSlQcMjVVAciNlx4/oVoJA
	5O7w==
X-Received: by 10.14.173.7 with SMTP id u7mr2138896eel.24.1385672435966;
	Thu, 28 Nov 2013 13:00:35 -0800 (PST)
Received: from [10.45.218.135] (to-18-82-181.service.infuturo.it.
	[151.18.82.181])
	by mx.google.com with ESMTPSA id h3sm8587516eem.15.2013.11.28.13.00.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 28 Nov 2013 13:00:34 -0800 (PST)
References: <548EF836-E57E-42CC-8E0A-0D77045DE0AE@gmail.com>
	<20131127214440.GR2870@jama>
From: Simone <cjb.sw.nospam@gmail.com>
X-Mailer: iPad Mail (11A501)
In-Reply-To: <20131127214440.GR2870@jama>
Message-Id: <34764D13-4A13-431F-B39D-E1B61004BBE9@gmail.com>
Date: Thu, 28 Nov 2013 22:00:33 +0100
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Meta-qt5 sdk
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
X-List-Received-Date: Thu, 28 Nov 2013 21:00:37 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hello Martin,
Thank you for your reply!
I want to test this sdk, but i don't know how to build it.

What i have to bitbake?
What does it produce? An installer?
Gdb is included?

Thank you for your time!
Regards
Simone





> Il giorno 27/nov/2013, alle ore 22:44, Martin Jansa <martin.jansa@gmail.co=
m> ha scritto:
>=20
>> On Wed, Nov 27, 2013 at 09:26:37PM +0100, Simone wrote:
>> Hello to all,
>> I'm new to this mailing list.
>>=20
>> I'm writing because i want to ask the actual status of meta-qt5 layer.
>> Actuallly, we are able to build qt5 with examples for our fsl based platf=
orm.
>> The problem is that, compared to qt4, there is no meta-toolchain-qt5 avai=
lable.
>> The problem is how to configure host system (development pc with qtcreato=
r) for cross compiling application and deploy/debugging them to remote ARM t=
arget.
>>=20
>> As for qt4, it would be necessary the famous toolchain that contain all l=
ibraries, paths and links for qt5, to cross develop application for arm targ=
et.
>>=20
>> Is this job planned to do by someone?
>> If not, there is an alternative solution (maybe documented) to configure q=
tcreator manually?
>>=20
>> I think it would be very useful also for a lot of other people.
>=20
> Yes it would, please check
> https://github.com/meta-qt5/meta-qt5/wiki/SDK
>=20
> and test/review proposed solution.
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

