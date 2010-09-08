Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1OtHaU-00077A-14
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 12:09:11 +0200
Received: by qwa26 with SMTP id 26so5444842qwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 03:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=qt3UuPei4WEal6WE0vYuXXsYAPz6uAqT0Lqb1XspDxQ=;
	b=yFiQEpAmkq6qvs2qCCg8jxNq/Kl6AQYzxs4W0iWoEsT4//ZNcVXsxcT7JFUIm3fDOu
	AdMw/iu8zw4airFroHQk61VN2hBEgVpxasNYN0bQoqfN5DABpbFTFdpGz+xwU4C2QBt6
	3Kzvd227duMzUI1j5jc08qMh8IkPgvuiwu6NQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=vI9jHO1w4o4Wm8rhg74fNdhzDpohvuUBKur0fU6rLSZUk1DJ3bZ6Z/ZcBIOiLuT4Vt
	Yr5KL9n+0eDHwfmotF9wkIv0Y+M+2pJQBM+x3cst41xPfU059tvenkukaK95w0UWfaWd
	1Gq28qq3Fy1A1UTCpNOF14Xl1PTlKqHuUbRus=
MIME-Version: 1.0
Received: by 10.229.89.15 with SMTP id c15mr5878253qcm.202.1283940503863; Wed,
	08 Sep 2010 03:08:23 -0700 (PDT)
Received: by 10.229.218.79 with HTTP; Wed, 8 Sep 2010 03:08:23 -0700 (PDT)
In-Reply-To: <AANLkTimmcz6jgqVnQmA21OAdUPCu4TqeCPO20hVSd-BQ@mail.gmail.com>
References: <1283523286-30999-1-git-send-email-michael.lippautz@gmail.com>
	<1283523286-30999-2-git-send-email-michael.lippautz@gmail.com>
	<AANLkTin9pQfGPRHfp5kro__vknb_Wn+Qb-Zh9Hfn-vSH@mail.gmail.com>
	<AANLkTimmcz6jgqVnQmA21OAdUPCu4TqeCPO20hVSd-BQ@mail.gmail.com>
Date: Wed, 8 Sep 2010 12:08:23 +0200
Message-ID: <AANLkTi=-drL9CWmjPqu20cXJHEEY4W7YqNJ=QiR2cr9v@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] x-load/igep0020.conf: Unbreak x-load for igep0020 machine.
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
X-List-Received-Date: Wed, 08 Sep 2010 10:09:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bump, as it blocks any igep0020 image from building.


