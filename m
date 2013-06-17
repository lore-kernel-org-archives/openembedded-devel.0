Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id CE916601DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 05:17:48 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id c10so5889026ieb.38
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Jun 2013 22:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=n1YVOnwiXGBXZ/CHo0rPHN/rPyDJRqFucrv32vt8QxE=;
	b=wZ7ZlIzyANPe94lHpTmrPNBJiJ1GHrMDxovDtch6jrPGC4HcIPwzTEVqOoE0oVsam/
	koMPl6G+xEb7uF+xXCG8eBhNtA1uKS8NZayzqxQAEPk+KGr1nQ6uIT/qAK4vmouLFp0P
	0fenKGK8pDCXdh068P4DrSSU/BEwStmkxKaWkZ5+Jt0Qrtn24yElWM16oXXbkPWVQ3kP
	1VgHygVJr3m+Ab6SMy3aC+WclDZipBfQvxswNJAjNgKe484XyanYvJcwFTgnnV9WfHHd
	bTiNuNJxOe+Lufe1pIoDmQpNQMGCMhFuVwLYCCHhD3AiqJzH/9M/Lh2RWTfzgek43utl
	vSdQ==
X-Received: by 10.50.78.100 with SMTP id a4mr3830382igx.102.1371446269660;
	Sun, 16 Jun 2013 22:17:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.4.168 with HTTP; Sun, 16 Jun 2013 22:17:19 -0700 (PDT)
In-Reply-To: <CANyK_8eaRBQTrqPoakvwkVn3Oj7Uoftgmi7_VK3nRshDDn72WA@mail.gmail.com>
References: <1371112052-24223-1-git-send-email-raj.khem@gmail.com>
	<CANyK_8eaRBQTrqPoakvwkVn3Oj7Uoftgmi7_VK3nRshDDn72WA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jun 2013 22:17:19 -0700
Message-ID: <CAMKF1sqwau+OsDSpixYPEnVwsECFS6Jr3=tyiB-rBc2vJrJYdQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] packagekit: Fix build with new glib-2.0
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
X-List-Received-Date: Mon, 17 Jun 2013 05:17:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 16, 2013 at 5:13 PM, Paul Barker <paul@paulbarker.me.uk> wrote:
> You seem to have picked up a couple of .o files by accident in this one.
>

bah, git add tricked me. Sending a V2

