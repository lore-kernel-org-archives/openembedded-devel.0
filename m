Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 04AA06AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 12:01:27 +0000 (UTC)
Received: by wiun10 with SMTP id n10so143267245wiu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 05:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=NFDHxSd95Wwzb18dYrrpWtWyDHsb3zKs8SpcxWK0xCM=;
	b=YgopL94E62ZCc7yBHGVSUu2Bs5V3ax2WfvN/+oNu6ZD66yGrgB7hq4EQeV9mIM8Sk8
	8m1oCN3r7ARw18b27IsX2inSKVuNqMh9SFxdSm7vqtGVGae25NE56xVbez5ysYFMMjob
	ubBFahuzAAIO0Z1Lo8ZOljsKD4nyVxWjWlccaMLvabmsdkUAgUCR27PWFCZLfaW9IUu+
	rfrOIXLKekn6GAYeJfz2VsRd3lQ45BAMQwZ9wrwfGULwAqFQOodCz3lEEh6CyvWLjj4K
	PnJ37M3vDB58lfL+Z1HxCOLqE0cy+qqckuA5t8gV+yYnLV+AP1Jkny1zHsAoLMfGebPz
	tvxQ==
X-Received: by 10.194.236.66 with SMTP id us2mr51763213wjc.54.1430827287955;
	Tue, 05 May 2015 05:01:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id qt2sm25262261wjc.7.2015.05.05.05.01.27
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 05:01:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 May 2015 14:01:32 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150505120132.GB2378@jama>
References: <1430824709-22286-1-git-send-email-thomas.perrot@tupi.fr>
MIME-Version: 1.0
In-Reply-To: <1430824709-22286-1-git-send-email-thomas.perrot@tupi.fr>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: tprrt <tprrt@tupi.fr>
Subject: Re: [meta-systemd][PATCH] Rename bluez4_4.101.bbappend to bluez5_5.29.bbappend, to fix build issue below: ERROR: No recipes available for: /home/tprrt/dev/oe-build-easy/combination/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappend
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
X-List-Received-Date: Tue, 05 May 2015 12:01:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 01:18:29PM +0200, Thomas Perrot wrote:
> From: tprrt <tprrt@tupi.fr>

NAK, see pending patches for bluez4 (I plan to merge them as soon as
builds stop failing completely).

> Signed-off-by: tprrt <tprrt@tupi.fr>
> ---
>  .../bluez/{bluez4_4.101.bbappend =3D> bluez5_5.29.bbappend}             =
 |    0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-systemd/oe-core/recipes-connectivity/bluez/{bluez4_4.101.bba=
ppend =3D> bluez5_5.29.bbappend} (100%)
>=20
> diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101=
=2Ebbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.b=
bappend
> similarity index 100%
> rename from meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.=
bbappend
> rename to meta-systemd/oe-core/recipes-connectivity/bluez/bluez5_5.29.bba=
ppend
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

