Return-Path: <elvis.dowson@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id DEEDB609B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 19:46:56 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so5254019eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2014 12:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:message-id:date:to:mime-version;
	bh=wzh6kZB8ztXkRaVbrGeISCOCgzY0B/uKy+sOeVAwL7s=;
	b=DE89tzrlQk9WvOVMgUzmPEnTrfSGL6MfTsqyK2FbZ6oVxNKc74iN0OpdUE7Tt0z3DT
	O9itvbtTuCPHHt1TH6dGuNpRFRHQH8nSouIH55Wwf233I/CHuRNYd18a01nZniOgL5zT
	VD2nttJ77u5z/7hGGRU1O+jAXIovCkrR/pzFrx2vU8ot9BjgLDTGfxyeRlgqVkyeF2NQ
	x1gVzrsPusbJSgtBp6VRik+FdkXGEfxY4k0hBpabLQLgG7lpmFJG0J9bt0WaPBDO2Gmj
	LYyLjaS5XRbNzFH2n/EwaZJn4MeltSc9M+/uYp7mIKKVSVPht49MKsNX6M++OyKqydvC
	KCUQ==
X-Received: by 10.15.35.66 with SMTP id f42mr3203676eev.93.1398714417789;
	Mon, 28 Apr 2014 12:46:57 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.15])
	by mx.google.com with ESMTPSA id 48sm52922721eee.2.2014.04.28.12.46.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 12:46:55 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Message-Id: <49B816AC-39C5-4A62-A1E3-70A3F065DB0C@gmail.com>
Date: Mon, 28 Apr 2014 23:46:50 +0400
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.0\))
X-Mailer: Apple Mail (2.1878)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-xilinx-community] The URL: '${PATCH_LIST}' is invalid and cannot be interpreted
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
X-List-Received-Date: Mon, 28 Apr 2014 19:46:58 -0000
X-Groupsio-MsgNum: 49572
Content-Type: multipart/signed;
	boundary="Apple-Mail=_925ADB43-E785-4751-BFD1-7EE2F403D99A";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_925ADB43-E785-4751-BFD1-7EE2F403D99A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

Hi,

In the following linux-xlnx-3.8.bbappend,=20

=
http://git.yoctoproject.org/cgit/cgit.cgi/meta-xilinx-community/tree/recip=
es-kernel/linux/linux-xlnx_3.8.bbappend

ZX3_ZYNQ7_PATCHSET =3D " \
			=
file://zx3-zynq7/0001-ze7000-phy-micrel-phy-init.patch                   =
           \
			=
file://zx3-zynq7/0002-ze7000-phy-adapt-marvell-settings.patch            =
           \
			=
file://zx3-zynq7/0003-zynq-nand-do-not-wait-on-erase-completion-in-cmd-fct=
.patch    \
			=
file://zx3-zynq7/0004-clk-remove-clock-notifier-at-unregister.patch      =
           \
			=
file://zx3-zynq7/0005-xdevcfg-Make-sure-that-devcfg-is-not-in-loopback-mod=
.patch    \
			=
file://zx3-zynq7/0006-xilinx_emacps-Make-phy-address-configurable.patch  =
           \
			=
file://zx3-zynq7/0007-kernel-sdhci-add-sd-card-support.patch             =
           \
			=
file://zx3-zynq7/0008-xilinx_emacps-Changed-change_mtu-so-that-it-is-possi=
.patch    \
			=
file://zx3-zynq7/0009-xilinx_emacps-Set-the-maximum-frame-reception-size-t=
.patch    \
			"

PATCH_LIST_ze7000-zynq7 =3D "${ZX3_ZYNQ7_PATCHSET}=94

<snip>

SRC_URI_append +=3D " ${PATCH_LIST}=94

<snip>

I get the following error, for all other machines, except for machine =
ze7000-zynq7:

ERROR: ExpansionError during parsing =
/tool/yocto/meta-xilinx/recipes-kernel/linux/linux-xlnx_3.8.bb: Failure =
expanding variable do_fetch[file-checksums], expression was =
${@bb.fetch.get_checksum_file_list(d)} which triggered exception =
MalformedUrl: The URL: '${PATCH_LIST}' is invalid and cannot be =
interpreted

