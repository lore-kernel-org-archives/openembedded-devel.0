Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Qqcef-0006an-MT
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Aug 2011 05:06:57 +0200
Received: by iyf13 with SMTP id 13so12256962iyf.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2011 20:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=PO1qiHeOHTX4jxscPtSWTl18Pd62jFZbEqXtany8Kl4=;
	b=IZs4dbm0tQ0cQ5WfYEVxqA79zUeirCIZVDGmfCl2o/RIu2je9xoMCnCzZrA7Z1ALfw
	jXbuXtuSFswNybtch8Lt5AH64DqfKPRU9D0ywIskFcLbRxnsFRapT0WT4aBELMrttxXu
	jh5oj6+Snwa4Z+D9bBdnsGJdbTZztkb+bVH+w=
MIME-Version: 1.0
Received: by 10.42.29.193 with SMTP id s1mr6099375icc.439.1312858947818; Mon,
	08 Aug 2011 20:02:27 -0700 (PDT)
Received: by 10.42.213.1 with HTTP; Mon, 8 Aug 2011 20:02:27 -0700 (PDT)
In-Reply-To: <1312827980.683.6.camel@jjg-linux>
References: <1312821482-32319-1-git-send-email-jgilles@multitech.com>
	<1312827980.683.6.camel@jjg-linux>
Date: Mon, 8 Aug 2011 20:02:27 -0700
Message-ID: <CA+M6bXnpR1x0PRL7Pxgoo4sHxzvLgBGMP9D2rESp3g244xCsxQ@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] jakarta-libs: fix SRC_URIs for avalon-framework, logkit
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
X-List-Received-Date: Tue, 09 Aug 2011 03:06:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 8, 2011 at 11:26 AM, Jesse Gilles <jgilles@multitech.com> wrote=
:
> Please apply to 2011.03-maintenance. =A0Without this patch, building
> openjdk from scratch (no sources dir) fails because the
> avalon-framework-api tarball can't be downloaded. =A0Apache.org put up a
> placeholder page for http://www.apache.org/dist/excalibur/ that ends up
> getting downloaded instead of the tarball.

I don't object to the change but it (a) needs to be in oe.dev (or
oe-core/meta-oe) first and then (b) please send a pull request or git
send-email of your cherry-pick.  Thanks!

--=20
Tom


