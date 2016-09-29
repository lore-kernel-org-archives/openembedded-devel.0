Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9F48765C5B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 07:09:13 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id y190so35020411vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Sep 2016 00:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bh2ivIhweocETGU8yfuJFsJntk6DB+K/ORisEgLsTtM=;
	b=ofSUL26WseqgiWpTOYYl2kMPn6VnZUddfOVwlQ1P41UqC9s5bmFfB/xNNczpZdlXZ+
	hCeCo/c2J5dmTLllgtbOGZUlCaE7iABR0a2fth0B5Nh/QHXJ7eYo6QPCoefhGCjWIKWH
	FpcO7W/KRHgpoNjTEQe7YpzmdgeKi9JKfiwGLAoy1zQl6pKJomYsa7/DHkyp6LBRQtYj
	xSTYrGFPkycOO2+BHDe8wSiXlxiwF3WpkSv6Rr8YHJKRsL6eDe0ovfsNpHbg5uNINM0Y
	x6Y/Vca5uOLHiF1gPLtMxRdXqkb4Vjpdfu8WvsRzovEOPP2A30qR9zqXpHII6rVQ3WX4
	8JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bh2ivIhweocETGU8yfuJFsJntk6DB+K/ORisEgLsTtM=;
	b=JMKdTMzDYVELGj5HuNJ4eV5tLhXkiCzaLMGf3Buh5Y3Huw+veZFkHHXNTQlOLWDPtx
	0fkboic5VOyjZOp7cn+NJ3jnz1qZQJZp3L9PBKHIz1NMZd/cHeaoz9mExqffQAhRFby2
	QZZlzIY4Ks8I3RzjBrgTU5Gm/Bu/KEjzSCDbvtzPzbSVhp0tZlo/D+l7OMn+rCYufj7P
	qDLXGdwcXT28zvqYYLfnLw/DY4a4+kmezHm9q+HWlb+r02OUG3UzdWgNmgkoUq8hYjNG
	clNcLgUSc+lhBgK1WjDPMa+6I46LKDzzsj1KT/KDicHYbb5JAjztJ5eF+DxhomISJP3c
	0PjA==
X-Gm-Message-State: AA6/9Rmorh3wOnxIy4jyAu0UA+pd04sghkecWm6CPPlUWRAusssQP7e2jPz6VidMwpOtI8WfXVpXadIVFiZjQw==
X-Received: by 10.31.82.130 with SMTP id g124mr20125759vkb.72.1475132954380;
	Thu, 29 Sep 2016 00:09:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.114.9 with HTTP; Thu, 29 Sep 2016 00:09:13 -0700 (PDT)
In-Reply-To: <8ca5d779-dd4a-e01c-a34c-3110ccf9fcf0@rubdos.be>
References: <20160822143457.6378-1-ruben.de.smet@rubdos.be>
	<75048f87-6738-f678-b085-7bdc337b89e6@rubdos.be>
	<9d9e512d-a454-e917-a6f0-d3bd0ba381e7@gmail.com>
	<8ca5d779-dd4a-e01c-a34c-3110ccf9fcf0@rubdos.be>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 29 Sep 2016 00:09:13 -0700
Message-ID: <CANx9H-C02yHDEK8kNXb-k+x9aO3Zot8UbUAqRJW+M9OqXuyV0Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][krogoth][PATCH] python-cassandra-driver: add recipe for version 3.6.0
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
X-List-Received-Date: Thu, 29 Sep 2016 07:09:13 -0000
Content-Type: text/plain; charset=UTF-8

Please resend without [krogoth] but with [meta-python] as indicated in the
layer readme.

In this case, "upstream" is not what you mean. You mean "master".

Cheers.

On Thursday, September 29, 2016, Ruben De Smet <ruben.de.smet@rubdos.be>
wrote:

> On 09/29/2016 02:10 AM, akuster808 wrote:
> >
> > Ruben,
> >
> > On 09/28/2016 12:26 PM, Ruben De Smet wrote:
> >> Hi,
> >>
> >> Any chance these things could get merged? Would be for both upstream and
> >> krogoth.
> >
> > Sorry, Stable releases do not accept the addition of new packages.
>
> Oh. Would it be possible to have them in the next unstable then?
>
> Ruben
>
> >
> > regards,
> > Armin
> >>
> >> They do depend on my
> >>
> >>   pypi: update the base pypi url to use the package info without
> >> requiring the hash
> >>
> >> backport.
> >>
> >> Ruben
> >>
> >> On 08/22/2016 04:34 PM, Ruben De Smet wrote:
> >>> A Python library for Apache Cassandra
> >>>
> >>> Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be <javascript:;>>
> >>> ---
> >>>   .../python/python-cassandra-driver.inc              | 21
> +++++++++++++++++++++
> >>>   .../python/python3-cassandra-driver_3.6.0.bb        | 16
> ++++++++++++++++
> >>>   2 files changed, 37 insertions(+)
> >>>   create mode 100644 meta-python/recipes-devtools/
> python/python-cassandra-driver.inc
> >>>   create mode 100644 meta-python/recipes-devtools/python/
> python3-cassandra-driver_3.6.0.bb
> >>>
> >>> diff --git a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> >>> new file mode 100644
> >>> index 0000000..d3e4cf6
> >>> --- /dev/null
> >>> +++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> >>> @@ -0,0 +1,21 @@
> >>> +SUMMARY = "DataStax Python Driver for Apache Cassandra"
> >>> +DESCRIPTION = "A modern, feature-rich and highly-tunable Python
> client \
> >>> +library for Apache Cassandra (1.2+) and DataStax Enterprise (3.1+)
> using \
> >>> +exclusively Cassandra's binary protocol and Cassandra Query Language
> v3."
> >>> +HOMEPAGE = "https://github.com/datastax/python-driver"
> >>> +SECTION = "devel/python"
> >>> +LICENSE = "Apache-2.0"
> >>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba
> 93"
> >>> +SRCNAME = "cassandra-driver"
> >>> +
> >>> +SRC_URI[md5sum] = "756a3b235c5766c3072ed62e1083c9ef"
> >>> +SRC_URI[sha256sum] = "049c8a871e49052c7b72fddb6569f1
> bfe738bbfea0a562eeeb5404abeff015ab"
> >>> +
> >>> +DISTUTILS_BUILD_ARGS += " \
> >>> +    --no-libev \
> >>> +"
> >>> +DISTUTILS_INSTALL_ARGS += " \
> >>> +    --no-libev \
> >>> +"
> >>> +
> >>> +inherit pypi
> >>> diff --git a/meta-python/recipes-devtools/python/python3-
> cassandra-driver_3.6.0.bb b/meta-python/recipes-devtools/python/python3-
> cassandra-driver_3.6.0.bb
> >>> new file mode 100644
> >>> index 0000000..65fd2c0
> >>> --- /dev/null
> >>> +++ b/meta-python/recipes-devtools/python/python3-
> cassandra-driver_3.6.0.bb
> >>> @@ -0,0 +1,16 @@
> >>> +inherit setuptools3
> >>> +require python-cassandra-driver.inc
> >>> +
> >>> +RDEPENDS_${PN} += "\
> >>> +    python3-cython \
> >>> +    python3-multiprocessing \
> >>> +    python3-six \
> >>> +    python3-json \
> >>> +    libevent \
> >>> +"
> >>> +RDEPENDS_${PN}_class-native = ""
> >>> +
> >>> +DEPENDS_${PN} += "\
> >>> +    python3-setuptools \
> >>> +    python3-cython \
> >>> +"
> >>>
> >>
>
>
>

