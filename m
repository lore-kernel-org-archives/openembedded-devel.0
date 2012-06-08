Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ScyWc-0007wQ-Bj
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jun 2012 14:42:46 +0200
Received: by yenl13 with SMTP id l13so1105805yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2012 05:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1feA9rGhPd02ttdtwd8TDMUX9BWmRh3UTV/g3yq60QM=;
	b=ki6EhOmtykR+DGstuE7W9vJSIuKZ8vVuGt4ssPutpJXp8jj1E71TVhQneK0haWg6Ep
	7N3m4L9+B4Y8L9GAYc8B7Srsvh7zJYZ38SayTOVP+zA7qNmfGSQIHRk+ta0MK6ncJz8W
	2gSOSXX8eGJM+cGFY6300EbbWw82QhXmoCSLSNeqamnilvzaLQUSAIRQcqRPIIR5kUyB
	Oz1CX+0WuWjd0Xwr8O00WU1+Y3a7E1C25fBbi6NUjeaRHXKLetJjxf65a8/hOZY97PQq
	pzT6tvVzVRLOrK7UChh3a/PEviWI9M7cwQjscdAAC8mIxdr0bYf5u3BSgAQKNGVMbpdB
	hyIA==
MIME-Version: 1.0
Received: by 10.50.158.233 with SMTP id wx9mr2746917igb.42.1339158736070; Fri,
	08 Jun 2012 05:32:16 -0700 (PDT)
Received: by 10.64.18.10 with HTTP; Fri, 8 Jun 2012 05:32:16 -0700 (PDT)
In-Reply-To: <jqscmd$9ms$1@dough.gmane.org>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRSd7cUwPbTjcaf+cJHdRrA-=+sW6fAchu0_FURkqoSUzQ@mail.gmail.com>
	<jqscmd$9ms$1@dough.gmane.org>
Date: Fri, 8 Jun 2012 14:32:16 +0200
Message-ID: <CALbNGRRitf3tuCPKnc9S-PF4D3tWB-UCphEyCoMY+JHTCbHRBw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce 00/15] bugfix, new panel plugins ans xfce4-mixer
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
X-List-Received-Date: Fri, 08 Jun 2012 12:42:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 8, 2012 at 10:21 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> It gave me a merge conflict, can you try to rebase it onto the current HEAD
> of meta-oe please?
Done - can you give it another try?

Andreas


