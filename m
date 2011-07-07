Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qepzv-0008QX-Ax
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 16:56:11 +0200
Received: by iym10 with SMTP id 10so986360iym.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BdGk0RHB6tN2I7vgpxRACxncSWCbfAqX59EZs6zBgLQ=;
	b=VVD0UE6KVjUM+q3SbyIKVp7ucTCycvlRZ843wHbDl02/QQ6zL/7ue68U+ofgVImQwV
	1KIQZIIr22iIZE8pMf73UPMIpF58PNPfTssM//5/tLxT9NoQAqi8qnfn2TdlbMTQ/CTb
	5DxoUgBJIMDxN3zckjvsnZebiXU6WNowcsJbc=
MIME-Version: 1.0
Received: by 10.231.203.136 with SMTP id fi8mr798305ibb.181.1310050339318;
	Thu, 07 Jul 2011 07:52:19 -0700 (PDT)
Received: by 10.231.174.73 with HTTP; Thu, 7 Jul 2011 07:52:19 -0700 (PDT)
In-Reply-To: <13872098A06B02418CF379A158C0F14601620D182B@dnce02.ent.ti.com>
References: <1309968919-23810-1-git-send-email-agnel.joel@gmail.com>
	<CA+T6QPmwg7mbU-+YRM1=DuXUUJqJR+zqkyz=wcRFQAxff4mmYA@mail.gmail.com>
	<13872098A06B02418CF379A158C0F14601620D182B@dnce02.ent.ti.com>
Date: Thu, 7 Jul 2011 09:52:19 -0500
Message-ID: <CAD=GYpb4F=2Z9k_VW1GERnPGqw1jreybkw22SLrhnZpb=OKkNw@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: "Kooi, Koen" <k-kooi@ti.com>
Cc: "Fernandes, Joel A" <joelagnel@ti.com>,
	"beagleboard@googlegroups.com" <beagleboard@googlegroups.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Kridner, Jason" <jdk@ti.com>
Subject: Re: [PATCH v2] beagleboard-test-scripts: Add a script flash-fs.sh for flashing NAND
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2011 14:56:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jul 7, 2011 at 9:37 AM, Kooi, Koen <k-kooi@ti.com> wrote:
> Since we're not in a ramdisk anymore, we could also dump a /etc/joel-was-here file to see if we already have flashed nand from this specific card or not.
>
>

Don't see how this will work when the same card is used to flash
multiple boards?

Regards,
Joel


