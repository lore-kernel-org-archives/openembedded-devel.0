Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 41C647573C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 15:49:36 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so36223519igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Jun 2015 08:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=IOft/ZHJKT43VNQ4VD2+S1jYWpPiklta2orheOdQi1Q=;
	b=v89Zn2kBW54p6jmHvQYG6eKgfSNonBx05fUHRPspD+/N8olp3s0K34rtZ2MFt0TGJM
	DujdXjzF9VWdHWKNEtkgHAy79U0WhO/sfo3h89Jf2euAK/vBJPLgyVGISVlV6BMb2rxC
	wBOVhFCC+0bkXRw4MzFdW0sl8V0A/LiegHSB0h9VmnRcFxa73EPVDAOdzYXHzPKsVEkK
	03Z+0wZCPU2kYkbtZQ3gk5/DmJNWqBf3F/0difjVAEsU8afk6f3fIqwzyRGAR+avSwvT
	5AKmTmRg/LrS+iWnw1qqmGuCSgK8vBqRDAsNlSaGnR84kYpZY0QCIQNewVw8n1OV/AYX
	RJhg==
X-Received: by 10.50.143.104 with SMTP id sd8mr15688061igb.14.1434296977823;
	Sun, 14 Jun 2015 08:49:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Sun, 14 Jun 2015 08:49:07 -0700 (PDT)
In-Reply-To: <1433555298-20087-1-git-send-email-akuster808@gmail.com>
References: <1433555298-20087-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jun 2015 11:49:07 -0400
Message-ID: <CAMKF1sqqFXL-p-cYt2Trn2Xvk+R9s1mYc1rSqoq5z9Z8hn6QMQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] redis: update to version 3.0.2
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
X-List-Received-Date: Sun, 14 Jun 2015 15:49:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 5, 2015 at 9:48 PM, Armin Kuster <akuster808@gmail.com> wrote:
> +DEPENDS = ""

doesn't it need tcl and jemalloc ?

