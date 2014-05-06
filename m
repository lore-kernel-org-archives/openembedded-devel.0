Return-Path: <nickdademo@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9A6CD60048
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 22:23:00 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id wo20so171702obc.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 15:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ezz1pPIhWxNRF8p0nH69ywOkWLV19WCTUiO4zmgI6N4=;
	b=IHiZNdCQlQrnvKxn+/k6pCN11QKSD7an25Tc9XCnijk+kY9pI9rx3l7EW4ouMpObrX
	QVRkerGG28VU7804tq+UYtlyAw1LfEfXgoJdTkC+GcW7XdhaR8zXf7Qejm0PMF/ODN00
	pQQ+B5OvqJeT4o9RfuoXiqcbhNCmXXHXffUSSOo/+pHd4ISJkUXnCfZS4+BzvHx4+bwe
	4y0HW8I9GU/XlrJfuSE4uD1h+BxspjnU7LwLPY8MWiu9ez4oTUd7/MIlV9ixfh63dyOu
	f3LDfGDxMT0kDdsTjxxZq5rIy+t7uP9LiJuLE7JNWLBkRsQRPDBJK142464O+3NxddpS
	WHFg==
X-Received: by 10.182.33.99 with SMTP id q3mr40896297obi.33.1399414981092;
	Tue, 06 May 2014 15:23:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.85.33 with HTTP; Tue, 6 May 2014 15:22:41 -0700 (PDT)
In-Reply-To: <20140506152156.GA30955@jama>
References: <1399376593-8768-1-git-send-email-nickdademo@gmail.com>
	<20140506152156.GA30955@jama>
From: "Nick D'Ademo" <nickdademo@gmail.com>
Date: Wed, 7 May 2014 08:22:41 +1000
Message-ID: <CANR6C56u3pMTtCcDZN7CZVyMPe-wsKPBmmFYoDkgYTEjxs6LzA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git. Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
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
X-List-Received-Date: Tue, 06 May 2014 22:23:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks - resubmitted.


On Wed, May 7, 2014 at 1:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, May 06, 2014 at 09:43:13PM +1000, Nick D'Ademo wrote:
> > ---
>
> You need blank line between subject and SOB line otherwise it's all
> considered to be subject.
>
> >  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/recipes-support/opencv/
> opencv_2.4.bb
> > index df512f6..43e6a2b 100644
> > --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET = "arm"
> >
> >  DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib
> glib-2.0"
> >
> > -SRCREV = "a4b34e7ae10351fc4d30dc55995679340efc488e"
> > +SRCREV = "df8e28283f09825cca0c2902160b7abebcfe1b64"
> >  SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
> >             file://opencv-fix-pkgconfig-generation.patch \
> >  "
> >
> > -PV = "2.4.8+git${SRCPV}"
> > +PV = "2.4.9+git${SRCPV}"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

