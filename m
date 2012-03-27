Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SCeTr-0001TM-8o
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 00:03:07 +0200
Received: by lagw12 with SMTP id w12so452585lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=d9A8sU1qOO2NhDw5qLh5il6XAMVt5rS/KOCXlj/8yQk=;
	b=L1BsznbayogNAPc37Ga3y0sG0Fi6fr0JVcl6+rXWlfcnG6qrUl0pANs1i9kbtKziO7
	HCF5EDVEtoJtiQMw1bWTnjqhjbeCWE5Gx3iKYbHXyY5GVal3cFhgMbiZHEIq2czlqNdP
	ES8xCbjgEco8EgJWrQzC0EAndBCFPKhbJ1MrJdr1XpwvK/Z57FBWPUVPsnMmGFEVWWqk
	AfJXMRK7zf8wZAYNAnGuv/otkQ6607RSozrht+Dg0tU00vEpwVbORmZPzXYqJEKmjoua
	DucaqvL4x35aONsE8yJn+gc+AJuum/PDUVTBUKcRYYPr1T4g33jaxblX26id8COS5vHA
	+QUw==
Received: by 10.152.146.163 with SMTP id td3mr20077824lab.31.1332885245915;
	Tue, 27 Mar 2012 14:54:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.3.161 with HTTP; Tue, 27 Mar 2012 14:53:35 -0700 (PDT)
In-Reply-To: <cover.1332569901.git.sledz@dresearch-fe.de>
References: <cover.1332569901.git.sledz@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Mar 2012 14:53:35 -0700
Message-ID: <CAMKF1sqkh11vfth_MxHpWAQT82jN_oDkBt75mGdVXDu-jwp+bg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20120324
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
X-List-Received-Date: Tue, 27 Mar 2012 22:03:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 11:20 PM, Steffen Sledz <sledz@dresearch-fe.de> wro=
te:
> Hi Tom,
>
> here's the pull request for the libmatthew fetch problem fix.
>
> Thx,
> Steffen
>
> The following changes since commit 8d2c8f49312f6a0318dc82b6ce85e50bc08dfc=
b2:
>
> =C2=A0ltrace-0.5.3: Update URI to a functioning one (2012-03-14 12:13:19 =
+0100)
>
> are available in the git repository at:
> =C2=A0git://git.openembedded.org/openembedded sledz/pull2
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dsledz/p=
ull2
>

in general when sending pull requests its better to push your repo
into some of user repos e.g. may be on github or somespace so you can
easily delete branches etc. after pull is done.

> Steffen Sledz (1):
> =C2=A0libmatthew-0.7.1: SRC_URI updated
>
> =C2=A0recipes/libmatthew/libmatthew_0.7.1.bb | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> --
> 1.7.7
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


