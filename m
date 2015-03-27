Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 89FB36013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2015 11:25:49 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so16929924igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Mar 2015 04:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=Zfhhr+JcJeEu+YXXk6l/W8nEse7qdjkJA003zCEgicA=;
	b=A+m7TEC/KiASbAdQRLRTALeXltojHE7Juj2e5xiWi+d+N+BbVDIeesvAA+GqX65hgN
	17D3KhaUOtNavY6alPhINCd0EqvskNgGWWp0srJjtn2N8hm/vrtvZrCzR0K3yI3MVeoA
	R9YDnvh0Iq3sIIYkyKazdN0woKD2WLav41OhajmO4oWsvT9I+5jjvpc3hgNuezbvkspq
	LGW438o5SVhIjBgx92KXOOvsr+pYk+56TQbGhL4/h29XxI8EW8QgqTv7bX7sHXGbciIv
	58vOPfpmGCZ1GSH9r1H4NIe92xGaZmtEX8YorYF/CZ9FuTUSvFynzGucdk6sEPuvkjQi
	zZBw==
MIME-Version: 1.0
X-Received: by 10.107.136.144 with SMTP id s16mr1054919ioi.62.1427455550089;
	Fri, 27 Mar 2015 04:25:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.170.138 with HTTP; Fri, 27 Mar 2015 04:25:50 -0700 (PDT)
In-Reply-To: <cover.1427426569.git.akuster808@gmail.com>
References: <cover.1427426569.git.akuster808@gmail.com>
Date: Fri, 27 Mar 2015 08:25:50 -0300
X-Google-Sender-Auth: xNDo_88iAL3_8kBYNOv5J9sGE-s
Message-ID: <CAP9ODKrNJSW-aN5UfK9A7O5CMiTLsTiMUnaP9U+mZXN9qxmhbg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Armin Kuster <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/18] Dizzy pull request
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
X-List-Received-Date: Fri, 27 Mar 2015 11:25:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Armin,

On Fri, Mar 27, 2015 at 12:26 AM, Armin Kuster <akuster808@gmail.com> wrote=
:
> Please consider this changes for meta-openembedded dizzy-next
>
> The following changes since commit 853dcfa0d618dc26bd27b3a1b49494b98d6eee=
97:
>
>   rsyslog: fix name of syslogd ua group (2015-03-03 21:13:17 +0100)
>
> are available in the git repository at:
>
>   https://github.com/akuster/meta-openembedded akuster/dizzy-next
>   https://github.com//tree/akuster/dizzy-next
>
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
> Paul Eggleton (1):
>   tmux: remove sed-native from DEPENDS
>
> Philip Balister (4):
>   python-pyqt: Update to 4.11.3.
>   sip: Update to 4.14.2.
>   anki: python-sip package replaces with just sip.
>   sip: Split python into a new package for runtime support.
>
> Sven Ebenfeld (2):
>   claws-mail: Fix SRC_URI
>   pxaregs: Add source file and fix SRC_URI
>
> Zhenhua Luo (1):
>   python-pip: add python-distribute in RDEPENDS

Alright. All seem sensible for be.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

