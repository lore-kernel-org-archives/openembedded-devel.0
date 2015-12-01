Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC37606D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2015 16:48:37 +0000 (UTC)
Received: by igcto18 with SMTP id to18so10868786igc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Dec 2015 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=EIQpx0AbBOaHt1r+h/vL+G32kNEwnZksDp1ZiiGPf1o=;
	b=GQtcHPWSQ0YSGhsyEbOeHGK2b3yfP+zjGViND7Q8U60V7BFkGTVBWDwrvsbCXSKIjJ
	kP8+VqE6DaqyFGHZL9NIZI6Bkxaa6L10X5rcBYXPpsxgrY1l8oZyOBus3zwQWmBKJBQR
	lXqoZDNmkQQ/n0oCOrxpUI0RgSmRjZyYMUq1S3YnQm+LmtQclYr8RZexkf+tquO1i/MA
	HA54b2G9fTYNsRCwGONoVJl5ZOUJbuBCnFQDfu946MwGnjR8qVRAcLXzWF4yHi/zgCwh
	VuvVQV2Z58ZeDibqC03Z7WUm0hp2fEBwAPsbvcQG1HHqUsMJJq0zuexdnBcKMgIRuFOG
	Tl7Q==
X-Received: by 10.50.4.40 with SMTP id h8mr24631146igh.75.1448988518062; Tue,
	01 Dec 2015 08:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Tue, 1 Dec 2015 08:48:08 -0800 (PST)
In-Reply-To: <1448974975-31352-1-git-send-email-funman@videolan.org>
References: <1448974975-31352-1-git-send-email-funman@videolan.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Dec 2015 08:48:08 -0800
Message-ID: <CAMKF1soAm3fR=SMc1c+YHjQPRqGLv5L4wRn71yTUcMKhhfLGoQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] net-snmp: apply patch for cross-compilation
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
X-List-Received-Date: Tue, 01 Dec 2015 16:48:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 1, 2015 at 5:02 AM, Rafa=C3=ABl Carr=C3=A9 <funman@videolan.org=
> wrote:
>          file://0001-config_os_headers-Error-Fix.patch \
> +        file://0002-config_os_headers-Error-Fix.patch \

these two names look pretty similar. Can you check if these both
patches are needed