If I redefine=20

SRC_URI_append +=3D " ${PATCH_LIST_ze7000-zynq7}=94

it fixes the issue.=20

However, I was wondering what is the correct way, to use the kernel =
PATCH_LIST variable?

Regards,

Elvis Dowson

--Apple-Mail=_925ADB43-E785-4751-BFD1-7EE2F403D99A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQQcBAEBCgAGBQJTXrAqAAoJENajI+UwiZtEr14f/3cSlsBJ2T/kMcvM8cGc7iw5
d+IJvFBqIhd0+AoxwZWcuGTlU5INTRowtFns5eFd2CS+G/6tGYFzWUMvndrfhprn
M1uK+KV2en1MR9P8YFAzvOuvfip0ObfrP8XjsgbkF8kVCIEH7MdFSuPFPM7NpW9b
IDGO7vkjIiVuNx9gll/Xc/I63JnS12cBNHSshdKyANEgUJI6kYf4gce6SXuUSLFl
3waDR1/P0sVZVp+Fewi13xUxRbasjOVmE0fN5y1siFtCtimSnW7+uvzmbaVDkOfY
uX/7F3uGFdM15dMrxa8CtRR1dqxlILMvL5TC913BGvHJwd3Baocc4lcQn54jLSbD
Sav52dODIlX22BE4+zod25Naujg9ejGoGXjZUY9qu52CT9jDUJMB56YlpVIqdnAI
xe1Mro2pXSAg4mtyNBH00d6tIJ1RZLE65EYbcY/sE4SQanTkiouvqlwEdGZLRmQX
7s2XOg3n5XLWfg7VxbE/3u3UsQjCpFDP1jpjdZlxgX1T3k/3EGbmlCnz83GAduXi
izGvERLhxS+If5g2+fh7oo1euErOiOFkjG2h5dNUISsN7O13q41bpJLrdG0yOMbb
vRG3jUnkk3hbHSIUNAH3k4I/wLHL7gc+dwmPmwD4S1nb9R6OFzWy7DXEeGT/LFiX
PZJ7gqpOD7L0WXM70M5IXjO4KLU/WB/KuXhVIPxU4tdm9Eh4Im2gttYX/40/m38f
KCan6IreDR2TsfO5hT5zemq7/tbkX3sVmcOmIPmzdJYuan/Bnl5AB1be9S4+0fQd
K2GZbf1Y/iz76yLpn9SLOtC2hnch/YcAYlhH5c3Y74z28FOmVmwyOSvmKZqaAxRm
Oac5YYGZYOofGUhxDJqukWh3Ft3g9pPcySb8yZlWBAabtnMgnrBO2TGxbuSO3M5j
N5I3Cy3XHUhh63Xng51/l62UeS+U8B45FXh1FgujsVkK14OpOfpvHsj+HtbO8Cmb
ADhRH+qVDbPRUHLK7/tFJBWAjCrBQlr5d5m4OaZs2FhqjJoM0PPz/S/cA32kswOQ
j7uBIf3F7ntrucahrobucgUFXGdNuaJxtqUexzQVKuYOwnqVyV8hlREbhSRyDsr2
f0V0Bk0jePvymGl+ghBMxdsJjeeFkgvRtPYWCLQCg+f3yJM3MJKiJkSk4vvj66Sf
AX30Uqhvpniot62Muozx4BgbgnwWCndrpsxHIzcD6USDvjL4/hlJdpIfkL5iS5ry
x9XdoKryrWX/TJgM51rIlLzgJoeGL5UFEeGSIcH7GxQzDdBMb7Tfw4o0VjOJaVsb
f7RfwkmZlqA3T1qTm123/BuwyEQ6sPPL3qocVF2P4rhcaf8O0l/E7uyR7HDViVM=
=ZZvX
-----END PGP SIGNATURE-----

--Apple-Mail=_925ADB43-E785-4751-BFD1-7EE2F403D99A--
