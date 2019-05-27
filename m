Return-Path: <nick83ola@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2822D7DFE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 15:39:08 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id a25so2524625lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WsLEfM5bzYdrXTpalRcWibalspEdwAlBAVmjS5XbqAE=;
	b=W26nK+CQkgMTb4O5JXtrFsvWpOmeMvYcD0GyjrUAAmuwlICCHeKHAHJB5/BkUV1xi6
	ZRysDdauqDKl5SRD4y2J3sjtIQvyVkZ4r6Yma6oS/VnUBflBQRJUeWIfQvSrB48Q57LT
	PCEoC3XpUfGp9tMwtDY462ZRjpbpNOr1aQgzmOIt73JlMNH+/+qZsa2E7kRiVz0Q5QTY
	06yftqpDWBCTB25kRaiP2Y9f1a1t1vkmq/GHwSN0MxtlXdV57U6Eh+W4g+czzhWaDPbh
	oGyMpcuOwYw4LuqsUTg5eOg/hJY0CBJx7b2AUDiV6quZUk8WtuzrIJ9nc12S5GA7Je/D
	0PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WsLEfM5bzYdrXTpalRcWibalspEdwAlBAVmjS5XbqAE=;
	b=YuMQaKiQXyK7ctGS+ayxhnutZRW5c098HVRLxRQAMRTlmPRCGSzTau4qt3BJyCbAsk
	xWv3n56LOSIirgNKuNCluarAlBGJ0DoolpLmarb5VOOir92Zq8IWKX8g5s+qmDVLFDP/
	GI4rHCHnw8uoOw5VYmFMIU92xY1lFdmFP38tiNq5YSaUUtczSt8Vc67QcjpwpHppCv7F
	Bewm3gJm28zu3/d7ncGyZHpOYPpT5U0GCvR5sqvhJzdrtEQDMwoWCl2PhdfTcnNIJsq1
	lTT/nCNVaVA9GhO3aM6kMp+No3GeWlZc75uiXbLELW3aWVbfFu48UOF/YuaG7Bad1RtG
	E2hg==
X-Gm-Message-State: APjAAAVNJIWMp9XJDmvZXYHD+4crSqWTm/OJXTBW+OSgsW8I/JrAVxSo
	khfnAH3hjyhBhP2OZIP++r7iIypedjXK2GBY+EU=
X-Google-Smtp-Source: APXvYqzvep7MEGCU23mOwxiUMuY+uRJ+A90sPeKQYd1M7yb9tRxz2VLcJDjgLLomxQd6fqTIvvy8nEWOPcVJTEMI3+0=
X-Received: by 2002:ac2:4c21:: with SMTP id u1mr10648992lfq.33.1558971548732; 
	Mon, 27 May 2019 08:39:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190527095310.4890-1-nick83ola@gmail.com>
	<CAMKF1sob5rYA2vYTAcGEeBVX=pLHcZJg1RF3x4RDPYBjb0MP8g@mail.gmail.com>
In-Reply-To: <CAMKF1sob5rYA2vYTAcGEeBVX=pLHcZJg1RF3x4RDPYBjb0MP8g@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 27 May 2019 16:38:57 +0100
Message-ID: <CABPh3UN4fqJr0435mh9ztk3zDUaju0zCCQmwN7qVr_R+bBw8FA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH 1/2] nginx: update to version 1.17.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 May 2019 15:39:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem,
are you talking about the LIC_FILES_CHKSUM?

Thanks
Nicola Lunghi

On Mon, 27 May 2019 at 16:25, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mon, May 27, 2019 at 2:54 AM Nicola Lunghi <nick83ola@gmail.com> wrote:
> >
> > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb | 6 ------
> >  meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb | 6 ++++++
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >  delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> >  create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > deleted file mode 100644
> > index 5e6dc33e9..000000000
> > --- a/meta-webserver/recipes-httpd/nginx/nginx_1.15.7.bb
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -require nginx.inc
> > -
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=3691402cc54ce09f800ca348634a2dfe"
> > -
> > -SRC_URI[md5sum] = "719b2e3d416f111fecc9db6625553658"
> > -SRC_URI[sha256sum] = "8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93"
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > new file mode 100644
> > index 000000000..8774a87ff
> > --- /dev/null
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.17.0.bb
> > @@ -0,0 +1,6 @@
> > +require nginx.inc
> > +
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
> > +
>
>
> why is checksum different please mention it in commit msg
>
> > +SRC_URI[md5sum] = "56767fd62302508295b31adc48b99a59"
> > +SRC_URI[sha256sum] = "e21b5d06cd53e86afb94f0b3678e0abb0c0f011433471fa3d895cefa65ae0fab"
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

