Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA3FC4707E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:48 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] gnuplot: inherit pkgconfig
To: openembedded-devel@lists.openembedded.org
From: preeti.sachan@intel.com
X-Originating-Location: Bengaluru, Karnataka, IN (192.55.79.175)
X-Originating-Platform: Windows Chrome 100
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 19 Apr 2022 09:31:33 -0700
References: <20220419162825.2202995-1-preeti.sachan@intel.com>
In-Reply-To: <20220419162825.2202995-1-preeti.sachan@intel.com>
Message-ID: <7230.1650385893010891136@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mmhqgHgJOvtpF3AS2pr4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96698

--mmhqgHgJOvtpF3AS2pr4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This patch is to fix do_configure issue for cairo.

*configure log:*
checking for CAIROPDF... configure: WARNING:
*The pkg-config script could not be found or is too old.=C2=A0 Make sure it=
*
*is in your PATH or set the PKG_CONFIG environment variable to the full*
*path to pkg-config.*

Alternatively, you may set the environment variables CAIROPDF_CFLAGS
and CAIROPDF_LIBS to avoid the need to call pkg-config.
See the pkg-config man page for more details.

To get pkg-config, see <http://www.freedesktop.org/software/pkgconfig>.
*configure: WARNING: The cairo terminals will not be compiled.*

--mmhqgHgJOvtpF3AS2pr4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This patch is to fix do_configure issue for cairo.<br /><br /><strong>confi=
gure log:</strong><br />
<div>checking for CAIROPDF... configure: WARNING:</div>
<div><strong>The pkg-config script could not be found or is too old.&nbsp; =
Make sure it</strong></div>
<div><strong>is in your PATH or set the PKG_CONFIG environment variable to =
the full</strong></div>
<div><strong>path to pkg-config.</strong></div>
<div>&nbsp;</div>
<div>Alternatively, you may set the environment variables CAIROPDF_CFLAGS</=
div>
<div>and CAIROPDF_LIBS to avoid the need to call pkg-config.</div>
<div>See the pkg-config man page for more details.</div>
<div>&nbsp;</div>
<div>To get pkg-config, see &lt;http://www.freedesktop.org/software/pkgconf=
ig&gt;.</div>
<div><strong>configure: WARNING: The cairo terminals will not be compiled.<=
/strong></div>

--mmhqgHgJOvtpF3AS2pr4--

