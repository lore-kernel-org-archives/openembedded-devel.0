Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E065E65D6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 13:59:45 +0000 (UTC)
Received: by wifw1 with SMTP id w1so32063604wif.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=99L2R4YxeVzGozqO/yqkUBsbDJFH2sJ7wA6pPLnoZnM=;
	b=gcqd/75oQ+ZzDiLGV0372OlfQyZD4QydfPuA2Acb9w/7TzjoGfYbF2MGQ0wsHs+5h2
	N8dCeRIBr4QoMMaEmJ+vBXaJL/xr5Jd0T/4n7Oj3+YFCdaBVd6Ydd5fn9e0QScdt3CiH
	wXHpoNFBkb4pH7zaq6EIN932DrxDbw8YvYpBfTZuZa6D/eoBrduNthS7uURNNnCJCGff
	0QRzxQFPHVtKPaYiki+qthQ2JX1LD4OWwPo6GyKVaOonxn5TSKOcFP0kqaVdZxHkojp/
	AHkB6Si7NpmHz3xhaIadmFNuB884OQr2zch1vAxc77O06PFdEPZvNza6Ptaaw8lzx48L
	t9fw==
MIME-Version: 1.0
X-Received: by 10.195.11.202 with SMTP id ek10mr48432161wjd.12.1432648786125; 
	Tue, 26 May 2015 06:59:46 -0700 (PDT)
Received: by 10.27.128.68 with HTTP; Tue, 26 May 2015 06:59:46 -0700 (PDT)
In-Reply-To: <1432639251-12249-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432639251-12249-1-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 26 May 2015 15:59:46 +0200
Message-ID: <CAHvQdo3++AkZcmVeMdcbYNxT=G3g5HuMeWwCNT2uhhpTjtzgAg@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] poppler follow up
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
X-List-Received-Date: Tue, 26 May 2015 13:59:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The patch works fine for me. It builds the qt5 poppler libs without
errors/warnings.

Thank you!

2015-05-26 13:20 GMT+02:00 Andreas M=C3=BCller <schnitzeltony@googlemail.co=
m>:
> was pushed ontop of
>
> https://github.com/schnitzeltony/meta-openembedded.git patches
>
> @Johannes: feedback welcome
>
> Andreas M=C3=BCller (1):
>   poppler: fix configure by pointing on moc
>
>  ...dd-manadatory-options-to-find-qt4-qt5-moc.patch | 91 ++++++++++++++++=
++++++
>  meta-oe/recipes-support/poppler/poppler_0.33.0.bb  |  3 +-
>  2 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-add-mana=
datory-options-to-find-qt4-qt5-moc.patch
>
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

