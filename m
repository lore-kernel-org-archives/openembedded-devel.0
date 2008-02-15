Received: from [209.85.132.249] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JQ7Dw-0002f8-2B
	for openembedded-devel@openembedded.org; Fri, 15 Feb 2008 21:32:08 +0100
Received: by an-out-0708.google.com with SMTP id b38so188164ana.6
	for <openembedded-devel@openembedded.org>;
	Fri, 15 Feb 2008 12:31:37 -0800 (PST)
Received: by 10.100.241.17 with SMTP id o17mr4498826anh.106.1203107497091;
	Fri, 15 Feb 2008 12:31:37 -0800 (PST)
Received: by 10.100.190.7 with HTTP; Fri, 15 Feb 2008 12:31:37 -0800 (PST)
Message-ID: <c384c5ea0802151231p3c4d6685s3642cb3154dc341a@mail.gmail.com>
Date: Fri, 15 Feb 2008 21:31:37 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47B5E488.4010902@student.utwente.nl>
MIME-Version: 1.0
References: <20080214045433.02de68cd@widy.localdomain>
	<74d0deb30802140255k6c16bafeq6771d572fd7c542c@mail.gmail.com>
	<20080215110230.526ea6a1@widy.localdomain>
	<74d0deb30802150141q71e844esd6185bf52b1e79ae@mail.gmail.com>
	<20080215133238.7d8f7887@widy.localdomain>
	<1203076695.8636.30.camel@dax.rpnet.com>
	<20080215182949.053c3d3a@widy.localdomain>
	<1203095510.8636.92.camel@dax.rpnet.com>
	<47B5E488.4010902@student.utwente.nl>
X-SA-Exim-Connect-IP: 209.85.132.249
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: Building a kernel with builtin initramfs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Feb 2008 20:32:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello all,

On Fri, Feb 15, 2008 at 8:14 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>  Richard Purdie schreef:
>  | I'm actually going to go as far as proposing any recursive bitbake
>  | recipes are removed from OE.dev ASAP for the reasons I've mentioned
>
>  While I agree on what Paul is saying, I don't think having recursive
>  bitbake is a good idea, and a recursive bitbake that assumes a sane
>  distro even worse, so realistically I'll have to back up Richard with
>  the removal policy.
>

+1 for Richard's proposals (remove recursive recipies, and make the
initramfs a two-step action).

(We are building kernels with initramfs in that manner now.)

Regards,
-- 
Leon


