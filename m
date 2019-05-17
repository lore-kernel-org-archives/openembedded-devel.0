Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id B483D6D61B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 09:43:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s17so6432150wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 02:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=TI0stbUc1pJr9AkOkAgT1e9s/lSE0QHD7NQzPLn/+X4=;
	b=s/KtRZFdB+fvvlWTrlzH3KuHX+4flbgu6P3ItGPQ7X3F+0xHDvx1qwo4O7tDevRzMj
	gC8m0gz1fUo1IWJOjFVFGsNAEYAIIv11pFCS2jlZstiMsd6Rrgrr+o/erBOJtPPXEF1b
	LkM0zbEeQO0ErSxQDQQMqIXBbcT1rUhOR9aYpexACrk6VRiX+4/7Sq2hX/g+HtSZVXaN
	r/o9VMhp7+FKdKIzeICFtcWEM5A43u3astknPLKXk9VTSCYrQAMyUlFs5mAMl4sFUYp8
	eyW+hTOGZzaD27AVzSxsBQbNhei828CALvHExR81prSY2bFq5YTldqQ8GEeASUorkNA4
	Jq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=TI0stbUc1pJr9AkOkAgT1e9s/lSE0QHD7NQzPLn/+X4=;
	b=pqgyeHKqhZUG3NZCJ8UXTSJS5TwDCN4ujg5qgQQ/W9c22C7TqyrQCJSpybc6PArpQM
	T9KV8LP2Um3PC9ZM7FbDEgNimsfgVXJqKLqMiDsJJetRzG/c241Yd8MAhJOJO0HnXnHF
	5s7BbvZNFXPzWhoB1ZDR1nZRs4WBiIjkex4umGYj7JtReabdnfMx+3/BmVYBVqNqaLDN
	JS/Q4E7qmNRj2kdy5u4dzVkTxuIQFgvY6eyY99CywgY9rmZa3kD/iL9UZ7+w/qkf/Z4j
	ZQFMRw4jjgTVOJUehMmAD7VnisyY4wIK8Cat1xcKN4aowEyiMDEakYXVPzLp753wWouv
	px4g==
X-Gm-Message-State: APjAAAWk6NWyFuq/lmqVMQRT655OmEPOY8BySyetWsTMkAoSxLamnAhk
	NEtkIjpO+hMaGBxb6/a6y+mfZa/Y
X-Google-Smtp-Source: APXvYqxFTGQnysVQlXrW114SP1NWk61CDe+t73vcdahyem6JhYknUXeg5kJv7yvyODJnhvBZZveCzw==
X-Received: by 2002:adf:cd09:: with SMTP id w9mr18305129wrm.242.1558086232094; 
	Fri, 17 May 2019 02:43:52 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	c63sm8979938wma.29.2019.05.17.02.43.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 May 2019 02:43:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 17 May 2019 11:43:51 +0200
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20190517094351.GA1594@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: github archives in the recipes
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
X-List-Received-Date: Fri, 17 May 2019 09:43:52 -0000
X-Groupsio-MsgNum: 77579
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This c..... is spreading again.

Don't use github archives, because they are regenerated from time to time with different
checksums.

If someone is looking for simple janitor tasks, then please pick some of these
and convert them to either use the developer uploaded release tarballs (if available)
or just change them to use git fetcher instead.

Also notice that some of these are using the often conflicting v${PV} filename
without setting downloadfilename to something more sane.

meta-networking/recipes-connectivity/firewalld/firewalld_0.6.3.bb:SRC_URI = "https://github.com/firewalld/firewalld/archive/v${PV}.tar.gz \
meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.0.3.bb:SRC_URI = "https://github.com/arno-iptables-firewall/aif/archive/${PV}.tar.gz"
meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb:SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
meta-oe/recipes-connectivity/libuv/libuv_1.27.0.bb:SRC_URI = "https://github.com/libuv/libuv/archive/v${PV}.tar.gz"
meta-oe/recipes-extended/dumb-init/dumb-init_1.2.0.bb:SRC_URI = "https://github.com/Yelp/dumb-init/archive/v${PV}.tar.gz"
meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb:SRC_URI = "https://github.com/rmbreak/pam_ldapdb/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
meta-oe/recipes-extended/pmdk/pmdk_1.4.2.bb:SRC_URI = "https://github.com/pmem/${BPN}/archive/${PV}.tar.gz \
meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb:SRC_URI = "https://github.com/LibVNC/x11vnc/archive/${PV}.tar.gz;downloadfilename=x11vnc-${PV}.tar.gz\
meta-oe/recipes-kernel/crash/crash_7.2.5.bb:SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb:    https://github.com/mpv-player/mpv/archive/v${PV}.tar.gz;name=mpv \
meta-oe/recipes-support/hunspell/hunspell_1.7.0.bb:SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
meta-oe/recipes-support/opencv/opencv_3.4.5.bb:    https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz;destsuffix=git/3rdparty/tinydnn/tiny-dnn-1.0.0a3;name=tinydnn;unpack=false \
meta-oe/recipes-support/uhubctl/uhubctl_2.0.0.bb:SRC_URI = "https://github.com/mvp/${PN}/archive/v${PV}.tar.gz"
meta-oe/recipes-support/uthash/uthash_2.1.0.bb:    https://github.com/troydhanson/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb:SRC_URI = "https://github.com/matplotlib/matplotlib/archive/v${PV}.tar.gz \
meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb:SRC_URI = "https://github.com/blueness/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXN6CVgAKCRA3VSO3ZXaA
HLMIAJ4oN5RgooWtD6KHUpzWgx9k3NJmFACePA9SFSJqQAgfcoHeGeZlEntKa90=
=zm+E
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
