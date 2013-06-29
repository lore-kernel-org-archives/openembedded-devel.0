Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6EEB1612D1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 14:30:57 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so1596641pdj.28
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Jun 2013 07:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=CiFjKkHCaQpc5xUYI0wiv5034ICvK0YV6x8eNNonMTU=;
	b=Z+PS3TSutWP/cR07keMrtTLRrGQ0A3Ni59aBido7qHGvYaLu9E5cczPfXE/VR651i+
	TWcfW5nW0ToPb4SSy5o+U4lxT+7CeCUzjXOpK6Xa5BFa9Fur0I+s2myQ7KHwNbgXtEvs
	+tBIBxC8kvXYt17LD0NwlfoSYoLvcOhJ0/63+aypCEoSnFhPa5djAvR8DyDyhWzwYGkm
	DpuFDhSrDtICseky5+2emlahipDD7CnfGGGqstWvwfw2PoXXgus4c8DSqiBn9xODzPNJ
	EBE0HxXhc9HTedbnJttH2NjT/5h2ik1WwLE1n7EXAkf938TjNGWTkw3AzfOdXfrupXfi
	MdjA==
X-Received: by 10.67.1.33 with SMTP id bd1mr16322576pad.75.1372516258875;
	Sat, 29 Jun 2013 07:30:58 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	dg3sm13124518pbc.24.2013.06.29.07.30.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 07:30:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130629122713.GT3261@jama>
Date: Sat, 29 Jun 2013 07:30:59 -0700
Message-Id: <3C785BCF-50C1-4144-8EEC-C2EF2663E2C6@gmail.com>
References: <1372437419-31205-1-git-send-email-raj.khem@gmail.com>
	<20130629122713.GT3261@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
Subject: Re: [meta-browser][PATCH V2 1/3] chromium: Remove older recipes
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
X-List-Received-Date: Sat, 29 Jun 2013 14:30:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 29, 2013, at 5:27 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> Fails to apply cleanly:
>=20
> patching file recipes-browser/chromium/chromium/google-chrome.desktop
> Reversed (or previously applied) patch detected!  Assume -R? [n] ^C
>=20
>=20

don't know what going on there in your tree, but I observed that one of =
the patch is already applied
so I rebased the patch set on top of master and resent a V3. retry and =
let me know if it works
this time. If not I will push it to a contrib tree and you can cherry =
pick=

