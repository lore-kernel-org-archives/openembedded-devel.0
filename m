Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkPBp-0002nO-Q6
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Jun 2012 02:36:01 +0200
Received: by werg55 with SMTP id g55so1830040wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jun 2012 17:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=d4PyF2UJzunBHPSmKkrssZvEyx29IsZ7EmLdn1j5Th4=;
	b=gpgs2npJQAZmqIU7nlkgXJVYA+VZGtDCYCBo0MaPt4uFRwtecdgQPy1snytHERs+lG
	PKlmKICHRjA7hTPi8nxo47xlYmO/1Ats8u+83aO6Mwwc3uiP1HQ3D3d1ujJBVun57QFD
	rSdWNOPPSF1AnACUYgbiNoz02ATJUsGMnBx9uHpJjQt+hnQFrB6brqUqQCL9dHZUfVPp
	g/ExbVCzOX2Xk0cVefd9oL/OADkHOU+OdmCGW7TQd5MVKYZXzRCJvM6yELl4e9FI1zpR
	iLkuKYBJmcfmZ/M2QCGI53FHz+rjWF6GDXcZ/nDbcML9dfoqfsUAq8nCRdC2rkAHDf7x
	0K2Q==
Received: by 10.180.97.135 with SMTP id ea7mr643212wib.11.1340929506729; Thu,
	28 Jun 2012 17:25:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.30.34 with HTTP; Thu, 28 Jun 2012 17:24:36 -0700 (PDT)
In-Reply-To: <20120628174041.GB24537@localhost.jama.net>
References: <CADZ6=avV5=3g9CkMMDc9cKLUpw_-Bk_q7fb5MceJmtR0gH6YvQ@mail.gmail.com>
	<20120628174041.GB24537@localhost.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 17:24:36 -0700
Message-ID: <CAMKF1spLCxsBLtUKpFzF18xM3Wa7FNTRiM8BCX-V0EmdbGUPPw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-oe breakage since oe-core removed gcc-4.6
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
X-List-Received-Date: Fri, 29 Jun 2012 00:36:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 28, 2012 at 10:40 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> khem's patches which removed it from oe-core said:
> gcc-4.6: Retire into toochain-layer
>
> so I guess he has some patches adding whole recipes to toolchain-layer
> (I had a feeling that I've even seen them somewhere, but cannot find
> them later).

the patch is here
http://git.openembedded.org/meta-openembedded-contrib/log/?h=kraj/move-gcc-4.6

Koen

Please pull it

I did not post it since it would hog patchwork


