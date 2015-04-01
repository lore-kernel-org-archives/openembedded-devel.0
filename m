Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4DC73CC2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 13:39:37 +0000 (UTC)
Received: by igbud6 with SMTP id ud6so47959317igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=LvxoWaq3cf1422z/nOfJri9/lsoej5D2yP3gvKWY9A4=;
	b=q2RKc2lfHfIs2cuHY01OdxlpVkcl+x2yn4V+m4+TQwwozLjQxP8eYe9LbXlLVnkYnw
	t58U8Ebzyv+llUX7wZEf3RyloQM/XX9JJTt4tU+w3+6Mudm6khPS7r3iQtmEBV9U7Is8
	cHk0Ij2wf27vOcf6upYOmdx0aRhFAw2ayNAA3GLhRlUGjtVa3tMTiOYcr4jZ8mCRryHQ
	xGb6So3nkcYLGmDSCVaYz9sh+mIijOP1D8ZVAe+V/wYA472CG2FuhKWejzEKh1BbHgMr
	aWE4W0y5kYW8oV++FO5yTMA9n8oyWOJdVb8xQQOoXPy3YQImntwCtpVpqALCpNIXKnMb
	ymWw==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr64699286ioi.1.1427895579162;
	Wed, 01 Apr 2015 06:39:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Wed, 1 Apr 2015 06:39:39 -0700 (PDT)
In-Reply-To: <cover.1427894535.git.akuster808@gmail.com>
References: <cover.1427894535.git.akuster808@gmail.com>
Date: Wed, 1 Apr 2015 10:39:39 -0300
X-Google-Sender-Auth: WBF7ErEdoBX-8nMJAHu7kcrTgTI
Message-ID: <CAP9ODKoiJxqMPaqtdhbUVYQJdjFgbRdxdVYrkTv8-BD6xsOoXg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/20 V2][Dizzy-next]
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
X-List-Received-Date: Wed, 01 Apr 2015 13:39:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2015 at 10:38 AM, Armin Kuster <akuster808@gmail.com> wrote:
...
> Andre McCurdy (1):
>   log4c: fix undeclared dependency on expat
>
> Andreas M=C3=BCller (1):
>   samba: add mirrors
>
> Armin Kuster (4):
>   wireshark: update to 1.12.3
>   wireshark: fix rdepends issue
>   wireshark: fix pcap-config issue
>   wireshark: update to 12.4
>
> Ash Charles (2):
>   xfce4-xkb-plugin: Specify GPLv2 license
>   xfce4-diskperf-plugin: Specify BSD license
>
> Bian Naimeng (1):
>   xbitmaps: fix build warning.
>
> Dan McGregor (1):
>   lxdm: RDEPEND on libsvg-gtk
>
> Hongxu Jia (1):
>   pimd: add do_install to pimd
>
> Paul Eggleton (1):
>   tmux: remove sed-native from DEPENDS
>
> Philip Balister (5):
>   python-pyqt: Update to 4.11.3.
>   sip: Update to 4.14.2.
>   anki: python-sip package replaces with just sip.
>   sip: Split python into a new package for runtime support.
>   python-pyqt : Move RDEPENDS on python-sip to PyQT.
>
> Sven Ebenfeld (2):
>   claws-mail: Fix SRC_URI
>   pxaregs: Add source file and fix SRC_URI
>
> Zhenhua Luo (1):
>   python-pip: add python-distribute in RDEPENDS
...

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

